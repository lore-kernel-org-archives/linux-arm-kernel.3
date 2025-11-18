Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07506CED249
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 05:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hi/WJwu0meQHwa9Ulmgnntv6q+cfCBIeaHgpN091xI=; b=kso+kJL8r96qpB+kl4mjod2Prl
	lT3nyT1va6dzi7p0jO5eNI88Xajybu9n8hnbKbuHy6FX0r+o+/KgoQ28GfrJo40rM3zB74xc0L5Wd
	4K2W+5hdkLREw7/He0IICw4lePzOcn7C1hsF7lRfT2JB9LKSqFytZh3win84EsS5MWjApeDjIvn/0
	csWWyoOkJjeWUF2Z12PPHvEtO/1jswt6rIAinXSUEmcG9U5AZK7lvPLDz4KD39tEGklHQxykcNanR
	rEn/EzGt0oeVuVsuVbbnje0JVpz9hrYTWMkBJ1kAU9vnT4WH+cH4jz1r05qPuG647Ja95WiDMGi36
	LrPOZQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEkG-0000000HSJX-41Yf;
	Tue, 18 Nov 2025 05:59:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLEk4-0000000HSC7-3TjP;
	Tue, 18 Nov 2025 05:59:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2193043B6F;
	Tue, 18 Nov 2025 05:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64FCCC4AF0B;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763445543;
	bh=dJK22r84acanscjFS46rpF2hSs0/5lm1epfUph3n/Ds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jdnEGGEnvNCsF8xDsSmOkr8eCIUJoNyC3uSLC8+oCMbYQF8wy17GRN7FbFzKGkYYK
	 SHCRvSjCrP3giyQPok9gce9pYxnTrgV8ZO9i+NXJAQDYXBqWwTAhFxSKB61nCkdAjF
	 /q5y3T/YcfM2qWxzVAoXEXWooD24ZF94bRoyJMstEjqv7Sjb8XdtBUXs3rIZGWb7yU
	 HeszUuxMeXIOpZX/L2W+DU7OhFY3dbW0gAZIUwJG4L9W5LdPvBdQhuGMZhzuDKrUki
	 br0mW46H08Y34qhkkSlGDy5AyJwtYy0e6YB+WI8J2mLCk19tTAtcQmf54+RWsL/x8x
	 J07C3Kn5mpnzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D19CCED243;
	Tue, 18 Nov 2025 05:59:03 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 18 Nov 2025 13:59:00 +0800
Subject: [PATCH v2 1/5] dt-bindings: arm: amlogic: meson-gx-ao-secure:
 support more SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-soc-info-s6-s7-s7d-v2-1-38e2b31a88d1@amlogic.com>
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763445540; l=1074;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=X2YO1s8uBuGAUV6Y26504dBNen26LRGhmjN4aH4eHgQ=;
 b=UvCK7bw2hkzxHmk8SJ/k4HJD2vMK0DPdkXSLdvTsXNyjDV5TxK4go+XkLV4ZsPuH06zv5X5JH
 Gb47s6uNqL+CGjF4M7L3WTMRHo45boBfKjXkhtBOOdkaTgPdJveIm0L
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_215905_648675_AA796EAA 
X-CRM114-Status: UNSURE (   7.58  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add new compatible for ao-secure of Amlogic SoCs(S6,S7,S7D).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
index b4f6695a6015..fa7c403c874a 100644
--- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml
@@ -34,6 +34,9 @@ properties:
               - amlogic,a4-ao-secure
               - amlogic,c3-ao-secure
               - amlogic,s4-ao-secure
+              - amlogic,s6-ao-secure
+              - amlogic,s7-ao-secure
+              - amlogic,s7d-ao-secure
               - amlogic,t7-ao-secure
           - const: amlogic,meson-gx-ao-secure
           - const: syscon

-- 
2.37.1



