Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903F2C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wXKUp0jLGdtp7D5Cr5HTNVyQxHB2C0Ds7jpfGQp1h+c=; b=R/BIAzGnO26OrOiEHJrZlCLUHI
	7LuIIblff/bwXp1UldHT6UGiFeMEThHjl7FAUBUTKMcZZJOZ1RoqO77BMh4Jix8NPbZDAyR/M6lYV
	PB8qhsku83peJYhMFSpJhfBtuGiMxCmICY7B/qKLeE5ZrT5K5rpLElUz7ASberP7S1phCG2ICHTPU
	GAbrvMlmUfp7KsS1q4po5zqmQgi5c4oZUWmhI7pOhTXIlLS8bjZKoheA8hBc0D4lsNJgzpyElHvJL
	bAod9WAMrrvv3v5yhBsvvoHLX4kq8giJtF5nNfrIT+YuLK/Mvhrf/QEtX0xWCzmjE45uCp46K0UJA
	fWLIIbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkGn-0000000D0gQ-1L4A;
	Wed, 04 Jun 2025 09:18:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkD8-0000000CzrP-00FR;
	Wed, 04 Jun 2025 09:15:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-234b9dfb842so62137825ad.1;
        Wed, 04 Jun 2025 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749028500; x=1749633300; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXKUp0jLGdtp7D5Cr5HTNVyQxHB2C0Ds7jpfGQp1h+c=;
        b=fTUYt26+S/N7J37Yi52RC0LQZoXcDcW6jUxRzivHM6Bg0WltEExjPs4mc1wxvekI2O
         W3zidjjh+wn2DOTNUNO0UPLp/zQvRSf4hBsi6NqtyKfDozx+qEHhlMc+gBEmNLu4o/qx
         30fVCBpiQ3YCtxtzDNq7EM8eeONtZdwEBn8oOvi4f6jgDJA9s8a+RI9mFZHM3DwmIOwI
         9n+bMSJujRT6mmGhx1E2gZTZlGwj65F5q9N9uGEAhwa+zskQmgKeq462i5kWYjU+Agkb
         jDJvE3cWnYeGqgwD6KfQTJPnezad/JJ92Ck/dpNDFmBiCS72jYvjhbXMCXZEuFPf/hjk
         muhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749028501; x=1749633301;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXKUp0jLGdtp7D5Cr5HTNVyQxHB2C0Ds7jpfGQp1h+c=;
        b=PBkO0c+yJjvHuicaYobiNVFoZb3A9ngFUjObpsRiPvoju52ZKEeCyQdL7wX7+edbil
         MJpIevZkdEvnRLcKQY5sjjIkSzruxYthA/P2Fw5/1G9Ki8igKPsxkN7fX8xixtSb9D2/
         VcGNfCvnbiqmuyS7cuj+TIcuea+S8yQ6T1I3yb9pCBLocgjWjiHYXBZ/P7h8lnhmFqRr
         z4uhOKeHKF8GEBtUCZ09B5yPHfANSzcmCyovoaseXX/vI+30k2DetFugSN+oCQIuPzxO
         12OFqHOj+XEUJvnWC8gxx7dmm+QoEskdLdlvKsQqbMRLK7Q8YqHN8vzEIiApuIzCa/hq
         +1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCUjMOM5Ffrwrh4C2Y2Jcme5o8mI7qrt0Vgj4u3Z+n1JcBEhPot/EYIEdZtjn4pSqpRQgX66NSN36jbFs52786@lists.infradead.org
X-Gm-Message-State: AOJu0YzplS8CmLIaA9r1LmQg0i4Jo9kcyaIKRtBl4J0xd53KIdnx8ce8
	rpGu61zmfMY6yfdoMzqzuObsjAF7KHx9ezDDATx/SXwpUA2Ln5k5QXaqXLQPmENjyT5nl1O4qjg
	=
X-Gm-Gg: ASbGncvgpNexnIhZDl6+Xzk1j1vpAegU3Iip8Q+J6wjwLCaEWMJtr/1oN64UoyiNOQ7
	pKEFCvJaFnM1Exvz87sXHs6Fql/pt4Ix8SjtiIaQgR0bpHyaQ9k23G5rLlVIyyZJLfU04QyANP8
	9VHPEiLZdYEHBrG4QikGYx00dKeGAlkpcd5UI5Fi0MeUSp0x4gOpeeWgGh8vAVnWGKDC9KqUzdc
	irM5yO7kxPGh2A2439vOJNh5Fh/RWSvhTMbciYwBQoH+v8AjHWbYvU5j7UsATJDFbBS48PK3FjQ
	ky87AEk4zesey20ZbB51/QNOKzdUZj45AVuOuw==
X-Google-Smtp-Source: AGHT+IGrWh8jmJojKSu+BSXj2AcIBuAIpGQv28Yb3WscoCmm5H1KpgPvyci17orjrFIZ1IdDZFdaZA==
X-Received: by 2002:a17:902:dad0:b0:234:e655:a618 with SMTP id d9443c01a7336-235e11cb8f1mr29637965ad.25.1749028500499;
        Wed, 04 Jun 2025 02:15:00 -0700 (PDT)
