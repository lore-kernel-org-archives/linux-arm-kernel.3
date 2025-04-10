Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9657FC369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nh0VanLTR8k7JGV4ABz+/PnmlXleZHArR9ROXTfckbg=; b=OA4J4NNm9kdsz76umUTB0w/cKV
	CgeeTCBUlVraOKPif0czxMnO/s0kaXDsLx5FrEJ58S8zGyUW97TFCoN8YgCzAjsJF/EenX65ZaywL
	kruJ0ZSg8k0OH5h7xoBftUt/1qWQZmClD1udIbtqeW06YKsNdzv+8gGtCpyZhXrvFM5z4nPCLKaoL
	IXrPHsaCktfpeDpuNzinCduOYalO+Ygp7/3i/C2Y7ZHUmrhyQReM/4k46cI0JPT4eGA2TLDnDG8fD
	8bFb5v/DAzWedAKxjb8U6s8d51dUbkE4zSVs2k9YT1upDaFzua7XzFPL725T8xYyjvLwkfj39tjn8
	UbqNM8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s6T-0000000AhEC-2mlx;
	Thu, 10 Apr 2025 13:38:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s2U-0000000AgPg-0pnK;
	Thu, 10 Apr 2025 13:33:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22409077c06so10872025ad.1;
        Thu, 10 Apr 2025 06:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292033; x=1744896833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh0VanLTR8k7JGV4ABz+/PnmlXleZHArR9ROXTfckbg=;
        b=SJr6NMSjR1B0STcQ4OGoPpU28UMgYJzZBW3QsPnYJ9zKrojDHaOreJ1Krg+UjfyAC5
         ft4gYP4WXRB+Psn9ScESzAstfWh2PtPXgGkF+FgDe48dVq/qHFzJYMea2hcW6HH6rV53
         Xtodg03/jqKS4hSvfyj+RygxilbKwTFSPgm4AjUZ7E5hmlV/qqV6sJBD5lNYXDbDr2NG
         EX61yPfMi46DKahNSIB3B5Haf6RoPiBNjRIO/bYjvJABkz4g9u5YmtwBYyC3IRoxqduD
         pvMpZdzmivI4eEQWIEqYcBmlNwDW0tMbkasN8SxtYqWmhf40mUFibCKPI4QLeWNB2JcV
         JjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292033; x=1744896833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nh0VanLTR8k7JGV4ABz+/PnmlXleZHArR9ROXTfckbg=;
        b=BHD3WbvLV6D8YPFbYh5wQnoEnJpMRRF00VKsUpMosjmVy2skXyGL8T3OD0J2tfwmQk
         WxhNWG2qVtJPW8I3lRk/UaNJx934IZrzv2bN3TQE4O7k4EYH1OQDGp0ATOTKfwv3Qj2D
         VnfvfIIXUHbtJhQt0OPHlSgglUXAbb3a08AsO8a8LmZS3LJL56ruu3p26ywzPjTJ8z9i
         Qox4zDSKjZmJ7oYrnx7UYlO5XltGr93ada/RnHnfh3borfkUqOx9P6vsemz/RPJK1qz4
         pdmaKJciDupzldXf1rUmCGoFUSkN3Eqk17jpROmch1+6LtgGGsusC5bNy0fSQ31Z8hd7
         VORw==
X-Forwarded-Encrypted: i=1; AJvYcCUfGLaMjHbWBoNPml3a9IEWaXfQwMPs3ZGvSvwd9mLL4EzXJY3IorIMMPagQYkQHWTGAEKxE9KwwjyLWd1vRQyQIQ==@lists.infradead.org, AJvYcCWN6iHG6V9CviOAhsYO0a5E5SY4bVTZZtKanSOjf3YObjd7aHS1YcTxRNWhCWYy5rI7tpKlXw4tI+T/@lists.infradead.org, AJvYcCXguXsxFJM1KDFO3sSlIxSV24p4EMf/ZIaEoEXGYOmOiF5wmpejlK7mPTT6uEnErvJgbEquEVF5EwmIcETO@lists.infradead.org
X-Gm-Message-State: AOJu0YwnKm/MNnrvTE+uzFsNCPNsiAuhfK28YQL5voApE8FgormlzVJq
	i5drqB34wZK4umiyel67ujeOrMcn19iifQTF+ieweSuiqJ5e8IIm
X-Gm-Gg: ASbGncuQ7WDfofZjIY7TP2Y0U9n1pKUUlco8DEyn78MhAxKMOs0ZNJeuw87kWNJynLp
	E+zzaLd58TtCYO88Zlbkgigmm2NQZWbwoAprCk+YtSv5xWKysdDgnc344nAOs0wa4w6ll0lj497
	AvzydyxDEMS38zQuF7rb2wnvzzySpzI0KBF2g9O251SDSfFNzzEyWEvwdSovX1qIeqZOS5nsGef
	4LjRzoY+cLI+VY3R2ZiVNPAs5bxOpzrEVe/XzsVQUBvYsdnksESctV5oX/Z460QndjTspss6o6s
	Pe0Ib4gfaEqW09tZ0h4XZkXGCcrMfGLJLaYGceIXzzKK8AlH6PR2p3M=
X-Google-Smtp-Source: AGHT+IEhJosZc1PPq47EzJpgLKAV0sW8OUksWP/T0By+TlgLPTsHhEsBRkYklsNnL3vMaEPTFuyMZg==
X-Received: by 2002:a17:902:f686:b0:220:e655:d77 with SMTP id d9443c01a7336-22be03cf8d3mr28766255ad.36.1744292033274;
        Thu, 10 Apr 2025 06:33:53 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:33:52 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 1/6] phy: amlogic: phy-meson-gxl-usb2: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:16 +0530
Message-ID: <20250410133332.294556-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_063354_234952_6A75E6C7 
X-CRM114-Status: GOOD (  11.82  )
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

Use dev_err_probe() for phy resources to indicate the deferral
reason when waiting for the resource to come up.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
index 14ea89927ab14..6b390304f723c 100644
--- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
@@ -237,7 +237,6 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 	struct phy_meson_gxl_usb2_priv *priv;
 	struct phy *phy;
 	void __iomem *base;
-	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -266,13 +265,9 @@ static int phy_meson_gxl_usb2_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->reset);
 
 	phy = devm_phy_create(dev, NULL, &phy_meson_gxl_usb2_ops);
-	if (IS_ERR(phy)) {
-		ret = PTR_ERR(phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-
-		return ret;
-	}
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create PHY\n");
 
 	phy_set_drvdata(phy, priv);
 
-- 
2.49.0


