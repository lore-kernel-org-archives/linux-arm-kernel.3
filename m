Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AAFEE4992
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaqDmlM/ryP+OBENWJT46WXB70y6ipu0Q/ItO4okUfU=; b=fopo+kOZmrPABwPHcXdenpvqRK
	dKGfVgt7wB9TYiYAetNVnCyhSitdaEeS7Ue5msF49rwUOvtexi1pj9kfP+LWWFZ2Z4w3VBVTSdWEy
	aKcviJsBprpOm8kuw6qiOaz+aFsPkxwQzQMTOJvHPA3JR5nJjb+gALrwtQmpRMkY59F/PHPE8Il0j
	HWfu7eYyeRPc/EdVOI/NDA+bgJ9h5jp5AKz7MeqlECs19bdtl0QfIB28EW3ydVZ5bpAkZU8ltR+yW
	VuU+Z1axhKpmYYmlF6az9RHgVOgKSpV2Fx4/21pGsOpv3KLjzBihnCuNtecnQ/lafETcX32MGe9rf
	BGBOTWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae0P-000000059c0-2jeS;
	Tue, 30 Dec 2025 17:59:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae0O-000000059bu-3F3q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 17:59:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B70D60017;
	Tue, 30 Dec 2025 17:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BAD0C4CEFB;
	Tue, 30 Dec 2025 17:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117574;
	bh=6GrivOnSV9jOqzRDnWFEmYWM9NxqNKhAy4AejbzzLN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oY9gtCTddPBLusMLKXjz44ZEQoG70XlxDQlVrLpwqqIhB/iHHkfWJlJgwVnZVgtji
	 40CA0Ucz22UH0WllS4RzbHhfrPVdcRLMytqaZPVKLY+o7xFcEz56r6pq3Um30d6DQh
	 TBBt/Wa+Ljgl9TOiNAZ/8pn7AeShmDaVQDtfUiKS3OW/u0kmhJcC9mklt01yBAxSgP
	 VReAvCEmBmJcy4Ff8mzF9g3LepSGOlvqUjndhZMygqcG6A/3V4MjDDffkBcHz1gu6P
	 BCKCoMLSYaUMvEX9erJXK1hqRzrcMXw7HOPTMcPkW1SHkIpSy5hncCuoCk4/r/0Wx7
	 Fxc3OGu0ZbCkA==
Date: Tue, 30 Dec 2025 11:59:33 -0600
From: Rob Herring <robh@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm: dts: lpc32xx: add clocks property to Motor
 Control PWM device tree node
Message-ID: <20251230175933.GA864856-robh@kernel.org>
References: <20251228224907.1729627-1-vz@mleia.com>
 <20251228224907.1729627-3-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228224907.1729627-3-vz@mleia.com>
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

On Mon, Dec 29, 2025 at 12:49:07AM +0200, Vladimir Zapolskiy wrote:
> Motor Control PWM depends on its own supply clock, the clock gate control
> is present in TIMCLK_CTRL1 register.

You say it is required, so does that mean this hasn't ever worked? Or it 
happened to work because something else turned on the clock?

> 

Fixes tag?

> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
>  arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> index 39af48470ed5..abd401fda94e 100644
> --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> @@ -304,6 +304,7 @@ i2c2: i2c@400a8000 {
>  			mpwm: pwm@400e8000 {
>  				compatible = "nxp,lpc3220-motor-pwm";
>  				reg = <0x400e8000 0x78>;
> +				clocks = <&clk LPC32XX_CLK_MCPWM>;
>  				#pwm-cells = <3>;
>  				status = "disabled";
>  			};
> -- 
> 2.43.0
> 

