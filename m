Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F96CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=; b=og6jpIYGl4FsCkav9r/DP5mal+
	miLO010I/wu8H1Sa7KRuFg/rYRvIbTalMk/JnFsxrkOis6gEZGs8Jj5oH+u8WLMd4ta/FTUme3nnk
	ljCjBHiF4T7ErqoqSaaJaWy2drTXx2v+JBuzckZMwV1qRucphMhvxOqGENMyVch8yQe2HAloCnSB+
	LiFvHeL3GrBKgT3GztA0t7BbOkfjrhTLSzAKZGqAbuB0IszndKw0MI+hRSDFhAI+VVGQYDRlR3UBw
	QM4mxZ0JFFG/lV51cVM1rL5sXw04x89wehAUaEaVqsXkzY4+Ec8GTD1f0h6dHQn2qCGZYeMwLO6b0
	VuDGgmvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHGL-00000005P3l-1iCf;
	Mon, 30 Dec 2024 15:00:57 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHE0-00000005Ohr-1PVn;
	Mon, 30 Dec 2024 14:58:33 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-30037784fceso101000131fa.2;
        Mon, 30 Dec 2024 06:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735570710; x=1736175510; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=;
        b=VjF7O2c/9w6cVi07LySCEBDgcrPXHoNyBVQ8C66Zjp+xlMYkqJnHUenNYjLwmokAKo
         juUvSQq3bIlqQVPAMbEl8+Yr7U808YZ+HnekQbIUKjGTFDCuAILlHVpJVLFm9mM61rYW
         +bgxE9+3TXjS22hqhoHX0OKPDcUTTByWXOrPlp1L+F+PlvqsrdCzCkBV0Xyxus5zH0Al
         dlZr+Z3GTgG6vCxiyGXbJ9wV3dnVZJDLAOrb6a90/8vrHi77p/EueQM0IpxDqnPA5KJT
         5jy+bzwt9dsQ2hy5gHWkR3oRC5ZLIHlLXGYbb+s/2yiZn3o5Rd3uEEvcc3MEQ3aCBqyK
         4MRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735570710; x=1736175510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CcUs5V3NaAvho7+pyHks8hnj2f07Xk/qrLoafEl76mI=;
        b=MwWsNwM2L0QSQncDND4SEWWzWbh6xQE/dA7+h5GdXs0492oIS3FcnxLEpF2OsDwnsi
         rGqlMgvSL0fm99cxusZUC19lDvnMt/Kpr1jYXSqvMCCRWSBmfT+PjH5R86fgFppyVtDt
         imVDW2EQQ5kEv36GA1tXDZQWOTklubdYWnQTjv5llwASnH/wo6ifqQoMrXhSM+yZSvP5
         lnFvSFqDwcSHL8mRnGF3czQNQ7EGnpFz31e/dmQ4adoUKbjDWsOWnhoDQpAz0aOEwijS
         hBFSqUCexmHFlibMDF5rHAiZ3BsVQ9ZdLcZd0cUKqL5fFmVsee4rwaEj1w4qyviDu/9D
         5IAw==
X-Forwarded-Encrypted: i=1; AJvYcCWTFZDO8NV5JhoSHP7/bS+uoSUzZ89l+6xZtjJAPXS1xY/J9nZ4HziHd3nma+PmILWtiRgF4KdaqrgauT5eqnvL@lists.infradead.org, AJvYcCXRGo6PtkOhLYpgHC22RMILzPyWwqlWD5e5ZQ6N4kMIbL7SACbOZ4Iccpmr08MILDdc+bvmvZ1QwNseBV6Yjbw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZoHpDF9jUURGoqxqujD5vEnIqKXIl+hc6cr0Zsy3ANfT0Vxvm
	1ZRhygDpyjBCPU/H6fOP+9GRSD9m6qm2rgfJ6d66RBJSNKfylrBLQYykmNk=
X-Gm-Gg: ASbGncv0HbIqj4OH3s1m5hs0pauIofPLV7VxxDEifSqzJm+FbYY1RltVytUHBlb4VLq
	FJN+1svhWeQoX748aMO7qykhLOoAT50VewCAFCG9nt5lrd7gqaaYApFwM+A1YvpZiTV/htoe5Id
	jRsi9f+DoJ0kIeAh7VNj2V/59kJ2ikczSVUoAN4L5uXAuDBBL8Re0PmI6m4tU6+Rg8QiK8T1S/m
	QZTUD+lLC63HsBQMqFx57Ok8F0WWFRRSvkOHQ5rpzjbioquS8LlNZ7cOTg=
