Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D65C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmgZ1kuKUg8u9g60AHnNSwtJI85kh0jg6ZDj3dcr3gI=; b=WZYKUoEyAS9EXXbHbe8FUdMIWe
	PcN5R7+TUAIj4Ni9QlEaShu9FAdc183xI7vVZHLGn4i/VanEltf9+/BRGabA+TTdcgi6JuMyKDYGF
	YP/cr0Ia/uSj7NtCNc4pIsT/9iiYkKD7FhxCSmxpRARbEUMg2HGlCUBBATs4EoZXdxi5ugihX3szr
	CNxzUCd/D2lQA1wQOTdxfeE810tg2AH67LeytjIfSN+BCHbiCVTc3mSEL+5Cje6j9jC2paLex2f49
	HhrRfU02tvLUQYbifzmUH0PqsBTbXH4usi+O7daVBDH3z6XBS/RKQpF6Xf8lT+z/w18fRIzqKlvep
	idVo51ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsM7U-00000008ZNq-3OiO;
	Wed, 12 Mar 2025 13:27:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLMr-00000008QWF-0iaP;
	Wed, 12 Mar 2025 12:39:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFDB65C4645;
	Wed, 12 Mar 2025 12:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498D8C4CEEC;
	Wed, 12 Mar 2025 12:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741783164;
	bh=qXP7e9cKm6PJkk8q6/yjyEe53myvFFMcXHURqJ4AGdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Df38IDxapPmYq0zj8nu7ZQSbnwY8pnZmSMx0hk57NPggET6m5SxqoxMxvXfCLiYbE
	 7hSCkbEnTKrJYxlafMpI/CqdqAJG0QsoOrfR7kyQa6ClWUpNPrklWixAZ2P5LAYAO2
	 f3O2VROq161I6dyFkTroLnTQIs5f2/G+PP6aH1JQ1WXw/b2t1QRqBT7pqoJtsAGakz
	 VQxCAqC6tamSVx7P7/huVu/RjNohRfFOjijFn/TbbO8L9X2DikiCEGls1om9xW8zP3
	 O2W7Y0MPNVHSxavqmiXHrAPqY9GFXEtQ8D/7/8bEpCjMkWaUEY0jDcBw0pwAl7Ixua
	 6j18oVK5zQZiw==
Date: Wed, 12 Mar 2025 14:39:17 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, 
	cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org, yubing.zhang@rock-chips.com, 
	krzk+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: rockchip: Enable DP2HDMI for ROCK 5
 ITX
Message-ID: <q3y36jgswj4xa2g3hnptc6kgzphbqfg675r5paa2lwvdseytio@jysj4f2i6osu>
References: <20250312104214.525242-1-andyshrk@163.com>
 <20250312104214.525242-8-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312104214.525242-8-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_053925_295758_5A5CCEA8 
X-CRM114-Status: GOOD (  19.81  )
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

On Wed, Mar 12, 2025 at 06:42:08PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> The HDMI Port next to Headphone Jack is drived by
> DP1 on rk3588 via a dp2hdmi converter.
> 
> Add related dt nodes to enable it.
> 
> Note: ROCKCHIP_VOP2_EP_DP1 is defined as 11 in dt-binding header,
> but it will trigger a dtc warning like "graph node unit address
> error, expected "b"" if we use it directly after endpoint, so we
> use "b" instead here.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> ---
> 
> (no changes since v1)
> 
>  .../boot/dts/rockchip/rk3588-rock-5-itx.dts   | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> index 67b886329248..29f10ec9f0c1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts
> @@ -57,6 +57,18 @@ analog-sound {
>  			  "Headphone", "Headphones";
>  	};
>  
> +	dp-con {
> +		compatible = "dp-connector";

You've written that it is an HDMI connector. Could you possibly clarify,
why is it being registered as a DP connector? Is there any kind of
a bridge between the DP controller and the HDMI connector?

> +		label = "DP OUT";
> +		type = "full-size";
> +
> +		port {
> +			dp_con_in: endpoint {
> +				remote-endpoint = <&dp1_out_con>;
> +			};
> +		};
> +	};
> +
>  	gpio-leds {
>  		compatible = "gpio-leds";
>  		pinctrl-names = "default";
> @@ -268,6 +280,24 @@ &cpu_l3 {
>  	cpu-supply = <&vdd_cpu_lit_s0>;
>  };
>  
> +&dp1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&dp1m0_pins>;
> +};
> +
> +&dp1_in {
> +	dp1_in_vp2: endpoint {
> +		remote-endpoint = <&vp2_out_dp1>;
> +	};
> +};
> +
> +&dp1_out {
> +	dp1_out_con: endpoint {
> +		remote-endpoint = <&dp_con_in>;
> +	};
> +};
> +
>  &gpu {
>  	mali-supply = <&vdd_gpu_s0>;
>  	status = "okay";
> @@ -1262,3 +1292,10 @@ vp1_out_hdmi1: endpoint@ROCKCHIP_VOP2_EP_HDMI1 {
>  		remote-endpoint = <&hdmi1_in_vp1>;
>  	};
>  };
> +
> +&vp2 {
> +	vp2_out_dp1: endpoint@b {
> +		reg = <ROCKCHIP_VOP2_EP_DP1>;
> +		remote-endpoint = <&dp1_in_vp2>;
> +	};
> +};
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

