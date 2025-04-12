Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DBF8C369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=; b=ktg95dHHHwL2S9ujHh6q1zzHkm
	zWNNKgsERPlioXylerR6NuMLXLQ60PYMzO67znLO1qAO2gAUCGZzjEE0E6JpXukxQy2ssU3cDvvRf
	7VoyVMyhAg+akE9N0PNOKAgwW9DkmB+PYnGWkVLmbRJMW9/nDJz/SQ6002Dh7rc3wcg58vuhkTK1B
	WG1ApB1thqfoYq7eZ7pURczNn2WjIUSSPTzd0t+RqtMbUZIpEEXU54OxfHUm0HES6614AsF10fUh3
	Y4RSSQT5mh37I/U0FQf7DbCMjrNyYiSrxSFPUVpDMfSa55zUsqF+KH1HqCdciz+KD65yeFhHMeGWC
	Vr8OIwig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hc9-0000000GQXs-0fAM;
	Sat, 12 Apr 2025 20:38:09 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hRR-0000000GP2r-05Z9;
	Sat, 12 Apr 2025 20:27:06 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-399749152b4so1331237f8f.3;
        Sat, 12 Apr 2025 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489623; x=1745094423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=;
        b=ShEqd0k11O4ZMqlG8AGKuo46/KORF53I0a2J14bpym7hVTz8dUpSJDhNq51aJJqGVd
         ZMWvgs3wuK6QH/eFd3SI+stHS32DYyAyCGI8/bo5FIjZ1Zas791gkbVvi841ka50ZSry
         myhdm/FIRQNs3RnSJgLjAHrtGPR9CY4oOXsZOq+UmusrBySutm3RQ8G4kxugf+Lmtnym
         7o05sqG7OoI+sdIXenuG20s9wuOacmWQ9yLuTd/HdIpwka4L8ZkCRde8EVTFlFdf/FSK
         qbYXkOfr5OxyLit/qUb95nOUppIfRbilfSNNgcqxy+Uv+OiyqudLqaKiPlT/hqFU/LK2
         H85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489623; x=1745094423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/2ZMg6LQNzP+WqoJGSl/J+PhbKTk0j0hhnJ6TPVsHY=;
        b=Oc1cNSGpcnuPWj5FfX3Crxi/zuYwzpyVVDIYOzA4VYug8ZBiur4L9DtJ03uP17/5kU
         pckvTShQAaEj+nqK3O23sV7ktCkkVBzNNVORno3jGQdBzMlr8+leEA3HlHfAdIy5SRlB
         vUoMCJ9/K1ks4JtKsLqdHIgmnJ5wxFs4mthXj3pD9AQaLrcv5277ZJa6FrtuqH58ckpa
         HzPHg6leqdaO9h/OWTGFScWeyPMURle998Hi2sa/p+psidP+VI9hs93layIMSlpHMq4r
         +W+7lmxxyKT+0Lxvs9uVRpr7BTaUTQtdtXQLiRoJZFdl1744lo/KGahuXh+cwbMIWikD
         rGVg==
X-Forwarded-Encrypted: i=1; AJvYcCVFGRJm6ESZofOThyUF8E+LZr5aRGxxZO98IRB6oRevy6cV6yLbq4gzNGRvXMZmoqAGn2PuKOjTR0I4swxG37TE@lists.infradead.org, AJvYcCXOIzWQIKKgtRoSZpPty/YtJR2GZo5flTq64PuThkc80r/iGNpLPQNOYmcND+4WFD1QA9dDFOxfBnGJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwfXHl4E79LS3Z9Xr9DdGijroyj2m8ZlXftcX4vWJHRsPDfGrZ1
	DvmxwhAuFOCYs329o+HsuHCZdiN8HSvztvj7VFOQLfqipXHbF7iZ
