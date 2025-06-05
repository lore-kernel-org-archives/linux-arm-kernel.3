Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F97C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 16:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KhW9QPrsGwu26NBYUsMExt8YOvu5jBbvy6pXm9zcT+s=; b=U4ibhZO0pICPk8VQVD+l92jaMn
	HVGQDr5o7fZ4PDhwN1S9MCqFrHr4OPqWQNyeFS0Lc8//+jBlz4ZyTgSK4qiIFSeBqLXOaZRw45Meb
	1y2ICCiDp+nyQ0om/nBe6SxgyuRKeJPE9p5ZqC4EDn5tIUeFP9ZZIwl/1DtWBAZDOvxzE0JMjxj7A
	NuFXXqe3l4/ebqxF2QhVG3JJC9q2KpVPNyY+52DIq16pMTQewu5u64LlAG3DjH08/45lw+mHQa48n
	3gRpMCgmYyy+HIg75B06rBkUwBi2retjdIil7lTpALdg2KoV26DY8ZcgU643Rtth3z6qLU3kzILFF
	3yo1M00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDrL-0000000G5Fw-1Grh;
	Thu, 05 Jun 2025 16:54:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNDnh-0000000G4ft-061E;
	Thu, 05 Jun 2025 16:50:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-234d366e5f2so15704485ad.1;
        Thu, 05 Jun 2025 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749142244; x=1749747044; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KhW9QPrsGwu26NBYUsMExt8YOvu5jBbvy6pXm9zcT+s=;
        b=QSuyV3icNV+RJvK+y8/Q+N/nAPl4630J4o6LLaAFOgFJIJZ7Qv9xsISOd4hLxsYUTr
         p57KUGG7FOEJDQgXr36mrSk0Dom/TZfipvKBHuyMiPKWlQN9SlCZMoQzwEUny8/rO1zY
         1fGPESnnqJMAW3Gf7mQhg1EswUZv+ffvObtDZloek0paeM62s2o87ObdVh/1l1bN0cWN
         xnbWs0UO6sVOCUFBsoyd3gxDv4Ycvjfx7WjMndy6M8uDxHGj5WENv+DGum7txyxbfEnC
         zsiJVbHZtQ2CaM3gv7TFuBA9S7lDUUoT+oUVmL6TTQlDXx/0Lzz7OGnza+meYndJNmMF
         v94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142244; x=1749747044;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KhW9QPrsGwu26NBYUsMExt8YOvu5jBbvy6pXm9zcT+s=;
        b=SOYvRBHdgbop2lOeG8h4EypgW5E8MDanM2iwaMlYKVh/qj8XTCC7w26U3An76urb0L
         Lce7HzVS7Wf89pr19GRPCC25vbVXS6N7jO9HCpUf8t38r4hXWPjwwulL+R0r6qfnbTL5
         wzT8o+W2PzLyI14q01AAuj//xiy1EsoEhGD6LoP5wIHw+zIPR+Z4QZensFEkMjk+jNI6
         QqfN/XXf7/heHtFZS7W26R6NMOtbWFNdFmepPqKp2WUtj7rCxGiVsI9piDTgI51vTSaa
         h7/l+tKjLWcBaAsVzl1MGdghV0O6Genn8QEKmvm96uf57uoTSCkM75Ec0G2ID0Ddafpe
         AUNw==
X-Forwarded-Encrypted: i=1; AJvYcCW+p2Jx6GhL7lEDM2s6RUlcap8V3qLnXxCq5AQeZZ1JK1yTqkqrNEW3TSS11qI6puJfFL63kguDe8SDxXPnEqgm@lists.infradead.org
X-Gm-Message-State: AOJu0YwstWBlmEYhRqGIk7/ZIKexTd2Y1bZNjLBcaIn9DEf4D/D/d7yo
	rhkOFUHUMyaa++8bFY6HgT0Gt1TbG3Y+cHaMi3odeoVvP6XA9KC9U4GkQTlGG6kF
X-Gm-Gg: ASbGncs2OCaR7VHUL0L+cYNWDE9fLuvy70ntE4dfgRlZ3X30Wbyn+AFIfpIVWOAD9sS
	bBxKPXJaFHg8AnEHPY/tQBsSKRvDwDirL7oYpTG+G2lyw9mXDKfCVnoiFjTR0FWQWFjlLhm3pTS
	rmEWtauFYmy6P4x9ZgIsgi0PKdHQQnm7f/n/ryqFs/Int2J7StzItEYsI8EaTvg1O0ZYysu0+6Z
	en4NDlK6Xf63vilvBMjYpv2C4Ybrs94yj7uwX2JLQoyOqZZuwgyh0aTojPeGyksKaMTEazUi1ZZ
	y3XhQ4dtwEHr5Y75OFLUwQHzRzPngwsQMSNW9vU=
X-Google-Smtp-Source: AGHT+IEf+vTfjvGNxCk/OGr6dye7BD0FG8xzE7ZPNv1iKzOBxRcTx9QpwvugHNOmR6rLZSeWU06b8w==
X-Received: by 2002:a17:903:46cb:b0:235:ea29:28e9 with SMTP id d9443c01a7336-23601dc0189mr1059835ad.38.1749142233132;
        Thu, 05 Jun 2025 09:50:33 -0700 (PDT)
Received: from geday ([2804:7f2:800b:110a::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-235f64e05ffsm12463665ad.128.2025.06.05.09.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:50:32 -0700 (PDT)
Date: Thu, 5 Jun 2025 13:50:27 -0300
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
Subject: [RESEND RFC PATCH 1/2] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <aEHK0yVfSVO84EZE@geday>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_095045_064024_554F4E1E 
X-CRM114-Status: GOOD (  20.42  )
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
here - PERST# is not toggled during retry. This patch does exactly that.
I find the patch to be ugly as hell but it works - every time.

I added Hugh Cole-Baker to Cc: as he is experienced on RK3399 and
maybe has faced the non-working SSD experience on RK3399 and
will be able to test this.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
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


