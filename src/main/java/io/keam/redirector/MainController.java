package io.keam.redirector;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@Controller
@RequestMapping("/")
public class MainController {

    private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @GetMapping
    public ModelAndView index() {
        ModelAndView modelAndView = new ModelAndView("main");
        return modelAndView;
    }

    @PostMapping
    public ModelAndView save(@RequestParam(name = "name") String name) {
        Map<String, String> model  = new HashMap<String, String>() {{
            put("name", name);
        }};
        ModelAndView modelAndView = new ModelAndView("show", model);
        return modelAndView;
    }

    @PostMapping("/redirectme")
    public ModelAndView redirectName(@RequestParam(name = "redirectname") String redirectname,
                                     @RequestParam(name = "customname") String customname) {
        logger.debug("[redirectName] begin");
        logger.debug(String.format("[redirectName] redirectname: %s, customname: %s", redirectname, customname));

        ModelMap model = new ModelMap();
        String location;
        switch (redirectname.trim().toLowerCase(Locale.US)) {
            case "yahoo":
                location = "redirect:https://yahoo.com";
                break;
            case "google":
                location = "redirect:https://google.com";
                break;
            case "twitter":
                location = "redirect:https://twitter.com";
                break;
            default:
                location = "show";
                model.addAttribute("name", customname);
        }
        ModelAndView modelAndView = new ModelAndView(location, model);
        logger.debug(modelAndView.toString());
        logger.debug("[redirectName] end");
        return modelAndView;
    }
}
