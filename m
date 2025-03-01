Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902DDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 11:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kfw7S9PISxlM8JOdG0c7ZWnrCqjKJ+Nf2RtZxDfeUiM=; b=gnKd7DF05e14UT4DLVJm3u/9Uq
	brjPjRSiBj+j+W5AzTYhMusxuraEVxVTBkmI9759ltPy+vFMw/elO0ArnsICqRKwIlQQ/xaKFqNEI
	uArIzNxPYp3kJ0zNCvkGakcvXx7Up/W3oP1AtkrWqzvEZ8Go20q22oRp3gbr4tunVvyX+1hGfRHnF
	i6/OqR1Knbr/X72LhBCJuJYHp8ybSMrmYEc3VUmjrDN5eywDrB6Z02iVX5+yy7YBayGbYXi5RYbY3
	oTOdII2jLXHl4l/Rde725mmBEHiIykZ8DCF+xB7CtFGsDgLBycHbaVFMuf3sLPaCXbfpTVMtJZwNs
	53Kvmh0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toKag-0000000DnjV-18In;
	Sat, 01 Mar 2025 11:01:06 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toKTd-0000000Dn8Y-39Bm;
	Sat, 01 Mar 2025 10:53:51 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 09C4825C6C;
	Sat,  1 Mar 2025 11:53:48 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eePE81pfhHnS; Sat,  1 Mar 2025 11:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740826427; bh=CJzhoN8ea/k1Fetjo1S8JrpXLfZw8rrH+qRLx50b1Os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L90RqOFErJ0UJUHz22ZdufLaHFD3mG8PeoJycaWRLI3UH1L7EL5t5CqMz4MhubUNl
	 h1q35UqDQVizPDdg5sc28yeaOCPc8N68dIsreZhmCmixO/RZoJYoqpmBe5TeLtOp2f
	 gfUAc3XdJ6lGELMiVkGi9iWtqRRGLRtQd+DDhFXDozVP8IK/OxkLTmmVP56llu0GeI
	 BKYmPjlVgViP1lhHP07anCPRj4P55HDdZbD6SeVuswGO5y1y2CXPCIxMdJpdLjvhI8
	 OQOYFmko3tkqZyT4urFDRVvAwW/OtxarrKRAdggb/KdBFTJXxdmxKgHc1FZkTnWrFm
	 1TPzwVCVkWYEA==
Date: Sat, 1 Mar 2025 10:53:21 +0000
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: clock: Add GRF clock definition for
 RK3528
Message-ID: <Z8LnIfDWZtuwoUrk@pie.lan>
References: <20250301104413.36335-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301104413.36335-1-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_025349_924274_EA016FBF 
X-CRM114-Status: GOOD (  14.77  )
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

On Sat, Mar 01, 2025 at 10:44:13AM +0000, Yao Zi wrote:
> These clocks are for SD/SDIO tuning purpose and come with registers
> in GRF syscon.

Please ignore this e-mail and refer to the series[1] instead, I missed
--in-reply-to when sending. Sorry for the noise.

Best regards,
Yao Zi

[1]: https://lore.kernel.org/all/20250301104250.36295-1-ziyao@disroot.org/

> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  include/dt-bindings/clock/rockchip,rk3528-cru.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/rockchip,rk3528-cru.h b/include/dt-bindings/clock/rockchip,rk3528-cru.h
> index 55a448f5ed6d..0245a53fc334 100644
> --- a/include/dt-bindings/clock/rockchip,rk3528-cru.h
> +++ b/include/dt-bindings/clock/rockchip,rk3528-cru.h
> @@ -414,6 +414,12 @@
>  #define MCLK_I2S2_2CH_SAI_SRC_PRE	402
>  #define MCLK_I2S3_8CH_SAI_SRC_PRE	403
>  #define MCLK_SDPDIF_SRC_PRE		404
> +#define SCLK_SDMMC_DRV			405
> +#define SCLK_SDMMC_SAMPLE		406
> +#define SCLK_SDIO0_DRV			407
> +#define SCLK_SDIO0_SAMPLE		408
> +#define SCLK_SDIO1_DRV			409
> +#define SCLK_SDIO1_SAMPLE		410
>  
>  /* scmi-clocks indices */
>  #define SCMI_PCLK_KEYREADER		0
> -- 
> 2.48.1
> 

