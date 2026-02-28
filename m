Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2181B1048924
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6DX7/ume+J8u8/5crPcKRpAYc6P87o2KKs4Q75dW3Wo=; b=g1rU6AotcdjcrJ
	AaERLfSO7pTke8Jcv88ENZiPNHQyvHNKhUrOzsonjLCudmcM9P4Kyfcyk0rIMEbiA7jef0Qa/qBWe
	tsg/4Vwe5mGqHu4IrEMAYcZ+CGCx1vmKSGXpgDxS3lLBfy933KXO6PjmJo7MBulbeY/rq8ouLE2oO
	dOjIZ7Cd+r8VR/I2snzDCf2hjXdvi3U0aD9J4xUKZZdiorISmvPo9ABsUzL8O8VvVxNHSFAS9Wrav
	nNvy+AdnYay0r8R5gJ4kDd3Os9jl0ZUfxUt+tM7e9I1dRGTZHfPIwv6Bcr5/G/kOAQ/4mLm1XhhOE
	ZgZkj3V4TFgwhuqEMbIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7qA-00000009IJy-2o1g;
	Sat, 28 Feb 2026 00:05:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7q8-00000009IJ6-0UAM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 00:05:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A33D40B76;
	Sat, 28 Feb 2026 00:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67B6C116C6;
	Sat, 28 Feb 2026 00:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772237147;
	bh=qzTqk6LQvcL60Am5VdYw8msyeKSQTRSzWgdMPkFQ/Iw=;
	h=From:Subject:Date:To:Cc:From;
	b=u+NbmC78T/ZOT5ugEq2UmdcIhbySl/yLefJ4s6+cBi7nj2lR3pGcVXybPCe7Yv7Wp
	 sLCm2Rk/v8vcUY7i2PBi9SS6h65anq930WIWMjPpwl7NCbZUlSF0kek4wLlLzDQ5tB
	 iewe946WBwSpPQqTf9CGSRuZMBOYLR65S6Ezj2m3Iy+Z3fiC5Qhm05RyefzUCU9mwE
	 nQREXPqhGjhUlFw6PDXrYgqXQCIsV47E0MrCSN+MN8Ff04QLwm9EWokChUkPSjrkXJ
	 xnN4aqpDHGHSGDoeuus9RZR2eXxS1kwh3ZOe64wn3fZZ7/taBtQea+hWIDu0R2ei6V
	 AS3+MdvU+d+Ug==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/8] ARM: dts: gemini: Additions and updates
Date: Sat, 28 Feb 2026 01:05:40 +0100
Message-Id: <20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LTQqAIBBA4avErBvwB8K6SrQInWwWWTgRgXj3p
 OXH4xUQykwCU1cg08PCZ2rQfQd+X1Mk5NAMRplBaWMx0sGJMdyCG78kaNfNWe386AeCtl2Z/tC
 uean1A7ouQABiAAAA
X-Change-ID: 20260123-gemini-dts-fixes-3af8318c9c6e
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_160548_189539_0F0080DE 
X-CRM114-Status: GOOD (  10.78  )
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

This augments and fixes the Gemini DTS files a bit based
on some upstream work from OpenWrt.

- Add the SSP block from the bindings already merged to
  the SPI subsystem.

- Add Verbatim Corporations vendor ID and the S08V1901-D1
  NAS.

- Add Raidsonic IB-4210-B DTS.

- Fix up errors in the Teltonika RUT1xx DTS.

- Small fix to the iTian SQ201.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (8):
      ARM: dts: gemini: iTian SQ201 need to boot from mtdblock3
      ARM: dts: gemini: Tag disk led for disk-activity
      ARM: dts: gemini: Add SSP/SPI block
      dt-bindings: vendor-prefixes: Add Verbatim Corporation
      dt-bindings: arm: Add two missing Gemini devices
      ARM: dts: Add a Verbatim Gigabit NAS DTS
      ARM: dts: Add a Raidsonic IB-4210-B DTS
      ARM: dts: gemini: Correct the RUT1xx

 Documentation/devicetree/bindings/arm/gemini.yaml  |  10 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/gemini/Makefile                  |   2 +
 arch/arm/boot/dts/gemini/gemini-nas4210b.dts       | 205 +++++++++++++++++++
 arch/arm/boot/dts/gemini/gemini-nas4220b.dts       |   1 +
 arch/arm/boot/dts/gemini/gemini-rut1xx.dts         |  18 +-
 arch/arm/boot/dts/gemini/gemini-sq201.dts          |   2 +-
 .../dts/gemini/gemini-verbatim-s08v1901-d1.dts     | 225 +++++++++++++++++++++
 arch/arm/boot/dts/gemini/gemini.dtsi               |  17 ++
 9 files changed, 470 insertions(+), 12 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260123-gemini-dts-fixes-3af8318c9c6e

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


