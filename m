Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB3BC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 18:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVXIOItaezdq7V8Fdm5M8R1buhdCJDDURjn98tk2w2o=; b=lWVDS2QZJPuO0W5yj6kghvGnyj
	RBwAW+C/4g4JUTvYQBfE/2fIfBivDeHBA60QpokWMkw6V4BLoGbLtb8YDmTzOWDtV36RcyvGNH5hM
	MRKEettXnA0Y6dxd4awkYmc+3ife6vDPhJEKWzS230iBtJoeqP3lS4k6Pw2MvGHRrTTpUQlNdTsAH
	IJLhOPWrBMGmBwq2miCnn/aus0R5WcII8QcTeVnIV+zQRcNqHIFqzfUqsCgpnWA6XJuYoipKCRzbJ
	HVSaO/Hq3NHr1FcD9SmVDU0hNgyytVKx2ztRWuYVOYNpGc0nVSmQGQzLL3rO9lerdIGs+D8d/T2kP
	EJlskRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAvP-0000000FisV-3Rwh;
	Sat, 17 Jan 2026 18:21:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAvM-0000000FisC-3ZR7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 18:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9C67403AF;
	Sat, 17 Jan 2026 18:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A3E0C4CEF7;
	Sat, 17 Jan 2026 18:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768674083;
	bh=JQzl6UvvwOgf72EnstNOsIrbBj/Ch7DRk+QpYHs8w9U=;
	h=From:To:Cc:Subject:Date:From;
	b=JdxU46sr9AT92vuL1OwSTDdJuCsNd56T0FqBwxgLFWaEi1CrMwyuYMBjD4FK915PS
	 /wUUaApvJsyfYcwVoXT2HrKKLXkBBwb1/qRwpZl23SqJ1U7jaFC+4Qbq7sgSozOh1B
	 Q8UYK/TkdaNS8WG63pi779p34RqdHVH0yVnnw/POuaRD8hl2EuZiY/73iPBAW5QLaZ
	 K2kNkfSI97lfvxW6lZM6FeEvSwQNiB8p0Q/174N4VpF6qOj/xXOhB0RS8TnVXCg1Hh
	 ldBWMOzJSKOe7ADoLN2paXcXtSMjSMx/gxIZwuOhghMiw+sSoGdIFNd3Kwj2R0Kd8t
	 HJbeaaYgEvb4Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/2] arm64: dts: cleanup for v6.20/v7.0
Date: Sat, 17 Jan 2026 19:21:16 +0100
Message-ID: <20260117182117.14483-3-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3480; i=krzk@kernel.org; h=from:subject; bh=JQzl6UvvwOgf72EnstNOsIrbBj/Ch7DRk+QpYHs8w9U=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpa9MdLYg4n00K5c0zA06+EGuiS4gf9c4KjA0AI 7/cvC5gmDuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWvTHQAKCRDBN2bmhouD 1w7UD/444wPOwaabumifUG9tsJQrJaAe4LDo8s7YvgBMlahXka0m2Ec+iNNsJ3McScUpnjDiWPn 4GKFsRAp9DSiMBeFCs6kYBbksm/yzr1HolM7psCHlY4WcXhFmNUOHPDKYW8qX7oS9OROsNGNmrC 63pzlXMLZvBtsIVn+6pooDS7O8/jqWypMZQFcBbAyN1DlnErKy51IK5jQrKsbDB5Ra878kVAlqQ Q+F6Pef+ZRWQwZs3kMGJzNOSkK7+y4fF8N6nTpV0eXxKg2COoNYb+Vop91wKo0j7jLN14SmfYp/ NIMk/X4/u6H59O4f4Q0qrlMLhXLbs5JqPP57sEYEDsQLdwjKStppZQqt4+wstQKmmz91GwNIHWD UQhOaf1dZBGd9V6GYYsU99Ml6bgoOPZ+S4pzp8LcN88e9bYWXvUjjNYzqp1u8n0UOpfhdhevg6E h1QDfTFDBRgccgl9jy5VPIJQg/XFkVHLz3BcuZydFcK7HpRJDZ3FGFizVKnFs32P2mbGJfwhKM/ IoDmEkFE+wLz4IRGtjfX7TTFdH7ZCpEvxVhnwUTATb/d1HQRfaeFMidaMydpZyXBRXUvcCTom2q 9kWvcQeZReikhwMmDCgxIXLmHyotHSyfZ/NrbeFnIuRbieGf+hZIeQPdJ2MD5cq593M6jj1Zg/O Afb7kmeqnzepUTg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_102124_935470_117F5F2F 
X-CRM114-Status: UNSURE (   9.66  )
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

