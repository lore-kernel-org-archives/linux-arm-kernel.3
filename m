Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DABC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 01:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DhDxwg9jkPh9PfPU4lAhRk0j/dF1GG0oWPrwgbW7iGg=; b=yA4D0QMLdsI8O2OaTRakX/HOzj
	KJmFjnPQCOte6CVUWtNvqRW1C9y6vBm0YEdLY1JiQlRnpnFyABDxNYwd1G5wvgeEtX/a3si+GsKmC
	AYCFMrYRbx8ogBNfgtKF4LUfSZTW46OdrHrMbyjXwMNzgEa6Z4eeyCl114BgNjlb97D8tASeBQ0+P
	8LNQBj7Poaezy19MIP36nkeaQZadIPYf7GsBjRdbQWk4qsK9/svFTPIaCsQ4FULhtVhCWO22XCWns
	NssA3UW04f9bctbfD+0wOJbUL25Ij/BZd9EdbiRzO8UXFfxFGIwbU0HsZBGEKpb2yL6xd2oXltleI
	jRakKeVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5asH-0000000Enjg-2xV4;
	Fri, 18 Apr 2025 01:50:37 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5aqO-0000000EnT6-0AmM;
	Fri, 18 Apr 2025 01:48:42 +0000
X-QQ-mid: izesmtp80t1744940890t33e52999
X-QQ-Originating-IP: xxYq8I7Tn0LYbD/zhGkQUHqaOq+30P2WCr1qDmsQs4c=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 18 Apr 2025 09:48:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12449981161467156277
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
Subject: [PATCH v2 0/2] Add support for RK3588 EVB2 board
Date: Fri, 18 Apr 2025 09:47:55 +0800
Message-Id: <20250418014757.336-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N7MSp95pYuqVdt5Ada0qswa5Q85vZDVGKwMX0tgjkJInZHvrW3t2kIpT
	OabEc/IShIOWW3qSfCsOgAEefqUTTq/dAPi02SD1iVVe+rS2fdmg/5CYwuKVHzMCW4eCdsn
	4036/i/hYgy9bNJHpSrFvj0mqUUtdn2YXPbxLrGzBhB+OMbORGxv+KL4vvlEPInj9Wolx4B
	kFj7Tng+HkPScXFqjTmLtPpyv2i15aAGK/097QUG2k9sPQKStbu6mvmfDviP7/zSWpwYosy
	ylzNndWfRELk8wFjC6833Yn8whG1OFYfz9Ty9GgAwihNFukwpQjOvLw5nhGMQ+2tYp59EhB
	G/Zrm8AsxXs+t1NgKX9WATZH+GA0Qc+1kkcpHuV+BwIA25xTKpKEt65UNySiY4CEmp9vpmf
	MjjzqvYAgDJuP0ZMQ3xlxd4cQSp+8uzZwBfSltgFhf3RxKh+7qRCbvBfIXQYyY1jz3nMLvL
	Kb2b44Xlbt6l2KJ+4bmcI8YI7CkE0yZSRtez1D8j9/hv2qg5+vmu6asg1iNBSVwBR4y4JN+
	a1i0XNvmYAM2luKuwzAPpPxQL8JA/JDBHQfukP6YG+mz6mb74XJLpWSHSH5+JsSGCIfhB8y
	tLlNnpvpyVDdXDlrp5Tje6D6HItrtPV25zOpXWRnateo7J+oKXoPKKwGz5T9DElh7zSNBUJ
	ZifqHDfVPZl0IdW1W/S/t/LnK6bo+vpWJUKYj7cx53Bu33VLYCPNfUSbspZx/nUE5nnN0xs
	dVIhhoLwiK4YMiZYdsi+jlhq6HsaG9otNhlLJQBMt8lrVoIeWtJE0yGFR+9g05xytoWVi2y
	aROrv2f/3c3qH9e9PBDCszgiU34dTtGEabd8Ln3rMTlJMBbaMgfrrlNUBJFm45raCY3zkl1
	9u6mE0qLHjnKM+/N9YOPQsmuqO6hyQlamx+4J+N7OlDwlGT+oaN6YSvWfiWFjevg+4DzeTc
	TOgdlpI37bx+B9ShpZV1LS6d9+Xc4u4o8B0bVlkHtczBoi9vrLSQ40AKrJ9MQwUp+wmm+Pc
	ujswug52tnXc06RgCOnSTRM0ZM7L/xuWgMXUol7A==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_184840_702619_D1E0CD2F 
X-CRM114-Status: UNSURE (   9.25  )
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

v2:
- Fix wrong indentation in dt bindings

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


