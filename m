Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091E6C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 13:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1kWazCgt2wTMgdaG9WNz9Xk8u2NqIC3IsWwigUEl+k=; b=O9l2vEFPJmX6dlfmpI0iPKGX/r
	aE3bf05vL/VUdTF1oUm47B8Y+kfXASc95f3DU5Jyi8KDg4dSj1Nhb/Q7rhtLUYrRN4CsBTN9Y4PO6
	0DxrnjbjIHOZUCtVCHmJuP9/VuLi5wQht1yKRyeyG7ZBUCoyikBDpwa72HWfmrNmOg12mHZGUX4PD
	pv0i6SVLATxJGqFWjXQNzqlv3lVOg+eKBPnjxTHnO7Akb8y/Kv7ghL9Ozx+8Erd4/V9BpBuqg7DK6
	aztwykHPzhq6z78PxKZqTKUX5fyn0Q0PK1UalBVHc+QX3ck01OrgrAIMOmeaprv/0Exs+79/WbReM
	E3kkg2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trGZK-00000000ZLa-0rQR;
	Sun, 09 Mar 2025 13:19:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trGW3-00000000YeD-3y20;
	Sun, 09 Mar 2025 13:16:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4EC1A45BD1;
	Sun,  9 Mar 2025 13:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 715BDC4CEE5;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741526185;
	bh=PoF8AvGS4wt5+cR37V0qaAD2Fcupg7Px2u0q9M3aolg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dm2b6DhjwyWpdZ36SDGlonr6xvckWaUBh0BCVRppKwuI1jaVzfSxd2GaRKCdw3Sqw
	 +fa9YwsdY42lY8fT5SW7/LUbeJ5CafICKhNlKlR3g7wAxHlk10WoLH1w1bB/VxNow0
	 zRPZaJxms9za9ikLeHkVeTQgptw445CdIuTlkyaSjCUUHyEF+JJgFuGcL4ihBL24Jp
	 0ZT4Eu7viAnlIs1BrwGjPA56sfSfe6DKnwK4h/J8lvEl3NjPYwXL4fY2bJZiXwK0bd
	 R7e1hRP2JIvzdDIZgxghUiVgm1syMtiWG7ODmjf+A1ntfjDNMTKbBxSjleNfK0uA4U
	 Gv6+TbQBC4/Eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58638C28B30;
	Sun,  9 Mar 2025 13:16:25 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 09 Mar 2025 14:16:20 +0100
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: Add Ogoos AM3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250309-ugoos-am3-v1-1-38cab5a4725b@posteo.net>
References: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
In-Reply-To: <20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741526184; l=888;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=cqqIMQAjsp7Lgq4pj0jk6mh06cp/exYekgA28kwLzGU=;
 b=MQdcbQ2DByDgPVBjz4/nCnfDMhGmDOXtL9cjBlqd/eSMIt6t2TQd3pYRCHyLK2iNWWYrpO+kI
 EHtBqcvSJfVAnhfzDFzxTwEEF+ptaGvBd6jxsVOa1Y/4QUCAeLFM1zN
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_061628_071494_FA6D2EF3 
X-CRM114-Status: UNSURE (   7.11  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The Ugoos AM3 is a small set-top box based on the Amlogic S912 SoC.

  https://ugoos.com/ugoos-am3-16g

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae1f55a27bfb148252532bcf15ca905bf..779568f158ce985e1d12fbee73418549cfc58705 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -127,6 +127,7 @@ properties:
               - minix,neo-u9h
               - nexbox,a1
               - tronsmart,vega-s96
+              - ugoos,am3
               - videostrong,gxm-kiii-pro
               - wetek,core2
           - const: amlogic,s912

-- 
2.48.0.rc1.219.gb6b6757d772