Hi Arnd and SoC folks,

Various cleanups and minor fixes, some acked by respective maintainers, some
just missed (platform is in poor shape).

Best regards,
Krzysztof


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.20

for you to fetch changes up to 5cd532f7f017460395836d8f129ad3ee5ae63110:

  arm64: dts: apm: Drop "dma" device_type (2025-12-22 11:05:32 +0100)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.20

Several minor cleanups for Nuvoton, LG, Spreadtrum, Toshiba, Cavium, ARM
and APM SoCs:

1. Switch to recommended node names by fixing style
   (s/lowercase/hyphen/), using generic naming and adhering to DT
   bindings.

2. Use consistent whitespaces around.

3. Add missing properties like UART clocks (Cavium Thunder 88xx) or
   "reg" (APM).

4. Drop incorrect or long time deprecated propeties.

5. Correct clock cells to 0 for fixed-factor-clock clocks.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      arm64: dts: toshiba: tmpv7708: Align node names with DT bindings
      arm64: dts: nuvoton: npcm845: Minor whitespace cleanup

Rob Herring (Arm) (10):
      arm64: dts: lg: Use recommended simple-bus node name
      arm64: dts: sprd: Use recommended node names
      arm64: dts: toshiba: Use recommended node names
      arm64: dts: cavium: thunder-88xx: Add missing PL011 "uartclk"
      arm64: dts: cavium: Drop thunder2
      ARM: dts: vexpress/v2m-rs1: Use documented arm,vexpress,config-bus child node names
      arm64: dts: apm/shadowcat: More clock clean-ups
      arm64: dts: apm: Use recommended i2c node names
      arm64: dts: apm: Add "reg" to "syscon-reboot" and "syscon-poweroff"
      arm64: dts: apm: Drop "dma" device_type

 arch/arm/boot/dts/arm/vexpress-v2m-rs1.dtsi        |   8 +-
 arch/arm64/boot/dts/apm/apm-merlin.dts             |   1 +
 arch/arm64/boot/dts/apm/apm-mustang.dts            |   1 +
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |  20 +--
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   4 +-
 arch/arm64/boot/dts/cavium/Makefile                |   1 -
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi       |   8 +-
 arch/arm64/boot/dts/cavium/thunder2-99xx.dts       |  30 -----
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi      | 144 ---------------------
 arch/arm64/boot/dts/lg/lg131x.dtsi                 |   2 +-
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi   |   4 +-
 arch/arm64/boot/dts/sprd/sc9860.dtsi               |   7 +-
 arch/arm64/boot/dts/sprd/sc9863a.dtsi              |   4 +-
 arch/arm64/boot/dts/sprd/sharkl64.dtsi             |   2 +-
 arch/arm64/boot/dts/sprd/whale2.dtsi               |   8 +-
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts   |   2 +-
 .../boot/dts/toshiba/tmpv7708-visrobo-vrb.dts      |   2 +-
 .../boot/dts/toshiba/tmpv7708-visrobo-vrc.dtsi     |   2 +-
 arch/arm64/boot/dts/toshiba/tmpv7708.dtsi          |   4 +-
 arch/arm64/boot/dts/toshiba/tmpv7708_pins.dtsi     |   2 +-
 20 files changed, 42 insertions(+), 214 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dts
 delete mode 100644 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi

