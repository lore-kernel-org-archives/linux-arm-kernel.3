Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D451CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 19:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbpDWJdZfVTVSB8z3KjE43n+mbMdK6iqWDy5+ydNGZc=; b=bdZSTg7rohtrVMgAR2O9h7DSUY
	fMdTAUhR4hFGAPX5EaE9vkSwEhiSZM4qUAZJtmq1QbG2dTd4XjD9CcVTMYR7xR3Zs4K9b/0ky9u82
	uUrUC2bTCweZkspoHvkhAQ2ZX/Xha5PvbhVmz7IIFSeeUEgybXPGwyvMglO+l+7a83dpKUvEQPAhh
	JRTaPRHunqkoqjvi6UwNs1bCeQKrrHbLFElQI1mFh6niEPHSHJsWbrgxEdyVBSNaMkeYjjeWxBNe8
	QH/+f8Wr0tLmwmjF+vrz1KkxUwiW5A8N6AA/JfFL1NZpWAL/NhiEB3oibjZXeZSyxo+QcNw7/7FVl
	LkyZ7jjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEByA-00000002cth-3rBE;
	Wed, 29 Oct 2025 19:36:31 +0000
Received: from mail-qv1-xf62.google.com ([2607:f8b0:4864:20::f62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEBy6-00000002csM-1RLu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 19:36:29 +0000
Received: by mail-qv1-xf62.google.com with SMTP id 6a1803df08f44-87c217f4aaaso4292676d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766585; x=1762371385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbpDWJdZfVTVSB8z3KjE43n+mbMdK6iqWDy5+ydNGZc=;
        b=Dw1EKMwaunJt1c22GyYf5vKNkvLD9s7Tf/v+ip2JTPDmSP6arg3q8AXrFgUDSpLUbc
         BYHF1dNA3oQC98wsSnXtDJlDHjO/zb2JakzGLgkvUNRxwHhJq3Jtt9vaF9C12YaEnCtN
         pdd/6V90fcQ/aNo3dQ4tXUphaQywzAbwXH4nkLzZm3/F8bQmGpoGCwiD2qhzSdJtVGZv
         oIjDDiT5jpFUbk/FLa8/Earjyku4id4ml0owUBxw+LtOKFnKmv+6SWVVxfy0FICeHF+0
         RCEIp2Ha2o83pQiFJQ+PBt+BZjdS0klTpnjyvUcdBXH9Gjg0I6hMoAzsoccq8iKSSt8i
         or7A==
X-Forwarded-Encrypted: i=1; AJvYcCV4GgPIAXqStXvnmF4dOH/ncGip7kviYgXIv4kapkrL3PQTuqtCLeqOqOqFYTEP+/EAyIl19cHVvEFLx6kPFvLM@lists.infradead.org
X-Gm-Message-State: AOJu0YzPfC+cBQPOvzLARfP7caLt1Mp48/mNvH0GruMaBaP3Kp06U0xG
	vitssJzQINyO1n9ykXEqmMOEb0y7HzqQj0PJiQYutYsKsIY/rYjj92hgKxMRk2uRkqQGQKULILf
	ZIgHE6C4FMArQNaYBYJfj3SRRhXrAokbR8nYKuyDTrpAolO9jcoxtmcwqQvhBOL1/hjGLNmSXVo
	q9/He3bUHe9e+OBXI59ZEqHSpqHn9/m8ZF2QeKRoictuX+c8aucIpyBtZYAuhJrx8kbL6DOWBBn
	AmRmvHBdO3A819WSJ+ytEXRo6UsQYk=
X-Gm-Gg: ASbGncsJbR1y01EuIFe0NcRgsowY6PuR5fQQw6MNRafUdMKQJDNf9kwpJrc+q6G+O1l
	Ra3R8gqz1IOxRUlrS9nOippAZIhPy3w/ux682iHsZVmIbpG3uiPdcjnBAuJth1uLDYUEr4vZ463
	+PuwmRCzhCDh8o16a5Ey+p7WICwbaO4plMaTfWP8xhFObIci8N5WxHS1i11HOw6DQSRVAdKCZhG
	yXehz/tFFBPyKRzlhkdXoFixE7Q5c/VeLv8bgeIBmms5oq8AlSzzWmIgfMotRC4Mo28UBewo2Ut
	T+Jgcg5xIf2aKvmx/QLNfFWTDmMvSMlR4ct4cJzBmmVTdvJteUtAnA8/J641T7g8OfDZjpcAZ0y
	XC9DysibZ9qZKswM2bdQYGqD/ky3jib8n5yfzStsOQIPS5ZLQMTcen9kNduUfsUMxghGiYOmk8A
	59O422WAfPpRZJYJQJaqygis3BDik0OjZv3kw=
X-Google-Smtp-Source: AGHT+IFdcGboqdt4SatKpKOWKPp5GKwFuAU7kteqb81KKYqYMxxSwMjExgn4NEpR2cBJx4PKZ2eyOyFfIu+k
X-Received: by 2002:a05:6214:ca1:b0:820:a83:eaff with SMTP id 6a1803df08f44-8801b26ba1emr9167666d6.64.1761766585021;
        Wed, 29 Oct 2025 12:36:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-87fc48dbc14sm14743716d6.6.2025.10.29.12.36.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Oct 2025 12:36:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a267606fe8so211598b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 12:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1761766584; x=1762371384; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbpDWJdZfVTVSB8z3KjE43n+mbMdK6iqWDy5+ydNGZc=;
        b=HcBRnFD0SIc46TfzoNuNd92fhdnB3eMhL8FWu0WlDNBo4Q+NbgGknIwobyUqXsfYpn
         gGSgf/YdcZf54Dhv+S4AHjhfXOilmCqW1cAbsccb9u44Vh/gUVB2t5VzCG0C1dmTWzpL
         mcMX6Y7OCf9AWnUdifoZTBraquKb9STBgQueY=
X-Forwarded-Encrypted: i=1; AJvYcCWNyZbMszJfc2zVh10SfAnJs1WiHACRmnjxa2d3EgcKWKxGXW1OoeM2RSNx5f68kRDcQIrJkebx0D3FvOSb/9ex@lists.infradead.org
X-Received: by 2002:a05:6a00:c95:b0:78c:97fa:619c with SMTP id d2e1a72fcca58-7a6275ee9e7mr645020b3a.32.1761766583727;
        Wed, 29 Oct 2025 12:36:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:c95:b0:78c:97fa:619c with SMTP id d2e1a72fcca58-7a6275ee9e7mr644977b3a.32.1761766583175;
        Wed, 29 Oct 2025 12:36:23 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a4140a0d47sm15895260b3a.73.2025.10.29.12.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:36:22 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/2] PCI: brcmstb: Add a way to indicate if PCIe bridge is active
Date: Wed, 29 Oct 2025 15:36:14 -0400
Message-Id: <20251029193616.3670003-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029193616.3670003-1-james.quinlan@broadcom.com>
References: <20251029193616.3670003-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_123627_666783_19AD7DD0 
X-CRM114-Status: GOOD (  23.07  )
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

In a future commit, a new handler will be introduced that in part does
reads and writes to some of the PCIe registers.  When this handler is
invoked, it is paramount that it does not do these register accesses when
the PCIe bridge is inactive, as this will cause CPU abort errors.

To solve this we keep a spinlock that guards a variable which indicates
whether the bridge is on or off.  When the bridge is on, access of the PCIe
HW registers may proceed.

Since there are multiple ways to reset the bridge, we introduce a general
function to obtain the spinlock, call the specific function that is used
for the specific SoC, sets the bridge active indicator variable, and
releases the spinlock.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 40 +++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 9afbd02ded35..9f1f746091be 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -30,6 +30,7 @@
 #include <linux/reset.h>
 #include <linux/sizes.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/types.h>
 
@@ -259,6 +260,7 @@ struct pcie_cfg_data {
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
 	int (*post_setup)(struct brcm_pcie *pcie);
+	bool has_err_report;
 };
 
 struct subdev_regulators {
@@ -303,6 +305,8 @@ struct brcm_pcie {
 	struct subdev_regulators *sr;
 	bool			ep_wakeup_capable;
 	const struct pcie_cfg_data	*cfg;
+	bool			bridge_in_reset;
+	spinlock_t		bridge_lock;
 };
 
 static inline bool is_bmips(const struct brcm_pcie *pcie)
@@ -310,6 +314,24 @@ static inline bool is_bmips(const struct brcm_pcie *pcie)
 	return pcie->cfg->soc_base == BCM7435 || pcie->cfg->soc_base == BCM7425;
 }
 
+static int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie, u32 val)
+{
+	unsigned long flags;
+	int ret;
+
+	if (pcie->cfg->has_err_report)
+		spin_lock_irqsave(&pcie->bridge_lock, flags);
+
+	ret = pcie->cfg->bridge_sw_init_set(pcie, val);
+	/* If we fail, assume the bridge is in reset (off) */
+	pcie->bridge_in_reset = ret ? true : val;
+
+	if (pcie->cfg->has_err_report)
+		spin_unlock_irqrestore(&pcie->bridge_lock, flags);
+
+	return ret;
+}
+
 /*
  * This is to convert the size of the inbound "BAR" region to the
  * non-linear values of PCIE_X_MISC_RC_BAR[123]_CONFIG_LO.SIZE
@@ -1081,7 +1103,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	int memc, ret;
 
 	/* Reset the bridge */
