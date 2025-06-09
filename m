Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333EAC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BOVhTDyUrOPy9fLi/ryb2WMJyRVWZv4f/+KuhN3LflU=; b=qyKlS4BTPVse30VS1uSp4+V3Ez
	xjLmbr+b1pQG/ghvTjH9uUVWeh2nf8e87hzkogbL3GanmKVYi8F5jS+8nRbCL0JM+kk3w+Gw1cR15
	t6Elz8mke53p1Z2p/4X+fePWezCNPHBhwO3GEc4VKG5VAdgSEK2vFrjxe9/Q34cZLmHPOz97YhJ01
	j0gvRZax8bn53X4PgaJRCSW1TTEQXbtGzBF9+8vXsOk4oQ/GbieMGE4S6Q3pY2bnGab37R3m/3T36
	JARvSPHmeSMNSrlPVTh5igHjKTY/hqfakwUOuwMocfRnmp/A6iKSm1gCUUMwi50OjoY8GAqnr7XUw
	m7iKZRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaqs-000000042ai-0Gy4;
	Mon, 09 Jun 2025 11:39:42 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOalZ-000000042Bv-1EOp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 11:34:15 +0000
X-QQ-mid: zesmtpgz1t1749468649t03990109
X-QQ-Originating-IP: DgbvBjSokVTQG43IbUieazUxITiBXvTzFEVmAUCGFIk=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Jun 2025 19:30:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9665082274307116488
EX-QQ-RecipientCnt: 16
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: i@chainsx.cn,
	heiko@sntech.de,
	andrew@lunn.ch,
	inindev@gmail.com,
	quentin.schulz@cherry.de,
	jonas@kwiboo.se,
	sfr@canb.auug.org.au,
	nicolas.frattaroli@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-rockchip@lists.infradead.org
Subject: [RESEND PATCH v5 0/2] Add support for Firefly Station-M3/ROC-RK3588S-PC
Date: Mon,  9 Jun 2025 19:30:42 +0800
Message-Id: <20250609113044.8846-1-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NDtUtlvFer7vlI0btPf5H1OmahEl++0zd4EoAWFAmza1+5tGd3HGVewz
	WikOouuP90m+si4CnF8KGJfa+aQrb0mZXxK/rkCxM2zYW3xeZJ83qMT9Pp/bt74GvfvzSW1
	CRY6VjLVTMfw+QOb4PL/srkorzQh9zCN1vZ2ox87j4eNe7Nvw3/4RWgDXDojnz3qtSDEamt
	NWw1dzGEnt3lw/det4QVtlGM9HAc6oeBjpQ/cUHz/bbeoxC4ymNDwueJp8ElLvf9Kx+7gN1
	IaIpJpb1s+viB8fZR6PeiyfUrdcmoBwOEClvMN1wH4XAx5yTY0Q6bmjQqgwjBXyRQnk9ezL
	p1/eyaqcxoi1XOQeJdxaHJd3+/rtAXF+UcE5RTZy5+FUtwhoNovnCvQQ2N/sVb/+JnGFN9/
	eBm2syNiLuQJi4lLemYi7bgdyzehWZ6WZaqsmdsDKfvPxiS5pA3sCSOZfkenQBSCe0jSBwi
	D249Xu6nAqEgKRFdpXpafr1Kwu8eXZiOkXV0HotpclmNuUvSTpN+fHD3tb5jiL9zu/ol7Ml
	z2UuixDyIR7sgply3YpyJS9kq+I6+sUz+mHcFNFb1FQw8J32D3xwil0eymFO+YlXTd3cJP6
	56PMyJ5qnvmcM0tIFflx/04oepsua2g7CAsh6RHTA9DrPcBq5G0xmfaYjCWRdT7Wu9083ev
	qqDTwT+DtS8Xk5H79raAmTGxduG4bEwDcSfJB1UPlOJ4TD/xfQN1S0MaEhJfHWAd1tONIe0
	HaXIQKhLrFeGZHT8p2tD2vqXaql8It9I/mojvpHtxwsZTgkB2119K26uo3w+tm0aLQvB4Nw
	W96a0b/aKwy7v6UKXUvnni4IEHwkYlceeLFpMU5RQAsXRYwJHhK/yLGwomy1DscJdjf93Ly
	pucTZB4x5OBh7i/WFfDzz5okPty3rk+Dn/E6E7uFAzz8fpC6DbM6qoJopOivu+hGlEXziko
	o2vzloDQFcnOD/UvgttDfWG4kGEQxs3Sm/uTLMb+ybSXnWWZJjVxyyupKv/9UdjtIZoU=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_043413_849330_DFA621A6 
X-CRM114-Status: GOOD (  11.07  )
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

This series add support for Firefly Station-M3/ROC-RK3588S-PC.

Info of device can be found at:
https://wiki.t-firefly.com/en/Station-M3/index.html

Changes in v5:
- Make led-1 off by default (Chukun Pan, v4)
- Add color settings for led (Chukun Pan, v4)
- Remove vcc5v0_usbdcin
- Put enable/gpio before regulator (Chukun Pan, v4)
- Remove always-on and boot-on from vcc5v0_host (Chukun Pan, v4)
- Update the name of vbus_typec (Chukun Pan, v4)
- Remove always-on and boot-on from vbus5v0_typec (Chukun Pan, v4)
- Put pinctrl-names before pinctrl-0 (Chukun Pan, v4)
- Remove usb_con node
- Remove extra blank lines (Chukun Pan, v4)
- Add phy-supply for u2phy3_host (Chukun Pan, v4)

Changes in v4:
- Update the name of the regulator
- Remove the i2s5_8ch node

Changes in v3:
- Update the name of leds
- Add more cpu nodes
- Update mdio compatible
- Fix the order in the node
- Add the default serial port(uart2)
- Patch 1: Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Changes in v2:
- Fix rgmii delays

Changes in v1:
- Add support for Firefly ROC-RK3588S-PC

Hsun Lai (2):
  dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
  arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 838 ++++++++++++++++++
 3 files changed, 844 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts

-- 
2.34.1