Received: from geday ([2804:7f2:800b:6be::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdd0e9sm99762975ad.74.2025.06.04.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 02:14:59 -0700 (PDT)
Date: Wed, 4 Jun 2025 06:14:48 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] PCI: rockchip-host: Retry link training on failure
 without PERST#
Message-ID: <aEAOiO_YIqWH9frQ@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_021502_045696_0F2F5EB1 
X-CRM114-Status: GOOD (  21.19  )
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

Hi,

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
here - PERST# is not toggled during retry. This patch does exactly that.
I find the patch to be ugly as hell but it works - every time.

I added Hugh Cole-Baker and Christian Hewitt to Cc: as both are
experienced on RK3399 and hopefully at least one of them has faced
the non-working SSD experience on RK3399 and will be able to test this.

---
 drivers/pci/controller/pcie-rockchip-host.c | 141 ++++++++++++--------
 1 file changed, 87 insertions(+), 54 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 6a46be17aa91..6a465f45a09c 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -284,6 +284,53 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_DCR);
 }
 
+static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
+{
+	struct device *dev = rockchip->dev;
+	int err;
+
+	if (!IS_ERR(rockchip->vpcie12v)) {
+		err = regulator_enable(rockchip->vpcie12v);
+		if (err) {
+			dev_err(dev, "fail to enable vpcie12v regulator\n");
+			goto err_out;
+		}
+	}
+
+	if (!IS_ERR(rockchip->vpcie3v3)) {
+		err = regulator_enable(rockchip->vpcie3v3);
+		if (err) {
+			dev_err(dev, "fail to enable vpcie3v3 regulator\n");
+			goto err_disable_12v;
+		}
+	}
+
+	err = regulator_enable(rockchip->vpcie1v8);
+	if (err) {
+		dev_err(dev, "fail to enable vpcie1v8 regulator\n");
+		goto err_disable_3v3;
+	}
+
+	err = regulator_enable(rockchip->vpcie0v9);
+	if (err) {
+		dev_err(dev, "fail to enable vpcie0v9 regulator\n");
+		goto err_disable_1v8;
+	}
+
+	return 0;
+
+err_disable_1v8:
+	regulator_disable(rockchip->vpcie1v8);
+err_disable_3v3:
+	if (!IS_ERR(rockchip->vpcie3v3))
+		regulator_disable(rockchip->vpcie3v3);
+err_disable_12v:
+	if (!IS_ERR(rockchip->vpcie12v))
+		regulator_disable(rockchip->vpcie12v);
+err_out:
+	return err;
+}
+
 /**
  * rockchip_pcie_host_init_port - Initialize hardware
  * @rockchip: PCIe port information
@@ -291,11 +338,14 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
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
@@ -322,16 +372,46 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
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
@@ -613,53 +693,6 @@ static int rockchip_pcie_parse_host_dt(struct rockchip_pcie *rockchip)
 	return 0;
 }
 
-static int rockchip_pcie_set_vpcie(struct rockchip_pcie *rockchip)
-{
-	struct device *dev = rockchip->dev;
-	int err;
-
-	if (!IS_ERR(rockchip->vpcie12v)) {
-		err = regulator_enable(rockchip->vpcie12v);
-		if (err) {
-			dev_err(dev, "fail to enable vpcie12v regulator\n");
-			goto err_out;
-		}
-	}
-
-	if (!IS_ERR(rockchip->vpcie3v3)) {
-		err = regulator_enable(rockchip->vpcie3v3);
-		if (err) {
-			dev_err(dev, "fail to enable vpcie3v3 regulator\n");
-			goto err_disable_12v;
-		}
-	}
-
-	err = regulator_enable(rockchip->vpcie1v8);
-	if (err) {
-		dev_err(dev, "fail to enable vpcie1v8 regulator\n");
-		goto err_disable_3v3;
-	}
-
-	err = regulator_enable(rockchip->vpcie0v9);
-	if (err) {
-		dev_err(dev, "fail to enable vpcie0v9 regulator\n");
-		goto err_disable_1v8;
-	}
-
-	return 0;
-
-err_disable_1v8:
-	regulator_disable(rockchip->vpcie1v8);
-err_disable_3v3:
-	if (!IS_ERR(rockchip->vpcie3v3))
-		regulator_disable(rockchip->vpcie3v3);
-err_disable_12v:
-	if (!IS_ERR(rockchip->vpcie12v))
-		regulator_disable(rockchip->vpcie12v);
-err_out:
-	return err;
-}
-
 static void rockchip_pcie_enable_interrupts(struct rockchip_pcie *rockchip)
 {
 	rockchip_pcie_write(rockchip, (PCIE_CLIENT_INT_CLI << 16) &
-- 
2.49.0


