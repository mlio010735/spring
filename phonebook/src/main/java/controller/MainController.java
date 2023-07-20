package controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import service.PhonebookService;
import vo.PhonebookVO;

@Controller
@RequestMapping("/phone/")
public class MainController {

	@Autowired
	PhonebookService service;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",service.findAll());
		mv.setViewName("index");
	    return mv;
	}
	
	 @RequestMapping("/insert")
	    public ModelAndView insert(String name, String hp, String memo) {
	        System.out.println(name + "," + hp + "," + memo);
	        int result = service.insert(new PhonebookVO(name, hp, memo));
	        ModelAndView mv = new ModelAndView();
	        mv.addObject("list", service.findAll());
	        mv.setViewName("index");
	        mv.setView(new RedirectView("/phone/"));
	        return mv;
	    }
	
	@RequestMapping("/findAll")
	@ResponseBody
	public String findAll(int idx, String name, String hp, String memo) {
		List<PhonebookVO> list = service.findAll();
		String str="";
		for(PhonebookVO item : list) {
			str+=item.toString()+",";
		}
		return str;
	}
	
	@RequestMapping("/findone")
	public PhonebookVO findone(int idx) {
	    PhonebookVO pb = service.findOneById(idx);
	    return pb;
	}
	
	    @RequestMapping("/search")
	    @ResponseBody
	    public List<PhonebookVO> searchPhonebook(String keyword) {
	        List<PhonebookVO> searchResult = service.searchFind(keyword);
	        return searchResult;
	    }

	@RequestMapping("/update")
	public ModelAndView update(int idx, String name, String hp, String memo) {
	    PhonebookVO updatedEntry = new PhonebookVO(idx, name, hp, memo);
	    service.update(idx, updatedEntry);
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("list", service.findAll());
	    mv.setViewName("index");
	    return mv;
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(int idx) {
	    service.delete(idx);
	    ModelAndView mv = new ModelAndView();
	    mv.addObject("list", service.findAll());
	    mv.setViewName("index");
	    return mv;
	}

}
