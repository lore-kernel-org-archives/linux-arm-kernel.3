Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AA5C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z+fkirNX5weKYAtG6EfewdkYnJnllk2ja+oE3+oTPI4=; b=XcBDHD2IUnAowBV7EJ6YiFSk6g
	OltVJrYw4xxUzXFXKednvf8+jSPF9DrviTBP//dNflhu2JrgHRkjXtmKa/TCvcxqbTaXyXS+7glTH
	5bw/v/lVKB45PMBoQO5YENbmgI0oFPdOI/TtJ/VGxVYUMNee/HLecE9cFiGaLEDNlfuyqvTCbx+tZ
	skANVczrw/0KvU743KETwPHAEcVZp+fY3uwVAFFBbJifrHGfZrMas/f0tBj7hRBsW/REYnMXDWwqs
	hvsmne2wYW16elRBxwzV2jJxmH2OIGh/nmumty7x2F42Aw0tkIg98cFTf3YWICQME2D9kdDYgpaVp
	0ECV6zsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOubP-00000006DNn-3YlQ;
	Tue, 10 Jun 2025 08:45:03 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuRI-00000006C1U-337x;
	Tue, 10 Jun 2025 08:34:39 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bGhsy0jvvz5DXWl;
	Tue, 10 Jun 2025 16:34:30 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 55A8YG0C000519;
	Tue, 10 Jun 2025 16:34:16 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Jun 2025 16:34:19 +0800 (CST)
Date: Tue, 10 Jun 2025 16:34:19 +0800 (CST)
X-Zmail-TransId: 2afb6847ee0bffffffff9f2-c7679
X-Mailer: Zmail v1.0
Message-ID: <202506101634190538mcMSzfKfxQTy4LgbSpOy@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <ulf.hansson@linaro.org>
Cc: <geert+renesas@glider.be>, <magnus.damm@gmail.com>, <heiko@sntech.de>,
        <krzk@kernel.org>, <alim.akhtar@samsung.com>,
        <walker.chen@starfivetech.com>, <changhuang.liang@starfivetech.com>,
        <sebastian.reichel@collabora.com>, <detlev.casanova@collabora.com>,
        <finley.xiao@rock-chips.com>, <shawn.lin@rock-chips.com>,
        <pgwipeout@gmail.com>, <qiu.yutan@zte.com.cn>,
        <shao.mingyin@zte.com.cn>, <linux-pm@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <yang.tao172@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?cG1kb21haW46IFVzZSBzdHJfZW5hYmxlX2Rpc2FibGUtbGlrZSBoZWxwZXJz?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 55A8YG0C000519
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6847EE16.000/4bGhsy0jvvz5DXWl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_013437_096101_775CBA76 
X-CRM114-Status: GOOD (  12.25  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Shao Mingyin <shao.mingyin@zte.com.cn>

Replace ternary (condition ? "enable" : "disable") syntax and ternary
(condition ? "on" : "off") syntax with helpers from
string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c    | 3 ++-
 drivers/pmdomain/renesas/rcar-sysc.c         | 3 ++-
 drivers/pmdomain/rockchip/pm-domains.c       | 3 ++-
 drivers/pmdomain/samsung/exynos-pm-domains.c | 6 +++---
 drivers/pmdomain/starfive/jh71xx-pmu.c       | 5 +++--
 5 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index e001b5c25bed..c8aa7538e95f 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
+#include <linux/string_choices.h>

 #include "rcar-gen4-sysc.h"

@@ -171,7 +172,7 @@ static int rcar_gen4_sysc_power(u8 pdr, bool on)
  out:
        spin_unlock_irqrestore(&rcar_gen4_sysc_lock, flags);

-       pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
+       pr_debug("sysc power %s domain %d: %08x -> %d\n", str_on_off(on),
                 pdr, ioread32(rcar_gen4_sysc_base + SYSCISCR(reg_idx)), ret);
        return ret;
 }
diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index 047495f54e8a..dae01ca0ef6a 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/soc/renesas/rcar-sysc.h>
+#include <linux/string_choices.h>

 #include "rcar-sysc.h"

@@ -162,7 +163,7 @@ static int rcar_sysc_power(const struct rcar_sysc_pd *pd, bool on)

        spin_unlock_irqrestore(&rcar_sysc_lock, flags);

-       pr_debug("sysc power %s domain %d: %08x -> %d\n", on ? "on" : "off",
+       pr_debug("sysc power %s domain %d: %08x -> %d\n", str_on_off(on),
                 pd->isr_bit, ioread32(rcar_sysc_base + SYSCISR), ret);
        return ret;
 }
diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 4cce407bb1eb..0681c763f843 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -21,6 +21,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/mfd/syscon.h>
+#include <linux/string_choices.h>
 #include <soc/rockchip/pm_domains.h>
 #include <soc/rockchip/rockchip_sip.h>
 #include <dt-bindings/power/px30-power.h>
@@ -595,7 +596,7 @@ static int rockchip_do_pmu_set_power_domain(struct rockchip_pm_domain *pd,
                                        is_on == on, 0, 10000);
        if (ret) {
                dev_err(pmu->dev, "failed to set domain '%s' %s, val=%d\n",
-                       genpd->name, on ? "on" : "off", is_on);
+                       genpd->name, str_on_off(on), is_on);
                return ret;
        }

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 9b502e8751d1..1a892c611dad 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/pm_domain.h>
 #include <linux/delay.h>
 #include <linux/of.h>
@@ -38,7 +39,6 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
        struct exynos_pm_domain *pd;
        void __iomem *base;
        u32 timeout, pwr;
-       char *op;

        pd = container_of(domain, struct exynos_pm_domain, pd);
        base = pd->base;
@@ -51,8 +51,8 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)

        while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) != pwr) {
                if (!timeout) {
-                       op = (power_on) ? "enable" : "disable";
-                       pr_err("Power domain %s %s failed\n", domain->name, op);
+                       pr_err("Power domain %s %s failed\n", domain->name,
+                              str_enable_disable(power_on));
                        return -ETIMEDOUT;
                }
                timeout--;
diff --git a/drivers/pmdomain/starfive/jh71xx-pmu.c b/drivers/pmdomain/starfive/jh71xx-pmu.c
index 74720c09a6e3..0e8fca4e2de9 100644
--- a/drivers/pmdomain/starfive/jh71xx-pmu.c
+++ b/drivers/pmdomain/starfive/jh71xx-pmu.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/string_choices.h>
 #include <dt-bindings/power/starfive,jh7110-pmu.h>

 /* register offset */
@@ -155,7 +156,7 @@ static int jh7110_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)

        if (ret) {
                dev_err(pmu->dev, "%s: failed to power %s\n",
-                       pmd->genpd.name, on ? "on" : "off");
+                       pmd->genpd.name, str_on_off(on));
                return -ETIMEDOUT;
        }

@@ -198,7 +199,7 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)

        if (is_on == on) {
                dev_dbg(pmu->dev, "pm domain [%s] is already %sable status.\n",
-                       pmd->genpd.name, on ? "en" : "dis");
+                       pmd->genpd.name, str_enable_disable(on));
                return 0;
        }

-- 
2.25.1

