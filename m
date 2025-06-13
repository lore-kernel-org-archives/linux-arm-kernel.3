Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA91BC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzNQkY2OXtljp7yt/i/tI+v/gWIw5D47TujWJasE/B0=; b=XOIAW6Aj8FxE4HKUbBwhD0ToHv
	mBzzpERMCDTylRA1QpRMJHIiXsF/FpBsGfmkMA2guPTSd48bnW4NfgE9eWcfdUTPgqXBwkFgU9lwE
	AasX+V5yS3OY2JI7bcO8NI9H9khmNlm8bK6tY+40ElD35iFHBQJaR2fVCY8jLUFxr6bQLySdZMsbp
	SGeanyQiq3n8W/9ll8HiC9/VJxas7AMnrC1CH1b5NdCNyt+Y3B2PF8unbFE0ctQLbg97DAgFrruyP
	csE1lwFBCFctQfNUrR1OQFvveo4Vg+tEx8rAHhNpAbr4DVa+V6h+EZF75gO7HjvYv+ABWckYYOqlh
	O9OCSvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7IJ-0000000H3Zn-1zjU;
	Fri, 13 Jun 2025 16:30:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5yL-0000000Gokx-43Sl;
	Fri, 13 Jun 2025 15:05:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23602481460so21934555ad.0;
        Fri, 13 Jun 2025 08:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749827137; x=1750431937; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzNQkY2OXtljp7yt/i/tI+v/gWIw5D47TujWJasE/B0=;
        b=iVkGtBFo9RV9HnPoSAWviolig7qGzn5Oe8r8M7vMt3wy5hno2kh54AaS1s6QvEoJPL
         Oo17aH8dtfNNtBSFaXMCVMeRNwBLdNd+QyVnZOTTR07t048R+QAcIPWXhBr1DGlkbz4N
         T9j3W0Trb1I8emoeeH287SA1rRRL2dDxI6UPiypuTcG9iYvGRcRwnvtu77W5XOhNb7hP
         7Gyaqp0gWd5SA8t5RB/1iVwJh9PdtsMoCCP0r/KAk6ArAQAzP+NGd2dsGgYWBpuj0hKg
         VTsvxTgalAjUF2Ik8yirrHGHEoBZv57ni3Vr5FbVDNE1Fg5PsD347jON19plHXUujif1
         DP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827137; x=1750431937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzNQkY2OXtljp7yt/i/tI+v/gWIw5D47TujWJasE/B0=;
        b=ssDUxuqBAeqpNg+sRLllcZUlLqr6dmyD75K+RleklJluvok3NSrcmU3M2iTNIp4AKp
         s7b3Ul7FgbJwnfrHNbfRHMzReZmLH6XnRaTRhw3PBPyIqKjlapDdZtSvbM+HW+cLi9TS
         QJ0rxk5GiLe6IOjD3lcYcymB88lg+htXfM+BJUJsgbMgUlXmScXpkisl5onG9SaB4fm9
         9Soe/mPVvcXMaQftv4X4qQyIgdhdiUXo83CWpDd6Ib8hwO8VhxdguUAOUe0whILlyBao
         jCKYL+pfeG3Ayj9aSzMcKD7BTeV4ZcSEqz7x+zPwzesNNfqnJGQPl83cRYEanZDAdUnv
         mDRw==
X-Forwarded-Encrypted: i=1; AJvYcCUrQ3Btvp1FtXctN699Hh84HbnuNgdaj79iXxeJBFbk3tC/I/DLPX4nQ5B330quyK3wodRjFIXm0JWCRhIPUTQc@lists.infradead.org, AJvYcCXllm3Hx7aWghmwh+IdPf6hcaIvx8rUm+qYGU7UNuIUlfwt5SRFkovr274aKq/b8yEmdrD+VJIu1NY7@lists.infradead.org
X-Gm-Message-State: AOJu0YxYbJdIN4xjAZGXG3ryd+9unQ6MgWe5eDO6btvWJ7OLs07ugHtA
	S3QiG8/0ATphOM0weHCx7KkW339kTC0chBfHLSsV+eAz2PZLX65/TQcTEKKEhd/V
X-Gm-Gg: ASbGncskn8kR/zcTt/zaxD2i7NfKENOS2sn8qX5CsWSozjnh00+59dEkDCwwfZ1xUkf
	PG6pvF0QhnHbjazHRyEsIyqTli3MPhv8jJFVdXNBFU0MvEUq9l9RVQR2cv+XUy/HCymmr+rKeGp
	QOif+gx/kHSbz15wpDdrYYcRxGs33EILZjbXtieZFpYHsOHbd5oYb9qaQ4SHnIB5yJhn8cs8kGd
	+zIW8nG22G8qEwsPnQUtJOtEDFi2Bhwkvc+MyblJwH7RiI6527VURmU6q9LP2UUUs56juiaKpL6
	F8h3YOtK04+d0YczKjWnLMmhy9esU6AG3hDLwhnw83KCiGazMA==
