Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4D2C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxeSbPIzszjGnSvrpOvcwkfeAlvfBRAjswzSiZSoXzQ=; b=UOpWC2fCD9YVTJYIC33NNgsx4H
	Q0mNoFgiGVrGZ3YwWSNgSDbNnXPHgQitK4/F1D9t0eR2IauNGgpeNNTwHzjzOWjQ3X4Rq6QTThoQa
	ufoReoPnSCAC2ysNuzQ8OYosyI6vyif8fpm5jQvdZ4ypQ3Biu45H9yHkvdASS0Zz+9iBsGTOD5cs9
	QP04mKdi51z0aL4Ze7n/nW8/5nSEdMXky03JB0dv3AbsXXe3ZAPA//AGP+C0bBJtNEfT3WPIE7DrJ
	zUxcXBDxLdhYvuvxVluOjtoGDLF5mXMNBoC7n6f6zXzDCZ7dKKG8QI9sv9eS8ln1KYHTjIYqlCcz9
	1SqixbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sDc-0000000Ainh-1Zbg;
	Thu, 10 Apr 2025 13:45:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s2q-0000000AgUf-0yw0;
	Thu, 10 Apr 2025 13:34:17 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-227b828de00so7130445ad.1;
        Thu, 10 Apr 2025 06:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292055; x=1744896855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxeSbPIzszjGnSvrpOvcwkfeAlvfBRAjswzSiZSoXzQ=;
        b=Hhc03LzK+W0yNWepbpr42cL8t6yBYcTKUuykOLbcWPOTWylXSx4nxzWKkIejaPQVR3
         iPdITyYHTcn/CqJ+Jd/+TYwSBOCLFxKNctMUh6KDCSioKbaeBoNM8bzEAizDdl3l8XCh
         GgCrpmsGevMa5tW2R5JBJ9iydzYeG9y/yaD9BRHuMj04L/462K/0TglSj30emgKH4uuZ
         mk7jy3XXFH3rKGPLG+ll9h+H//7UmFdBV6uw8sLipA9NrD9lmrYfanbIaUm5VduWmgow
         xEZczEnXvaFMpjFiwJfzQ1QLsdZz11aJaUHltlGrbTnva2YqyfYVLsW0fSCj7uEaq39u
         yz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292055; x=1744896855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxeSbPIzszjGnSvrpOvcwkfeAlvfBRAjswzSiZSoXzQ=;
        b=tLxUQLUnsIc9UxDuCgDJssOEU0xABc1CZRgEZIJMWyxKEY9eIBJEvdo1m4bhqW4tVY
         H5TVTaqhJWiLuE2MlzVuujUkD6TfDswlp3gy6RTLSyrXYpAxLByanNzlKlkbYGagdtU8
         RZP3zHjfBvVuCZ5eRVGwyWHnvl+JcGtJzPGP6Z8fYsBWpjPWsJhlsY81VVAUPngfvLWl
         BtG4hz97zhIh2zcrMWcrmtbWyk6pWzJsf9viZcjC4zdQDpuD79obgcUWeDqC0s2ZOMSH
         +/5sZDXJ1k749Bpkb+Zcs5qPMedGa71ywApWQ8qzSgkecZ2aSfTbybBlI1uPD0zzl0Oo
         2Skw==
X-Forwarded-Encrypted: i=1; AJvYcCUrAgRWpLfSQ60hX+M4sq25CVtwyb+PO9fdmBuLJ/w76tPZcLRwy218pwu0dzhHgzeX/gJ59aRBh7P3nFjOTpCDXg==@lists.infradead.org, AJvYcCXdCGLASozgdCbNCPUE7n3ajzTMWLQL/2zNSSU+cJ/QBwM7oAOUOmPM3Jr5i2bsd/rcXVjUfwwYinEm@lists.infradead.org, AJvYcCXhk4cy/20/dkaaNJgeJNETBssD61MCkSpqMXdkjgWTNFr0NO9xczdmEPrTXzRZe/+GiJJ+SQjOPKeJn/pC@lists.infradead.org
X-Gm-Message-State: AOJu0YyNvP8e2lsJ1CW4zNXgNaV9ZYdBOIZ4Zn3KWve/JopOsoRuN+Zt
	MGOqapzp/L/YW2nGkz0FNNw2IyBQ461i4Cwk/pKbuHLuiSCDHewv
X-Gm-Gg: ASbGncum2dw7FIWNSxTiuswiGVhfd4ChQNf7+7EqmWzgNYLs2IZ14vGlgKG12Vpf1Zy
	qi8NmjkMBh53Qkn3oO+0DYVY1/KBwsEnVd//x4zczObDUQHuzgGbsMtAL1TvM74/ujARVOEs998
	a1cC3SAA46F/mWYGam0dWTRfZ1RUsGahmCKV7GCQWhi1Z2zYM1VizSCDlDKvaol40CovbwtuKAr
	lBpx5bEnA/J/HOXsy2QoSREwE0nA9ghW6sNUyupE56vPNF9E30pV4klU6XXRv6OsPmVOF4O3R3G
	29CaPw4is4F6hInjDN2yR2yUNfiVR68xcaDyz67IuabSH685edVmlW8=
X-Google-Smtp-Source: AGHT+IFfGKT+CjmFhjdjDFWm//5beQJ4RbUV7i3qqJwAHO8GX2iN4WUrgtrevE+4mbbu/BuXURpkQw==
X-Received: by 2002:a17:902:ccc8:b0:223:3396:15e8 with SMTP id d9443c01a7336-22b2edd1cb9mr51008155ad.22.1744292055287;
        Thu, 10 Apr 2025 06:34:15 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:34:14 -0700 (PDT)
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
Subject: [PATCH v1 5/6] phy: amlogic: phy-meson-axg-pcie: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:20 +0530
Message-ID: <20250410133332.294556-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_063416_273731_5EF8313B 
X-CRM114-Status: GOOD (  11.86  )
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
 drivers/phy/amlogic/phy-meson-axg-pcie.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
index 60be5cdc600b3..54baf7b8930e1 100644
--- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -131,19 +131,15 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 	struct phy_axg_pcie_priv *priv;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
-	int ret;
 
 	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
-	if (IS_ERR(priv->phy)) {
-		ret = PTR_ERR(priv->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-		return ret;
-	}
+	if (IS_ERR(priv->phy))
+		return dev_err_probe(dev, PTR_ERR(priv->phy),
+				     "failed to create PHY\n");
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
-- 
2.49.0