X-Gm-Gg: ASbGncviBhy4Ln+PVb08GcN5kV4ROyRM1RDyalqYkHKsIfYBCylUjsfYCV8MvfnnJ6S
	+/J77oDEqJFYzETIkX3P7N6a011ZI+QruhBeuCNLg9eT7jCQr/eb6CFDneabm2bvHITPG98ehqe
	X0cgIOAgVBlecOklQUsqChB3/NeG9fJr0SA03Bins/XvffASTx6hFVbOJfFyqcBSyECvFQrbUeg
	G04rQSdVA3LOrFsya7TcUuI3uU6rVAYhgXg0aWiE8ZHReIN71D5+DM744PGfgssu49wIeNZILDd
	adwyi8/RuZLWrMAbPmNTZ6l+RpCdOZbNYrZYcoNSFiSwtr7nus6trmMDFcZ1eAJToAeSNJ3Nhuh
	N7S+zoSj0sH8ykYAw
X-Google-Smtp-Source: AGHT+IFJDUur0adD/E+6mc6RzqJoyEDVCAPitJd/TRf5iOWy3NXGIjLX4HQcNm9eTWMzQfsVlLv4vQ==
X-Received: by 2002:a05:6000:40cd:b0:39c:266c:421 with SMTP id ffacd0b85a97d-39e9f3d9c2cmr5527869f8f.0.1744489622902;
        Sat, 12 Apr 2025 13:27:02 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:27:02 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 05/10] phy: phy-snps-eusb2: split phy init code
Date: Sat, 12 Apr 2025 23:26:15 +0300
Message-ID: <20250412202620.738150-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_132705_062295_28A7D625 
X-CRM114-Status: GOOD (  15.17  )
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

The current phy init consists of hardware power-up, as well as
QCOM-specific eUSB2 init code. Split it into two parts, to make room
for such non-QCOM init code.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/phy-snps-eusb2.c | 94 +++++++++++++++++++++++-------------
 1 file changed, 61 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index e1b175f48..1933e8440 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -121,6 +121,10 @@ static const char * const eusb2_hsphy_vreg_names[] = {
 
 #define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
 
+struct snps_eusb2_phy_drvdata {
+	int (*phy_init)(struct phy *p);
+};
+
 struct snps_eusb2_hsphy {
 	struct phy *phy;
 	void __iomem *base;
@@ -133,6 +137,8 @@ struct snps_eusb2_hsphy {
 	enum phy_mode mode;
 
 	struct phy *repeater;
+
+	const struct snps_eusb2_phy_drvdata *data;
 };
 
 static int snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
@@ -230,41 +236,11 @@ static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 	return 0;
 }
 
-static int snps_eusb2_hsphy_init(struct phy *p)
+static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 {
 	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
-	if (ret)
-		return ret;
-
-	ret = phy_init(phy->repeater);
-	if (ret) {
-		dev_err(&p->dev, "repeater init failed. %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = clk_prepare_enable(phy->ref_clk);
-	if (ret) {
-		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = reset_control_assert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
-	usleep_range(100, 150);
-
-	ret = reset_control_deassert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
 				    CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
 
@@ -334,6 +310,52 @@ static int snps_eusb2_hsphy_init(struct phy *p)
 				    USB2_SUSPEND_N_SEL, 0);
 
 	return 0;
+}
+
+static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+};
+
+static int snps_eusb2_hsphy_init(struct phy *p)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
+	if (ret)
+		return ret;
+
+	ret = phy_init(phy->repeater);
+	if (ret) {
+		dev_err(&p->dev, "repeater init failed. %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = clk_prepare_enable(phy->ref_clk);
+	if (ret) {
+		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = reset_control_assert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	usleep_range(100, 150);
+
+	ret = reset_control_deassert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	ret = phy->data->phy_init(p);
+	if (ret)
+		goto disable_ref_clk;
+
+	return 0;
 
 disable_ref_clk:
 	clk_disable_unprepare(phy->ref_clk);
@@ -378,6 +400,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (!phy)
 		return -ENOMEM;
 
+	phy->data = device_get_match_data(dev);
+	if (!phy->data)
+		return -EINVAL;
+
 	phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(phy->base))
 		return PTR_ERR(phy->base);
@@ -424,8 +450,10 @@ static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
-	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
-	{ },
+	{
+		.compatible = "qcom,sm8550-snps-eusb2-phy",
+		.data = &sm8550_snps_eusb2_phy,
+	}, { },
 };
 MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
 
-- 
2.43.0


