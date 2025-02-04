Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99491C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LL6EynQq/CqLtTBz5TS778NAparj4/zu88pSMnCePWE=; b=GMolfvx7z7qtKHNycHmB4Thpo1
	kwplkuq8MlNdKe6Ybxp5AwyozUfMf4oSSaHPn8U4aofZVqZ54T0b009ifevWGJOXp2DX5Qw69npQy
	VjqsoAlfyES0sF8b8hs6ffWidOiBX3aGYWmAcBkFPPcf7Dn8SlE8sQOk9s97tWXKugeqxsnTeOsO6
	WDumxD7wuKWwEMYQNkwQ3gMM/BcIxl4fWkSc8BtfHamAeSlyhLSKrsFEv0QcSw5CI6c9AYq64TApC
	Hdm/7+0rRA4RAmuPyYdArxbu/oBUgNNEennd9uKdslk4SM+4qzwzwawfoz8AS4UnAKQjHRuRaAJLw
	n3UOpYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfH1f-00000000GIW-1xOp;
	Tue, 04 Feb 2025 11:23:31 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfH0L-00000000GCw-2dJF;
	Tue, 04 Feb 2025 11:22:11 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1738668125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LL6EynQq/CqLtTBz5TS778NAparj4/zu88pSMnCePWE=;
	b=RzRMPyaljUx6qDqfChSH4IDeOvzTMlqJydPipK0cvuIfAsU/EzEm9K32gPRYYGIVcL22pz
	fH2QDI4tSGOZeceUoxJv4J3ToL88I+BGM9uM14HcTYTutMVL+2WQ60A+YwJcwKJipD/Ufl
	FBhB1rGmFY7t/f9V1wFpH2sGGpB1vxXBdCjHwQAMWD0TjrWL+2UE9HB3rr1j3F9m0Np82R
	FUWh2qPaAOqkt6PRWKEI2mCBJ9OMRBMxZjxUO5r2qCBRW6V22S5FYWZcyBJB93DxmXmvOQ
	1MSmkxgjhDCY65PUIKWFqhsBB3mPaaJmDwR3tMlh2ACO9x0wNkgX8eGtb2eJIA==
Date: Tue, 04 Feb 2025 12:22:04 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jagan
 Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>, Michael Riesch
 <michael.riesch@wolfvision.net>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Quentin
 Schulz <quentin.schulz@cherry.de>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 3/4] arm64: dts: rockchip: add overlay tests for Rock
 5B PCIe overlays
In-Reply-To: <20250131-pre-ict-jaguar-v4-3-c971e2852e8d@cherry.de>
References: <20250131-pre-ict-jaguar-v4-0-c971e2852e8d@cherry.de>
 <20250131-pre-ict-jaguar-v4-3-c971e2852e8d@cherry.de>
Message-ID: <77b5d0efa6e56bb391575aeeb4d1be80@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_032210_035952_C4A253FE 
X-CRM114-Status: GOOD (  27.02  )
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

Hello all,

I'm sorry for being late to the party.  Please, see some important
notes below;  to sum it up, we'll need to rework this a bit.

