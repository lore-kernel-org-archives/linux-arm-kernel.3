Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60B0E67A8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ch9jYgEps1iSVQj+VWuYzSp8RlujOONAFKcEZbc910g=; b=cjJqVqMPOQF82J
	fcYUtUX7Jb19p+Imk6O2pcS6qvjb0QdFCMZN1OYVpYmiDf6+YUj9e5pX76Vb4dcsAJUoUK+wHIJXb
	jHOvX2208UlBNdeIv+WWOnDssiJMCToE/GuwPDUX+pAkAHXH2+j3t6w6exll29lvavkk+2+86W+rW
	uExVTunFOkSJdH7/Be/bibXHo861Fw5MGYwqsqbJU5qKNGR+JdO+hoWBGHjxBUIBgh8H/Sl1A0NDb
	SJBu3JgQhcqiyes1iyAsdXRO+VtK/R0btoW1qk+kmibKvgoRMHCKAglcYlrxiIzcvqgL/DVBPdfMR
	+kRDN88pRa2ddC/+rTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCN-0000000EfpQ-42JN;
	Tue, 03 Mar 2026 07:29:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCM-0000000EfpD-2vEJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 07:29:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E777460126;
	Tue,  3 Mar 2026 07:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F545C2BC87;
	Tue,  3 Mar 2026 07:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772522981;
	bh=YyZ0/QyOn8tE5obx99KeIpMwB/Zi+4Oct6cmtNgDxTM=;
	h=From:Subject:Date:To:Cc:From;
	b=aOUv7iZAkOxJN6tZhZdGrj74l+tbJfrv94nv3u3I2hjQh7iWL5hXlux1wKa7YGBPe
	 pqIddRTg0UyLtq3D86jtCSjatrh/zAOIaJLWMuidfMuJcEIVmgNoYy94BUMFrDYonq
	 7kXU2EKCCxba+CsT1Zr3Q2DxVL8DOIkWSs3MI+3u90X/G5+fBki/lrnWrrE5ntTYeY
	 JefJTrYuOswINMQ07VchepsS0qSv+DO+70vSc1d89zc48ZCwCTnl/GuCz0qPGkIi7Z
	 TEwfD3n4cuP8kBPfVUFI2bMAOKDw+pDIbZnK6Y1MqMa1LKJIkiudBIy96TAUf3A3mD
	 bnl6NtGx8p7YA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/8] ARM: dts: gemini: Additions and updates
Date: Tue, 03 Mar 2026 08:29:32 +0100
Message-Id: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNwQ7CIBBEf6XZs2uAGlI9+R+mhxYWulFpAw3RN
 Py7WI8e30zezAaJIlOCS7NBpMyJ51BBHRow0xA8IdvKoITSQqoWPT05MNo1oeMXJWwH17WyM2e
 jCaq2RNqLat36yhOndY7v/SHLb/obU6r7H8sSBQqjnbbCjafRXu8UAz2Oc/TQl1I+YxIWHLEAA
 AA=
X-Change-ID: 20260123-gemini-dts-fixes-3af8318c9c6e
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
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
Changes in v2:
- Designate the two new devices as "new" not "missing".
- Link to v1: https://lore.kernel.org/r/20260228-gemini-dts-fixes-v1-0-0c6f6d0fb4bd@kernel.org

---
Linus Walleij (8):
      ARM: dts: gemini: iTian SQ201 need to boot from mtdblock3
      ARM: dts: gemini: Tag disk led for disk-activity
      ARM: dts: gemini: Add SSP/SPI block
      dt-bindings: vendor-prefixes: Add Verbatim Corporation
      dt-bindings: arm: Add two new Gemini devices
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


