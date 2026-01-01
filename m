Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD084EEB579
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 17:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFxRYh+8coogy2GN8owHTs5aoW2sEqq+/fQszUYZvNs=; b=BO4rCe7emgGWNNLzcwWSS25gT8
	E4kJ6ezadYVGTPZB2cYWYYWMp9KMrE5oINexiRMi04ogat3PuPnPC+aIA1QZNpG+I6e0rqBenE3NW
	aV2Ipz5KxCvEPk3jPRODodg+ubNzxqmgi66aLiU8mSF9x6F4xocrieUwflQOXozNcA4RG7xvQmv+s
	GIkL80/i7zE6pu2izLCO0Xe1sZbxQaTyWxvdiy10Fi6WmXuaLDFZ4qyfId0yf2PC2cNZuQ0KsL8YT
	hM3O1LgpDkkPAjM/hnVfFM9JjzA57wBtcNNdMDSIMdZX93YhNamREI7WGHTJL5JwznJLyFdMCuq1d
	IH8UBasQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMM8-00000007NuC-2UzH;
	Thu, 01 Jan 2026 17:21:00 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbMM5-00000007Nt6-2dFe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 17:20:59 +0000
Received: (wp-smtpd smtp.wp.pl 29140 invoked from network); 1 Jan 2026 18:20:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1767288055; bh=VFxRYh+8coogy2GN8owHTs5aoW2sEqq+/fQszUYZvNs=;
          h=From:To:Cc:Subject;
          b=PUksjmM42K510nffF/6GK+kvx7CdnCnS56eZTJklUOwp0Zw7OqAzzqX60uBMZKvW7
           Htq+VwYtGAW5Pudk/OiQSuLpMZQ6FuPuy/PP+Qcbni7mVA22RPXw/N2WmoyXxXbMo8
           hLdTnpMQSEXaqTkGwS34GCEt+5xNEmz5cB+PvKYwQfGrBjzhIg7cFEOO49EMQvt4Mu
           Grblq3QVX/f9nncGM6MaPaONF/mimYpMF/w+dLNpP62Z0qvrZET/HEJ5f5POWFAYW2
           jhQABDOERVIWBlX+KIsxfImrBhs2V953QGOh4lmDfh55XQlCsy/sph83WCb5bHtiPF
           7oZ81vJGstqwg==
Received: from 83.5.157.18.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.5.157.18])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 1 Jan 2026 18:20:54 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ansuelsmth@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	chester.a.unal@arinc9.com,
	sergio.paracuellos@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	tsbogend@alpha.franken.de,
	angelogioacchino.delregno@collabora.com,
	linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v2 1/2] dt-bindings: crypto: Add support for Mediatek MT7621 SoC
Date: Thu,  1 Jan 2026 18:20:04 +0100
Message-ID: <20260101172052.1862252-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: df73573d01c56ae3faa788a124db769a
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000007 [ccSx]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_092057_827533_914CF78D 
X-CRM114-Status: UNSURE (   8.28  )
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
v2:
 - Corrected commit description
---
 .../bindings/crypto/inside-secure,safexcel-eip93.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..8ccff64f5c1c 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -33,6 +33,9 @@ properties:
       - items:
           - const: airoha,en7581-eip93
           - const: inside-secure,safexcel-eip93ies
+      - items:
+          - const: mediatek,mt7621-eip93
+          - const: inside-secure,safexcel-eip93ies
       - items:
           - not: {}
             description: Need a SoC specific compatible
-- 
2.47.3