-	ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 	if (ret)
 		return ret;
 
@@ -1097,7 +1119,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	usleep_range(100, 200);
 
 	/* Take the bridge out of reset */
-	ret = pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
 	if (ret)
 		return ret;
 
@@ -1565,7 +1587,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
 
 	if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
 		/* Shutdown PCIe bridge */
-		ret = pcie->cfg->bridge_sw_init_set(pcie, 1);
+		ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 
 	return ret;
 }
@@ -1653,7 +1675,9 @@ static int brcm_pcie_resume_noirq(struct device *dev)
 		goto err_reset;
 
 	/* Take bridge out of reset so we can access the SERDES reg */
-	pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
+	if (ret)
+		goto err_reset;
 
 	/* SERDES_IDDQ = 0 */
 	tmp = readl(base + HARD_DEBUG(pcie));
@@ -1921,7 +1945,10 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "could not enable clock\n");
 
-	pcie->cfg->bridge_sw_init_set(pcie, 0);
+	ret = brcm_pcie_bridge_sw_init_set(pcie, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "could not de-assert bridge reset\n");
 
 	if (pcie->swinit_reset) {
 		ret = reset_control_assert(pcie->swinit_reset);
@@ -1996,6 +2023,9 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (pcie->cfg->has_err_report)
+		spin_lock_init(&pcie->bridge_lock);
+
 	return 0;
 
 fail:
-- 
2.34.1


