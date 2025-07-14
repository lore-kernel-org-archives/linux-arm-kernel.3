Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACBCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 01:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlFCaYE9mYYVqPZnXFg3825ZyoUny8ZoXw9exfobnrw=; b=BLZ1Ao+rhsm41y5ogGQPuixrjZ
	2JEp4HDXcL9CcBlNiwQwGAuzcH/II27twXsVzc11oJ1OMEZ/kFsKOJ0l8BAmyJ90nWvy1cLn1jf/y
	glvsZszOqW09pYI+e+DFF/psEwYeXI1T5jQBMT3DkwyHGA4k/hPnFWKfS2BmxJPHqsIF6VpwdiFSP
	8bdD6zkPoznbx5I6zHCBSFXX9q0iBuwumlIsVLtsOnl8uzUtlrGQP4qGDUrG4X8I4MZObNG4W0nC4
	k8l5t/Xzu60glYFFaF7T3a95eoMkRTVuA9BMRb1ZElHmSVIZRVeDpCfsiYrOjvzD6Da0RkaFx4ISm
	EkDxhnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7av-00000000sLI-0aQa;
	Mon, 14 Jul 2025 01:03:01 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub7YP-00000000s6V-0y2O;
	Mon, 14 Jul 2025 01:00:27 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 43FC020E25;
	Mon, 14 Jul 2025 03:00:22 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kg2EVRnGv0KQ; Mon, 14 Jul 2025 03:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1752454820; bh=/PImNDpsKBHTO5j8+6O63P7nRRG2EcEQFHDZOqoJskc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L2Cl8GezlIwKoGgZFR8yBr8t4BeY99hAAyG2YOMFivhA13G8l1yvip8kC9fOsAsDa
	 0QfQnVByuNOBylf+8CkyBNKLvHl0WmYxPSBu5TQBbO1LUJlBF3FNt29WTOrWf6LnyJ
	 y4zDEwyRudmKlhtTAFasswlprzXe2fZHP8eVb8iGJb8ZvzebnRdG1UVGcT8ocArvKK
	 YG1WnAI3vPTipgF3WCudVKsN4iOHxXMXZWryN/IpfZXtkznwofBKsH0l6CoqeKnx08
	 pywbyqrW52aTWNq38Tu2RvI4ETeG3DubsNIoqW6d836NLPrr3Xuf8E8oJDurYEYI/i
	 j0N+xUOJkz16w==
Date: Mon, 14 Jul 2025 01:00:08 +0000
From: Yao Zi <ziyao@disroot.org>
To: Alex Bee <knaerzche@gmail.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
Message-ID: <aHRWmMFTh7leEhrq@pie.lan>
References: <20250712173805.584586-1-jonas@kwiboo.se>
 <702dc4bb-7b3c-4647-b84f-8516989b0836@gmail.com>
 <9aae8b30-23ae-4866-9ce8-02bbc8b44a82@kwiboo.se>
 <88c7b90d-4c29-453b-9a5c-9679b371a3a9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88c7b90d-4c29-453b-9a5c-9679b371a3a9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_180025_812974_05653904 
X-CRM114-Status: GOOD (  50.15  )
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

On Sun, Jul 13, 2025 at 10:56:59PM +0200, Alex Bee wrote:
> Hi Jonas,
> 
> > Hi Alex,
> > 
> > On 7/13/2025 9:13 PM, Alex Bee wrote:
> > > Hi list, Hi Jonas,
> > > 
> > > > This series adds dt-bindings and initial device tree for the following
> > > > Rockchip RK3528A boards:
> > > > - Radxa ROCK 2A/2F
> > > > - ArmSoM Sige1
> > > > - FriendlyElec NanoPi Zero2
> > > 
> > > this only sub-related to this series: Is there any particular reason, why
> > > we call the compatible "rockchip,rk3528" and not "rockchip,rk3528a"? From
> > > what I can see all boards currently supported (and those in this series)
> > > are having the RK3528A version of the SoC. I didn't follow the development
> > > here, but there are differences - I did a quick compare of the datasheets
> > > of those two SoC versions - it looks like RK3528 version has USB3-DRD
> > > controller, while RK3528A has USB3 host-only controller. Also it seems to
> > > have different video codec IPs and the DRAM controller additionally
> > > supports LPDDR4X.
> > What datasheet versions did you check? I can only find:
> > - RK3528 Rev 1.0 (2023-05-22)
> > - RK3528A Rev 1.2 (2024-04-10)
> I used
> 
> 2023-07-12 Revision V1.0
> 
> which didn't include these features - which is interesting: Why would a
> SoC vendor not try to sell all features in the first place :)
> 
> But I now double checked in
> 
> 2025-05-12 Revision 1.4
> 
> and you are right: It appears there also for RK3528A.
> 
> The only difference I could now make out by comparing v1.4 of both versions
> is the cipher engine: RK3528 additionally supports "SM2/SM3/SM4 cipher" -
> but still it exists and additionally the different video codec (if mpp
> userspace library is correct about that).
> 
> Anyway: My question was more about: Why didn't we choose the correct
> compatible from the beginning? And of course the dts files would have to be
> renamed if the compatible is changed, as they are named according to their
> SoC-compatible.

