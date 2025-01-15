Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F02C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 20:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiOLfASoDLIxhMcYj6b7mYjqGiDFsNYKhppLhHdwIJw=; b=eULbQU2/pOdosy9a29+DdR6ONR
	HEIVVjCDSLAoujKb1TNGBdUPTcrd2B9xizdqWbLGf0XKpfcGDmDylyPPCf27iR7FoD+RN7ZdDtCAl
	PlsLdrbwsMqmNMFS6wD0vOAB0OCXMGJGBJUdBqN+aejCRmo1qUTcMN7pdAEJ3Yo16vVECq1oBesn1
	AEZmknK54YG7PfSAmnJTC0ZJ3OLTQ8oka7coMP7vBYJNrecjIVDXgqsdNCeClMH2lH8YPrhlKm1J9
	UkfiNAcIoNco0TipIFje8COu+juKFta7yiZgww14A6k/JQBfr+OewFEXX6DpYRtsm0wEJNxsEMyfE
	3Kf8nBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAFz-0000000D28C-2GcH;
	Wed, 15 Jan 2025 20:44:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAAy-0000000D1Im-0JOB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 20:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3F83A42464;
	Wed, 15 Jan 2025 20:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12121C4CEE2;
	Wed, 15 Jan 2025 20:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736973582;
	bh=4rHuuIIznllRMWXRTJSSwhOHFyt7BOtP3GxwNOgi94Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uBOsWTKLzEkJ606NcHvNEY42qnvkeOpOEoDCm5lE7Hb4te2Ggl4Za1Acxu1HwHwUy
	 TnY07kq7g7OkOcrOpPbS+pIAKUU4hFL2XWzLCvYwgbws7egck1BS9JrQUF6JOhBaVO
	 rbugmjwwTB6DrWOrNFes4tPApiXhhaEfijLXCdxXy5y1Pbyd6TnEwm4cy1D9ao5r2j
	 /OuguU4WRUAzvWC4eOmjsbmSvqYP7X4OJ1Toj9yRnYlsuNxE2GIgc9I6iChHvDSBbO
	 gIAVQkrD989xsrNJ0GXXFpF+8+/r4PAkNuHLXqT3TcGjWQ/bCAwt6g1x3ne4UlwvPr
	 igistPaQtOXZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008B6C02183;
	Wed, 15 Jan 2025 20:39:42 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Wed, 15 Jan 2025 21:35:54 +0100
Subject: [PATCH v14 1/4] dt-bindings: marvell: Document PXA1908 SoC and
 samsung,coreprimevelte
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250115-pxa1908-lkml-v14-1-847d24f3665a@skole.hr>
References: <20250115-pxa1908-lkml-v14-0-847d24f3665a@skole.hr>
In-Reply-To: <20250115-pxa1908-lkml-v14-0-847d24f3665a@skole.hr>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=qR7h7Srn86tbFZcfkQnFSzKzStRtjopHrNplHXNcxgQ=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDOkdsjxexqYRTOfOzniQ1nj5B//zgLQVcrlbJ5w/xSCRl
 rX3VtzFjlIWBjEuBlkxRZbc/47XeD+LbN2evcwAZg4rE8gQBi5OAZjII1OGv8KsgSZbJ4p6/eQz
 0Tf9JPe++eHuiO1fekwioj5+5kt7v4vhv++pW7t3Nd20vLo1rCirIKOQNU/+k27wirlvH+06Fn/
 0By8A
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_123944_250188_1BF9CFC5 
X-CRM114-Status: UNSURE (   8.93  )
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
Reply-To: duje.mihanovic@skole.hr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Duje Mihanović <duje.mihanovic@skole.hr>

Add dt bindings for the Marvell PXA1908 SoC and the Samsung Galaxy Core
Prime VE LTE phone (model number SM-G361F) using the SoC.

The SoC comes with 4 Cortex-A53 cores clocked up to ~1.2GHz and a
Vivante GC7000UL GPU. The phone also has a 4.5" 480x800 touchscreen, 8GB
eMMC and 1GB of LPDDR3 RAM.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
index 4c43eaf3632e4ec8e7d9aeac62f7204e2af4405a..f73bb8ec3a1a1b9594eb059b72d95dcbf8c87c6b 100644
--- a/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
+++ b/Documentation/devicetree/bindings/arm/mrvl/mrvl.yaml
@@ -35,6 +35,11 @@ properties:
           - enum:
               - dell,wyse-ariel
           - const: marvell,mmp3
+      - description: PXA1908 based boards
+        items:
+          - enum:
+              - samsung,coreprimevelte
+          - const: marvell,pxa1908
 
 additionalProperties: true
 

-- 
2.48.0



