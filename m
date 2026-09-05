Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47940C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 11:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=486SqcbPRJuKQ37551KxWnf0h8KxWwDTHGfoolspsYo=; b=hjE3sTScFZ7EENJPS3BrfNkYpU
	9BqZu251x9uxDo4jvGVi8crXAz0WyUxDouwxm/d9M5hcLyDTE011ar5MadM5mf+mbm9TzM4+shdzV
	ZHLFzHVIUinpxRcpj9Kl/lCkVuinZoToS26zNxqEzfpa4P8jrc/fbG5e4NQtxlQ8OcC1tOumGGV3M
	nhhhoSZ46grOM4ivahuhjJPctBkT1vqgdXOVyeMLdADLDqoNsiOm5fb81FRNX1QbGCtxbV8vpu3xX
	jFfzu2qM4sHDGZLga4T3b3Stw3DhI1ytBDdNxzrW0yKgCSyw3f0sLoGLRiMleQdteaeJjA0smvw4g
	GSbpQzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oT2-000000040pi-2ZYZ;
	Sat, 05 Sep 2026 11:21:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oT0-000000040oK-1ocP;
	Sat, 05 Sep 2026 11:21:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB796447B9;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7333C2BCFB;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788607308;
	bh=oAmDDrKnMv/AyVbWT0Wk8eZYpbvdxe5fXhli2PbtOEg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oS2aSADF/U8/vSBvgIerW4NKRx11q7YGSjN/B7awXvJ/H0YCv8jBWXypKBVgEPzsR
	 l3A0CHlTlnuJ5Uf//RsaRaB8Oj7//1fw9iws7PibgS5JZ44LgJStNisRkYttOCmqMN
	 N1ANr8YQeAbYR9aRjxLVSPRZJ9Iu2VEhjQAtWUq2VvgtANSNGr8WSq+krGhGRqR6td
	 8A04HEZM0BOFFzaXflW45iNHNhdoOB44Ga5pQ0Gy3i3Cie/54btx+EXwwA23NOng/y
	 2VxLkJt4eNYuMJV79MdaHrIdL5DMTfY9tQeYZwkIvJOlvvGtqFv/gyRnzUi1yqp2al
	 R0TaqXqzZ2CDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9655BC624D6;
	Sat,  5 Sep 2026 11:21:48 +0000 (UTC)
From: =?utf-8?q?=E5=AE=89=E5=AE=B9_via_B4_Relay?= <devnull+HystericalDragons.proton.me@kernel.org>
Subject: [PATCH 0/2] arm64: dts: rockchip: Add FriendlyElec NanoPi R28S
Date: Sat, 05 Sep 2026 19:17:25 +0800
Message-Id: <20260905-r28s-upstream-v1-0-f68d5389269a@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNT3SIji2Ld0oLikqLUxFzdVCNDo1Qj8xQzQzNTJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaABtk4b1xAAAA
X-Change-ID: 20260905-r28s-upstream-e212e27d6165
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 jensen <jensenhuang@friendlyarm.com>, 
 =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=HystericalDragons@proton.me; h=from:subject:message-id;
 bh=oAmDDrKnMv/AyVbWT0Wk8eZYpbvdxe5fXhli2PbtOEg=;
 b=owGbwMvMwCUmepz3XUtTHjvjabUkhqzZv71PLerYNfnZBvaoZZdaI6qZFjxf2XOXhd1bVqb0/
 bqVphy1HaUsDGJcDLJiiiyym6ojhVZFzyxikToOM4eVCWQIAxenAEwkuIXhJ6Pel+MTvVhbdk5a
 /PrxU7WGX1++1N7UfRV0Ma47eqrvzShGhvWKCyfHh719vXbvvEkJl2yzfvoyWP8u299w3a9wdeG
 +XGYA
X-Developer-Key: i=HystericalDragons@proton.me; a=openpgp;
 fpr=1DB27B5912AA5B9972041AC715C70DEE84826E07
X-Endpoint-Received: by B4 Relay for HystericalDragons@proton.me/default
 with auth_id=1004
X-Original-From: =?utf-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
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
Reply-To: HystericalDragons@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The [NanoPi R28S](https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R28S) is a dual gigabit Ethernet router board based on the
Rockchip RK3528 SoC. It is closely related to the already supported
NanoPi Zero2, sharing most of its power tree and peripheral routing.

Tested on a metal-case unit without the optional onboard eMMC: boots
from microSD, both Ethernet ports link up at 1000 Mbps, the HYM8563 RTC
registers, and all three LEDs are functional. The USB Type-C connector
registers as a DWC3 UDC in peripheral mode; gadget enumeration against
a USB host was not completed, because that connector is also the 5V
input and a PC port cannot power the board.

The patch referred to [fridendlyarm/kernel-rockchip](https://github.com/friendlyarm/kernel-rockchip/commit/ee640c5344b13a0a317436e2357df01af8268ce7) but with many changes make it suitable for kernel mainline.

Two things I didn't do because they are limited by my current hardware:

- The AICSemi AIC8800D80 WiFi chip on sdio0 has no upstream driver, so
  only the SDIO controller is described.
- The eMMC is described as HS200 rather than the vendor's HS400 with
  enhanced strobe, since the board at hand has an unpopulated eMMC
  footprint and the faster modes could not be verified.

---
安容 (2):
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
      arm64: dts: rockchip: Add devicetree for the FriendlyElec NanoPi R28S

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 404 +++++++++++++++++++++
 3 files changed, 410 insertions(+)
---
base-commit: 32e0f64640d558a0f5410ac5cdd8ebf371c5e6a6
change-id: 20260905-r28s-upstream-e212e27d6165

Best regards,
--  
安容 <HystericalDragons@proton.me>



