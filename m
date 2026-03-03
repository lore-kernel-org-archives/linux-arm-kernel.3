Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC68EDEBE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 18:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n4z6FdYhYaFqV+h14J68jBQV7uz/eMFVd1la7jJI9Rk=; b=Z2uHp8AJF58gtDrJagNk9gVIAB
	GM5CQmK2iATo+C8CIWsQ2vqU7RtZIzCVsKHBLcy+ohDJnep2YHTf5Ss5IPgkSDoHTYSKM9EEhl+tb
	gkokkhkYDrjH2TpmqdTxrr9JsYMYjjSs3g6VHpCWNooz7/Y5HpM0dhBPvLg7T3mQBwpzIrVJtzRiL
	66p/9qf84wXY3RIh8nei2AlAlaguf4SJ05NumbEUOAiPJqkePKjwlIl8/a1vAsaPkb8yeUIe7k2+9
	4hiCkwbUDaBEhGQ/bMqihD7+071uXhnxmrVKl6kLmHrJU8L4fGfLQIZx7wj3aD0NGVLWpapXDR2Gn
	7QfTwgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUtX-0000000FjQ3-1yO0;
	Tue, 03 Mar 2026 18:54:59 +0000
Received: from mx3.wp.pl ([212.77.101.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxUtU-0000000FjOj-2R4F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 18:54:57 +0000
Received: (wp-smtpd smtp.wp.pl 41929 invoked from network); 3 Mar 2026 19:54:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772564093; bh=n4z6FdYhYaFqV+h14J68jBQV7uz/eMFVd1la7jJI9Rk=;
          h=From:To:Cc:Subject;
          b=RZ0+TCdY33t4IZsm9S44lHbyCE7C9ekSDNPvB61rNzz4EvBI7OXSSNDg/h7P638cj
           94/2JSrimDIAJR3yILSpIStygYCOCcCnWceWxnU04ni4EmyR9Eui5qBA8ComSVkZ0T
           Bk6IlPH8+/Pxm7urQkxkFlEpRkhkUEyleuj008i3Yry9qCyx5pcbJHfRpXiyh9rD5l
           geWBknao5EEX6LAXCOWoWcqWyNGvqeUFb9hVaA5rrOYuWf1ch3GBO34yBVgVC9WlLA
           POouYUtmBF9lsiGlOx33CH5aqDlkhwwbxbiBkMEJWKiSSFsuPxbOtrnLtuILGSDy/Q
           x3RANrXvQwE3w==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 3 Mar 2026 19:54:53 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v3 1/2] dt-bindings: crypto: inside-secure,safexcel: add compatible for MT7981
Date: Tue,  3 Mar 2026 19:53:49 +0100
Message-ID: <20260303185451.70794-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 312696ebf01c215835820228deefb2c6
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [oNOx]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_105456_768834_FDED9AFC 
X-CRM114-Status: UNSURE (   8.89  )
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

The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
This commit adds a compatible string for MT7981.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v3:
- drop oneOf
v2:
- just add compatible strings
---
 .../devicetree/bindings/crypto/inside-secure,safexcel.yaml   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
index 3dc6c5f89d32..a34d13e92c59 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - marvell,armada-3700-crypto
+              - mediatek,mt7981-crypto
               - mediatek,mt7986-crypto
           - const: inside-secure,safexcel-eip97ies
       - const: inside-secure,safexcel-eip197b
@@ -80,7 +81,9 @@ allOf:
         compatible:
           not:
             contains:
-              const: mediatek,mt7986-crypto
+              enum:
+                - mediatek,mt7981-crypto
+                - mediatek,mt7986-crypto
     then:
       properties:
         interrupts:
-- 
2.47.3


