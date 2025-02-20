Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0FAC021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 04:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPuaLxISPmj0zzzUfvfO0Np846HbNddwv0/P6/GTIX4=; b=cHnjhbGx6hAE5AYgYTyKfa1+u4
	ZxX8oAsn8SiCW/Tx0HaeoLHgZV7Ru0RyJKKQ9arFX5Y5FALxj8R6TPjybVmhxh4D3JU9mLPiTA20w
	zCYgeACd59ZJhnxxtRxnrAFvbRBIeU3fqwYsfQJpbYbwsRMidWP7Ge66I5ECkcI+/v1e4Rq//RwF+
	d5wbfaHMZz2zcuLB5qttHuPlO6KMGKKzIeLTd1HzIdQ9eEmQYViSMLZJ+5oqQffPBeKy1onxWTfNE
	yLE3MT2ujzMUrjpclkiCCxo0AKxdPYf/XnykyRGs7qxxspk1V5fhW+7pZOw407pQSRqwW96SAuK8v
	4+039tPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxwl-0000000GgHW-1tJv;
	Thu, 20 Feb 2025 04:13:59 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkxtu-0000000Gftl-0LD0;
	Thu, 20 Feb 2025 04:11:03 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5fcfeda1040so221326eaf.3;
        Wed, 19 Feb 2025 20:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740024661; x=1740629461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPuaLxISPmj0zzzUfvfO0Np846HbNddwv0/P6/GTIX4=;
        b=WAtVpXHjbEvuGTvDf3CjQjX6w7xHcxHa2dOxC4yRpgG5b+GKT/INVS+//qRMxumNJ/
         eyDy5azcvS8CVm/PuguPGfakQnMvUBs6eqsEVMp6ix6xVr//2Yg77kDEQDbofFH3gXi1
         zDDJ5veYa6QV9pecSGD3ewQvTtZK/99jCCdPfnOxcEVnupcLoAW84l4guFoeI2sG5b1n
         sbIvhA75CNH+40irOQkIoq9FLrps26bmaUKSJaMfAdp615qQcgZaPP+G7Wnnw9Lg5Xhk
         v4riOALjZVZ4TYZhSSAd3g1zfeCStJaA7/runbb9Z8O/EWQN3rZ4kIIX55Wah17cJCVa
         ReCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740024661; x=1740629461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPuaLxISPmj0zzzUfvfO0Np846HbNddwv0/P6/GTIX4=;
        b=E6F1p/alGOIqi0MmZ/aPl9BPlmb52yO1Pq5nD3RSFv6FEWSQkVt0cvdETL/MNjTfgu
         Wt0h8tmwdS05bgs5neVHmKty5ZCSpm3/oX/mXN+PP378gzm9/hjOr68v8cum2VJRXNCZ
         gEzr3qgXYazTCD5HDFTiuC6qgYpqbKnpdhqGv5xSQNJpt0benfSKafgBA/GhMwEPrlFn
         5RDD0zxBBhPngmXplMJlj9pGAiGY2bshgqEiVMiVDMohD+pB7CFFCv/ET230PZGHxgPp
         POkkD50kLVxmzeaP5mTcyGsC/0HT1XMpY94XO4/jov2akdTTwjmEc7kIT3oWKz95w43b
         mH2A==
X-Forwarded-Encrypted: i=1; AJvYcCVYbbAisrilN+89ujnFP1gd6b7jpMR9tUXOZEupAsIDU5v6vXTJD0bxb6ZTZi+Kx0/2BEYZLFzN+OGIeSCdwcE=@lists.infradead.org, AJvYcCXAU6jItX8MGLUnZAEdCekQhDyeTI+s0ZlvNLAq92SLBJchMEeakEQ4o241IToF7rqsNJPx+sBSG39IWo3Ls60m@lists.infradead.org
X-Gm-Message-State: AOJu0YyDqDVOWyI+jpChmZFgsCGSQdVLnn1j8oLHucojabD8GWe210Qf
	znOCfihWHCVdtfmuAUjepxdtyMF4nXNttUHmwEf75ptC2dLDDZAI
X-Gm-Gg: ASbGnctKB0I2PW2Zj18poKJg+p/zvzCZKe4luptfJWuFiRtn9rbEjre963YHk3m8uXQ
	JPwxg22KJi/j9EwpxhsUkHfSnMoRDnR3Tn78NlgqF5RJe/EzfJpQIH6fszeyndeFnHBWCa+qS5v
	7J7Tyj48qWQ9ZCOeL+U5G2WKqCz6aIZoJxi7RWD8Z/dvY2a3HgHO+vmwnT8BlD3YhwOvFgO/SZ/
	0FOh08w27qSHMZyFFkkmHdzt7FIWK02604F7jz6Glr6n0GeMZXh0gOv0KqZtq30F+gNgCaU5+JW
	KIyuSpIu/2pWo6x4MT8WzZt5
X-Google-Smtp-Source: AGHT+IGnrMPHEBhIseSfxk+zly0/RwbQFSYtQKi5ZDgXJW6nGSRe0jULV1zSvgb1Ee1GPJb5/89C8w==
X-Received: by 2002:a05:6820:1622:b0:5fc:f3b8:78c1 with SMTP id 006d021491bc7-5fcf3b87fa2mr6831438eaf.1.1740024660702;
        Wed, 19 Feb 2025 20:11:00 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:20f3:777f:5ae9:b018])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-727378237e4sm1025875a34.47.2025.02.19.20.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 20:10:59 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH UNTESTED v5 1/4] dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Ultra
Date: Wed, 19 Feb 2025 22:10:07 -0600
Message-ID: <20250220041010.3801-2-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220041010.3801-1-honyuenkwun@gmail.com>
References: <20250220041010.3801-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_201102_119293_CAAACAF2 
X-CRM114-Status: GOOD (  10.11  )
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

Add devicetree binding for the Xunlong Orange Pi 5 Ultra board.

The Orange Pi 5 Ultra is a single board computer powered by the Rockchip
RK3588 with similar board layout as the 5 Max but with the HDMI0 swapped
for HDMI IN.

Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450ea..48b27f28a3d7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1136,11 +1136,12 @@ properties:
           - const: xunlong,orangepi-3b
           - const: rockchip,rk3566
 
-      - description: Xunlong Orange Pi 5 Max/Plus
+      - description: Xunlong Orange Pi 5 Max/Plus/Ultra
         items:
           - enum:
               - xunlong,orangepi-5-max
               - xunlong,orangepi-5-plus
+              - xunlong,orangepi-5-ultra
           - const: rockchip,rk3588
 
       - description: Xunlong Orange Pi R1 Plus / LTS
-- 
2.48.1


