Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBC5C88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY9ozb5KV1VBJo3Z3p+RlJyXkFICluMij+wCeI97mXA=; b=RS+gKoNsQRV9i6/OvUOsAZhtq5
	ntzSsTyIedLRoYuiaxTdst+9STwxT08d9Rh9SpWOpLxJNn0cjsIm2GeWzZ8ntiFJlJxudEKAi9YIR
	aN2qvyyEY3BzFaIECHA6WnLrxnvz/IVvbI7x1ypQILJEFtS39uTfLs9vbern2adcyCADtRuuimuRv
	TCCFriRRcY4++O7oPC3jFwdsNkrTnaJcpBhxX4X3CpZoWDSwkuZ6CGVbTs/zIcQ1WFwbsB86wHcks
	E+6MKJ8gR7kv3B9SIYt4uG1siMSxp9mq8zOATyiPvAQLypTgJtTbxqxZ8M+Mb9fkJZ7ygZpGpWNVP
	LXJlUXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ami-00000000Mkv-1Oyp;
	Fri, 11 Sep 2026 23:35:56 +0000
Received: from mail-ot1-x363.google.com ([2607:f8b0:4864:20::363])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ame-00000000Mio-3wfe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:35:55 +0000
Received: by mail-ot1-x363.google.com with SMTP id 46e09a7af769-7f4f3683fbcso1478832a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169752; x=1789774552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dY9ozb5KV1VBJo3Z3p+RlJyXkFICluMij+wCeI97mXA=;
        b=imj3rxMK0/Q+Sao4/t86Mz0TAdq3IguiQrJ8W/MTAcsXY8YhXs0hru2Tbk9GnAHpSO
         CgCrjl5Jxs9pEvbUTZD0U/Rd7frWew+Y9cbijfussSAG9BSwv28vvUf8CSeuEJHv673b
         syAgnnhKC+XlcbQZXKybf4OkShP4WBBLhmx0/2xtriHh/rtlsGOnyHJof6/z4woC8S8G
         DPMDbJNw5V0NpvYOdiq2fZmsphl9VS9KFx5pVS9gPhCyHeTBSJdCex18SXXdm5CtW9G0
         3y6ieCyGw6Ddy5S6pnQOJxmsPYBq9n4rG6PMe4BGZpmnRd1zrf0OQSCxemKyNTK/wjiD
         NN/A==
X-Forwarded-Encrypted: i=1; AKwUvBxMItcbTaKcR4BT6r0cHtVXyeYKlDldfSNyjPOqm9Onxxru4xVHsN+4rlXxu8sZ9io7btUwXd25N8zHR5mHUfcQ@lists.infradead.org
X-Gm-Message-State: AFuF++l9VOLvOMfM5Z+/FMN1MKOtlvwqbUdjb1OpnMcLOXdVL0u+XeUV
	JDE34t/b2JGOr6qZaJMrNbmu55ffwGFTwUdBqfpCA4ht1nnYzjPiwohAzBls2MF3amdzaDVm5Mm
	9FrBK+4pO2jnzI1vLDJO+8rY0MNuhaMTzWzys26rfrMUl6dkeKMoWFBpKZvFcoZFqHhVRm5NeDZ
	+w6IaEjYM2PqZYVdX6kYgFBTeWv5QVTFJQftWAblWTz4xrZ/o4Z5ZFP2ypRkwF+qh6bh+QReyX0
	UYAFsMsvhSpibkubM5JVs2u13kN7pA=
X-Gm-Gg: AYBFou3twJMId4fc/Np/BXj5f6X7vA9iDay4jMViief4H45mP6D4uBlFIMbjNoLwdFc
	7WaLfRFAEhx2A3YO+BsTEUYpfwoFWfNtXJA143aSJvJ159c0V8KCCsQWnHp8uhfoCjFL8/eaYTI
	vSykU6pnh2DWSlwm/sUA9nP+Yl2YpUy8R/A8B5Oqt+V86GL2qh1O5f7Be0RfYN2djCkHA/QgVAi
	6JIuhUA9PqF/+7XfUv+xqJ/2UGA04soU7aSsYYJQW9fSvYvceA57rCyvp5vRl062rHXg+Y2nxfS
	5MA8pticJQLbmjEKqsOcDaJVIni4t4zEDKavucl246KXuzPR7SZccajbSUCzXoaqY4/yScBCtjA
	aLiVkb4C6gmEYnzeVDE/d4f/iP3AHaQQmSnSEYSTOGJT9IsXoMxNt6q0XuVBIPGNorRDPTNfTJE
	X6OmrayztCcrq4qSHB+tIjIAwQKrbfyMbyAYGx
X-Received: by 2002:a05:6830:3e99:b0:7f4:db2:35b4 with SMTP id 46e09a7af769-8027c5b245cmr4724987a34.18.1789169751783;
        Fri, 11 Sep 2026 16:35:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-803f5df83eesm1939554a34.5.2026.09.11.16.35.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9102f07f2fdso49987866d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169750; x=1789774550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dY9ozb5KV1VBJo3Z3p+RlJyXkFICluMij+wCeI97mXA=;
        b=ZxhVzllYnENFJpOTY8ZMtglder/afCyJDrI/JiUghYcwZQeGMyL8rDmrb2wAlv4NMX
         QqKNoJPCBfkaWQ82j1dZqFPaOfJWB/vHQh2c1GQT4RwT8Dt5tzkO3QB7hsQqK1HaYGm5
         5VPKwezNf1PEkU5Jn2q03UAr1GCuMT96NGN7o=