X-Google-Smtp-Source: AGHT+IHUZiUNYYnkhNtOIXhUvFD1NyZ9GfAWtXm9pvCPpRR/XwK39oN7VLpPRBZkXkHNasnAU2L+zQ==
X-Received: by 2002:a17:903:1b6b:b0:223:65dc:4580 with SMTP id d9443c01a7336-2365de4ae41mr48856495ad.52.1749827137214;
        Fri, 13 Jun 2025 08:05:37 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb04a6sm15372025ad.178.2025.06.13.08.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:05:36 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:05:31 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v4 1/5] PCI: rockchip: Use standard PCIe defines
Message-ID: <992ab6278af59b8f2f82521bf4611f69a916bbe1.1749827015.git.geraldogabriel@gmail.com>
References: <cover.1749827015.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749827015.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_080538_006472_8E619C54 
X-CRM114-Status: GOOD (  10.58  )
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

Current code uses custom-defined register offsets
and bitfields for standard PCIe registers. Change
to using standard PCIe defines.

Suggested-By: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 44 ++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index b9e7a8710cf0..65653218b9ab 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -40,18 +40,18 @@ static void rockchip_pcie_enable_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE);
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 }
 
 static void rockchip_pcie_clr_bw_int(struct rockchip_pcie *rockchip)
 {
 	u32 status;
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= (PCI_EXP_LNKSTA_LBMS | PCI_EXP_LNKSTA_LABS) << 16;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 }
 
 static void rockchip_pcie_update_txcredit_mui(struct rockchip_pcie *rockchip)
@@ -269,7 +269,7 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 	scale = 3; /* 0.001x */
 	curr = curr / 1000; /* convert to mA */
 	power = (curr * 3300) / 1000; /* milliwatt */
-	while (power > PCIE_RC_CONFIG_DCR_CSPL_LIMIT) {
+	while (power > FIELD_MAX(PCI_EXP_DEVCAP_PWR_VAL)) {
 		if (!scale) {
 			dev_warn(rockchip->dev, "invalid power supply\n");
 			return;
@@ -278,10 +278,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 		power = power / 10;
 	}
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCR);
-	status |= (power << PCIE_RC_CONFIG_DCR_CSPL_SHIFT) |
-		  (scale << PCIE_RC_CONFIG_DCR_CPLS_SHIFT);
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
+	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_VAL, power);
+	status |= FIELD_PREP(PCI_EXP_DEVCAP_PWR_SCL, scale);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP);
 }
 
 /**
@@ -309,14 +309,14 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_set_power_limit(rockchip);
 
 	/* Set RC's clock architecture as common clock */
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= PCI_EXP_LNKSTA_SLC << 16;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 	/* Set RC's RCB to 128 */
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 	status |= PCI_EXP_LNKCTL_RCB;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 	/* Enable Gen1 training */
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
@@ -341,9 +341,9 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 		 * Enable retrain for gen2. This should be configured only after
 		 * gen1 finished.
 		 */
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LCS);
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 		status |= PCI_EXP_LNKCTL_RL;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LCS);
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL);
 
 		err = readl_poll_timeout(rockchip->apb_base + PCIE_CORE_CTRL,
 					 status, PCIE_LINK_IS_GEN2(status), 20,
@@ -380,15 +380,15 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 
 	/* Clear L0s from RC's link cap */
 	if (of_property_read_bool(dev->of_node, "aspm-no-l0s")) {
-		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LINK_CAP);
-		status &= ~PCIE_RC_CONFIG_LINK_CAP_L0S;
-		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LINK_CAP);
+		status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
+		status &= ~PCI_EXP_LNKCAP_ASPM_L0S;
+		rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP);
 	}
 
-	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_DCSR);
-	status &= ~PCIE_RC_CONFIG_DCSR_MPS_MASK;
-	status |= PCIE_RC_CONFIG_DCSR_MPS_256;
-	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCSR);
+	status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
+	status &= ~PCI_EXP_DEVCTL_PAYLOAD;
+	status |= PCI_EXP_DEVCTL_PAYLOAD_256B;
+	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL);
 
 	return 0;
 err_power_off_phy:
-- 
2.49.0


