Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7147C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzNQkY2OXtljp7yt/i/tI+v/gWIw5D47TujWJasE/B0=; b=L7v3TcnVBDCvfjZRPLpkFdiqvW
	H4D5HlSCugFpQ8qO95J2M0OfZ+gYm0JhaLvXKCT7zTwkN/D4Y00Qj565Y1SEt8UgHK60xdTTUpeoD
	dsLndipxaBrU1ISLQDHM2fQKM3+HNTEJ9HPR0oRw/sonHmmnmi0ZTtRCs3xQdLWDnLqREf2Q7VbfZ
	Kzt4c8Rsm2/WqozdDNxbWIeqXziN1180mdnfRIslKFdNGIv7A2OcSSPkioVEEb+taYPUP5nZT86Sm
	3CpedXtqumEe1hPdX37TGFvdf3ggBX+InD6caPFw8YbJf5eNbIaXPYiY5FjVvMeg9vmb7sCr0qIj7
	pY/62v1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwwR-0000000FNO3-1M5R;
	Fri, 13 Jun 2025 05:27:03 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwqE-0000000FMcK-1w7O;
	Fri, 13 Jun 2025 05:20:39 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3134c67a173so1928541a91.1;
        Thu, 12 Jun 2025 22:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792038; x=1750396838; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mzNQkY2OXtljp7yt/i/tI+v/gWIw5D47TujWJasE/B0=;
        b=cvwWXjxmHvbwRYx89vds2WgQVpiYG/QXm3s1fBWAi4lOnQF95yalfh16F2BG0wRWhy
         tzbDEqaj18kGC56EhV++nHQypXch+PuwBMyOZaFlytd1nPF7GSTgO+EoV8e0BiQq7ryq
         9PHbrbEN41lLQPbwHqXkGAhbXijzjzA3mvnUrogdiSE4eKlXUa66L5VYDZiVUUUopN13
         VDZdjwj1b/GEdRhh/QDsBKPvQIJS0nPedFS/1JJyStI9FYApB/x9T+h9EPlSO3WcBi+N
         v1fYkLzt638Jr2Spl+EIK2EvNyrt9ztW0ed5TjqQ1KFGq24b+hBzv2J9cA6bXxjpCTZV
         bydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792038; x=1750396838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzNQkY2OXtljp7yt/i/tI+v/gWIw5D47TujWJasE/B0=;
        b=b71YhL5tovMH0gBMhC6Q3VNGJ6kRNpNjGtJ3DJbfHMfkccdcRNB/gfkO4Tr2ghaCbT
         PFjsxxxJrFBqyCbK4eaqPhNiVqdswzDhJFgP08etgJGXkUXYGNLGd27mvoWtwzwlhDwd
         pEpG/kEguvnMcereDStsg36omdgvopyrjxxcdlXKh6cXQw7JAH7PHnUrjK9nIKIytQDm
         kTms1Fh0bM10kS3XjpRRea9Pvo6kZ9dUsbMc96VlvH8mf+Wziv/aOVYfTN2ycTRByFCK
         +HSvWUKhOHLeJq9ng6hQ3K7wyFyPM2DXNRoZV75ajsfHvQPKkoBQjT+P0rVdDgjj60mP
         nFMg==
X-Forwarded-Encrypted: i=1; AJvYcCUylgAUo7N0BwYRc7q/wKLFuYaTC3lsvmiLjSwa4jXf7awI1mzSyWCb9x3MugYtKulTFU2zTjzDnwTj@lists.infradead.org, AJvYcCXUC1rA+hOPDjTtYTZwQ9EucTHp0ToG0W7lggnSD/aM0v64OBjMKayoMSTEEltDxeC0dFyiKi9KwtrLxviJZLps@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp4klBljAq7J+/0+vO3yrM0bMrEkE5XfLq64ene4Gj8Ap6rw5Y
	Nqx7A0nIWbb6c1FzjnIdgCDOjbsSoMH2b4ecxOUTtWeQgNeJNOBfNyNqGXcQLtmS
X-Gm-Gg: ASbGnctsWiupUtdPALD/sZQH/sT37C/oUV41WEDbXbcUa2Oz5FxUJzLlIrrmouYeigs
	7eEud+hYIl08X7y+dQ5OqolBvmr6JY0NulBtLZ3PZCO/hwqIsaOd9w50+X/3s/MyZ7iyXlneXk/
	8zy2qJpRn9OotdTHzq0Z60tdko8JNEDGF2GrbrXFm63ORBYCrt0ZT8bylaVwMEzQxwnsE8DeW6n
	pmNGMw9DmwLY6/YZXHAISvjeqtF7JxZWZuq++XWj7wXiwn+6/wKyMVTy7K/emGTR43BIXdPuNAM
	yipUhRgLyA4elYlRN6dDGps+/PZ/lH8nPq+uLH3WhVJ9UEQ+VvQgzs4hLOl9
X-Google-Smtp-Source: AGHT+IFD4kNMkddGc3wLZDbhh2d7dD+nWlT0oop83EPQ5kX+4wOE8LIWl38jo2FQjDZelFQ07DNH1Q==
X-Received: by 2002:a17:90b:53cf:b0:311:f99e:7f4b with SMTP id 98e67ed59e1d1-313d9eaa4c9mr2631617a91.28.1749792037498;
        Thu, 12 Jun 2025 22:20:37 -0700 (PDT)
Received: from geday ([2804:7f2:800b:7667::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea8fd6sm6190925ad.145.2025.06.12.22.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:20:37 -0700 (PDT)
Date: Fri, 13 Jun 2025 02:20:31 -0300
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
Subject: [RFC PATCH v3 1/5] PCI: rockchip-host: Use standard PCIe defines
Message-ID: <fc88993a561fcc9a9960c038bbc8b0b717924888.1749791474.git.geraldogabriel@gmail.com>
References: <cover.1749791474.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749791474.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_222038_506138_E190E91B 
X-CRM114-Status: GOOD (  11.61  )
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


