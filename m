Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E46EB3640
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 23:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7+cweu98TOcNO2fC2HKsiZqjaNg+7ppVWQ+2CpDVZbg=; b=yvTFZftHwZwr48RJ1ViUWMpCFI
	crDpRBB+VHI//g6jY7/HdQZMo3CB+iuuhgmq6Z3ytNkVyqGkMdxeC+lJo1ma4DMXD20vuepQvoJ60
	laNIItRqK13ZMhhMBOK5sPbfLd5zpit06zeYYYzkeLkhgr46uS9c5LrdVOq3zQWznWpxX2chZaDYw
	aibIKktWfuKtIFyVrM1M7F3tR9dAabZ91dge2emWRE4Ac2V1eMxU0hlyGoqQ2mwDszb/ammk9ZAd2
	6jca5qegHw2aNDK1vCW7kfkKYGiVSCKkafS8ADSClGkKldEWy4Jw9LFlGONlX74uuhMzidxAZLoqQ
	vc5PthSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCGF-0000000EB2a-2aD2;
	Mon, 02 Mar 2026 23:01:11 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxCGC-0000000EB0I-2IMN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 23:01:10 +0000
Received: (wp-smtpd smtp.wp.pl 21305 invoked from network); 3 Mar 2026 00:01:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772492462; bh=7+cweu98TOcNO2fC2HKsiZqjaNg+7ppVWQ+2CpDVZbg=;
          h=From:To:Cc:Subject;
          b=h7+VrX8JF7VAf1BQwDmjpfLsuhB07MJnKuPBo+NocsvngfY51YBcYWwFXDEBNbohA
           xrTqSvXfz5Vf/Y8tyXi6wDF6oBtsjY5M4mH9mydRviOT1wKvR0X2vqWGtCl3eAXEgF
           hUeOgVQhxxzLTh9lHd9YAP5AqyUVEYdCLfc2WpBqAk0r050TYPFlikhh+9A8XEoTXF
           7mrlFG4VTCHkOxNoOLc70mT+hCqqhvP2tjVaMVNatTHpTlU8v0/5Azkgr6dsk4QB93
           PjCk5kX30g11wptGqAS7q6MGSnwlPpeWO+fNCfhPk6+GqYzhJuVoNvh4n3x+v6eu6u
           PSVaxrzGj5GxQ==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 3 Mar 2026 00:01:02 +0100
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
Subject: [PATCH v2 1/2] dt-bindings: crypto: inside-secure,safexcel: add compatible for MT7981
Date: Tue,  3 Mar 2026 00:00:38 +0100
Message-ID: <20260302230100.70240-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: d08f458a8f4368eeb35a8e26834207f2
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [kFNB]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_150109_003606_5A65628C 
X-CRM114-Status: UNSURE (   7.90  )
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
---
v2:
- just add compatible strings
---
 .../devicetree/bindings/crypto/inside-secure,safexcel.yaml  | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
index 3dc6c5f89d32..6c797b7ce603 100644
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
@@ -80,7 +81,10 @@ allOf:
         compatible:
           not:
             contains:
-              const: mediatek,mt7986-crypto
+              oneOf:
+                - enum:
+                    - mediatek,mt7981-crypto
+                    - mediatek,mt7986-crypto
     then:
       properties:
         interrupts:
-- 
2.47.3


