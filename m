Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F72AC2A069
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 02:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y/k9MsuSNbweF0g4tN+QXLsS5KGlTItZo2xUIwWpYCY=; b=x0KaeuPxv6XRtUJqTJZV7zJvsb
	ZwGDGhNJ1WhkQv5zIklcOVx46iHxL1Obvui0LjsFWANJSKa7QrNt3h76Yu6ErHAf4J/3FK6aBWPGq
	yyRkHOkQh8W37Jt4Fonu60ruViuh+p3eCSzeerDTsj3GaGE2d18eNnfeS6RS0qgwQMRP+S96m1kLh
	r3KFb5Alk+n6nQvnII7DW7hkTVDl+mZpKRCband239nn4PTVywqp2pVCO1PoFmHXx5ZpDx0NJZTwL
	T9JmDBDLSpUE+ggw5J0NPNNazzwO/46eVXkvqs8ziiOZ7fOnQAPAJ11wMG7nrfX0Eo7wPgrBDg404
	HQMEzHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcE0E-00000009yAN-1svP;
	Sun, 04 Jan 2026 02:37:58 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcE0B-00000009y8N-2DIb;
	Sun, 04 Jan 2026 02:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1767494238;
	bh=y/k9MsuSNbweF0g4tN+QXLsS5KGlTItZo2xUIwWpYCY=;
	h=From:To:Subject:Date:Message-Id;
	b=b3HvH97f8XaBBKZeKsmLCndtu4l8IRnOn6vFTgJ52AjxMRrKDwhzXjAR6F+zj8b0+
	 +YpfRy+BZ3iUihlZ6d3lSo6WmytPQNzP1TzQJ++THwQ9RUOH9S+Q8qznq2e+2ABvXE
	 9nQUABXJqcZyvQct6dLWxA/P72Fj6jceSROR2y5E=
X-QQ-mid: zesmtpsz2t1767494230t5d583093
X-QQ-Originating-IP: 9UpFS0FDHhr7aE4H1iWq2hxD7exHLmk+JfcEu07uhxo=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 04 Jan 2026 10:37:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16655950832647765738
EX-QQ-RecipientCnt: 22
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	John Clark <inindev@gmail.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: dts: rockchip: Add rk3576 evb2 board
Date: Sun,  4 Jan 2026 10:37:01 +0800
Message-Id: <20260104023703.118-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NuC9jha5hp0iacXbxXGz0i3+bouJlW+d+yrOdqbPCuyQQbEjmhjQ9I3t
	yZq1ITXuleg3mjHwp4VkA9jcl8h9jSIdzK68KjiwthMmTDTGwkThh1+pHlkDrsZWUEsJa3I
	n65JLdd/ZnVrB2SkGI/mSPsh925ylFvdaSOi1SazKdiEaczNJEY1LhqQ8Us9sPxhXzE65bT
	EyGM13j23IPA0nqUrK9Ys1GE5jmf17wi7ya3k1K9ohiJFivbQjmCDonIirNt05uIv3ozgAV
	LaE6fcKKDvxplYDBhQ2wYH6FauXS6kyoDEhZoktzfwGu2WYVXpx4BDkYhMnukVO3sCyF7O9
	A2dNf5M+T5heYunm4ot78qX9nRofH1VS4MPF2nFCmawF3Mv98fCcVPbO8iqwm0JE/Xygsfk
	SvMxr0v2zpcbmA3rtCwnIRfA72n21nCIMPx6PQ7ky97y9hkNh/A7ceIA1GsjtVhybgW91Q3
	xR2TtO8a0NmS6xOnf8KG3QOiWxaFAsNwZbY2NChNquRQdDB54dOBpAVL9njgCRqWGGTkaKx
	1mVu/wCvH1Oma7Vo6wma9/ENt7kgS321dZQgyTRw6yNzil/jnrtgpUi+SYsSQZFtpP/+Tiv
	jwPlXT6crrqynfJ3s/8UPRJEuwo6Sdb4XDQa7yngA9kz2AoppHsw1VoQyHDU74c1OoB4WwF
	mI7ReVjfm2MtO2PrNhoDGg7PwSfrLN+A4+0xZ3rJc/IwaQmu//6UEUKBnjy3oeWfQ91D16p
	Nk3R/c0uyS6R+yuDHiq+O+oL0JNHyUUVeWaMSSdDK3J4vUkNhKcfLEtiJ0v0GAZ+H/PdsQP
	YQWEAKYhDNMGlXo/oeGga3CUb/jVloMFI2NZQ6sn8MOwj8VEIN/Hq22V6zm4Zu0diEJm+9p
	JPD/nYXkcyKhDvexg519l2SGca4Pu1zy6wxva1hfzZLPSWJJvbBU+v8JciIg5CTgEY5M57n
	ogDyMwIukqS6ifeR3X4IJhiZrTBudve/8xcKSYNgGWg7rcAaLuXY4heXzAyTvXyHu96A=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_183756_283137_E43FD59B 
X-CRM114-Status: UNSURE (   8.79  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Hi,

This series add support for rk3576 evb2 board.

General features for rk3576 evb2 board:
    - Rockchip RK3576
    - LPDDR4/4X
    - eMMC5.1
    - RK806-2x2pcs + DiscretePower
    - 1x HDMI2.1 TX / HDMI2.0 RX
    - 1x full size DP1.4 TX (Only 2 Lanes)
    - 2x 10/100/1000M Ethernet
    - 5x SATA3.0 7Pin Slot
    - 2x USB3.2 Gen1 Host
    - 3x USB2.0 Host
    - WIFI/BT
    - ...

Chaoyi Chen (2):
  dt-bindings: arm: rockchip: Add rk3576 evb2 board
  arm64: dts: rockchip: Add rk3576 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   4 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-evb2-v10.dts     | 941 ++++++++++++++++++
 3 files changed, 945 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts

-- 
2.51.1


