Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F4FC369A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snDm+R9HSu34qLr874FxLnOvyHahTzryBYCxyI70mec=; b=zVY0JVwzOTf4zfG3YiVha5Pn5c
	dkc3RXa21OotrPLxOizSF/01PFJQh5Sb6AgupIxWrXNWpUdXqsLYffJwrhCnp23tizzoRT03qCyxI
	qJLK/L7cWPxhWBkQdifUfsFCMc5izxYNhDgWzc0WWpso/dv7RTiEBXMCb5LZMyk+Q6uY3shLRyRJM
	Tiyp8hcSuObdJ1Uj2gbG4zbEeIQQFhse32s4ItZtW8UQ2KgLl9P3wthdM+qiTsi7W172YDqCTu6IX
	q1MiKcxomk+fO6qrzZVy09663n4u+nE8SXuh5r0hgiGYyaVDXE6mjW2b3RS216jvwO6Me0w2gA5YL
	u727DnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sFM-0000000AjFL-3A9R;
	Thu, 10 Apr 2025 13:47:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s2v-0000000AgWx-2qRz;
	Thu, 10 Apr 2025 13:34:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2254e0b4b79so10495835ad.2;
        Thu, 10 Apr 2025 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292061; x=1744896861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snDm+R9HSu34qLr874FxLnOvyHahTzryBYCxyI70mec=;
        b=UEzqj60Zh+PhpdILO3rFtG8tkeg98HbFt65EGvFdk3H2mx2GYxM5zt11Iui5aHO9X1
         99S0WwdtUT1CSYjhfEQGeANf5Kjnadwt1dG5a1IzF/OLWZ0BLpw+cLS2KRdxLOwpSZzv
         YYq8I+s6AKXCy9gAWfS243ZigxPtFt07rd/JgTlsVDQDY+5EPyv9yMK3SYL/bu+S5zub
         mDXzGUWF8SS5q4ybHcL6x1DfWVkObnQrt17Pa1W/+0SdRnZIk5VpXa+6bDCi5IUxe5HX
         U64VSmcfvWn5CgkP0bqgu+Yz1ywpLcxqDlhAO34RllsB90gQsuFVakASwQrTSzNs6u1+
         2bkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292061; x=1744896861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snDm+R9HSu34qLr874FxLnOvyHahTzryBYCxyI70mec=;
        b=qkkfuFG2qH8venFjfqzjyQa9Zo74Aw2qYfgUfR4M4AbwoNzAvpfqpgA0KU9UsPJDBj
         NDaLWKOiYYPTgBATb0oVxJe+N3yqqiCTdxVYCVNpduG1E2fE5o194HKchsAIzLwr1kXI
         zqyyHwb4bOKDqWRK+BtnmoMXlcjOHui0EOcj+NTwdO5D+Jc0gvbzCSkF9+o/s98iywpM
         B4oZqeepwyEHPd3O7zCUDG9MNfASc863CBQuOI2tzjgIX7Gzn4cmTwia0i1tCrrJvaBk
         2VphbyFKrYU14WxV3+1OAidLVNuDTeuzzi7AHJLXCIlL39rUPN7dGMy3fKwsiUXTNBRy
         8wQg==
X-Forwarded-Encrypted: i=1; AJvYcCW7qA6aStfpIKUiWLLf/yMuGtXkZmp/zrQN1aLBLxwZggzIvZay2u00XmM2k2r1P5dFqBD7nnXofarO@lists.infradead.org, AJvYcCWHUNzTWSoyBY99r1/dt5e3GWav+kE6NJUE9XgabSPnCibY/NjdaEPmmAdLIR3kGi1misSLZhz8xNcvZ5FJ8mqsvA==@lists.infradead.org, AJvYcCXxF9ydFeNp7Z9OxHVxDnjXZGDe8FdyKsipVi6ApI+k4t39tXTs1sHDVqcV++qmscuySEuZRpgQ+k0uVZ2y@lists.infradead.org
X-Gm-Message-State: AOJu0YxrmehVFkTvui71DlhmECMHayFx4dAWpyVt6vgXsppfFu3E9teF
	KQEVubDFjFZTWGKKqQeGqvAZ9m3eL/3n7r2zdDIzN0naFUuPX6yL
X-Gm-Gg: ASbGncu/SehULYC54JmdHi2YGpUBaegnwsysnx2qZPth5vefxo4LvDMLbn1QEvATAlV
	6eQ8WReAHZpGQN5LDxulVhH0o3CZkn2fqmh/vANZSB7CteO2gRzty60Qjvw9HypeP0y8dIzhWfu
	MYqcztdFzdie7By0uJYNQy6sJEp83IHKn1ipTqj6Igqpxsxk/BktveUGa9I7KFlaBePhQrntfzR
	a43FvhO0ONOZnJkGmf/5crnXDxn76eTIQKZs8pXGBV0V3elbuk9fT9Q6fB5Kd9VQ8DCdQI8YgfA
	IA99IlTCwYCPQnmohqPPRA38fiS+gM7pbT2dJGrQ97Q95YLh2OYvxes=
X-Google-Smtp-Source: AGHT+IG8FTT4kfyWPBOyAb7OIrEAVZZGG4LdxWb3S85G2ZZGHkha/cC8RTwaJM0VFBFY0ZFSfbmjFw==
X-Received: by 2002:a17:902:e748:b0:229:1cef:4c83 with SMTP id d9443c01a7336-22be02d9318mr30954625ad.4.1744292060733;
        Thu, 10 Apr 2025 06:34:20 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:34:20 -0700 (PDT)
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
Subject: [PATCH v1 6/6] phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie probe
Date: Thu, 10 Apr 2025 19:03:21 +0530
Message-ID: <20250410133332.294556-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_063421_718121_17F65C3A 
X-CRM114-Status: GOOD (  13.75  )
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

Reorder the PHY creation in the axg-pcie probe function to ensure all
the resource is mapped before creating the PHY. This change addresses
the issue where the PHY creation was attempted before
mapping the necessary resources, potentially causing failures.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson-axg-pcie.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
index 54baf7b8930e1..14dee73f9cb57 100644
--- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -136,11 +136,6 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
-	if (IS_ERR(priv->phy))
-		return dev_err_probe(dev, PTR_ERR(priv->phy),
-				     "failed to create PHY\n");
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -158,6 +153,11 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->analog))
 		return PTR_ERR(priv->analog);
 
+	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
+	if (IS_ERR(priv->phy))
+		return dev_err_probe(dev, PTR_ERR(priv->phy),
+				     "failed to create PHY\n");
+
 	phy_set_drvdata(priv->phy, priv);
 	dev_set_drvdata(dev, priv);
 	pphy = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-- 
2.49.0