On 2025-01-31 11:40, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> According to commit 40658534756f ("arm64: dts: rockchip: Add rock5b
> overlays for PCIe endpoint mode"), Rock 5B can operate in PCIe endpoint
> mode. For that to work, the rk3588-rock-5b-pcie-ep.dtbo overlay needs 
> to
> be applied on Rock 5B base Device Tree. If that Rock 5B is connected to
> another Rock 5B, the latter needs to apply the
> rk3588-rock-5b-pcie-srns.dtbo overlay.
> 
> In order to make sure the overlays are still valid in the future, let's
> add a validation test by applying the overlays on top of the main base
> at build time.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> b/arch/arm64/boot/dts/rockchip/Makefile
> index
> 267966ea69b194887d59e38a4220239a90a91306..ebcd16ce976ebe56a98d9685228980cd1f2f180a
> 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -150,8 +150,6 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += 
> rk3588-orangepi-5-plus.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-quartzpro64.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5-itx.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b.dtb
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtbo
> -dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-turing-rk1.dtb
> @@ -186,3 +184,11 @@ rk3568-wolfvision-pf5-vz-2-uhd-dtbs :=
> rk3568-wolfvision-pf5.dtb \
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-ep.dtb
> +rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
> +	rk3588-rock-5b-pcie-ep.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-pcie-srns.dtb
> +rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
> +	rk3588-rock-5b-pcie-srns.dtbo

After a quite lengthy excursion into the scripts/Makefile.dtbs and
scripts/Makefile.lib files, I'm afraid that the approach taken in
this patch isn't right.  Please allow me to explain.

Let's have a look at arch/arm64/boot/dts/ti/Makefile first, as an
example that provides already existing DT overlay checks.  Here's
an excerpt from that Makefile, which also provides an important cue
by mentioning CONFIG_OF_ALL_DTBS:

   12 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay.dtb
   13 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-ov5640.dtbo
   14 dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo

  135 # Build time test only, enabled by CONFIG_OF_ALL_DTBS
  136 k3-am625-beagleplay-csi2-ov5640-dtbs := k3-am625-beagleplay.dtb \
  137         k3-am625-beagleplay-csi2-ov5640.dtbo
  138 k3-am625-beagleplay-csi2-tevi-ov5640-dtbs := 
k3-am625-beagleplay.dtb \
  139         k3-am625-beagleplay-csi2-tevi-ov5640.dtbo

  213 dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
  214         k3-am625-beagleplay-csi2-tevi-ov5640.dtb \

As visible above, the DT overlays get added to dtb-$(CONFIG_ARCH_K3)
as .dtbo files (not as .dtb files), while the build-time DT overlay
tests specify the dependency chains for the overlays.

Even more importantly, the build-time overlay tests aren't supposed
to be executed until CONFIG_OF_ALL_DTBS is selected, which actually
gets handled at the very start of scripts/Makefile.dtbs:

    3 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
    4 dtb-$(CONFIG_OF_ALL_DTBS) += $(dtb-)

The way this patch modifies arch/arm64/boot/dts/rockchip/Makefile
actually isn't correct, despite apparently producing the desired
outcome, because the way it adds rk3588-rock-5b-pcie-ep.dtb and
rk3588-rock-5b-pcie-srns.dtb (instead of adding proper .dtbo names)
to dtb-$(CONFIG_ARCH_ROCKCHIP) effectively creates some kind of
"phony targets" that indeed "get the job done", but unfortunately
in a wrong way.  The "phony targets" are handled by the following
"magic" in scripts/Makefile.dtbs:

    6 # Composite DTB (i.e. DTB constructed by overlay)
    7 multi-dtb-y := $(call multi-search, $(dtb-y), .dtb, -dtbs)
    8 # Primitive DTB compiled from *.dts
    9 real-dtb-y := $(call real-search, $(dtb-y), .dtb, -dtbs)
   10 # Base DTB that overlay is applied onto
   11 base-dtb-y := $(filter %.dtb, $(call real-search, $(multi-dtb-y), 
.dtb, -dtbs))

   18 targets         += $(real-dtb-y)

Let's have a look at the relevant part of the output produced when
"make dtbs" is executed with this patch applied:

   DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
   OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
   DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
   OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb

Note the "OVL .*dtb" lines above, in which the ".*dtb" parts are
the above-mentioned "phony targets".  The above-quoted "magic" in
scripts/Makefile.dtbs is what "unfolds" those "phony targets" to
make them apparently produce the desired outcome, by populating
the $(real-dtb-y) variable with "rk3588-rock-5b-pcie-ep.dtbo
rk3588-rock-5b.dtb rk3588-rock-5b-pcie-srns.dtbo", as the proper
.dtbo names that get passed to the dtc utility.

Even more "magic" in scripts/Makefile.dtbs "unfolds" the "phony
targets" to have the build-time DT overlay tests performed in the
apparently proper way, while they actually shouldn't be performed
unless CONFIG_OF_ALL_DTBS is also selected.

With all this is mind, this patch should be reworked to follow
the right approach for defining build-time DT overlay tests, which
is illustrated in arch/arm64/boot/dts/ti/Makefile.  In particular,
we should just add the following DT overlay test definitions to
arch/arm64/boot/dts/rockchip/Makefile:

174 # Build-time tests only, enabled by CONFIG_OF_ALL_DTBS
175 rk3588-rock-5b-pcie-ep-dtbs := rk3588-rock-5b.dtb \
176         rk3588-rock-5b-pcie-ep.dtbo
177 rk3588-rock-5b-pcie-srns-dtbs := rk3588-rock-5b.dtb \
178         rk3588-rock-5b-pcie-srns.dtbo
179 dtb- += rk3588-rock-5b-pcie-ep.dtb \
180         rk3588-rock-5b-pcie-srns.dtb

You'll notice that the $(dtb-) variable pretty much again contains
the same "phony targets", but that's the way they should actually
be used.  I'm not very happy with the way they're specified, but
we should follow the approach from arch/arm64/boot/dts/ti/Makefile
anyway, and possibly improve the whole thing later.

I'd actually prefer to just have these test definitions added to the
end of arch/arm64/boot/dts/ti/Makefile, without moving the .dtbo lines
around.  That would keep the tests separate, which should be more
readable when we get more of them defined.

With the above-proposed changes in place, and with CONFIG_OF_ALL_DTBS
selected, the relevant part of the "make dtbs" output looks like this:

   DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb
   DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtbo
   DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtbo
   OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb
   OVL     arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb

No more "phony targets" in the produced output. :)

