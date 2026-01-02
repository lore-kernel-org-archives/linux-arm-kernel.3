Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441C6FA3753
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTuvYWbsPdbCKoL0+Bab+OPewJBz4FpesHrWJNueagQ=; b=a95ILQftZIBhVgFPCjBkhsMoyQ
	gVHj2DV8aabArPXidBpXJhAq3IaSUbArIihdW1ieVhZ/15z0wpHHXIGZgI7WKsSa6ooZtDoNiNGcQ
	qdwFvoQeJexe3ibXuPAB4oFexvMXJLOVruesdgxAM9dU9z27rBePS+fy9u9CzD0h69XO1/CkP7LoO
	tjamZreMgcdXg1MKNCInrZD4vrtX3Zsh5Ygu8claYZG6dY8jYFpQcGzb/dpDs9F21wPHFquzeCBS0
	wQs7I6KXy7I7VjNYOzGDwWJgTyCB0GTW3bDWLhIhF4gmOsiu/aJzlERBCdjV7ZxX+yKL+eekJPWoJ
	w5wxSf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhTN-00000008SPZ-0pBF;
	Fri, 02 Jan 2026 15:53:53 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbhTK-00000008SO2-0gmS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:53:51 +0000
Received: (wp-smtpd smtp.wp.pl 29423 invoked from network); 2 Jan 2026 16:53:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767369224; bh=pTuvYWbsPdbCKoL0+Bab+OPewJBz4FpesHrWJNueagQ=;
          h=From:To:Cc:Subject;
          b=Ui8rzs67kt4mvHrJbA0Y23pDGSbSH0U1gS/l242uXZFivJI04Oj05OinXHpaAwW13
           h3KsB/0u86qYqxar4NWTkAw/w0lRMcOiyN+NRH8T2am/yqmEWRLSuTZGbSj7AtumGS
           Jj5utxYFUiX6JH8+WLjYN8sTMZN0mf1cR758tOtww6ZWMa9mKPKPMhoV9WvverYZ65
           6A2WWyJT5BevqxpyqwF0pW4bE+nI8EYwa5r2xVI0uedsigQ/pUl3D34ar8rltLRV4t
           gBrI9w0Pcii7jV+fRohH+V2XIVIVVnhH5N9k3jfJcUnkjXfXo5Q+GI5ogDwBbH0bVi
           P0yTQrh1XeMkw==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <benjamin.larsson@genexis.eu>; 2 Jan 2026 16:53:44 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: benjamin.larsson@genexis.eu,
	chester.a.unal@arinc9.com,
	davem@davemloft.net,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	conor+dt@kernel.org,
	herbert@gondor.apana.org.au,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	sergio.paracuellos@gmail.com,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v3 2/3] dt-bindings: crypto: eip93: add support for Mediatek MT7621 SoC
Date: Fri,  2 Jan 2026 16:47:34 +0100
Message-ID: <20260102155341.3682013-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102155341.3682013-1-olek2@wp.pl>
References: <20260102155341.3682013-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: de0ba326c9d18cadba17ff32d4687418
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [ofrU]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_075350_675155_7AF33E22 
X-CRM114-Status: UNSURE (   9.24  )
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

Add compatible for Mediatek MT7621 SoC. The implementation is exactly the
same os in the Airoha SoC.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v3:
- Use enum
v2:
- Corrected commit description
---
 .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index c6c99c08dc68..acd7c68178dc 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -31,7 +31,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: airoha,en7581-eip93
+          - enum:
+            - airoha,en7581-eip93
+            - mediatek,mt7621-eip93
           - const: inside-secure,safexcel-eip93ies
       - items:
           - not: {}
-- 
2.47.3


