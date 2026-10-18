Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C98CCF2CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 16:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emJJkhshzeK8P+If+K2qks4eZgheDqgrDrDeTe9jGqs=; b=1V/eHAm3NRn2GupnogHrCOhtDH
	OlQekCiCbIt3MvBxpUuwNuWjHBocfxWbVo6omOrpJiVoU+MulmrieUNKIyCIuePfXoVgmg7eMkeud
	3m7XqJhHRgvgPMgHbDuZOpjTgA2F8sOweVXLSaSxkn9l6F68XOpJ5QOMurhcsH9o78q541IBtOb0z
	2TnVKOnjgcN3HoIweaeTnBpfTtEQ1tMONvx6UU3vRx7OUrmi0Lg9U22E1g/3kK8O4rDp7yUKX5ZGK
	VSpPKjPF3mP4CFsVsvX2+W/9ovG0cj0YQgQFEebqWbHgdzTB90EOhj/UraBVFmk3/QTJdsD2QDIWo
	o1+z8J9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITuH-000000063EJ-3zCc;
	Sun, 18 Oct 2026 16:38:45 +0000
Received: from [195.39.247.168] (helo=mail.cyberchaos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xITuF-000000063Cg-1PXS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 16:38:44 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1792341505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=emJJkhshzeK8P+If+K2qks4eZgheDqgrDrDeTe9jGqs=;
	b=atA6yuZiFe5joFM10lquRpZ+3zbhop7/gWmncclhAls+SRCX6WKogikmlepluLLojl4l3E
	dSNnlEk0vrzHOfs6nRpWhXBpSWAhmCre2NUeVIrwKTL7YFGWC/sTr0iV0WWiqXk47U3vcN
	Tb0SlshEDgTjjkzuWEZv6td3AHmF9/o=
Date: Sun, 18 Oct 2026 18:38:10 +0200
Subject: [PATCH 1/2] dt-bindings: iommu: apple,sart: Add apple,t6050-sart
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-apple-sartv4-v1-1-1eaa5d63f6a2@cyberchaos.dev>
References: <20261018-apple-sartv4-v1-0-1eaa5d63f6a2@cyberchaos.dev>
In-Reply-To: <20261018-apple-sartv4-v1-0-1eaa5d63f6a2@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_093843_624304_6A246009 
X-CRM114-Status: UNSURE (   7.12  )
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

The SART4 is on Apple M5 Pro/Max (t6050) SoCs. It has 50% more entries
than its SART3 predecessor and is otherwise the same.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/iommu/apple,sart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/apple,sart.yaml b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
index 88e66d4b13c6..d081dde44b05 100644
--- a/Documentation/devicetree/bindings/iommu/apple,sart.yaml
+++ b/Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -36,6 +36,7 @@ properties:
           - const: apple,t6000-sart
       - enum:
           - apple,t6000-sart
+          - apple,t6050-sart
           - apple,t8015-sart
           - apple,t8103-sart
 

-- 
2.55.0


