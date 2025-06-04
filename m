Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13FFC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc5G8Yf2oKEcs0kpIQpTG3DAUw9YNL8AgIzXMGGn/tg=; b=Hx5NWC6ycUGgJseODH15I+eT8D
	GLN6REPqKzU1qyEBRjP4mgm4wpLeJOQOpESEauCLdJ82i7HS1sjFWvolW68qHV+QfCZNbbR6mbDoz
	i6JTsuWOT8ns1Q++5YmEAZOkdNdIckqL/gHefLCG23DMHukrEhqB9kL/Ac/UQBkWlWNc8yTPptMeZ
	20rDE1LjO6QYlrzJdODPISZYVNfh/VcL6QTqsrEPEYtC26LouzJpzioj1kqsPDJEGHxMabUnzI3Zf
	AJ7x844OV5lkyvKlMQ6RsltU2nYjII/8xezyg8kAX72Rq2dfZDk6EZZ1/rYz4SnGHOXY61ESa5nZL
	0NWDuigw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMofI-0000000DVvL-1orZ;
	Wed, 04 Jun 2025 14:00:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uModB-0000000DVQA-0Ekn;
	Wed, 04 Jun 2025 13:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4BEACA505CD;
	Wed,  4 Jun 2025 13:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE84DC4CEE4;
	Wed,  4 Jun 2025 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749045492;
	bh=DmoZb/9o3rHGp2jGpcgoTHMl8Ju66rgQCq7at8FrRfM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Fb1apBZg+VOhlfLXG1iDiloTrcIMRFweni9mL+9petMCQ5sqx1/Ay5x4uPlWMHyFA
	 RPU58NRypx5ukcZPLC40Gxx5v2ti+g2uLIGi2YwAxn/yuXikFUdyfGw332fZ9TpAnY
	 3fg0DV30D+fSSS9/2as7/N2zy0B96Mbt9pqK1ZNcio0dXO6IbhCCfnI9/0cCHxzWqn
	 7IHKk1Svq3I+hpK5ouwT71QmpS4xbqTBZFaEhIqjg74QcVUPo44fybVwCV+mYmzGt9
	 7LxVyNiOKoincQzEV3t9EaykZj8625C4CFBO2SDxztmTIIq3J0+Hj8U6s1dcGrcpg+
	 xdi4F/0uPUaBg==
Date: Wed, 04 Jun 2025 08:58:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
To: Alexey Charkov <alchark@gmail.com>
In-Reply-To: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
Message-Id: <174904540020.3869609.29886103068021354.robh@kernel.org>
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: enable further peripherals
 on ArmSoM Sige5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_065813_228779_67BC8963 
X-CRM114-Status: GOOD (  22.75  )
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


On Tue, 03 Jun 2025 21:01:12 +0400, Alexey Charkov wrote:
> Add support for the two USB type A ports, link up the CPU regulators for
> DVFS, enable WiFi and Bluetooth.
> 
> The bluetooth part might warrant some discussion and thoughts from the
> list, given that it's connected over UART and thus not discoverable. At
> the same time, there are two revisions of the board which have different
> Bluetooth chips soldered on: Realtek based on v1.1 and Broadcom based on
> v1.2. I'm not sure if there is any way to determine board version from
> software. Mine is v1.2, so the respective patch deals with the Broadcom
> case only, but maybe it's better to move it into a .dtso and thus kick
> the can down the road (i.e. make the user deal with board identification
> and loading of the right overlay)? Thoughts welcome.
> 
> Best regards,
> Alexey
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Alexey Charkov (4):
>       arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
>       arm64: dts: rockchip: enable USB A ports on ArmSoM Sige5
>       arm64: dts: rockchip: enable wifi on ArmSoM Sige5
>       arm64: dts: rockchip: enable bluetooth on ArmSoM Sige5
> 
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 135 +++++++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  16 +++
>  2 files changed, 151 insertions(+)
> ---
> base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
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
 Base: using specified base-commit 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/rockchip/' for 20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com:

arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
	'rockchip,rk2928-dw-mshc' was expected
	'rockchip,rk3288-dw-mshc' was expected
	'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
	'rockchip,rk2928-dw-mshc' was expected
	'rockchip,rk3288-dw-mshc' was expected
	'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
	'rockchip,rk2928-dw-mshc' was expected
	'rockchip,rk3288-dw-mshc' was expected
	'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#
arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: mmc@2a320000 (rockchip,rk3576-dw-mshc): compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3576-dw-mshc', 'rockchip,rk3288-dw-mshc'] is too long
	'rockchip,rk2928-dw-mshc' was expected
	'rockchip,rk3288-dw-mshc' was expected
	'rockchip,rk3576-dw-mshc' is not one of ['rockchip,px30-dw-mshc', 'rockchip,rk1808-dw-mshc', 'rockchip,rk3036-dw-mshc', 'rockchip,rk3128-dw-mshc', 'rockchip,rk3228-dw-mshc', 'rockchip,rk3308-dw-mshc', 'rockchip,rk3328-dw-mshc', 'rockchip,rk3368-dw-mshc', 'rockchip,rk3399-dw-mshc', 'rockchip,rk3528-dw-mshc', 'rockchip,rk3562-dw-mshc', 'rockchip,rk3568-dw-mshc', 'rockchip,rk3588-dw-mshc', 'rockchip,rv1108-dw-mshc', 'rockchip,rv1126-dw-mshc']
	from schema $id: http://devicetree.org/schemas/mmc/rockchip-dw-mshc.yaml#






