package pl.sda.controller;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import pl.sda.api.PlanApi;
import pl.sda.manager.PlanManager;
import pl.sda.model.Plan;

import java.util.ArrayList;
import java.util.List;

import static org.slf4j.LoggerFactory.getLogger;

@RestController
public class PlanController implements PlanApi {

    private static final Logger logger = getLogger(SchoolController.class);
    private PlanManager planManager;

    @Value("${use.mockData}")
    private boolean mockData;

    @Autowired
    public PlanController(PlanManager planManager) {
        this.planManager = planManager;
    }

    @Override
    @PostMapping("plan/add")
    public Plan create(Plan plan) {
        return planManager.create(plan);
    }

    @Override
    @PostMapping("plan/delete")
    public Integer delete(Integer id) {
        planManager.delete(id);
        return id;
    }

    @Override
    @PostMapping("plan/edit")
    public Plan edit(Plan plan) {
        return planManager.edit(plan);
    }

    @Override
    @GetMapping("plan/find")
    public Plan find(Integer id) {
        return planManager.find(id);
    }

    @Override
    @GetMapping("plan/findAll")
    public List<Plan> findAll() {
        if (mockData) {
            return new ArrayList<Plan>();
        } else {
            return planManager.findAll();
        }
    }
}
