Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FE8C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 22:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UvbgoGgrmXP3B5uQ+cywVTSDeS9uHHY5U7o4ME++MHI=; b=zw9RcwV1+Birob3KkRPllS8t97
	yij3KrynR4y6qeOY23UpHKxa0HDi4POXcQf3Axb1dt92iHKhOuj7jW/KivD77wBv6kr9S0P/bcmCR
	q3JWwel3JBai6ShLCc8v2ptFoXrCY6nfwFfAVLivVfcrzVPFEVaRdvLIEnlHVocj4JUtDXMbf7Djy
	uOlO+GkdC7DHSHcWf54PoLkFWavSL4Gskahxfmoc2wNwAzTs5qTCLlsYAVntwKmjyMTFAFXOK0upf
	PiEws329ehl9Cxo5s78JQVtPbDT7AZQrtEC5GKnYq7F4AaSXpIP6s8dfrvq0c2zwO1vJE2fPhazFR
	1+Q528mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZHAQ-00000006q6M-4AfF;
	Tue, 08 Jul 2025 22:52:02 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZH82-00000006pd5-1dzs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1752014971;
 bh=UvbgoGgrmXP3B5uQ+cywVTSDeS9uHHY5U7o4ME++MHI=;
 b=ODXAp3FMDk1GGm+hgUlv5zyOAM5zx220P73ox/ayfDmkNF1SsD6Btw2Y2DFvifphvvBzpNsgu
 qjYx0RoaBaalItpnC0/PhsOayQairTWCGztBihoLHcFK3x3MfGbC1Bw8ZXwtfC3xcvrhJF5Heww
 Rs7a4jffbUtKTOijcuHu7tMbjow2bHFbB6hbJI5gP/3Gj+QSlB2Xbvceluy14xceaDaTmJlM4i7
 CQEN8JBV+uU9SE2s1OS4O+T7SlMQ0v9lIoyMj0AeBAo0ygmGu9hoEuZUMUeVvXM5d38omdbU3YO
 uXqRGCTe6YJbFSx6E0DCLiYPsRawnGVNKUI/8CDhmAEA==
X-Forward-Email-ID: 686da07775317ad3cfdad39e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and NanoPi Zero2
Date: Tue,  8 Jul 2025 22:48:50 +0000
Message-ID: <20250708224921.2254116-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_154934_513728_72CC4A4E 
X-CRM114-Status: GOOD (  10.71  )
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

This series adds dt-bindings and initial device tree for the following
Rockchip RK3528A boards:
- Radxa ROCK 2A/2F
- ArmSoM Sige1
- FriendlyElec NanoPi Zero2

The bt/wifi_reg_on pins are described in the device tree using
rfkill-gpio nodes.

These boards can be booted from emmc or sd-card using the U-Boot 2025.07
generic-rk3528 target.

The patch "arm64: dts: rockchip: Fix pinctrl node names for RK3528" [1]
is recommended to remove a few CHECK_DTBS=y W=2 node_name_chars_strict
warnings for these boards.

[1] https://lore.kernel.org/r/20250621113859.2146400-1-jonas@kwiboo.se

Jonas Karlman (6):
  dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
  arm64: dts: rockchip: Add Radxa ROCK 2A/2F
  dt-bindings: arm: rockchip: Add ArmSoM Sige1
  arm64: dts: rockchip: Add ArmSoM Sige1
  dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
  arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2

 .../devicetree/bindings/arm/rockchip.yaml     |  17 +
 arch/arm64/boot/dts/rockchip/Makefile         |   4 +
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 449 ++++++++++++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 341 +++++++++++++
 .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 292 ++++++++++++
 .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 ++++
 .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
 7 files changed, 1195 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts

-- 
2.49.0


