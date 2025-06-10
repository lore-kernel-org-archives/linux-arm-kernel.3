Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EC1C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fo8YOHT6CATeMOT+gVauR/XbmIAIPn7RfL7rxhobz98=; b=1lc6t09jbbGtVDhxndg8drMWO/
	ARquAgOt+DvfVUN8WwelSJaNGGKKOpnD3Xy4wDKCk9e+S7flOznx7zr5eg65yQ7cHQdLCY5aZMh7J
	zPgQZXaCMJ6htWmsqNW7Pi+g91Bi3zxO8tqn3vnXbZCMDGbrvYSkBxPynZZfkXfz2QG4Pib0m1DZL
	dEcf+ouLDhKRFc7oeP0JTrT9/JeLfAAplvfvePTO8IoBicB2F+T4Vpzm6f8KI3D9hPTybg/udIZy5
	Ptg5wRaNiF0SFvvDoRaeM6I4eMOidunqyFQo9XMplq1oEhrG8Z6JyvSEqYWftbaLgiiTZ6jwq9D75
	x/RKY5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7m7-00000008GFJ-2SIL;
	Tue, 10 Jun 2025 22:48:59 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4IB-00000007sao-48ZZ;
	Tue, 10 Jun 2025 19:05:53 +0000
Received: by mail-vs1-xe35.google.com with SMTP id ada2fe7eead31-4e59af1f0e7so1881953137.0;
        Tue, 10 Jun 2025 12:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749582351; x=1750187151; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fo8YOHT6CATeMOT+gVauR/XbmIAIPn7RfL7rxhobz98=;
        b=kJPRohuiFvDpfxXKDE9U5H9XcMPBzgGp2f5nO25WBBb+ev4jIcZK99yCb45hDLEuH2
         tu5lRRYgMVy/8f7UXZce/ezK6KG0CPmV9Wgaaa+TaldT/OuSsMLisVzIFcEaTDqTrqr/
         +cG68CT2kYFqeo0c9yoPrp9VturiCbOKS/nZLchgKC+B8sGz84DAqMdYm9Njl6pCtDtW
         IEsF7Ss6jpVO3e99dGaQmW2Ubknm02HRErjgddrADEsEXXNeQan6eQx/hL3KJlmYmJtn
         wvK1FSkeuIGSECXR4eM/5z0Z8XrUIwf+IBFiZV28Q8wGhNeGeS3GKW0z+RC76W4Vr/GE
         wdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749582351; x=1750187151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fo8YOHT6CATeMOT+gVauR/XbmIAIPn7RfL7rxhobz98=;
        b=E9vX2DaFN6DM5L1XqflcPDoTq4Gv6lTrzc6vS/zkZs5tFHRnV/JU4URyYcEzJZEX1m
         n0DmQpZp+C7kgf/TKU2PZNm8ytyAV1w+9trSf2c6TlcfaiUw8WDOe+OHQNE3RfAd64Lx
         iIODNGuvMeumLPpmSSejb0Jna6uR49vWuAyMnuoIoMjLUjEwzzSmK96dCL+NNQNRZVBT
         G+xor3TI6rQotXIB57KRjYzQNcaIzenEDvrmS728r3UzLmGVdCx/z0Dm2rwMcFMMqs2m
         I3wEJEyNRjnUOeit7/5TTJkqhWyT0RMIUkpXGqdQJtdNHrl6h1/5BahcEfAXdwWyray1
         vc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6X0jQMf27PRuRCZWJ6h6yOm0RJ9qs+xsOHq/gyXx6BZkYOPwshP/zpXgJCOfE32R1EbVf+MbyaMg4foi5DgXm@lists.infradead.org
X-Gm-Message-State: AOJu0YwWehWrEdxhcRACDhTwt/3O0mG8AlS/GChYgt0f8pCaZS+KaR2t
	auEoADoRiEPkK1/R7lpnL8ugL6y2drIeOS7pAXtTOEtQEqGhGXggYugedVXP9Um7
X-Gm-Gg: ASbGnctMvD6n/5RXixTht3I5aHT6TlBZq6us+bopKe/LnkRQMJGyp+9CXXsAc5UFDvj
	HTGlQFuDDS5jiw1jFl1Gls9U7y6SKZ3k2TQo3MGdH3GFWjeeCgGTAumVpKUduokCF5bL00+07J3
	9K17SEkN9sMOOvZogDjgT8agtdqftxOotM1Lh5mCyn3wtylK0D6kvU3GkxQE+9ek9DsLRdJnKQi
	RyhC7AkChn67V24PFg2+5jiwIgi6GGxZL6uLNCkRFy840wcM9yaooikwssWDQEFQ6+QAbYWgrSg
	OPiKguRF0Uqqwp8S1oyEqdlvovP0zLTyh+Z4o1pLqGDqG8z4Q8J+OLiCDwli
X-Google-Smtp-Source: AGHT+IHsOECopwO8cvIVwhaTWu/i5+K9/yJofeA0iRJIWglC9WKZLtorpawxREPgref4SCUi7MF5xA==
X-Received: by 2002:a05:6102:3f8e:b0:4e5:babd:310b with SMTP id ada2fe7eead31-4e7baed7a27mr701927137.10.1749582346185;
        Tue, 10 Jun 2025 12:05:46 -0700 (PDT)
Received: from geday ([2804:7f2:800b:5a56::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7bb060aaasm150155137.24.2025.06.10.12.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:05:45 -0700 (PDT)
Date: Tue, 10 Jun 2025 16:05:40 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 2/3] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749582046.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_120552_026695_197E5291 
X-CRM114-Status: GOOD (  18.24  )
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

After almost 30 days of battling with RK3399 buggy PCIe on my Rock Pi
N10 through trial-and-error debugging, I finally got positive results
with enumeration on the PCI bus for both a Realtek 8111E NIC and a
Samsung PM981a SSD.

The NIC was connected to a M.2->PCIe x4 riser card and it would get
stuck on Polling.Compliance, without breaking electrical idle on the
Host RX side. The Samsung PM981a SSD is directly connected to M.2
connector and that SSD is known to be quirky (OEM... no support)
and non-functional on the RK3399 platform.

The Samsung SSD was even worse than the NIC - it would get stuck on
Detect.Active like a bricked card, even though it was fully functional
via USB adapter.

It seems both devices benefit from retrying Link Training if - big if
here - PERST# is not toggled during retry.

For retry to work, flow must be exactly as handled by present patch,
that is, we must cut power, disable the clocks, then re-enable
both clocks and power regulators and go through initialization
without touching PERST#. Then quirky devices are able to sucessfully
enumerate.

No functional change intended for already working devices.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 47 ++++++++++++++++++---
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 2a1071cd3241..67b3b379d277 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -338,11 +338,14 @@ static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
 static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 {
 	struct device *dev = rockchip->dev;
-	int err, i = MAX_LANE_NUM;
+	int err, i = MAX_LANE_NUM, is_reinit = 0;
 	u32 status;
 
-	gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
+	if (!is_reinit) {
+		gpiod_set_value_cansleep(rockchip->perst_gpio, 0);
+	}
 
+reinit:
 	err = rockchip_pcie_init_port(rockchip);
 	if (err)
 		return err;
@@ -369,16 +372,46 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
-	msleep(PCIE_T_PVPERL_MS);
-	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
-
-	msleep(PCIE_T_RRS_READY_MS);
+	if (!is_reinit) {
+		msleep(PCIE_T_PVPERL_MS);
+		gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
+		msleep(PCIE_T_RRS_READY_MS);
+	}
 
 	/* 500ms timeout value should be enough for Gen1/2 training */
 	err = readl_poll_timeout(rockchip->apb_base + PCIE_CLIENT_BASIC_STATUS1,
 				 status, PCIE_LINK_UP(status), 20,
 				 500 * USEC_PER_MSEC);
-	if (err) {
+
+	if (err && !is_reinit) {
+		while (i--)
+			phy_power_off(rockchip->phys[i]);
+		i = MAX_LANE_NUM;
+		while (i--)
+			phy_exit(rockchip->phys[i]);
+		i = MAX_LANE_NUM;
+		is_reinit = 1;
+		dev_dbg(dev, "Will reinit PCIe without toggling PERST#");
+		if (!IS_ERR(rockchip->vpcie12v))
+			regulator_disable(rockchip->vpcie12v);
+		if (!IS_ERR(rockchip->vpcie3v3))
+			regulator_disable(rockchip->vpcie3v3);
+		regulator_disable(rockchip->vpcie1v8);
+		regulator_disable(rockchip->vpcie0v9);
+		rockchip_pcie_disable_clocks(rockchip);
+		err = rockchip_pcie_enable_clocks(rockchip);
+		if (err)
+			return err;
+		err = rockchip_pcie_set_vpcie(rockchip);
+		if (err) {
+			dev_err(dev, "failed to set vpcie regulator\n");
+			rockchip_pcie_disable_clocks(rockchip);
+			return err;
+		}
+		goto reinit;
+	}
+
+	else if (err) {
 		dev_err(dev, "PCIe link training gen1 timeout!\n");
 		goto err_power_off_phy;
 	}
-- 
2.49.0


