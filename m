Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064ABC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SpXiomrxwgWW3KAymUxQ3eb5HkNF3o9XdspgzGz33ek=; b=hj6EhhoSSmHnYxRCC6mzPRRnHg
	kU+mxJQWpDtN2j0H5NtIsUUenQsvmKUzkUDw1yDFgHC4P0np4Qv5GgufP7Ohf1i2tcHon35b3AIvq
	kcXnZltmeeW/j4ekTEbC/KQWAlnlEXsNfYIJxgDtXN9NCGjUiwjyPQVAHqPRgD977ELsiFCqXfnVY
	uwAAytEq5iRpZaIV6GkyZGPoz7Ac3/gMkYUgxgifwKIfO4bGFcv2xCq91mGn3ErO7XvipSeitI8y+
	2C8yHlcvjS8BWaAjLz5V1A5Mn59zci3sm4P/OIeFdnZpNlLSi5iIw5CTmogyJHHmfDJUb4uc+/mA/
	XTNm52sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6rE-000000017aR-1GR9;
	Thu, 20 Feb 2025 13:44:52 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6f6-000000014SH-05Rt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:32:21 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2211cd4463cso17123925ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 05:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740058339; x=1740663139; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SpXiomrxwgWW3KAymUxQ3eb5HkNF3o9XdspgzGz33ek=;
        b=eUWqt9LRTj8Y1Yd9CH2uh4fm1ZiZopZcyDtmZIm3IFF3vcUfJfJEpeRt8kz7O9T2md
         KJikDLT5qaNqKu5eNW2Jzf7pilChv1kgkfI4gt3CB2SI+jCt6l4U9OkMNHeLvwmVYphw
         MbXpneDyUazrUldFA0X44+ED0v5ztNaRtvF0f2n5OW3euA5a/On/Auu9L87c3iNIfopP
         JHK3oLhpeb1nfMFvK/y4bwTb1m8mrriOndavWTsgefDVt0+65c8t73YmzmbZjtBW2Y2x
         og1/S1GME/lM8O086zR2pOb5b3QTVu9DjkQLhw1elQoaIlakNBlHcU/X1cytJm0bsxGn
         CaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058339; x=1740663139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpXiomrxwgWW3KAymUxQ3eb5HkNF3o9XdspgzGz33ek=;
        b=CB5kkeDFqQtiNiA2nhJ76cjFomORXFo23ryQjkqKOV3bz4dS4DC3L/YcUEenGqhgow
         yyetBK1Ug0wL4HQ7TzsfG00gPVQYmRts+uFT46AjcD7i0wjsbr6KsMwRFFh2euB2CT3g
         N0fGEttiiaQxgmatHpJdUmc3QELoYPynd+dlCWhR9ZKYJdxWBCHkcPCz+ZDJRYOJxbft
         v2mT4CDsI6EDnj2CBWSAzdUFIoxkd7g4HWkOzAsotIJUisJZwXDQxGfwQ0LCdPIV6RJ9
         XO2Wj3rYMOmCikH0Ad5mwmlimssUwWV1GDE2gSPdUiNRCcegApqO0/k1PrlUqljJkbVy
         /xKw==
X-Forwarded-Encrypted: i=1; AJvYcCXWdqKOn8jYDjz4uYm8n27YWovqwQY38yDiDnwp1U5BAr46HzxOQy/LHK9w4SuQNRcbvMSI0ciFEeHt30IpfjE4@lists.infradead.org
X-Gm-Message-State: AOJu0YwcVWq3tgZ8Dbyh2ktC2NYpdnmaI9QugjemkAXKURKJ+tIgMudA
	tpxIeKofexp6nSulCXB/Las5xO17b/ySJh0pOx9UFVyWCcYTqH4xG69dLw==
X-Gm-Gg: ASbGncslW+P/IUZy5pzLfgtUjnfwyCfumz/82By2INEiDQDA0BFFSzT+qKki3GPNKyj
	doCRCGncXt9A1i1r5nWS1fGEeUkYOPIEpcNonrMwgWP45AODaaLyy9ZIpDF21qs4KZO/Dh62NN0
	PNryfPfqWIHesvO1JwmWpE+JrcIBdRbXWGOjycaMsu0Kg4zpJrLctfX4E/qRB0ilAEyxQwKdTQn
	R+e4ZvyGBlYe5DWAsfmJzg/9gXZJzWdAYMCjSbh2p753tfasqfFUW0LBI9EUylIAAL42erGUH48
	QNwClsAp4Aj4SnjFB48aLr11pNtgAg==
X-Google-Smtp-Source: AGHT+IHeohGecc2Js/AYhxoI/ybnQzHGzwv8VB9CIjxIesLUIcECJnkFGTZ3JbjElCkZJmca2HnQYw==
X-Received: by 2002:a05:6a00:1707:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-732618fff8fmr36874772b3a.20.1740058339287;
        Thu, 20 Feb 2025 05:32:19 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9a27:2e77:89d4:5724])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7325953a4a9sm11605770b3a.82.2025.02.20.05.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:32:17 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx53-mba53: Fix the PCA9554 compatible
Date: Thu, 20 Feb 2025 10:31:53 -0300
Message-Id: <20250220133153.2380248-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_053220_055936_96C7C25C 
X-CRM114-Status: GOOD (  12.35  )
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

From: Fabio Estevam <festevam@denx.de>

gpio-pca95xx.yaml documents 'nxp,pca9554', so use this compatible
to fix the following dt-schema warning:

failed to match any schema with compatible: ['pca9554']

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
index c14eb7280f09..3cdb87ac1d7c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-mba53.dts
@@ -162,7 +162,7 @@ codec: sgtl5000@a {
 	};
 
 	expander: pca9554@20 {
-		compatible = "pca9554";
+		compatible = "nxp,pca9554";
 		reg = <0x20>;
 		interrupts = <109>;
 		#gpio-cells = <2>;
-- 
2.34.1


