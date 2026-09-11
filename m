Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE2CC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 23:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RexkG3EFmXpE/deY9AEDz2v/2Wt3PCylK3Bm+blW8Y0=; b=gZCoWuZRWG1aT9Y41HMIw8d1HC
	T/fNsp8mU6zxx696QpD3L7gegcxzBvVLxI3yWkf+OMx6CBRO3JoT1HSLg+hcqFQb+H71SI0piRiyz
	EfFq0ZtpSS8ADMiBWTroCVoBTS4P+F9uD6MUF4GyJjkF0pnoW8eroUHjvcox0MXOaEKzaxldrZJ/p
	YTKZzQ8xiwU9GSWl++kiPCcmYVSynJGdPT9UAvthXQaIyRkmhW7ETAnEaowUoWeYqZ8g4eKaM+vuW
	VQ3Ws3JvWWR/bHVLTICGmTzlWdTHeFyNFw+Ydp//B3LLz+2096xFiduwHJ0PVeVXagF5Q4dt3WyxS
	HkVEyDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5AnV-00000000NLZ-0yRG;
	Fri, 11 Sep 2026 23:36:45 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Amu-00000000Mtz-3hRd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 23:36:12 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-39b35105ba4so580597a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169768; x=1789774568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RexkG3EFmXpE/deY9AEDz2v/2Wt3PCylK3Bm+blW8Y0=;
        b=VyCJlTPihDvykdWNLzycbRurNSfe/Mcdhzr0TZAkc/h8NapJsbCaDDceLr8ac9aIh9
         /7hCRJn4TxtrydsgdXvWs/+qG04gsR1cmgJMW44PAUdiKLrDKP2CoeWo0f5DuDKBOFQJ
         6UQQQHSe/xG+Ad8j0dDOUIkQ4H9xy4GSFvn7Ckk5KJq8qDuOgZI4+pftz6ZVrjgJn1KT
         d8OhxJ+gORWVm3Qy646YxnUjXfRPZwZCJ4X08wRQbJzzT6vl5BdyLtgyhhWvJ8eanGWd
         IUSMbY47OrqwxDBvULtTR8tOaFnM6zzpsHWkC3j+hFy/e5XV846xqyvLNKG1dZWkgdN/
         5k4A==
X-Forwarded-Encrypted: i=1; AKwUvBxBOQgvfwXEzejILfZQW35xZkf/M6GsrZAhqeGSAcxgA/7F31IZq1+3yL7kHUMWAEFZVLQzPA2bZQI8cqAR8wH6@lists.infradead.org
X-Gm-Message-State: AFuF++nOwv+Q6cCftA8Mbe7zpEkpjatmnwZvAaffg0nBVTy2XgN9flPI
	R2oQu2Hevs8uUU78Ke84ZCDpF++yXZNaEIVnTtHDghHnfCkSN80wpBAD3hfNj87RE8H5jNfQzDp
	EILepFjJDIi+iVhfbFjvLwSOaXMxA89fU/7Mf3EX9OVdK+UJIvXcZsCzpTxEqazJOL+/Ux9XWU7
	UGdHBgg6Mc4j+65c92GUAEIchRpdFAx0TOsrzaRpmNEoU41MXmE7485V/lQrLryTjZld4qD2Hny
	xo9bBsuBN8Qh8hj3WZaX4km3xBAUUc=
X-Gm-Gg: AYBFou0rQZdiCoIDu0iR6vSIT2rsK0oF87c1P9/rTKjhPZHNgU7rKpo9fJHhxZSUwcm
	tJmLaH9PHLvcUmG7SVMgfB1HiJ9wckbdQ8wxXu+xWlSG9aIT1hk4NV0vv4MTiwodGxIDSkYUYOA
	9p4Sj65pcFF72ZIyxOs3CrYRNGBblE9GvtbcXVXI3g6aiTGH0fEfd3E17hpD2w4n4DrAbGAZiSb
	By4ce3aHpMowHIWpXKPJGexBvLmH1/+WYZicPmNIQvWOBE0wFt6RoaLshLZtdjaDPiB+dujPsN4
	I6oDIAZF9swYX5F7yMdJsQMzPZQlGJLnHxhwwmqRkzJmOFuxQtr5B2MbtxncBoau3VJ6Wr2TM08
	AUPuYVkQ/a7hN2hYT7oL3MMituIcj9NFUytt0sXlT4I5Agyjt7ZZi5IlyH99gY554Dxr7P92tkd
	QvP4XH5Cl4RJkBnpi0ofZVA5IM5WWc2C2ji+/f8l4=
