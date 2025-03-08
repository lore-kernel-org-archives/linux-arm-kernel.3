Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE9FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TwCpWhtmMBakpaMGHdISZitCtlIawEEMo8Rgfzygze4=; b=B+pWqn5fHNxtJFSUATr/zIZ88S
	tWKvv7QEfDVCPsN8lKtsZZyYNzFXTskanNBT9MjlUP/RbmFViAnFw88wmFP65MKd2Xle0hvHvgsTi
	PpadeBoQ5u1pBzUhtyM7RXAuiZS21ZkBKwrMQ0z3vRS5wnC/UlJfwW+NXFkkJxikweZxVxDFh0X+u
	t5dlBKsPrEAtR2DlcSEN+/vPpZZSGlLopB59C/oOFKr0yAcHHMeIbqtkP5l8qJIbc92XH5N/HIltL
	MgnqK1Ux1YcnxIdO8S9u9IPxzrvO5Xlddqx0pxNsVcHan12xCMs3mDxdDOUiOZB8EI757jdKPUgcq
	H12FcdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy5G-0000000Gw1M-486f;
	Sat, 08 Mar 2025 17:35:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy22-0000000GvX5-44yF;
	Sat, 08 Mar 2025 17:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TwCpWhtmMBakpaMGHdISZitCtlIawEEMo8Rgfzygze4=; b=UZ+1WlFQdQTmet1JzRbdXCrYQN
	/uG5rd3zDP2G5kaa/2F4DNflhGf9mS3D1Fk4OXrix8aRVQ0jxYM5Bnu2OGVXHunv9LCOdKkC+d/I/
	BJh5yHHPKM/f3VMLoizM91VUp4hML53PK/K7gjKVqLn/NAyGWbehIIeafMpIs8u9nyst0/aqQOb8X
	lbJItjL7dxwf9j9Ujp6uWq3V/RjHMy7F+nKheWCWideq7+aHwi6fWBGtaneyPAMnlOHT0IQ3BPILV
	p4QZHpma7kr88HsZSy+4Vkchgyl1Baz/nv4OMu3/7JhBptwI/fyyW0Mz523fgdyBzhefD1zzHl6n6
	2O07e9Iw==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy20-0004Tx-6Z; Sat, 08 Mar 2025 18:32:12 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] rockchip: Add support for leds and buttons on Radxa E20C
Date: Sat,  8 Mar 2025 18:32:05 +0100
Message-ID: <174145503577.101861.8733087252860398696.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250304201642.831218-1-jonas@kwiboo.se>
References: <20250304201642.831218-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_093215_007455_F08E6C65 
X-CRM114-Status: GOOD (  12.81  )
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


On Tue, 04 Mar 2025 20:16:33 +0000, Jonas Karlman wrote:
> The Radxa E20C has three GPIO leds, one SARADC maskrom button and one
> GPIO user button.
> 
> This series add leds, gpio-keys and adc-keys nodes to board DT to
> describe the leds and buttons found on Radxa E20C.
> 
> Changes in v2:
> - Change gpio-leds node name to leds
> - Drop patches already applied
> - Merge saradc and gpio button series
> - Reorder patches
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: rockchip: Add leds node to Radxa E20C
      commit: 6a709e003492e9878d5f1357be0b2e1162e1e6a6
[2/4] arm64: dts: rockchip: Add user button to Radxa E20C
      commit: ad8afc8813567994164f2720189c819da8c22b99
[3/4] arm64: dts: rockchip: Add SARADC node for RK3528
      commit: 6e58302c84ce90aadbecd41efe1f69098a6f91e5
[4/4] arm64: dts: rockchip: Add maskrom button to Radxa E20C
      commit: 3a2819ee9c71d1c6388e456cc4eb042914d15d7e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

