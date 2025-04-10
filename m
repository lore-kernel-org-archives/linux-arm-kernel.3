Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3691C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 13:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppfroywA/WF+8dvpxb3LW0A1l9sdjedjaaEGMEvs0rQ=; b=nmth4qBJpKPbdHE0c4cFDqdiYN
	/xj+Teo0KE9lAb6Zuxf9Wm/LStmahMUXLJFzmTvvPuczq+xh/5oTGrF+ptJNpFXW0XLfZi3d8Y0u8
	CwceLPercG/MdjCTC2Exp3Svl16Pf3iUMwe23q/KmauZe7zMGoAvne9jOhM+gwMpwdkE/hYIUeOiB
	AFEsBpFvNoHTVkmCN531aZh4wsUkK0nNKF19yOaDI7t+BitHBbXbQhMePPNx7cQgZe9OuTPX2jEu/
	jBzjIpzYuWO4fx8pHeXnFH6ddNzXzYwvHOOLh7ylPs+tUdQVUaL8BifvFHn/ZG5EPY9fQIi84gMrF
	KpLWvw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sA0-0000000Ai21-1Aba;
	Thu, 10 Apr 2025 13:41:40 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2s2f-0000000AgSC-1bVv;
	Thu, 10 Apr 2025 13:34:06 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b03bc416962so521754a12.0;
        Thu, 10 Apr 2025 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292044; x=1744896844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppfroywA/WF+8dvpxb3LW0A1l9sdjedjaaEGMEvs0rQ=;
        b=TQlR7u5+45u80st/vy5xolMwPF9/Ow/bF9d9oxBquwxBulCmlh6On7LfcmRVf5AReE
         dJOdL4Ca0mhkTiIQ8dKBkTUiDQBAhJ/eoVzM9TQTtTqa/yMN80WxN+7UCacTcpcYdoNm
         xTTi/9tVBXN7laGTcmlfxXoahYe10TwmFk/1UcLXDl347TCs710L/qEN8J/AEbkYpFt8
         L8Mb924scFhFJgHfd/Kz6dXRUpUcGAfCjwzQugtXRzjsdLi1LEWE8NnVuT2LD5p8RTbk
         QApZCyzqLLWMwx7af+tDtjoabEGUsUbOf1AKtNoFbZ5OJg+oT1dg6jW63szjCQ2QRCC4
         1KHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292044; x=1744896844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppfroywA/WF+8dvpxb3LW0A1l9sdjedjaaEGMEvs0rQ=;
        b=FC2Is+2+4Fj/KOu2KZhdDFd1L4E49Xikubs6mgepaZM/vc8xYBCP+wYSNE8C+rmcP+
         qeSS5J4HrDz2ZmBiLsZurggpPbnY6SXbiUSoYEHbpOcDUB5pW49Lmaq2EhEA9wCuc0A/
         qON1r4ZgLq623+V22la7fUaXMsLJ/wiJOcneS3GEt6eCArvw7i/J/siHnSAhnLSyxymc
         m0g+5ISA1ePuWjE04VcM4CgFDy9NX4Ls4jKR3IyDAIoGgTs/CrXTPfJHbdFjolko2Mmx
         mqleMSTPbzMSfx+iCUj6D1muQSI5Xh/kbOjMIK8q4gzsMx3n5OdoN7BgicYPv2vvE4gL
         4DIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1V6rksMQLN2zK2gUbYp7DizIyv8JOEMywHP33Viidqb6qP9589JXxGnYYDBJfWEg0AarTSRfsUMTTVBUZ@lists.infradead.org, AJvYcCVsQ8FHMVXbZY+W8vqC1KVBoar0NDkaBB+N4t1xNTfjB5UXnny8bTMuIgSaKJbko9j2dbpyZXGPkIW+@lists.infradead.org, AJvYcCWytRJHpDBPNp2T6xlFQgnqzCMvIs1W2AwaHHRNqIWtVBFfrLHDrDUrEaheYnqAh1SW5fJ3duPOQEc7MlkanUV+Ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHKoHj4G+MTv3GGUXPXxjDQEJQwunU8sx4SvcYiDOTACXjsMP5
	TlU4DkSxdQO/HVeYgDUICkrN7AXuJ/mnJlT9N8UNwu4hrkIddCbl
X-Gm-Gg: ASbGncuHS42a3ybPsKHr11BhYy//ViZm3tOiUBbzI7bGxPBQ1e3lZrUtG4+9JmqHSA0
	wu+hlzAfvCbE5wbjy10euOknWU6/PkGPUY40R/1ELcQdgFg6M7bxh668RWtBZZZ174g6i9ywzZu
	ka39kW5XrZT66Myr2vkklXUMAPxnlNfsxIgc2VToMtw8lBZb1zaz4M8qMehCoQjhaTos2CVKZKQ
	aHIB8ylog0cWSy4KNB7Ig+JBfjwf939CFop9t98WZxOGbJoXSW6nEmoh/F9OkP3ocFDAKgGd7av
	TGQewu+efazzGk4A3h4VGIPK79C0wQfUxV+/2ulbOauMJsTwFtazBIg=
X-Google-Smtp-Source: AGHT+IEx7fjFPOwJFBqQcxYwcNEjjXqC0n7A40gc7RBPd72Er1kad1UbyK8eNmLCNZzCP+fmYv0iMg==
X-Received: by 2002:a17:902:db01:b0:216:53fa:634f with SMTP id d9443c01a7336-22b42c44052mr47156885ad.48.1744292044230;
        Thu, 10 Apr 2025 06:34:04 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:34:03 -0700 (PDT)
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
Subject: [PATCH v1 3/6] phy: amlogic: phy-meson-axg-mipi-pcie-analog: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:18 +0530
Message-ID: <20250410133332.294556-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410133332.294556-1-linux.amoon@gmail.com>
References: <20250410133332.294556-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_063405_419545_7EA98A5F 
X-CRM114-Status: GOOD (  11.94  )
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
 drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
index ae898f93f97b2..c0ba2852dbb8e 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
@@ -200,7 +200,6 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
 	struct phy_axg_mipi_pcie_analog_priv *priv;
 	struct device_node *np = dev->of_node, *parent_np;
 	struct regmap *map;
-	int ret;
 
 	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -219,12 +218,9 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
 	priv->regmap = map;
 
 	priv->phy = devm_phy_create(dev, np, &phy_axg_mipi_pcie_analog_ops);
-	if (IS_ERR(priv->phy)) {
-		ret = PTR_ERR(priv->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to create PHY\n");
-		return ret;
-	}
+	if (IS_ERR(priv->phy))
+		return dev_err_probe(dev, PTR_ERR(priv->phy),
+				     "failed to create PHY\n");
 
 	phy_set_drvdata(priv->phy, priv);
 	dev_set_drvdata(dev, priv);
-- 
2.49.0


