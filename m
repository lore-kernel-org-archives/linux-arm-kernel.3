Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A501112259
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 02:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H1LV4TgymdLPUIetMKfvpeuTUSahTG1L3OphAQC7DOA=; b=pKe3/meXl+6nHMGn2DpBGmJeE1
	Cd5rpElAKtWyV7RidA3dILpwg8hPfOEj1Wu5Im/RyZHCcuRl20NUUekETs4m6v0Pb8P61lUbB3Rov
	AZa4/a48G5H2HuPafngTylmLDKTadaTol30J3NIBXnNyRqTTR1TPMjU1irK4jGuAqs+GRjpwTZNRB
	AVmIWxa3/ufs1HAJk/T7Ps1iPSobD2diwLJCKtod9ppId38aK8EDI2MoecHbXwXBHXfywOu65kY2p
	aSafZny79Rxc4Wyg1xg8mK+E7mUqZR5UXVjjW9n37s6XWuXNxhox0kGTf2E+A9yNMO5mI5mIgjiYr
	3+/Gq4nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87z3-0000000GcQo-03gZ;
	Thu, 02 Apr 2026 02:40:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w87yl-0000000GcOH-2F74;
	Thu, 02 Apr 2026 02:40:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72FFA61843;
	Thu,  2 Apr 2026 02:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B5CCC4CEF7;
	Thu,  2 Apr 2026 02:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775097618;
	bh=MzbXLULHXDPO40t8V2eon7BjaepBG28tDaVLig2EstY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UkYeIG0qBedj4zPQtf8YWkGXLKOQgku2IbP1sk2dTygM4e6XB6DmkPjYNLsQyt166
	 aQs9e8OoWo4NqFb/G3tpeCxGWN5kE+tsKNVv+Afb08nUcV/IXwXwyRwZ+OaxtRGWz/
	 Ln2dGfzieKSOcAqEhxuNOPBqwLfmAgbRLK/WroSoXhpdVhiUJr1EOStx8qxjjWcieX
	 qYM0faqsNOJActaciSAxvumIAoATOLGNbM3giqDPwLiT/7K5b4FhV49LZfCvs+HI6p
	 O4NceZZLi/PZlqdEamrfw3XAVxbw0lmcpoey/+zspBIVbF7rYor98EPkBEEfsjnCLr
	 a8JsOBGd1h9ow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021F1111227A;
	Thu,  2 Apr 2026 02:40:18 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] Add PWM support Amlogic S7 S7D S6
Date: Thu, 02 Apr 2026 02:40:14 +0000
Message-Id: <20260402-s6-s7-pwm-v2-0-657dce040956@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA7XzWkC/03MQQrCMBCF4auUWTuSTmkSXXkP6aKJaTtgm5JIV
 ErubiwILv/H49sgusAuwrnaILjEkf1Sgg4V2KlfRod8Kw0kSIqGWowSo8L1OSPpWrbaaK0aCeW
 /Bjfwa7euXemJ48OH906n+rv+FPmnpBoFSuVoUGRO2thLP9/9yPZo/QxdzvkD/RtCwqQAAAA=
X-Change-ID: 20260325-s6-s7-pwm-281658b88736
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Junyi Zhao <junyi.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775097616; l=877;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=MzbXLULHXDPO40t8V2eon7BjaepBG28tDaVLig2EstY=;
 b=AI9WFujgFd2PKUeRxl3/lDThNDBbC94EVYbDBCRIW0gasV4+Cg2oTV2+NeRGuUhUlMr8mNFMi
 Ov9Nz565F7UA3msuJ8WH1N0IpGqOeqxU8cP6/0+Q1G4qEjKIojPiDof
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add bindings and driver support Amlogic S7/S7D/S6 SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v2:
- Simpler s7 clock desc, and drop the example in bindings.
- Make minor changes to probe based on Martin's suggestion.
- Link to v1: https://lore.kernel.org/r/20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com

---
Junyi Zhao (1):
      dt-bindings: pwm: amlogic: Add new bindings for S6 S7 S7D

Xianwei Zhao (1):
      pwm: meson: Add support for Amlogic S7

 .../devicetree/bindings/pwm/pwm-amlogic.yaml       | 19 +++++++++++++
 drivers/pwm/pwm-meson.c                            | 32 ++++++++++++++++++++--
 2 files changed, 48 insertions(+), 3 deletions(-)
---
base-commit: 8ab1fc9104158045f68fde2d0ae16f5fbcf8bfbd
change-id: 20260325-s6-s7-pwm-281658b88736

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



