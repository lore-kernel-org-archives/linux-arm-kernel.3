Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186F3C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGiINAVxrmdGU1PCrP23FZvlTFaK01obSa4XqumrYhM=; b=Hrhv7TxFw9jXmVb/Khr8l/Ju71
	mkIpj1JMj8qo6aw2XB3L/PAyEHVNPtv9eua9LwPFJDF6OR5rcXdQtc3n5whigxeYmbM1Z4kG+y0QU
	teGcmAEhzVt+RVh6SodyKXx50M0b2FUH8nEXlTUIuncLixqhNjOcumMQ8wgvRiDayCPmzsibjdZQO
	GrpIjloHfWu3I4xTcR4GjtTlPh4Q2vzCqJUI0cub0OBWVC+xUtIHPNBUsHWVmHn0ZTdlo73pFFalh
	3QjZNs279cdruIBbq89v5/zfR56r7gE2Acbtevhxj23K5NxMih39RS0xtvx8Oc7p5M4k1zUqOsR24
	hFUVhybA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWkc-00000009ApX-3G3a;
	Wed, 09 Jul 2025 15:30:26 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUlt-00000008lqP-1DTW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 13:23:38 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1752067415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGiINAVxrmdGU1PCrP23FZvlTFaK01obSa4XqumrYhM=;
	b=lKsKQ2q4ZBk/za6pTF38bYIbjhaJTuEUqYP6d+q0rAxowzY/zJDyxEt2L5TdKnHcMaXE7/
	jiVohHfPVk7niMVYyXZWc4bo+oUS7tv5khIaTeA8q+Bwjrqwu8H4NsbFmy+p/TN6Zia3OW
	6KD7KrEoXrwNZA7mBXNMc/dH51UOZI9QRLNDJ4fNcdz9AeAT7c1vIP0/fhW1YAQbEv30o0
	QFrmDWPX4QK6jsQJNltcFyUdbh4F1EfQy6xS8B+bz/ONJE9BK1nXqiRDdj9XC0NMbNGUDW
	mXRp+Svipuu3SGgsN+752Q2p3XLlA//r2kT/L4fDosTa6qKG8b+/nlRJFZ0ghg==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v4 03/10] dt-bindings: display: rockchip,dw-mipi-dsi: Drop address/size cells
Date: Wed,  9 Jul 2025 15:15:16 +0200
Message-ID: <20250709132323.128757-4-didi.debian@cknow.org>
In-Reply-To: <20250709132323.128757-1-didi.debian@cknow.org>
References: <20250709132323.128757-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_062337_470005_5EB31EA5 
X-CRM114-Status: UNSURE (   5.75  )
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

The "rockchip,dw-mipi-dsi" binding has allOf "snps,dw-mipi-dsi.yaml"
which has allOf "dsi-controller.yaml", which already has #address-cells
and #size-cells defined as '1' and '0' respectively.
So drop this re-definition.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml     | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
index ccd71c5324af..0881e82deb11 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml
@@ -58,12 +58,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  "#address-cells":
-    const: 1
-
-  "#size-cells":
-    const: 0
-
 required:
   - compatible
   - clocks
-- 
2.50.0