X-Google-Smtp-Source: AGHT+IGGle7L3Pgw7YylhfihahGvyOEaP7KbJQB691xKUVzMelucw7pM0g381qkKyOpyxUJSbMnafQ==
X-Received: by 2002:a05:651c:50b:b0:300:1f2c:e3cf with SMTP id 38308e7fff4ca-30468556638mr121726901fa.13.1735570710108;
        Mon, 30 Dec 2024 06:58:30 -0800 (PST)
Received: from JetTurbine.homenetwork ([2a0e:e6c0:20d3:2100::1d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b096026sm34385111fa.118.2024.12.30.06.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 06:58:29 -0800 (PST)
From: Ivan Sergeev <ivan8215145640@gmail.com>
Date: Mon, 30 Dec 2024 17:58:18 +0300
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add BigTreeTech CB2 and
 Pi2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-bigtreetech-cb2-v4-1-26d2d30e07ce@gmail.com>
References: <20241230-bigtreetech-cb2-v4-0-26d2d30e07ce@gmail.com>
In-Reply-To: <20241230-bigtreetech-cb2-v4-0-26d2d30e07ce@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ivan Sergeev <ivan8215145640@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1174;
 i=ivan8215145640@gmail.com; h=from:subject:message-id;
 bh=p5DkTJDu5QlNVWl35gjaVUthknkZBv6iZeP84hntyqE=;
 b=owEBbQKS/ZANAwAIAbzfXRlQM5b9AcsmYgBncrUUA3PrmBoOQc7ZK6KuFz3wKh25H4s2Ks4/y
 ZkZpGqK4jGJAjMEAAEIAB0WIQROCZtApKFz1fvvsOS8310ZUDOW/QUCZ3K1FAAKCRC8310ZUDOW
 /UB5D/0UqZVTLfo9t+CZwDH2325WVdLwSnj4si0Dt3/1sDivld5EZu2i/ygHdEHQQjL+rbQb33g
 JhZ4VjkWj02or1/DxwriZMD8lTPai8vi7FA4+r+rytYFAwn9V3VA/xhBVw9muFCUFgsBvLUCNt6
 PhG4Ey94ehyjyJyk2QhvSQR/dx7tKp4twzUfH1ewHb1M+CPOatsPKX0p40L78FNm/UoFlh3FYuZ
 pDJ0ZHbo7Dic4kfvcbikF2pnjO4qhlxlvzjAmXiKgxz1kyWy4ylJZmZGHmZo6riNCgfv2Kt7Nkf
 +2cSgiVcJftrvwM8YUSKxia/vPn35aRxpeBBiZtp8b10Ole3XL2A9oPi/A1f+T9N1/NyOpqkbWz
 HBdv5rBRkATd7L9iVpX1BipqMHhO+v248a0xt4PSe5ScihVPq0HSmsMGV2pxF+1IbPsTfG4iUtk
 DkyCNy7KyHk7FBufRZfN4kd3+kP23XRuIImQfX5ReTgpPOkSVv6SRQGELXfTFLzaOsLR+V0fKig
 2Xhhdd19vGuFh/g2B4dDCTmlmPxz5BYlyMgO4rdjNfcKP5FRIZRiMV7RsmB/XsFcv4P6QEEDhQd
 HNpcr62xDuk+9qNiqgp8K/JJPpnjAPAeLtCpu37WQ0gH7Tw4nNJ4ZDxGhz/GYwNd+FOujTK9q3+
 jXUo0ykFOopWMzQ==
X-Developer-Key: i=ivan8215145640@gmail.com; a=openpgp;
 fpr=4E099B40A4A173D5FBEFB0E4BCDF5D19503396FD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_065832_377421_CC6BE694 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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

BigTreeTech CB2 and Pi2 are Rockchip RK3566 based boards

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ivan Sergeev <ivan8215145640@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12923fadaa48c407a8e55e7854db7203e..349453b1676bfac45abf5cd49d6bd9f847281213 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -81,6 +81,17 @@ properties:
           - const: azw,beelink-a1
           - const: rockchip,rk3328
 
+      - description: BigTreeTech CB2 Manta M4/8P
+        items:
+          - const: bigtreetech,cb2-manta
+          - const: bigtreetech,cb2
+          - const: rockchip,rk3566
+
+      - description: BigTreeTech Pi 2
+        items:
+          - const: bigtreetech,pi2
+          - const: rockchip,rk3566
+
       - description: bq Curie 2 tablet
         items:
           - const: mundoreader,bq-curie2

-- 
2.45.2


