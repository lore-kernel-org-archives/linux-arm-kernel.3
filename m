Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA7CC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 04:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+VOksxVxl1n9pVJKF/iIgS3rOWKCiVngYTFNCP+Fq4=; b=UikPXTHMIkE4+C5FwxT5UJ6OOu
	YQJEvXuepuhIthThHiBYhvidtC7w1TcpcVlxZj/qay74+m1HWBDFgjs7yTPimNjcbKAt0MSz0Q7EG
	rzzJBjuGH5kfx8AMPv1EgLZH7wfDSPaKGEK7YaYj++d3Hnz2OUAhfsfC/2lbAzy8vQmYLgHbg5GAZ
	4zNAEJdxwls00/AkhxUu8zu3rlUbVK5JpZKkmZYiT/epIMniuKq0bITCgfOCiUAF/IjbMjKewhZLf
	wZOV40bzKsLBoGohxjaeYWv2B/uqSiJdgmODrHlxd8qR4sfqxVf98ZQ5FWeeiiSlqnstqs8IWen16
	EdRpogKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hTE-00000008JTY-05cg;
	Wed, 16 Sep 2026 04:42:08 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hT2-00000008JPu-3t4H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 04:42:04 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id A3BE543BC8;
	Wed, 16 Sep 2026 14:41:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1789533707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+VOksxVxl1n9pVJKF/iIgS3rOWKCiVngYTFNCP+Fq4=;
	b=pc4HvCweIVrkeCspTViACRKJL/iO6fNRNRnrpQRkg4Vxx5pOP3Ve1IeAnVK0T7s7OHnBmn
	y654KnCD7ZcygtHjQ1/pYyMJ4wydZFBMW5GqOVNXy5gDXVl1V2ATjiJK5FBilrcrLVpJ+1
	jipxHgsr5G09FqzaCwV5rMgsWfOH5ADrUehiSjLPNPs9nLKhZsa4Uw+G7Rcd24XoctrwOB
	Xu79Dqi1fn+nNwhY0eWIjAELI8k/Kzd6JCfw8dLrBcJvkmPhLDDgKJD4VJ614eEPn25h/a
	tol3mAi0lbeHUdL+olwOpKj+ALyjkyM6MJ9kGxzYYGt0spwzIR+IB1LE2gDzLA==
X-GPT-Reason: legitimate; the email is a technical "patch" notification
	regarding Linux kernel devicetree bindings, which aligns with the
	personal/professional context of the recipient and sender
	(alastair@d-silva.org); the From domain matches the sender's identity;
	the content is highly specific technical documentation (YAML schema
	updates) with no marketing, urgency, or phishing indicators; and
	there are no suspicious links or requests for sensitive information.
From: Alastair D'Silva <alastair@d-silva.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH net-next 3/4] dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1 and syscon index
Date: Wed, 16 Sep 2026 14:41:18 +1000
Message-ID: <20260916044119.475666-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916044119.475666-1-alastair@d-silva.org>
References: <20260916044119.475666-1-alastair@d-silva.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_214157_123661_B290D313 
X-CRM114-Status: UNSURE (   9.97  )
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

Document the Allwinner H616 EMAC1 and internal EMAC compatible strings
("allwinner,sun50i-h616-emac1" and "allwinner,sun50i-h616-internal-emac").
Update the syscon property schema to support an optional register index
offset argument, allowing boards to reference the secondary EMAC clock
register on H616/H618 SoCs.

Assisted-by: LLM
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---

Notes:
    Tested against Allwinner H616/H618 device trees in Armbian, verifying
    schema validation with dt_binding_check.

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 323a669fa982..cd1075dab581 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -39,6 +39,8 @@ properties:
               - allwinner,sun50i-a100-emac
               - allwinner,sun50i-h6-emac
               - allwinner,sun50i-h616-emac0
+              - allwinner,sun50i-h616-emac1
+              - allwinner,sun50i-h616-internal-emac
               - allwinner,sun55i-a523-gmac0
           - const: allwinner,sun50i-a64-emac
       - items:
@@ -71,10 +73,16 @@ properties:
     maxItems: 1
 
   syscon:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - minItems: 1
+        maxItems: 2
+        items:
+          - description: Phandle to the device containing the EMAC or GMAC clock register
+          - description: Register index offset (0 for EMAC0, 1 for EMAC1)
     description:
-      Phandle to the device containing the EMAC or GMAC clock
-      register
+      Phandle to the device containing the EMAC or GMAC clock register,
+      with an optional register index (0 for EMAC0, 1 for EMAC1).
 
 required:
   - compatible
-- 
2.53.0


