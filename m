Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250C4CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 02:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3XsxM7Raaf9zxJmtajP5sjAF5HH4qDLmz+vLnVBR2Q=; b=FLh5Hh5ElzTEAjIhZNOO/2nqhC
	OoXHpGByhr1v0dfTj3VXRIgP9/UW53uTUHKci5D6iaWDihkCWiiijpWP+idSofEFlPQamUm+quGhM
	G3qhUmZpsOfzkE23+aEJXVtqbNywmryHTgJ6RK6clTX52XL5ygbPDcOSVudQR7Z9qutZEaBWZHONY
	LwK+XsDcgGmgsvCLWBV/mlUtFMJ+jdvHhals8l7a7P1koJmgRmY4VqToOxCzU1dCGtaRBAm1o8Tyo
	9W4KfYUvQ2Z7gvHSAqQwLbc8CgjCWZ35Y+L9lam9YU4qlfZdDtdcizbPEKkQxxizTR1e5bCUrlMCf
	vM8CHELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBCQ-0000000GfPR-143b;
	Thu, 15 Oct 2026 02:28:06 +0000
Received: from mail-m82220.xmail.ntesmail.com ([156.224.82.220])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBCI-0000000GfNU-0gCv;
	Thu, 15 Oct 2026 02:27:59 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 511900f41;
	Thu, 15 Oct 2026 10:27:53 +0800 (GMT+08:00)
Message-ID: <5b62d754-aedc-407f-b36b-7c4fe54908a9@rock-chips.com>
Date: Thu, 15 Oct 2026 10:27:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Diederik de Haas <diederik@cknow-tech.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/9] arm64: dts: rockchip: rk3588s-nanopi: enable
 mmc-hs400 and add supplies
To: joachim.eastwood@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20261014-nanopi-m6-improvements-v1-0-e713f71eb4d3@gmail.com>
 <20261014-nanopi-m6-improvements-v1-2-e713f71eb4d3@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261014-nanopi-m6-improvements-v1-2-e713f71eb4d3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13d6333c703a4kunmb59026b23a1f60
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQxkeVkIdTRoYGENLHU9MT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gCg1VFET44YTPOVLCAxAgb8ExIvPx7MJBBFRca7F3+ygjpZogrF0wXL3eL34B2LopI7lcrDcemdf7LHtnTuBvIqduRVud0Dcrbdqvpmi2dS5nM8CxzkSwZSEVocUPnyrr2lDGc17uRQC17SwftQKYOSNepen9jbboiWTenInAZc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=R3XsxM7Raaf9zxJmtajP5sjAF5HH4qDLmz+vLnVBR2Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_192758_572222_C91CEC09 
X-CRM114-Status: GOOD (  13.05  )
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

在 2026/10/15 星期四 0:33, Joachim Eastwood via B4 Relay 写道:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> The NanoPi 6 series all support eMMC 5.1 HS400 mode. This also matches
> the vendor device tree. Also add power supplies while at it.
> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>

Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>

> ---
>   arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index 8c36268e9876..8c77ee71ebf8 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -390,7 +390,10 @@ &sdhci {
>   	no-sdio;
>   	no-sd;
>   	non-removable;
> -	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	vmmc-supply = <&vcc_3v3_s3>;
> +	vqmmc-supply = <&vcc_1v8_s3>;
>   	status = "okay";
>   };
>   
> 


