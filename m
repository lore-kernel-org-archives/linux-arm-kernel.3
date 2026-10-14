Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F17CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cnFk0nz489x2Wl8XVQjJo+QBzfvbAM5EFJdwTMusAPg=; b=ZoT0x3Xhc0rAiLx8BVHiIDF96p
	GeGlEds4Q+VwpBTg0oSximCnLePvsAlKLdyC8im54l7CA7Vqk9p8ZiQFtK7beHs0I3aGjygMGyjs1
	y+tPANpcNceifVZE58uMHcEisphV93V1HIrVnIGvMCklRaMhsMM49A5gx/Ola6UDbX6hK7avdFekf
	FlDORh9d+GtC5OYWg45ibdxWg+4PfK87veXelwJNb4ZnJbi0Yluj+GnzpMTLmYqSW8i94p/pqHMSL
	cjHqrWV3ahJevYWeoCF6VqmQHb8t5+vsoVu0Xc6GWfd8Cfv5tH8uZ7pcjXRrNCQRoB9XYaXiBUXX8
	ORynxZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wH-0000000FzAa-2Je9;
	Wed, 14 Oct 2026 16:34:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1wF-0000000Fz74-1F1y;
	Wed, 14 Oct 2026 16:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAB1460229;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 645E8C2BCC7;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791995686;
	bh=M4oiCczvM6va+isk9WjeSYqDXsbuek40oN13boAHt8I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GY6hGui2T5XXWfuvUg2CXIN7d7GbyaU67iYK7LarS6o7YTUT/e4MixZDdV+fKEKVQ
	 eekPGvE5bOLRZMLM2fadWSG8B+C76415U/MoR5iNCdmDjJRsw4eM/CWxSGFH7WRWn1
	 IIAgaVserzho4ufjgOOG9IKWoyw60RhPfMtiAumkC0rK7O+oA5vsTryvNEcz7XbQOv
	 0i3V9/zkZlcP+aud6kdzmRYPZQork5inhKvk8jlsfNf2TOQ6/plmer5WtFq15vYKyf
	 0rCo2zkaC0VvWz/pUjfHifQ2O071VqIYGyKp53DmAwJAGfaGhnvLFSFj/LSCcoxkAX
	 m2Zh4/WD/W3Xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D388CC6B1D;
	Wed, 14 Oct 2026 16:34:46 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Subject: [PATCH 0/9] arm64: dts: rockchip: NanoPi 6 series fixes and
 improvements
Date: Wed, 14 Oct 2026 18:33:00 +0200
Message-Id: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0yTORHr2JYQK1Qk+lMpkhMC
 Hd31OW3eG8H4yxscK12yLyJSdSC+lQBLaPOjHIvBu986zp/QR01JsHQooSU48aBdTVs+jNRN7m
 e6gZKnDI/5P0b34a/7TU9mdbvDY7jA1Si6uZ6AAAA
X-Change-ID: 20260729-nanopi-m6-improvements-584cc7b08c15
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791995685; l=1823;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=M4oiCczvM6va+isk9WjeSYqDXsbuek40oN13boAHt8I=;
 b=xeGKQRKGVzN67jaE0vQ2rOyJewPenDA0ogXBP4ukvIeWddMRTGL61vnp9dk5p0HmKdbZxvORi
 lmfDP60AGfbDqIcrlIFG5lraHthr6513r8hHj9ES9D337D1w3tWZExj
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
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
Reply-To: joachim.eastwood@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series contains a few fixes and miscellaneous improvements
for the NanoPi 6 series of boards.

Patch 1 fixes the voltage range on the SDMMC regulator.
Patch 2 enables HS400 mode on eMMC. Tested on my M6 board.
Patch 3 adds an IIO HWMON device to monitor the input voltage.
Patch 4 moves a regulator that only exist R6 boards to the correct dtsi.
Patch 5-9 renames DT names to match the schematics signals/nets.

If patch 5-9 is just considered churn I'll drop them. These are more
nice to have and just makes it easier to cross-reference DT and
schematics.

Based on linux-rockchip tag v7.4-rockchip-dts64-3.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
Joachim Eastwood (9):
      arm64: dts: rockchip: rk3588s-nanopi: fix sd min/max voltage
      arm64: dts: rockchip: rk3588s-nanopi: enable mmc-hs400 and add supplies
      arm64: dts: rockchip: rk3588s-nanopi: add voltage iio-hwmon device
      arm64: dts: rockchip: rk3588s-nanopi: move vcc_3v3_s0 to nanopi-r6
      arm64: dts: rockchip: rk3588s-nanopi: rename sd power pin
      arm64: dts: rockchip: rk3588s-nanopi: rename usb host power pin
      arm64: dts: rockchip: rk3588s-nanopi: rename gmac1 reset pin
      arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2 power pin
      arm64: dts: rockchip: rk3588s-nanopi-m6: rename pcie2 power rail

 .../arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dtsi | 14 ++++---
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi | 14 +++++++
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi   | 45 ++++++++++++----------
 3 files changed, 48 insertions(+), 25 deletions(-)
---
base-commit: ae965b9856f033145e292b0c29082a26bcc45efd
change-id: 20260729-nanopi-m6-improvements-584cc7b08c15

Best regards,
--  
Joachim Eastwood <joachim.eastwood@gmail.com>