X-Received: by 2002:a17:90b:3dcd:b0:399:ea1:5a82 with SMTP id 98e67ed59e1d1-39d9bc66ab9mr11446737a91.3.1789169768204;
        Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39d994bf7d4sm2174439a91.7.2026.09.11.16.36.07
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e869793d3so26615456d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 16:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169767; x=1789774567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RexkG3EFmXpE/deY9AEDz2v/2Wt3PCylK3Bm+blW8Y0=;
        b=YDAYK81lF4iE2w66EunR/iIa2Ndp1VDxbvav1ASi/yUOeyfxPGTECYwP1jOz+8o/BD
         Zrg8I6iH0tQQsjWpmH9+AndVraoon8cZBsuwzdWrxrzJ5tLilqPyqZSGY46IbLQkRdja
         7A9E3F5hmnCrr4YF+rY0PrnUXHGe8kGbKds7k=
X-Forwarded-Encrypted: i=1; AKwUvBzy2uqZ4f/ouxwY/5kWQZMMhhqIBEm2P1m1jRJGsjA0x/jnfg09aq0Y964lziAj8wXxuhrT1UpZEl6NLFt0UORn@lists.infradead.org
X-Received: by 2002:a05:6214:3218:b0:910:63c3:5c70 with SMTP id 6a1803df08f44-912120f1bdcmr91745156d6.19.1789169765640;
        Fri, 11 Sep 2026 16:36:05 -0700 (PDT)
X-Received: by 2002:a05:6214:3218:b0:910:63c3:5c70 with SMTP id 6a1803df08f44-912120f1bdcmr91744836d6.19.1789169765178;
        Fri, 11 Sep 2026 16:36:05 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
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
Subject: [PATCH 10/13] PCI: brcmstb: Declare and assign quirk PERST_PCIE_REV_CUTOFF
Date: Fri, 11 Sep 2026 19:35:35 -0400
Message-Id: <20260911233541.1650895-11-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_163611_295628_7DF9C234 
X-CRM114-Status: GOOD (  15.31  )
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

The SW behavior for asserting PERST# for some SoCs only works up to a
specific PCIe HW version.  Declare this as a quirk and assign it
accordingly.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index dfd703571091..047783e33ae4 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -298,6 +298,8 @@ struct inbound_win {
 #define CFG_QUIRK_NO_RGR1_TIMER			BIT(4)
 /* PCIe PERST# must be asserted before internal bridge turned on */
 #define CFG_QUIRK_EARLY_PERST_ASSERT		BIT(5)
+/* PCIe SW PERST behavior only works up to a specific HW version */
+#define CFG_QUIRK_PERST_PCIE_REV_CUTOFF		BIT(6)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -1987,6 +1989,7 @@ static const struct pcie_cfg_data bcm4908_cfg = {
 	.perst_set	= brcm_pcie_perst_set_4908,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
+	.quirks		= CFG_QUIRK_PERST_PCIE_REV_CUTOFF,
 };
 
 static const struct pcie_cfg_data bcm7278_cfg = {
@@ -2168,7 +2171,7 @@ static int brcm_pcie_probe(struct platform_device *pdev)
 		goto fail;
 
 	pcie->hw_rev = readl(pcie->base + PCIE_MISC_REVISION);
-	if (pcie->cfg->soc_base == BCM4908 &&
+	if (BQUIRK(pcie, PERST_PCIE_REV_CUTOFF) &&
 	    pcie->hw_rev >= BRCM_PCIE_HW_REV_3_20) {
 		dev_err(pcie->dev, "hardware revision with unsupported PERST# setup\n");
 		ret = -ENODEV;
-- 
2.34.1


