Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039D4C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWzAh8NPO04rtRLnNCeigUoQRZfIm1QlqA5u4uhqbpE=; b=ctwSi/hGQp/CkmaRrC3afCTxFj
	qgT/Cn5tyQr5RNdpOgmVp2CGfhnzVKDBgy6wLy4ZAsIaRpMYQYHxH7nD7b2UhRD8j1emtNDcbp4I+
	5UrbX9RE1glU2ycoowNW8040SRVmhtBLJpxbVu/7PDvicV7QT4yKTa0hqdH5GX4tNUOEBd2MMeo73
	FNgPQXGrzywyMNEhkG/HA9TIsp8DZWYLZ7zMz8zz9TAYGyrZnbXVgpfSIHcU8izT7X3aG5NJIE7R5
	3oejpsV0uIzzwlSc8aXuHWm/DxJ+Nfx0fkQ5mKT7By6XLOUOlPMFNh+0vH/VhLFhrsQF3uAEJpZvn
	wEEGIUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1isU-0000000ESxT-1IB3;
	Wed, 02 Sep 2026 11:11:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1isS-0000000EStd-0pGL;
	Wed, 02 Sep 2026 11:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NWzAh8NPO04rtRLnNCeigUoQRZfIm1QlqA5u4uhqbpE=; b=J0XKTeuRjTzRKJub7Tyz7N7QFx
	aD0wgIa/Xo37ePrta76cF2xJ7dWbhw7SYWMdrEdXeQ5f80B6SjkFwyaOEGAzMafqkATGjQDqBUqGb
	OzOUaXc0/+4cNPsgNRdzmNh2zQtfYRx/lU2Uzhn6uHhg6ubDLQ3NjZCIiGhUJQP3aX15nIPabf4GR
	2SAho9vaeL8dYhCNs51sAIxCs1AIuPrQWm/uw/+dCm75QukEymWtSYKxaQX9aqVqq2RYhfn4wSoY+
	L7r0OkBdo6b7n0eh5Ycx2cbO0btUpSomxCiOHTMmq/45KsJg1v8e7+OLH2VagN/tgNzlOLevDc/oL
	JVs6DSVg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diederik de Haas <diederik@cknow-tech.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Ricardo Pardini <ricardo@pardini.net>,
	Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
	Daniele Briguglio <hello@superkali.me>,
	Hugh Cole-Baker <sigmaris@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Cleanup DT description of NanoPC-T6
Date: Wed,  2 Sep 2026 13:11:13 +0200
Message-ID: <178834747217.2268650.5352835281518759084.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260828114530.1315798-1-diederik@cknow-tech.com>
References: <20260828114530.1315798-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_041136_239055_41EB05DC 
X-CRM114-Status: GOOD (  10.86  )
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


On Fri, 28 Aug 2026 13:43:00 +0200, Diederik de Haas wrote:
> This series cleans up the DT description of NanoPC-T6 devices by
> - Remove unneeded nodes
> - Align pinctrl names with names used in the schematics
> - Fix sorting of various nodes and their properties
> - Fix an unneeded pull_up
> - Switch to using I2S0_8CH_MCLKOUT_TO_IO for audio
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: rockchip: Remove unneeded vcc_3v3_pcie20 on NanoPC-T6
      commit: 05956cc8d96b41cee78322d5fd96365e1755cfd5
[2/7] arm64: dts: rockchip: Fix PCIe 2 pinctrl names and sorting on NanoPC-T6
      commit: d10b733bec0bb2949beec3bbc3625a9909711602
[3/7] arm64: dts: rockchip: Fix hym8563 pinctrl name and sorting on NanoPC-T6
      commit: 21431b76fc0380bb60ec6792492fbdc282847120
[4/7] arm64: dts: rockchip: Don't pull up rtc int pin on NanoPC-T6
      commit: d936b4164c9fef5e3d5a12a4f260c7bd2413f83c
[5/7] arm64: dts: rockchip: Sort usb nodes on NanoPC-T6
      commit: 6c4aacc5956924fd38703b95df7d67a650fb2db9
[6/7] arm64: dts: rockchip: Improve sound config on NanoPC-T6
      commit: 7ac01d4ea7a2c0074d3c92da0272baa6c1591b66
[7/7] arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS
      commit: e4392d3f56f686082f62e27131f4ac233ee05ac7

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

