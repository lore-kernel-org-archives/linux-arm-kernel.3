Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4495CC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxRFCrZ4tEYGl9pgNTMvFraV93EKM855ZrrXiCcwOi4=; b=nj639A4Hd2bUFoFNTR6nIz3DpC
	Uyyl7llt8X/9CKnUeynEuVv3XlQY6UbHU7agJmd2abgLXrjSrvJQSqCDM9978rsd3gGTFeGdn8e5b
	EoKRlUGnYxMM9lTRyTdqdEToBNki1vTiTLJNQh4e8dSTKVycZlB0frXidPl/EkBsS49JPydmN3GSW
	vK/9lAbJ8IC6fOECkiHtkTA8fdfPc3ykWdLdNTxnQlliaPUOHyoSJQWip+6TwZwhsOi52T8iMBx89
	l5udZKcgLH76rV2dTTCOpnNCFVBn2uvfL54315w90gMWnQfZyPDndh6zXT4jdsEzV34mEkNNTAbh/
	9mrVLzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AnF-00000000NAW-3asC;
	Fri, 11 Sep 2026 23:36:34 +0000
Received: from mail-pl1-x662.google.com ([2607:f8b0:4864:20::662])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amn-00000000Mp2-3LDf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:36:03 +0000
Received: by mail-pl1-x662.google.com with SMTP id d9443c01a7336-2d7200b2e15so5251085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169761; x=1789774561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxRFCrZ4tEYGl9pgNTMvFraV93EKM855ZrrXiCcwOi4=;
        b=finz3Dnyglwxpc3u3NDPctP2Pe3B+f98T9l1IiDLb20sJxYoFMKIwlwZgnvS9u0zf3
         xcSkSTCFZyaykc2AtNOKAebsa2IgxQNEaw8JbcDvA2HnARATDAGtz6gddYlDr9Sj6GXN
         WVLa+LpcHFnDDrY57u1y9GbqrBOTgeZzMLrhB4xUAcIpSBhMQbq8MVubjVM3i6xoaYMh
         iGPqAEWQhMR1UaMoJeIltSq6K1BKfYtFG2yWAwNS7kW8YhAkQeJX+U8MHJZfgEy5BOEt
         otyxirfUsb4xKy8MZzocgevvBaXNLetASiDQn8N2k3scXvuIej+GI1qWJm9NsThyT5v7
         /kSQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNBTtE2zChLU36F2MHHg7C+kiBDQl0/1zsMzh4J6Njqt3ERJHFKUuhh4DkkXPKoUEzSyyryfcjNXZzWI8SNNHj@lists.infradead.org
X-Gm-Message-State: AFuF++lRJxnU7KnNumtR6sb4y3Gvtyuu+CctLW6X12Y2vcv+Tc+yeBxA
	LjbR8rq7LRgkZk0lSc3Qe0GfqUgWZyUZxgeMsvLh/WwSmI6L4Uqgs2ZmPQWkiEmVjucMdblesEY
	NvvRR9jje+7BXMp+t568H6vZGPrc5dPTaXzHmZFF45NGAISDYYP7OdX0uUkHdDxpCUj+RXFm8AR
	1aDUOohzqCuoep9/1yifurvvASZsdYN+FxZMzvz0VgFQQf0OSM+Fb6J+vlBEAswHY0KwvgRjUHd
	Dhd+zM9CHaNU5LtDsKpzNR6OHckQ4A=
X-Gm-Gg: AYBFou1ixVe1Kfid8g2CCWUb4O4boQOvXeTWsgiU5vBN7PJxlU4UnPv4yPllzfWVQUQ
	PVf4ZvobefyoLD1a6ATA3tTaVWoUD9hBJpAyGVed6Dl5Jr92fxaHZ9A6C/1VGD27caVl6TysnCz
	PFPRCDQlUKGuZ+05zUtGtitbnn43CxRnYkSBGd8vKjclR0wLA0NP0NtmwvwBplfXyVvD83Dcn4m
	5t+OfC+v7HSzSpi7FeWMYpu5ilsFo3lPHiP4UBxWJz3+rAATlVMV/CMOD9U2WMexjxXKCPXCLwG
	vWm7VG2j9thO61TwZlqje72iDJkdWW1ZHvyrQhG4Ve699mi+XKVqwE9flgfw+0xMOqan1kqECHE
	BO5QDKKFx6f/PVcRJq4dkc2Meurwhm43mvtDjwS+NToKzrlCP5PnL5VXwmQbR5X8ONTIfynA9Gc
	GuDH8+jLidHgXfEXSXOcwT5Wfa+muIRYrMKfkl
