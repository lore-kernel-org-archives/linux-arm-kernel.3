Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA35CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 23:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iVj6qwR+8ydezce1PmETQDT6/Yef/ogm3BcibIH7V8k=; b=yLpxRBCCJMRHm5lCbbWF1MKfGY
	0uNadxPee0czQrrUdym40IfhABWmln6jS/Tcdhc72B5HzmD3zqhie73Ta1Bfxlq9DWZMUwJQweu3O
	WDo95T/8n1ZJc/ekdXK/Cn0YKvSX6ER4PzQ6b/3X2mL/dUZvyEMlkCG3Vr5jQeM7LXA4R3q0O5lr7
	sG1PQ9VomxjeZUbTylIkka7bZZMqs0mB8GfDelmJDk95N6udLSWUR4g062MJ1UE8XUSNsEPPILBV8
	ZH85QDOGfn6iOaHidsZIpsesBPJjDmJiczWJ+/Sbls2trIN/P5FlYw89o2ZRg/as0f7Fh2NFWHVWC
	FymXAUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwr5K-00000005xeK-2Tve;
	Thu, 11 Sep 2025 23:52:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwr5I-00000005xdM-3leE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 23:52:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F1D344C5E;
	Thu, 11 Sep 2025 23:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62D95C4CEF5;
	Thu, 11 Sep 2025 23:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757634732;
	bh=rXQlLipzuO460hLM6yk6F8xNPGedj1EQygxLedmpBzk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BH9caTF9ac1H+H/LjH1X37ysQw2c8Is712Owi6XkgEIQC+cE6cknDD3lWn4UrJ9cz
	 fWyQg5D/WTyCQKU+UZCW4yv2UOPgiIemWFzDUWuAlTx7kwkf2EWi2nar5WHjBdtXbr
	 GEnn/HwzziVxLTJgirGXAcd93UFng7kvhzIp21y88y+MKkb44o61veubkUF/BrEmog
	 vdo8CyQNuaGsbQb3zXiFH00vUxKY2RJwuOQasExrS7iUBLTrzrLZ2mqzPo0D1/cSV2
	 dvXvlnklxNC28aXOkhMJEYa77G+KKvinTHYWzlEZLEYrXpaA+kxlMGk9EIdQ44OVMA
	 ToBgTu+JBLuVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE7DCAC592;
	Thu, 11 Sep 2025 23:52:12 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH 0/2] Initial Amediatech X96Q support based on Allwinner
 H313
Date: Fri, 12 Sep 2025 01:52:08 +0200
Message-Id: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKhgw2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0ND3QpLs0JdU/NUM2NjCwMLA5NUJaDSgqLUtMwKsDHRsbW1ABhukK1
 WAAAA
X-Change-ID: 20250911-x96q-57e63380804e
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757634731; l=937;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=rXQlLipzuO460hLM6yk6F8xNPGedj1EQygxLedmpBzk=;
 b=M0EgaUBY/bR66z8j4+11q/JqRm4pXPtp1UZ7NvBJPd6gL5yfBzHzCDkiWsBp+AaLirOtDR1Dr
 DGry5a6MTTIATIpQgaOccON/kpyi2do+5HKGBE9ZynXJ1z/i4K7Kkk6
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_165212_956300_D44C59EB 
X-CRM114-Status: UNSURE (   8.49  )
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

This patchset adds an initial devicetree for the X96Q set-top box.
WiFi, Ethernet, and HDMI depend on drivers that are currently not
available in mainline Linux, and I didn't enable them in the devicetree.
The builtin infrared receiver produces IRQs when a nearby remote sends
events, but I have not checked whether the events are decoded correctly.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
J. Neuschäfer (2):
      dt-bindings: arm: sunxi: Add Amediatech X96Q
      arm64: dts: allwinner: h313: Add Amediatech X96Q

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 235 +++++++++++++++++++++
 3 files changed, 241 insertions(+)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250911-x96q-57e63380804e

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



