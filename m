Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE0DCA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 18:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56eixtQM6IBrEm/5Jwsst/ouQ2m/s5sQIb2TIKo+iAg=; b=dAOe3t83jgGwV2ROqrAfIrjnpf
	BlJxis8PPDqItb/Et2xo7gJQndO4f4s78RixOs7yqQhgCkkr6o5GUhKcZbMm8+OCMV2jtQ/JXIa9k
	bD8Q2Wp8uN43dZJKlNPIFSB/hc7oRRAXSwuBQalq4sBvJm1XYlZE5LNwZ2FudeSkcFMQhbtEYzfX+
	MbBC6kPLM0QBT8VA2pL9m+JX3ik9NTGdOmG3c3wb7lxqLXGvdjBEEn6SBXTNvSsglzTDiH2LhcetI
	bn12hoOJgdjOIT2/boYsh0x+kdVZhETw3J3YlDugMbyKQHMiqcIxRGebg4/egaDyUpTynHHl1CnFr
	b+kLaTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usQdj-00000008KHc-07M8;
	Sat, 30 Aug 2025 18:49:27 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usQa8-00000008JvI-2ts1;
	Sat, 30 Aug 2025 18:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=56eixtQM6IBrEm/5Jwsst/ouQ2m/s5sQIb2TIKo+iAg=; b=fp9xgnDj2TWtvFuECWHixYHZR3
	2gft0+POSW1l9LkOv4Cq5kRn2FVCBU6kFr871g2Ee4Pr0aJiT2kBFEA6MS94OnstnO7pH8EBLSo7J
	nO/M2OvoPr5XKgpDcR22/RJRBHfPhQUQDVvNjp2zwjQHum0CAptdjd4lQ1XbBUmDEWqkKeDLFp/hm
	hn3HP1B3BrWpBoCAY8X987K5jbYNthsyXpa1BwJpEEsvlLABqtp1++ryvUXi+HXUjCFAvFK5Y6QmY
	m1rWo2ySWJaTpi5I15KGr/xNHAOKrFnor48JMsh9YGosQIPew3qr6fQc1+AHp72yv8Nxpx+OIr1fB
	xtiWcCYA==;
Received: from [88.128.88.73] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1usQZz-0005MT-66; Sat, 30 Aug 2025 20:45:35 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Chukun Pan <amadeus@jmu.edu.cn>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/6] arm64: dts: rockchip: Add ROCK 2A/2F,
 Sige1 and NanoPi Zero2
Date: Sat, 30 Aug 2025 20:45:34 +0200
Message-ID: <7632976.8F6SAcFxjW@phil>
In-Reply-To: <6cf1cf2d-50cb-413d-93c6-79ecd6b0788e@kwiboo.se>
References: <20250717103720.2853031-1-jonas@kwiboo.se>
 <6cf1cf2d-50cb-413d-93c6-79ecd6b0788e@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_114544_729686_C2D380EC 
X-CRM114-Status: GOOD (  24.87  )
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

Hi Jonas,

Am Dienstag, 26. August 2025, 10:31:07 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Jonas Karlman:
> Hi Heiko,
>=20
> On 7/17/2025 12:37 PM, Jonas Karlman wrote:
> > This series adds dt-bindings and initial device tree for the following
> > Rockchip RK3528A boards:
> > - Radxa ROCK 2A/2F
> > - ArmSoM Sige1
> > - FriendlyElec NanoPi Zero2
> >=20
> > The bt/wifi_reg_on pins are described in the device tree using
> > rfkill-gpio nodes.
> >=20
> > Changes in v4:
> > - Remove disable-wp prop from sdio0
> > - Collect r-b and t-b tags
> >=20
> > Changes in v3:
> > - Rename led nodes to led-0/led-1
> > - Remove pinctrl* props from sdio0
> > - Collect a-b tags
> >=20
> > Changes in v2:
> > - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
> > - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
> > - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
> > - Add bluetooth and wifi nodes on Sige1
> > - Collect t-b tag for NanoPi Zero2
> >=20
> > These boards can be booted from emmc or sd-card using the U-Boot 2025.07
> > generic-rk3528 target or work-in-progress patches for these boards [1].
> >=20
> > For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
> > Fix UART DMA support for RK3528" [2] is required.
> >=20
> > [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/=
rk3528
> > [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
> >=20
> > Jonas Karlman (6):
> >   dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
> >   arm64: dts: rockchip: Add Radxa ROCK 2A/2F
> >   dt-bindings: arm: rockchip: Add ArmSoM Sige1
> >   arm64: dts: rockchip: Add ArmSoM Sige1
> >   dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
> >   arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml     |  17 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   4 +
> >  .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 464 ++++++++++++++++++
> >  .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
> >  .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
> >  .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 ++++
> >  .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
> >  7 files changed, 1210 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
>=20
> Any thoughts on this series? Rebased patches for a possible re-send v5
> contained no changes compared to this v4.
>=20
> I would like to send a v2 on the follow up "rockchip: Add USB 2.0
> support for RK3528" [3] series and was unsure about the state of this
> series before sending that.
>=20
> [3] https://lore.kernel.org/r/20250723122323.2344916-1-jonas@kwiboo.se

it was pretty far down in my inbox, so I hadn't gotten to it yet,
picked up now and the patches indeed look good as they are.

Thanks for the ping though.
Heiko