X-Received: by 2002:a17:90b:278f:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39d9bbe47b2mr11957559a91.1.1789169761137;
        Fri, 11 Sep 2026 16:36:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39d9d595f70sm428992a91.3.2026.09.11.16.36.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104c2ce026so39935386d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169759; x=1789774559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxRFCrZ4tEYGl9pgNTMvFraV93EKM855ZrrXiCcwOi4=;
        b=KfmPxgGhNxweXysEx4vaXa5qsVaA+tH6h8S14/7qv6rT4Lxaq6rJYNx2etdPGOqwYy
         D1lXIUJYkkqnKoxlEoKaaNQ6QbnVFePYlXCKVxp8rbsVso66lFAwGtXeOH49PbtABn/I
         dBpo2m5EkDcTebH8mudMwIouCYZNQcqFNskzc=
X-Forwarded-Encrypted: i=1; AKwUvBw32y4YXrdJT88kpGeoGQ6AO9cn5/b2ljqhFqJwO0NjHD0WkPDtH4KIWP+OzKYA2HTCzgPMdfH7dFKOGGS6tk9k@lists.infradead.org
X-Received: by 2002:a05:6214:3012:b0:910:a402:eaf with SMTP id 6a1803df08f44-9121211d5c3mr93244266d6.35.1789169759477;
        Fri, 11 Sep 2026 16:35:59 -0700 (PDT)
X-Received: by 2002:a05:6214:3012:b0:910:a402:eaf with SMTP id 6a1803df08f44-9121211d5c3mr93243826d6.35.1789169758991;
        Fri, 11 Sep 2026 16:35:58 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:58 -0700 (PDT)
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
Subject: [PATCH 07/13] PCI: brcmstb: Declare and assign quirk 32BIT_PCI_OPS
Date: Fri, 11 Sep 2026 19:35:32 -0400
Message-Id: <20260911233541.1650895-8-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163601_843461_BB9B6BF5 
X-CRM114-Status: GOOD (  14.58  )
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

Declare a new quirk that indicates SoCs where the config-space accesses are
restricted to 32bit R/W.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 8927d1d97f4a..be414d346855 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -292,6 +292,8 @@ struct inbound_win {
 #define CFG_QUIRK_OB_WIN_32BIT_ADDR		BIT(1)
 /* Each of the outbound windows size must be <= SZ_128M */
 #define CFG_QUIRK_OB_WIN_MAXSZ_128MB		BIT(2)
+/* PCIe HW can only access config space with 32bit R/W */
+#define CFG_QUIRK_32BIT_PCI_OPS			BIT(3)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -1996,7 +1998,7 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
-		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
+		| CFG_QUIRK_OB_WIN_MAXSZ_128MB | CFG_QUIRK_32BIT_PCI_OPS,
 	.flags		= CFG_FLG_IS_BMIPS,
 };
 
@@ -2050,7 +2052,7 @@ static struct pci_ops brcm_pcie_ops = {
 	.remove_bus = brcm_pcie_remove_bus,
 };
 
-static struct pci_ops brcm7425_pcie_ops = {
+static struct pci_ops brcm_pcie_ops32 = {
 	.map_bus = brcm7425_pcie_map_bus,
 	.read = pci_generic_config_read32,
 	.write = pci_generic_config_write32,
@@ -2180,8 +2182,8 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		}
 	}
 
-	bridge->ops = pcie->cfg->soc_base == BCM7425 ?
-				&brcm7425_pcie_ops : &brcm_pcie_ops;
+	bridge->ops = BQUIRK(pcie, 32BIT_PCI_OPS)
+		? &brcm_pcie_ops32 : &brcm_pcie_ops;
 	bridge->sysdata = pcie;
 
 	platform_set_drvdata(pdev, pcie);
-- 
2.34.1


