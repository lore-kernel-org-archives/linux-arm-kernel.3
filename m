Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE536606D820
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xmH1CEx2;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=kth79mT9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7KIi5ajgm8xWQZ/dZf4T7JLHUXnisyBiLTaDomI84wc=; b=xmH1CEx2wwavnT
	uY9J/Si+1fKWwGHP93yVWU6PlYkMQEp0+tG2Pv+OhPg70JX1nZ0J1jX1JXWpxG147BgqocFOytkKR
	kth1stZdf0DR42bcaxUER6rfsLg93AWWWYoh3YJV07sdSew2wAcd7DPoqg7HWYwRKXsY6UP11py2M
	Ux/0BETjvoYVljvhAdhb/bsrgDDZLbdCqdTipg/pDgpTqxp9kV0vpiVO5xYty1EDIMVbd18/Pb1sx
	OFEl9zNwMpyA/ZflTlBO/0H3SXX6DBLseTYjjY2HCYUw8stBoEddH5lJpfq8zDrdMIoXPSNGPtuny
	bgD2Xa0GTd3CQwd4KvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOej0-00000006BWb-1pJ7;
	Wed, 04 Nov 2026 17:24:38 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeit-00000006BPP-3f7X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 17:24:33 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793813070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KIi5ajgm8xWQZ/dZf4T7JLHUXnisyBiLTaDomI84wc=;
	b=kth79mT9ePMBDeNF8OXM5FwgUjM4ED+LpEEa7Pf/2eX4Qb7ughpCmRqlZ7+Mw5L2MXG6ms
	8ImE++fQxGOmsJDMtP9vNwyjglToN10OZLkgAT5s57wkEV/Nc4CAWEyDY6ZLqH2Skb0Bgj
	22GtYWbGyv9k+xS1eDkYODw6wtAZUBU=
Date: Wed, 04 Nov 2026 18:24:19 +0100
Subject: [PATCH v2 6/9] dt-bindings: pinctrl: apple,pinctrl: Add t8142
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-apple-m5-initial-devicetrees-v2-6-fd727a82d380@cyberchaos.dev>
References: <20261104-apple-m5-initial-devicetrees-v2-0-fd727a82d380@cyberchaos.dev>
In-Reply-To: <20261104-apple-m5-initial-devicetrees-v2-0-fd727a82d380@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_092432_085178_830C65DB 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pin controller on the Apple Silicon T8142 (M5) SoCs is compatible
with t8140. Add "apple,t8142-pinctrl" as SoC specific compatible under
"apple,t8140-pinctrl".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 0984e4e58af3..13ece17eca9c 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -27,6 +27,9 @@ properties:
               - apple,t8122-pinctrl
               - apple,t8132-pinctrl
           - const: apple,t8103-pinctrl
+      - items:
+          - const: apple,t8142-pinctrl
+          - const: apple,t8140-pinctrl
       - items:
           # Do not add additional SoC to this list.
           - enum:

-- 
2.56.0


