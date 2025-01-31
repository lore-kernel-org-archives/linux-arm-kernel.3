Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E8AC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oONFBN9kRWZhgPfaLK5ZjKIMG9MQ+h62PBu+80B8xeI=; b=BB7j7UnSBylAcPQVpp13FQCIQ4
	LXXQNtLX045Qc0AdD3Bl2fQ4dztGDIl35TAMetvzH7OEEc4lPArQYK+JDRSYhuLszdpMNwp2Gxjwr
	4jkqecXBbSiHH6FktC5omASO5tUhjKHeaOGKvo47CSixw8aSXonQ5SZyhQF/kLnQAXNjBqdvTPurp
	uDFbqsBP91bMvrX1Sh+sWFB16ZeJ/VfwjZAjozKumVuSUVR0WqQkDpSb6jd+qYyY4gyKHX2dNLZDY
	n/KA2E/14tkw+t8W3qfPScEDSdme4bFpqpzOPQtmN6dv3cANqNy0IdJauiDZekED3ij9OWHfHeQXV
	im5hHTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxHu-0000000BLas-3IZU;
	Fri, 31 Jan 2025 20:06:50 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxGa-0000000BLNX-0nI4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 20:05:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738353925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oONFBN9kRWZhgPfaLK5ZjKIMG9MQ+h62PBu+80B8xeI=;
	b=GcDOkICOn3Tr7pKWUWR4rcuOIbez6/m23DvRRqkDFIw0kMTlLUrUabDF9UrH2uptTcU2Zi
	8qdakhRJV6dOrsdZ40nyTp7+k6GpfULfbfDFcW8gnPaj5RVZsQmFl6G9+J9F8exYEjE5mK
	P8lv/dsSinloQ4aucEtEGHr0kxQBUqrwRoidWkkgYZ74wK30JZV/e9lnjniLHpOfepX0Jp
	wHvRjEr0htCEz55GnLQazEjAw8VkRdNzuHfxgnWOuN50tXz0CKmmLVCHGaaSW1626RzLLY
	sP5rURjoSQ7mRqiF4LHvwe7bHlRo6Jxk3QoNSuB9p572d7AmQqU2CXb8CJ8CdA==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi TV Stick
Date: Fri, 31 Jan 2025 20:03:18 +0000
Message-ID: <20250131200319.19996-2-funderscore@postmarketos.org>
In-Reply-To: <20250131200319.19996-1-funderscore@postmarketos.org>
References: <20250131200319.19996-1-funderscore@postmarketos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_120528_370371_45E0504C 
X-CRM114-Status: UNSURE (   7.68  )
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

From: Ferass El Hafidi <funderscore@postmarketos.org>

Add support for xiaomi-aquaman.

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae..0db7038b9 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -70,6 +70,7 @@ properties:
           - enum:
               - amlogic,p241
               - libretech,aml-s805x-ac
+              - xiaomi,aquaman
           - const: amlogic,s805x
           - const: amlogic,meson-gxl
 
-- 
2.47.1