X-Forwarded-Encrypted: i=1; AKwUvBzu0GF9DB2RhBpyL2GeBLwotkUzvjoeEujXkbM30bQ0HXp+y/OZKXYwYtM1lZ8BPaq+OjdhnDNzLStnrA5eses3@lists.infradead.org
X-Received: by 2002:ad4:5965:0:b0:910:42f3:958e with SMTP id 6a1803df08f44-912029a2a01mr144987316d6.27.1789169749970;
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
X-Received: by 2002:ad4:5965:0:b0:910:42f3:958e with SMTP id 6a1803df08f44-912029a2a01mr144987016d6.27.1789169749543;
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:49 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
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
Subject: [PATCH 02/13] PCI: brcmstb: Use flags u32 instead of bools
Date: Fri, 11 Sep 2026 19:35:27 -0400
Message-Id: <20260911233541.1650895-3-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163553_455808_A269133E 
X-CRM114-Status: GOOD (  17.95  )
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

Instead of having separate 'bool' fields for each SoC configuration, use a
small bitvector (u32).  Doing this uses less memory and provides a uniform
method to assign flags for a specific SoC.  The expectation is that more
flags will be added as we replace conditions like "if (chipA || chipB)"
with "if (behavior_X)".

A helper macro "BFLAG()" is used to shorten the determination of the flag
value.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 89aaa19d508a..47862569937e 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -286,16 +286,24 @@ struct inbound_win {
  */
 #define CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN		BIT(0)
 
+/* FLAGS */
+#define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
+
+/* The PCIe HW registers have phy control of a "RESCAL" reset block */
+#define CFG_FLG_HAS_PHY				BIT(0)
+/* The SoC PCIe HW can dump to the console PCIe error info */
+#define CFG_FLG_HAS_ERR_REPORT			BIT(1)
+
+
 struct pcie_cfg_data {
 	const int *offsets;
 	enum pcie_soc_base soc_base;
-	bool has_phy;
+	u32 flags;
 	u32 quirks;
 	u8 num_inbound_wins;
 	int (*perst_set)(struct brcm_pcie *pcie, u32 val);
 	int (*bridge_sw_init_set)(struct brcm_pcie *pcie, u32 val);
 	int (*post_setup)(struct brcm_pcie *pcie);
-	bool has_err_report;
 };
 
 struct subdev_regulators {
@@ -356,14 +364,14 @@ static int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie, u32 val)
 	unsigned long flags;
 	int ret;
 
-	if (pcie->cfg->has_err_report)
+	if (BFLAG(pcie, HAS_ERR_REPORT))
 		spin_lock_irqsave(&pcie->bridge_lock, flags);
 
 	ret = pcie->cfg->bridge_sw_init_set(pcie, val);
 	/* If we fail, assume the bridge is in reset (off) */
 	pcie->bridge_in_reset = ret ? true : val;
 
-	if (pcie->cfg->has_err_report)
+	if (BFLAG(pcie, HAS_ERR_REPORT))
 		spin_unlock_irqrestore(&pcie->bridge_lock, flags);
 
 	return ret;
@@ -1589,12 +1597,12 @@ static int brcm_phy_cntl(struct brcm_pcie *pcie, const int start)
 
 static inline int brcm_phy_start(struct brcm_pcie *pcie)
 {
-	return pcie->cfg->has_phy ? brcm_phy_cntl(pcie, 1) : 0;
+	return BFLAG(pcie, HAS_PHY) ? brcm_phy_cntl(pcie, 1) : 0;
 }
 
 static inline int brcm_phy_stop(struct brcm_pcie *pcie)
 {
-	return pcie->cfg->has_phy ? brcm_phy_cntl(pcie, 0) : 0;
+	return BFLAG(pcie, HAS_PHY) ? brcm_phy_cntl(pcie, 0) : 0;
 }
 
 static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
@@ -1898,7 +1906,7 @@ static void brcm_pcie_remove(struct platform_device *pdev)
 	pci_stop_root_bus(bridge->bus);
 	pci_remove_root_bus(bridge->bus);
 	pci_unlock_rescan_remove();
-	if (pcie->cfg->has_err_report)
+	if (BFLAG(pcie, HAS_ERR_REPORT))
 		brcm_unregister_die_notifiers(pcie);
 
 	__brcm_pcie_remove(pcie);
@@ -1999,9 +2007,8 @@ static const struct pcie_cfg_data bcm7216_cfg = {
 	.soc_base	= BCM7278,
 	.perst_set	= brcm_pcie_perst_set_7278,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_7278,
-	.has_phy	= true,
+	.flags		= CFG_FLG_HAS_PHY | CFG_FLG_HAS_ERR_REPORT,
 	.num_inbound_wins = 3,
-	.has_err_report = true,
 };
 
 static const struct pcie_cfg_data bcm7712_cfg = {
@@ -2179,7 +2186,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (pcie->cfg->has_err_report) {
+	if (BFLAG(pcie, HAS_ERR_REPORT)) {
 		spin_lock_init(&pcie->bridge_lock);
 		brcm_register_die_notifiers(pcie);
 	}
-- 
2.34.1


