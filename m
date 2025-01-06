Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD13E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 19:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqoUEBSQZIsop5h7cyh3uwVMLcksY9eE0elSsXyzhlM=; b=YZVgYZEyFxRqx0E6Kejse4hQr/
	YubdyiGglbU5GjJGcAuB3XtWjJhyJ8znPJHl09k4mFArvBy3I7s/3z5QppiljMHrv/CThduyuQZNc
	falL+w6mnN0srKxQEwWyvslvl5Y8+92xrUPA5esit+PgYQJjfKG5Yea5NF55rzevn39/3B+Bf4HnD
	KY+YSvUBhYfQxuz2410uEUBWsdIDlGZVGJxDdQyaHt1cgDhoUkuY6ceZkKroWEMeo/+ynPEoFbd5J
	xUc75n3rZMqCdLyXlqr03wxendgYo8aoU9pm+D+DJr1Vn9Rkz9EpwK0BARwjWJzWp7vmeKBNB60cc
	MiOGNN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsnz-00000002S1h-1FAQ;
	Mon, 06 Jan 2025 19:30:27 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUsld-00000002Rds-0bou;
	Mon, 06 Jan 2025 19:28:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7CD24A41D88;
	Mon,  6 Jan 2025 19:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3CAEC4CED6;
	Mon,  6 Jan 2025 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736191680;
	bh=5tsX07eTkRoFq5Nm38qev6WjEZVcUzeCa6oqpna7Ed8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kgRlgU8GU1TddcQJm0LiALzx0MqBz6jPBo89Q7e/Hkl+AJZc3RVrJtwjodqAkU3c4
	 Y3lftu93fHXW79FbIhDfGSXri633ulM9+eXy+anXy3iXQuyECl3EeM6zbw+v+F5RVP
	 mPFJqdHUPyqX9LFROjM3icAhY0LkhsvtrvsFBFA8XxCrXhp1Tl/OjUtmCG7DZEyBjo
	 /zmLu2XcCTfmEwInaUb2F4tx1hOOQN9LqVpLic3BysOkyjM3/IeH1hlP93jQzdnMjJ
	 ZJuiw3fhZqGEE7oF+mA4NsdZuTTortuiquR9MF+TuzxGHgAuRnlhaLDTMZVhq/KymB
	 6suevT9PiD80g==
Date: Mon, 06 Jan 2025 13:27:59 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-rockchip@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
In-Reply-To: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com>
References: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com>
Message-Id: <173619154694.838812.1604486663887944578.robh@kernel.org>
Subject: Re: [PATCH 0/2] arm64: dts: rockchip: Add H96 Max V58 (RK3588
 based TV box)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_112801_342483_B068AB7F 
X-CRM114-Status: GOOD (  21.01  )
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


On Mon, 06 Jan 2025 01:07:16 +0400, Alexey Charkov wrote:
> H96 Max V58 is a compact TV box based on Rockchip RK3588 SoC [1]
> that ships with Android by default. Add support for it.
> 
> Note that there is no publicly available hardware documentation,
> nor vendor sources to be used as a reference, so this implementation
> is best effort based on poking around my board and staring at the
> decompiled stock DTB. It works for me, but improvement suggestions
> are very much welcome.
> 
> HDMI output is not tested, but expected to work.
> 
> SPDIF output is not enabled (base RK3588 .dtsi needs amendment)
> 
> Auxiliary LED display is not enabled (no mainline driver available).
> The controller used is FD6551 connected to GPIO3 RK_PC7 (clk) and
> GPIO3 RK_PD0 (data), which happen to be the right pins for
> i2c5m0_xfer pinctrl config, and thus might potentially be used with
> the hardware I2C5 controller (to be verified). Out of tree userspace
> driver is available at [2].
> 
> [1] https://www.h96tvbox.com/product/h96max-v58/
> [2] https://github.com/arthur-liberman/linux_openvfd/blob/master/driver/controllers/fd650.c
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Alexey Charkov (2):
>       dt-bindings: arm: rockchip: Add H96 Max V58 TV box
>       arm64: dts: rockchip: Add H96 Max V58 TV Box based on RK3588 SoC
> 
>  .../devicetree/bindings/arm/rockchip.yaml          |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 785 +++++++++++++++++++++
>  3 files changed, 791 insertions(+)
> ---
> base-commit: af349ca4d3f8659d84abc667125c826fda155109
> change-id: 20240618-rk3588-h96-max-v58-c2c1bf8e6996
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3588-h96-max-v58.dtb' for 20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com:

arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: syscon@fd5d0000: usb2phy@0:otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: usb2phy@0: otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: regulator-3v3-pcie: gpios: [[267, 1, 0], [187, 20, 0]] is too long
	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: regulator-3v3-pcie: Unevaluated properties are not allowed ('gpios' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#