Just like what Jonas said, I was not aware of any technical
documentation at the time of writing the basic devicetree, and even for
now the only datasheet I manage to find is the 2023 revision about
RK3528 without A suffix, so I didn't realize the difference between
RK3528 and RK3528A, but just followed the vendor code and devicetree[1],
where only RK3528 is mentioned :-(

Regards,
Yao Zi

[1]: https://github.com/rockchip-linux/kernel, branch develop-5.10

> Regards,
> Alex
> > 
> > And both list LPDDR4X support and the A-variant seem to list USB3-DRD
> > support, did you mix them up above?
> > 
> > I think these SoCs are similar to rk3228/rk3229, rk3228h/rk3328 and now
> > rk3528/rk3528a, in that only the second variant support VP9 decoding.
> > 
> > Use of rockchip,rk3528a compatible could be something to change,
> > could also be something that bootloader set at runtime, similar to
> > what it does for rk3288w.
> > 
> > > I guess it would be good to discuss this before this series is merged,
> > > because re-naming *.dts files after they have been in a release is somewhat
> > > impossible.
> > I think renaming the device tree files is unnecessary, as there seem to
> > be very little difference. All boards I have come across are currently
> > RK3528A variants. How would we treat the Radxa E20C?, it is not named
> > rk3528-radxa-e20c.dtb, yet uses the A-variant.
> > 
> > For mainline U-Boot I have included printing out the SoC-variant,
> > however the compatible is not adjusted:
> > 
> >    Model: Radxa E20C
> >    SoC:   RK3528A
> >    DRAM:  2 GiB
> > 
> > Regards,
> > Jonas
> > 
> > > Regards,
> > > Alex
> > > > The bt/wifi_reg_on pins are described in the device tree using
> > > > rfkill-gpio nodes.
> > > > 
> > > > Changes in v3:
> > > > - Rename led nodes to led-0/led-1
> > > > - Remove pinctrl* props from sdio0
> > > > - Collect a-b tags
> > > > 
> > > > Changes in v2:
> > > > - Limit sdmmc max-frequency to 100 MHz on ROCK 2A/2F
> > > > - Drop clock-output-names prop from rtc node on Sige1 and NanoPi Zero2
> > > > - Drop regulator-boot-on from usb 2.0 host regulators on Sige1
> > > > - Add bluetooth and wifi nodes on Sige1
> > > > - Collect t-b tag for NanoPi Zero2
> > > > 
> > > > These boards can be booted from emmc or sd-card using the U-Boot 2025.07
> > > > generic-rk3528 target or work-in-progress patches for these boards [1].
> > > > 
> > > > For working bluetooth on ArmSoM Sige1 the patch "arm64: dts: rockchip:
> > > > Fix UART DMA support for RK3528" [2] is required.
> > > > 
> > > > [1] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk3528
> > > > [2] https://lore.kernel.org/r/20250709210831.3170458-1-jonas@kwiboo.se
> > > > 
> > > > Jonas Karlman (6):
> > > >     dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
> > > >     arm64: dts: rockchip: Add Radxa ROCK 2A/2F
> > > >     dt-bindings: arm: rockchip: Add ArmSoM Sige1
> > > >     arm64: dts: rockchip: Add ArmSoM Sige1
> > > >     dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
> > > >     arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2
> > > > 
> > > >    .../devicetree/bindings/arm/rockchip.yaml     |  17 +
> > > >    arch/arm64/boot/dts/rockchip/Makefile         |   4 +
> > > >    .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 465 ++++++++++++++++++
> > > >    .../boot/dts/rockchip/rk3528-nanopi-zero2.dts | 340 +++++++++++++
> > > >    .../boot/dts/rockchip/rk3528-rock-2.dtsi      | 293 +++++++++++
> > > >    .../boot/dts/rockchip/rk3528-rock-2a.dts      |  82 +++
> > > >    .../boot/dts/rockchip/rk3528-rock-2f.dts      |  10 +
> > > >    7 files changed, 1211 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
> > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
> > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
> > > >    create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
> > > > 

