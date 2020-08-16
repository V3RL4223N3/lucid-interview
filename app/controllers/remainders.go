package controllers

import (
	"github.com/revel/revel"
)

type Reminders struct {
	*revel.Controller
}

type Reminder struct {
	Time    string `json:"time"`
	Message string `json:"message"`
}

var (
	reminders []Reminder
)

func (c Reminders) Index() revel.Result {
	c.Response.Status = 200
	return c.RenderJSON(reminders)

}

func (c Reminders) Store() revel.Result {

	reminder := Reminder{}
	err := c.Params.BindJSON(&reminder)

	if err != nil {
		c.Response.Status = 400
		return c.RenderJSON(err)
	}

	reminders = append(reminders, reminder)
	return c.RenderJSON(reminder)
}
