Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB4DC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PqVjnpCOd6tw5elOnzKgHyJPJMgjBBKXmBN1/Gz996A=; b=wwQv42Zh5NwL8L
	0+V0+ZhC9cK2cbl2Fpo8zyqhWzgG5R5I87j8OGJXIx1zCiPOErT9RO4PRHDq5P9NLxdgtuMI5CU4F
	pDAN9slEfKdII0Ifnj9f+NRI0aCFXw5J6VZByANGC8gU4gWplZvkvxSTELzJldHyauO1PSHk3TDCA
	W2ds+gK0X2mMFaw3UucLp7K78Q1OeB+UB2tF+JsaagabkSKH488AkJvvQefduHlOYqqYgv0ve/U9m
	I6huUHVZxM0Q8WyoOlBdkI3RbT3a8m+t8pWkcHAZnhvyXnffxNZlpgyiaZLopIKvM85D1p0enBaBu
	SpLXA3pakNmwaz3nJdzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdu0n-0000000B0Ea-2gr3;
	Fri, 31 Jan 2025 16:36:57 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdtsD-0000000Aygj-0kem
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 16:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=PqVjnpCOd6tw5e
	lOnzKgHyJPJMgjBBKXmBN1/Gz996A=; b=gOWhJbf6VGoygz6RTsmwr2f4aMW834
	+fqARDsL8hXB33eGg+QHH2GODZ2DtIZGupFmUfyhp1qtwYYFQfbaDtZNhltuoM2V
	puRwjZBIDKMoVsn8oGywSrOjjininDc9nnmSl6OumBCv19Flk4DP1Td9OBNFmf33
	4I1B9ulCqzZ3NjGQT41bPiHm66svJt6Rfy93GKxTIXaBtPz8rJtpIBcjeM7tQEnM
	9N8Fux6H8ASN8ho7LWd2s1LrwcJJwhZCh/7iOZu+tnJ+At4YACEefh1ygjPfwv+5
	+95kn+fIH5SJrvDiKOZV6osMaitwWNstTTpSafpdM2Lm4drVZSdoRrWg==
Received: (qmail 1739453 invoked from network); 31 Jan 2025 17:28:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jan 2025 17:28:03 +0100
X-UD-Smtp-Session: l3s3148p1@K6/WBgMtrIzUph5e
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: ARM: at91: add Calao USB boards
Date: Fri, 31 Jan 2025 17:27:13 +0100
Message-ID: <20250131162713.33524-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_082805_494627_3DE60B0C 
X-CRM114-Status: UNSURE (   6.89  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

They have not been added so far. dtbs_check complains loudly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 0ec29366e6c2..42469a054a60 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -23,6 +23,9 @@ properties:
           - const: atmel,at91rm9200
       - items:
           - enum:
+              - calao,usb-a9260
+              - calao,usb-a9263
+              - calao,usb-a9g20
               - olimex,sam9-l9260
           - enum:
               - atmel,at91sam9260
@@ -35,6 +38,11 @@ properties:
               - atmel,at91sam9xe
               - atmel,at91sam9x60
           - const: atmel,at91sam9
+      - items:
+          - const: calao,usb-a9g20-lpw
+          - const: calao,usb-a9g20
+          - const: atmel,at91sam9g20
+          - const: atmel,at91sam9
 
       - items:
           - enum:
-- 
2.45.2


