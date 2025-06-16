Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B27C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgP/UZ9aiTn7ARdenejdERI2DPDczTa3wghA3VFKd/s=; b=jUFQ2TeXBSIKdrcQHcR1timxsT
	vulN8+m6v2qq3heLkxPN07aQcTbaaLYqGH8VwI4igimr3Ly9Wi7sdr1SM9GJP4/EJSVEwh82StF4k
	QACgknNI/zpgBpilDr4VbKYoaR9aq8dwNMWhFlbCwpdK9KkYi6NsVeJJ1C+v8uBNdVPYjIpR9Prp1
	9c976QN1OVjCNj29OgPP/MBlB00ej9rxAitOWBRC6YDUHRgRfdOxyB9gj/7yYbNDevMFZIuberi3+
	A+NTM3waLw8GMEEA/P9vM/zuzYkdwMboSHqQSVcUorQHQCDQC/MbcFu4QA49w7lZfJ4y5MehK5xvE
	RcBqBUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHmY-00000005d5Y-3tiw;
	Mon, 16 Jun 2025 21:54:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHfL-00000005bhA-3SMc;
	Mon, 16 Jun 2025 21:46:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FD6E4AE9E;
	Mon, 16 Jun 2025 21:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01A5C4CEF5;
	Mon, 16 Jun 2025 21:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750110415;
	bh=lAcy14owpRzsFcmmXaUy8Ue2E7S1558QynG8B47P8O8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pH1Axf1V8bPyNxC6wmvG/lSQK1WlBOXm1q7U2qvfRdqTw/CUDLoXfddLs9h4A2UTr
	 KfigPlZAThSWo7ZusG2+0oplV1umoh9NvNW3GqHDpgl4YiS3knsbo8XxRhHOgOXU9+
	 PhffMTLgRjAlX4oFyD/jt9hG/JZmBN0SxzlcvumH5W4bXAl9GZfqUzPLjfeNN6nZHS
	 /XamOiOLY9XTplnUUez5rnsHVdBOgq3c/0rj+p6NrFEku9XL/EOiLeCJgFHe0galXp
	 20uHhVOpQ9ANUImErbreQsgRsRdH5paf+nriR4wnl+OXtpOYVX75TnCRUNlLN1/AlC
	 QZJUtQkAPEdfw==
Date: Mon, 16 Jun 2025 16:46:54 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
To: Alexey Charkov <alchark@gmail.com>
In-Reply-To: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
Message-Id: <175011005578.2433766.276755788637993361.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] arm64: dts: rockchip: enable further
 peripherals on ArmSoM Sige5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_144655_903722_B5611B8F 
X-CRM114-Status: GOOD (  20.89  )
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


On Sat, 14 Jun 2025 22:14:32 +0400, Alexey Charkov wrote:
> Link up the CPU regulators for DVFS, enable WiFi and Bluetooth.
> 
> Different board versions use different incompatible WiFi/Bluetooth modules
> so split the version-specific bits out into an overlay. Basic WiFi
> functionality works even without an overlay, but OOB interrupts and
> all Bluetooth stuff requires one.
> 
> My board is v1.2, so the overlay is only provided for it.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Changes in v2:
> - Expand the commit message for the patch linking CPU regulators and add
>   tags for stable (thanks Nicolas)
> - Fix the ordering of cpu_b* nodes vs. combphy0_ps (thanks Diederik)
> - Drop the USB patch, as Nicolas has already posted a more comprehensive
>   series including also the Type-C stuff (thanks Nicolas)
> - Pick up Nicolas' tags
> - Split out board version specific WiFi/Bluetooth stuff into an overlay
> - Link to v1: https://lore.kernel.org/r/20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com
> 
> ---
> Alexey Charkov (4):
>       arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
>       arm64: dts: rockchip: add SDIO controller on RK3576
>       arm64: dts: rockchip: add version-independent WiFi/BT nodes on Sige5
>       arm64: dts: rockchip: add overlay for the WiFi/BT module on Sige5 v1.2
> 
>  arch/arm64/boot/dts/rockchip/Makefile              |  5 ++
>  .../rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso  | 49 +++++++++++++
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 85 ++++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 16 ++++
>  4 files changed, 155 insertions(+)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250602-sige5-updates-a162b501a1b1
> 
> Best regards,
> --
> Alexey Charkov <alchark@gmail.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com:

arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl (rockchip,rk3576-pinctrl): i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximum of 13
	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#






