Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC01CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 01:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1i8L10GRky4bG22WnSj3l/2lPWD2x42vP1059qe6SY4=; b=J+t289iUd2UnmKqQixyzMoDwmI
	sPz9b+EyGrjUWbE9I/Tt+/vmprLHd5U8qXINf033dAYAPtvpU/JWdkApnq/1SJXeORYV7YEQOTmyl
	2KFah7TCi1fRTtReNOuprwi5TCHbzsRNG1A/648p0VQw38mZy5AVA+cKo/dtogcK29vwY8G5lVQ8D
	hBlkT12RXl5UcVFtms4AS/C4b6txwPYLVteIOY1b2lcA1sjYP16ylBDxtepuzeZ8anv4bbW6lGwnn
	Iezx3ZLB1V0nMm/XXqdRVqykYr5JBIMp40kZi6H8/BlIbQVf5XhSJYs/oLQC7/S7lreSsvPpzXSa2
	IdOoP3Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFihC-00000008dKx-4733;
	Sun, 11 Oct 2026 01:49:50 +0000
Received: from mail-m60244.netease.com ([210.79.60.244])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFih8-00000008dKM-3X5Y;
	Sun, 11 Oct 2026 01:49:50 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5097b761b;
	Sun, 11 Oct 2026 09:49:39 +0800 (GMT+08:00)
Message-ID: <8bf7a001-8b65-4129-8b41-a2986bb78643@rock-chips.com>
Date: Sun, 11 Oct 2026 09:49:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable HS400 enhanced strobe on
 Kobol Helios64 eMMC
To: iav@iav.lv, Heiko Stuebner <heiko@sntech.de>
References: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261011-b4-helios64-emmc-hs400-v1-1-36951d319229@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa128a6c25703a4kunm693df481f314c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0JPVkoZQ0lJTE0YTh5PSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=DunVzkjct1HK2gDhGF78vAGWOTvXmbTFQCh7jdOS9zME+63fNyXovf246jrlLtHymCuh7IhBhE6hXj7e22ZxFXxNQRR65irjZ3/7IU3Y41SWAfKeJWwf5C0gppNIqzSez7L2SkUBt7yRgAX2XFZGGv4ZhPowE9pEnx+s9w7iurY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=1i8L10GRky4bG22WnSj3l/2lPWD2x42vP1059qe6SY4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_184947_463102_70ACF2EA 
X-CRM114-Status: GOOD (  16.17  )
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

在 2026/10/11 星期日 5:52, Igor Velkov via B4 Relay 写道:
> From: Igor Velkov <iav@iav.lv>
> 
> The eMMC of Helios64 runs in HS200. Run it in HS400 enhanced strobe at
> 150 MHz, as on Gru. The strobe line goes straight from the SoC to the
> DS pin of the eMMC with no pull-down on the board, so enable the one
> in the eMMC PHY.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Schematic, sheet 14:
> https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
> 
> Tested on mainline with three 2 GiB write and read-back passes, no
> errors. Raw reads go from 180 MB/s in HS200 to 247 MB/s. Without the
> pull-down, writes dropped to about 1 MB/s with repeated
> "mmc1: running CQE recovery".
> ---
>   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index 63ad79b4c8ac..f78482c4c285 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> @@ -320,6 +320,7 @@ &cpu_l3 {
>   };
>   
>   &emmc_phy {
> +	rockchip,enable-strobe-pulldown;
>   	status = "okay";
>   };
>   
> @@ -586,8 +587,11 @@ &saradc {
>   };
>   
>   &sdhci {
> +	assigned-clock-rates = <150000000>;
>   	bus-width = <8>;
>   	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
>   	non-removable;
>   	vqmmc-supply = <&vcc1v8_sys_s0>;
>   	status = "okay";
> 
> ---
> base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
> change-id: 20261011-b4-helios64-emmc-hs400-9c784f35d8dd
> 
> Best regards,


