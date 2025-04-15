Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E3AC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 01:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wnkPaXEk6qnYCo+vvtWUioDSPxFUMrg19yw3XdC2wC4=; b=cfvHI2ykNvJEZaN86Evyrosr+3
	P4aBIcIFnSEkYWhDJ8rWeQRKItGghm2gC/w+1s/xNia7jxQaf1EGG+DzV20QzYnZ2sE67N6ZLLaC+
	YC+DjXxHNZOEpiKmU837WiHFoGa4NMwmRsYi/z8i1NEJnZXZnbvFAh115MdvSSMUMZ5ZvtP4V2uvw
	qovaTBwdCwsL64BExPehGDZsmP9/gCVitDsqQe5071oCK5tx+K+Ztl7UpGllUusMgYumzNmJXWUUk
	EhS29IBPIEu6UmnHxp82ysD77O6J6VUsuVYgUalz0CUk79zjL5tulsF/wgTetIMMSW1nj4RmDNbQT
	R74tnmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4VXm-000000049fr-2IK2;
	Tue, 15 Apr 2025 01:56:58 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4VVw-000000049Kj-36R7;
	Tue, 15 Apr 2025 01:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1744682090;
	bh=wnkPaXEk6qnYCo+vvtWUioDSPxFUMrg19yw3XdC2wC4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=pvpKKiLnzxT2FnGg12YQopnGAxFS6dDaf45OAClNaQ+2LqcdaeSQUmZnQ4PU74Usi
	 kg2nCVJZHqp9/lmbfx44wFbD5vv9eh/4MQeyFSojUpk0xwRvCZKQKNb3JqFM2rhDVI
	 fPthn3g6EnW6fXKlTGG2dvZ53SetVcRhfdXc2g7Q=
X-QQ-mid: izesmtp87t1744682086tba17c408
X-QQ-Originating-IP: fKMTSp+kc+w90RdYckDRM+y8DxFPMNasfY7wqVQrQR0=
Received: from localhost.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Apr 2025 09:54:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17149853333597941837
EX-QQ-RecipientCnt: 20
From: Chaoyi Chen <kernel@airkyi.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for RK3588 EVB2 board
Date: Tue, 15 Apr 2025 01:54:39 +0000
Message-ID: <3B59B383C82BCCCA+20250415015441.371214-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OCFGt05vYz7YvWpe1uePm5eULD9aSIb3h30C2kLwI6I8RuW9oQyu/npC
	P10Yi0xxJzADchGsRXCTk7XYog1tUQJVmgeMReY45F2X3ZcCEzFHERJBwERZGZiy8H7qMNv
	GoOyB+xWO70+LwoZ98Dk0Bv1YK5rioJ9/X1sLbIBNUiplTfOkjYKSrKjm5pomDdUb/V2Eb2
	lrM2EcRYQu3r1WIvpDiUij2U+7XhXfXjNKuNtZruvm2mc3J/1D3cb6G5/RmzaIf3BLhV/a7
	UqihwMHe1ZEcK9TfQRstJ5Bk9oatQ1q16B/WH99YWYHgkKfB1mhKSUpE3xrfCCCNStIl3Xd
	rJ/VucsF7cXflqBiOiQPKHTKkvI3zc5ic1Dfa4bOOK+l6am0rrEL6uAjgYFPsikJPwCGjZk
	5LrJiezijk5cz5zLP+josrXYf1J3O+6c1nbQU9kH8lVXyVSj4wYcDNY9klQtyl6pmBLGj9e
	vdp6G7s1MfFKaJWOGWK3rYC2y27CwoHKUHVh4Z4PnGPbYXsyxs1EgaRzntIG4vnYPBKq5Ef
	jF7FDwQe0t8FDyhb3ORT0s0LKpsNlrInkhzu7YQwhWcx6uH158GgJDU70jJaZaPnB4A5nv0
	OjjYMEag52v6hOnZv46Njoph+qQvQMWGFHWZmyIzskkMCNNVnBriulHWQ1S3QADeiPghMfG
	2ddmYa7UKDmZHZ4MCSlQ85i8j1B7EIxPsaW+Wn0QCr7KGVmhjhJ6yUYQ+9Ns7zQQtuF5lYx
	Tco81aa10T/u+Pff/FM1UqHU0WO1sp+nFMKbQWsUWCN20qLDENnFJxB9Fcmz7lIBrzwtgAG
	i0p4dS9Xok/gJyB4ES9Qc//mr5UBVX1KTjwEBGaVxR4d69nl5z8Vt0WN7kAKyEhpA9z6U3y
	+ofewRHTbSS1rh98mDIzssfmBjt/OsmqbsPPA4yFnYmTPWmXvki8lHjJ//2MhY6mw3KjJWQ
	aLkfbguE+SmNhv29MI2SWQzMd0/4qq3vbxsMjrvytk9wptklcEzDh3+4P
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_185505_094985_1330D9B8 
X-CRM114-Status: UNSURE (   8.94  )
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

General features for rk3588 evb2 board:
- Rockchip RK3588
- LPDDR4/4X
- eMMC5.1
- RK806-2x2pcs + DiscretePower
- 1x HDMI2.1 TX / HDMI2.0 RX
- 1x full size DisplayPort
- 3x USB3.0 Host
- 1x USB2.0 Host
- WIFI/BT

Chaoyi Chen (2):
  dt-bindings: arm: rockchip: Add rk3588 evb2 board
  arm64: dts: rockchip: Add rk3588 evb2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   4 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588-evb2-v10.dts     | 931 ++++++++++++++++++
 3 files changed, 935 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts

--
2.49.0


