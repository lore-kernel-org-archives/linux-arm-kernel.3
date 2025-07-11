Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D39C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx7PMx/DEFo9giDhkRCttbFZkh2ZC5i/d6MxX8neTZg=; b=DN64uQyH7f6XVmaEgN3Wyebebk
	H0s/lj10WSCwmNGBW2eSr8RMhzRqae3ocFZWUWOXcyO1ucd3dXcQ2oW9fsy2FAFpZ6moiKFOIRTbP
	iRkspLfpLcwPi2cLbAD7zONeazG7bTXnc9vrjuAYafQCRFuJ4MT3Wp6K8jFNTizOypAg+m9NXqj4Y
	+w1epZxQqSt6nxZULGkaTCh7KG25OCv2XqPqP/T8f+qNRDQODCYf6hL7TtQqjbFsil5nz4fwE744y
	FjXtZoqWjFLX1YZMqzcxRwv/2fXP3yyaDCG4O71F5TW90PqC7RiZLbICDaFSdlzOXY/vv4SOirMTK
	fefhyJ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaK7u-0000000Flj0-1Blr;
	Fri, 11 Jul 2025 20:13:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIkT-0000000FZ0x-372G
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:45:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BFCA16F8;
	Fri, 11 Jul 2025 11:45:18 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 037533F694;
	Fri, 11 Jul 2025 11:45:26 -0700 (PDT)
Date: Fri, 11 Jul 2025 19:43:38 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: iuncuim <iuncuim@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.or>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: enable Mali GPU for
 all boards
Message-ID: <20250711194338.52532eca@minigeek.lan>
In-Reply-To: <20250711035730.17507-4-iuncuim@gmail.com>
References: <20250711035730.17507-1-iuncuim@gmail.com>
	<20250711035730.17507-4-iuncuim@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_114529_873407_2BABC371 
X-CRM114-Status: GOOD (  15.70  )
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

On Fri, 11 Jul 2025 11:57:29 +0800
iuncuim <iuncuim@gmail.com> wrote:

> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> All devices based on the A523/A527/H728/T527 processors contain a G57 MC1 GPU.
> 
> Enable the DT nodes for this GPU and specify a regulator that supplies power
> to the SoC's VDD_GPU pins. The other parameters are set in the SoC dtsi,
> so are board independent.

Checked the schematics of the three boards where those are available,
and it's indeed DCDC2 there providing the voltage. For the X96QPro+,
regulators.txt in debugs confirms this as well.

> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 5 +++++
>  arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 5 +++++
>  arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 5 +++++
>  arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 5 +++++
>  4 files changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> index 8bc0f2c72..553ad774e 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
> @@ -66,6 +66,11 @@ &gmac0 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&reg_dcdc2>;
> +	status = "okay";
> +};
> +
>  &mdio0 {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> index 59db10354..a96927fbd 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
> @@ -54,6 +54,11 @@ &ehci1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&reg_dcdc2>;
> +	status = "okay";
> +};
> +
>  &mmc0 {
>  	vmmc-supply = <&reg_vcc3v3>;
>  	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> index 142177c1f..b9eeb6753 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
> @@ -76,6 +76,11 @@ &gmac0 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&reg_dcdc2>;
> +	status = "okay";
> +};
> +
>  &mdio0 {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index 5f97505ec..d07bb9193 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -95,6 +95,11 @@ &ehci1 {
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&reg_dcdc2>;
> +	status = "okay";
> +};
> +
>  &mmc0 {
>  	vmmc-supply = <&reg_cldo3>;
>  	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */


