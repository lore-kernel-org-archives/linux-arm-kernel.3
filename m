Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FD0C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGYptzQitBqvlBeqfLUR1pvxKBwqhA+k9O947J2Uzs4=; b=CC+0ycUgm9UtWw7nCE+/n+EBua
	CuqNSyTZk/8yDnpNUGkG1wOTMr4lLPyX6J1vMlhJ6h595OsTAN3StyAL46G2aLRxZ0DFHfxzdAYVP
	wJFkjBEcDLFSJGWylsPiU5aO3FTfu9wnarKcr6Vo0HB+1M9KXQ/Zh2tpr3r/DsAhkaZzTuhFt3Fau
	Hfk8P9Mre7tJOoq727MVBsTbpoqko+z6dgNWfUVExubTEH7n1nNA7JMDaCAg9Q1d1RPjo8/zalMjO
	fFxdyohL+G0mj1MEtRXNZSU/Oanfi2DLkWthqwAHZJm6vpUoZrSYdlgFkajZY7ZYni0TOjZ3x18HK
	/UPqNLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rFw-0000000G7qE-1hyG;
	Sat, 19 Sep 2026 09:21:12 +0000
Received: from flow-a1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rFt-0000000G7oh-0aJi;
	Sat, 19 Sep 2026 09:21:10 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 7A4A71380CC3;
	Sat, 19 Sep 2026 05:21:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 19 Sep 2026 05:21:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789809664;
	 x=1789816864; bh=MGYptzQitBqvlBeqfLUR1pvxKBwqhA+k9O947J2Uzs4=; b=
	KKJxgAPqGf8ffn9cEzGN/lmRPaI84KnadpYFXzKCX9hE2ejUIq68mi4u49PvWfgc
	Itlb19ZH3qr7BojbMyQRo+ba2NPVuxshKxNHPNc1n0WoFm2P82SdvXVe/ozusaqU
	UUuNFmN3pT+MAIOXefE4Sv9U8sKTnAH69sCP1ZzXN2aKc8adbqjGCZ5y3vHL5yUn
	DebvNQKunanNCX2bmcP83jS/V3bgaOaMTSMerlAWCQ2EgFBXQ1ZRTTrcYTU71eEv
	lbzAJDJUW1lP7r0QDdMJOaObYpwLv8jsh3ZCwwwsKuWBDf/iXMBIEia/Vxnb/8S7
	nxGJsoWmFpCeajtr5MutCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789809664; x=
	1789816864; bh=MGYptzQitBqvlBeqfLUR1pvxKBwqhA+k9O947J2Uzs4=; b=w
	LA7xh2o3RY19SYTpHtjFoN2bWuBr9Jl0X822TEzfg09UxehR9IxivJ/PPDbEq5vh
	xknj+g7mVbq0BrIyxwjz7mQPl76Es0GLU76nsl2Jc5PWQZ2aYnu4tSWX2U+CEbOU
	duXnb8byYslI35rhb9G1P41C+PXcxQA0LTyXYnfwnUdPfuutf27xS+i0HNDcYlJc
	mgqWClJS3odJaqniOPApq6NW3P2YBAq8VK9RlSsIgQ3yQUFHVbKCGOJnK9XiOEZD
	XKwatuiR9o5xSppMVRA8v/P+uFKq6qikqTrSgLJnHtuSO/CDe3DZZJW23Dy/fkvD
	ZW547r14CEX+ogHG402fg==
X-ME-Sender: <xms:_VOuaoMc3T-ITDLbcqgHBdCUnJzWxvJ2B31OHOBqLt2R6J_GHk_kgg>
    <xme:_VOuaqs_CdaHWRrECVh8zBB_Oyed8sjnn2zi8cyFPVs8HxgcW-AM-CDenZ6BvPCg9
    zlQ4TZCJOVtaZNgCLdbweoHYhCfqfMC5hHqD0aLFaBIweeaNQUjKTmY>
X-ME-Received: <xmr:_VOuan099myfjV70XEVtLI9rCteLcp3wwc72aBYnA1KSo0aM_0JVaFlzyhM1LK5r-Kar73jmByYogctH37tNWYeVENTK3UI>
X-ME-Proxy-Cause: dmFkZTEHzaPBOkzhEZKtlcJiHuaR/8A9YwcvLFmST50NgBICej+vTp5vMhNNvAsQoG90/2
    Jm0kDSLPlHjTl32jVWjbcwmLDSqw4GyHFeDhV0053Ev7hF2r8HtYhx1OQFrcFYUvp22zhD
    bwa3p77dJnCDUtHCllEbqhJvrcmU7/C1lASmVI5bvK/T4qtdpnBur25H1DkP7UkKXPQC/j
    elUdagyi5wVvBIc8Nks2/9BjgcJJqa08jQYX7fGyZhY2tU8D8FNMzrqNvQRW4UOnqv29DO
    Z3Z15oIGz+UspWal/6k8HrhYZj+XVKhxeKCuy8RhfhaOSuu8zlDB0q69H/9Oe3rv7hs/Wn
    ZGWF+6lY0YfPnQu0pkLeDFn6uVWRwRv3tWt2cnBI8Mig3THTVbziWZT3hx0FavRU1Rblw2
    5GJ1NCrct8YFcaHTUsLESEIG9dn4bGZyc3OuX6C4ucocsN5peK2laUn1i/p649xuZe4yDu
    V9gsVPzHsvP7DCumtstJA6KfKFLICxe7Ru/+RiSUSIleLOGD4tyf6+IMKgLo2rk4eyaZo+
    A7NyVb8ONLKLmtm+YaDKnf1kykpl1RplpJr0gIHd9q1fENpv+FWekqgFQI2/j8Oy2+G7o+
    pftD3dpMRQhb9hVe3tAsXetfhuC7wxDXeMfAKz0fypwUl3oZ3oPUXI0wHjNg
X-ME-Proxy: <xmx:_VOuah2y4LFz1PpadpumYBxfc98D0-tdHUeGo910UPdHnB2MAwoLcw>
    <xmx:_VOuaqq125S6Unzcn9Y0ECrr5LgGIJIXBZEy27KqgbK5ukiGRB_g-w>
    <xmx:_VOuai0UYZvkkFR3qjdiC9hpdOm_mE8nabOFF-wFotoZzh3c314HmA>
    <xmx:_VOuaj0j1IjBEGZ5neb_ubNG80H_nWXeTS--3M-4wyMouLo54xV9WA>
    <xmx:AFSuakOZvT35vQTN-w2q-qm0NMqiAOAQOnWSEbPNjOLlAV8dYkNEXA1S>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Sep 2026 05:21:00 -0400 (EDT)
Date: Sat, 19 Sep 2026 11:20:57 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,	Jacopo Mondi <jacopo@jmondi.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jimmy Su <jimmy.su@intel.com>,	Matthias Fend <matthias.fend@emfend.at>,
	Mikhail Rudenko <mike.rudenko@gmail.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Richard Acayan <mailingradian@gmail.com>,	Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,	Heiko Stuebner <heiko@sntech.de>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,	linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6 3/6] arm64: dts: renesas: Convert to new media
 orientation definitions
Message-ID: <20260919092057.GA1099675@ragnatech.se>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-3-5e8b1f01be29@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918-kbingham-orientation-v6-3-5e8b1f01be29@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_022109_350007_6EAE5AA6 
X-CRM114-Status: GOOD (  17.83  )
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

Hi Kieran,

Thanks for your work.

On 2026-09-18 11:44:15 +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the renesas device trees to use the new
> definitions.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso | 3 ++-
>  .../arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso | 3 ++-
>  4 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> index 3acaf714cf24..b816382bba0a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> @@ -12,6 +12,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  
>  &{/} {
>  	clk_cam_j1: clk-cam-j1 {
> @@ -44,7 +45,7 @@ cam@10 {
>  		VDIG-supply = <&reg_cam_j1>;
>  		VDDL-supply = <&reg_cam_j1>;
>  
> -		orientation = <2>;
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		rotation = <0>;
>  
>  		port {
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> index a19bc0840392..4019b80a88b7 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> @@ -12,6 +12,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  
>  &{/} {
>  	clk_cam_j1: clk-cam-j1 {
> @@ -46,7 +47,7 @@ cam@1a {
>  		vdda-supply = <&reg_cam_j1>;
>  		vddd-supply = <&reg_cam_j1>;
>  
> -		orientation = <2>;
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		rotation = <0>;
>  
>  		port {
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
> index 512810b861aa..fea1ef4a1178 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
> @@ -12,6 +12,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  
>  &{/} {
>  	clk_cam_j2: clk-cam-j2 {
> @@ -44,7 +45,7 @@ cam@10 {
>  		VDIG-supply = <&reg_cam_j2>;
>  		VDDL-supply = <&reg_cam_j2>;
>  
> -		orientation = <2>;
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		rotation = <0>;
>  
>  		port {
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
> index a31524b59834..177201a8a6d2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso
> @@ -12,6 +12,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>  
>  &{/} {
>  	clk_cam_j2: clk-cam-j2 {
> @@ -46,7 +47,7 @@ cam@1a {
>  		vdda-supply = <&reg_cam_j2>;
>  		vddd-supply = <&reg_cam_j2>;
>  
> -		orientation = <2>;
> +		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
>  		rotation = <0>;
>  
>  		port {
> 
> -- 
> 2.52.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

