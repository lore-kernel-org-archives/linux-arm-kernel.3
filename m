Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB08C369A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7/MnhQ+XPTlJRR1H/JsR3WjkkF0jznVuDOQtTNzl7E=; b=y/jGPMMUNV8ZbBmL1o8uASPNyi
	iLHegQxgpGaFFsMGMFRA0E8vHj5vSnINbzm1AoQazBLeVE2drRn8JNb3w859uMw4OqdwwL761DPHe
	t3NgQhCf2FXT0mwlO8EowZpsom2Yb/B9lxzay5aszYJ1ax2JdCETVtcDFR11OW5zQsX1DnCM27Px+
	Im35kpMSwBtTepI43vio41GAKgGVygDmWQCSTTWQ1xbzpyYnZ4XDtmO/HRiouRJan1wkbSemVd2HB
	CtMRm/PtuZHZCAkaRius+ZbzCETHGOkkWYImHO1vCij3655si4hBJiNqTkgxBZRQRAZgpBoKO2FH7
	cfhKggQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s8E-0000000AhbG-3zo7;
	Thu, 10 Apr 2025 13:39:50 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s2Z-0000000AgR3-1nkm;
	Thu, 10 Apr 2025 13:34:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22403cbb47fso7845955ad.0;
        Thu, 10 Apr 2025 06:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292039; x=1744896839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7/MnhQ+XPTlJRR1H/JsR3WjkkF0jznVuDOQtTNzl7E=;
        b=NPeHsg28U69JrxtoNpkwh0+L5/iIOr1Zs6yRblX3Aylzzem480O9bFbwMrPchyelzt
         e9YEvDx1f5lqDrSsEflaBIjdbsvk26KjA7903WcktOD1/fvDZvPlWPApn0rNXSqVLlC2
         aWccmE2RfyflwQ9/84TxTP1pY1wVufaQeWllEWmheH4oudrBmQqtt6RFTWVaWIKb/N/g
         rIet8OzvjVzzdOiDTmjasRrQ9TnVxrshK9lfQ2Lv5gMlKJGl8ot+XFV7c3VnGGlJyog5
         KCLRKgBj/1HKQYgof7p0bXe9Iad1c7M2To/j3gVj8DDujcXJuQpCYuwQMRDt5tZ/MWbk
         etWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292039; x=1744896839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7/MnhQ+XPTlJRR1H/JsR3WjkkF0jznVuDOQtTNzl7E=;
        b=Yeo10zaKK3XsM/vidXTUHz429E5XhP2gzlBpwiPnus4idXMvV28d6/FNBdum2s5/Cc
         T6zu3pN3MM9hmrI/5ncfgl1TlnM6SRcvvB0e2Ei0ObKlnaUHXK5rCUPsJOmiP/xMG9dd
         R3yITiq6mnCWxXKHOkckGmAh2Ui0LM/mVdFafTWBoK33RCQR1wyA4jieX/BSMSDnjXT4
         nBOySdb0MzFjcTiy8Poi1vMHejZQ2Z5YQlxMR4sJ1hlFN2PIiqqOGplc+WOI/ZMy27Lx
         YRmGMk9yL/uy2aaZEwLKRWlyAegAyzd/79hi9R36//ly9L3xYK36TxhhqoMOm62oieBN
         H72Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+UyZoSmSU6Sm1lsACBGs3zXhHssMo2eAnCPTkxdKW17wPGayV0AdjWqbyy23r3g0aYFclP0K9bJ+l@lists.infradead.org, AJvYcCW9TkuYxsRpz32oH5BjLkqaSupY5JkZssffMdrXZGUi6zvw4Gom06m3+WLYQgDib9LQyQicumbeX39Uu2OK@lists.infradead.org, AJvYcCWeuCp2ipkBIhybGVLDk8ph/BxtVg2kToLLPpaShyQrvYmY+ebcXKxKqrtvE+IzYf2fbTwgcVflKpqjlv8z7KCglA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXM0Wky34avLR8aSlEtphup+nf1wV1YfhQxnap74yIwcLbFf7M
	8nRezdz98I8N8l/actmz+eKKbUo2cA4yvYFvWygqB6G3jKAfqk17
X-Gm-Gg: ASbGncvxVzubgD0M8baVwFRR3Qy7TebaIcUKrNSvHlPNIZpq+u6LqkWO8jeOrpCziIM
	/4qAKpWK1Xh4AoamGNTm6593dtsBPU9ieOeGK9n9vJw+tbgJAyQnKgKQkFixh+QvOPHlie8SKfp
	a/XukpqAudik9ocusnodfHnBkouSaf3TWCba63Bp1VGfHixARO7NWnqPMbsmOjiwOi9F/dJFsyP
	h3hmcuFSqiSDxMV8qoZjI2mqeWKPYGJfQnnkWTVOiCWA+VesaylrglzGfMZ2PSTNIOyE5XNna+M
	1kxvTk4JYMZMN7K0lL57rafMfhu7Wt23jSG92Kc/ql5BACiYebAlehE=
X-Google-Smtp-Source: AGHT+IG1oHEnhJcJPMpJXFVc2lblDNzFL0NCm1/z6pryHmDc/E60Sjg2zPGvf+IjlruZt6r44yNjmg==
X-Received: by 2002:a17:903:46cb:b0:224:a74:28cd with SMTP id d9443c01a7336-22be03167bamr34974705ad.31.1744292038682;
        Thu, 10 Apr 2025 06:33:58 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:33:58 -0700 (PDT)
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
Subject: [PATCH v1 2/6] phy: amlogic: phy-meson-g12a-usb2: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:17 +0530
Message-ID: <20250410133332.294556-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_063359_465150_543F092B 
X-CRM114-Status: GOOD (  11.59  )
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
 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 0e0b5c00b676f..66bf0b7ef8ed3 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -339,13 +339,9 @@ static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
 		return ret;
 
 	phy = devm_phy_create(dev, NULL, &phy_meson_g12a_usb2_ops);
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
 
 	phy_set_bus_width(phy, 8);
 	phy_set_drvdata(phy, priv);
-- 
2.49.0


