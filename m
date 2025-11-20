Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4988CF8857
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47n9smvsUtbRtdfwye4aUg0o9m4HmyLtFLAnv1nbXP4=; b=iindtfPKuOdMnUqCo/aK3hIg3y
	tUN6pkYRjA38wRrXwVy+6LEPAaMpZV7/vgmBVSdYffKzwCrD94o5+d/yXWPUxR4pDM6RmdVCooPD4
	vvPM+gtg1LiEtaagz9fp7KgBx/bQ/9Ao/0YRCCmfeXqPk7n5JDtmTpfI8zZeqdiPSBcjH0ySQ0uVz
	eRnLXBpqv3s9JD390hfEpU0NeisXWgAcv6fGsyhW0C9XobZ2o2cQEzKMs8RmfjhEuIwZW/s98+RZ3
	fohiRxeSeymk5idL6HhW5C142jdPCeO/lRsvUfHF3ohs3lOt0xuyQNN6pHlqTaV4oGvwY5nRb1xPh
	vwtw3VCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Fy-00000006gqq-0Bhc;
	Thu, 20 Nov 2025 12:59:26 +0000
Received: from mail-m49245.qiye.163.com ([45.254.49.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Fv-00000006gpx-0UrC;
	Thu, 20 Nov 2025 12:59:24 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2a4ca15e8;
	Thu, 20 Nov 2025 20:59:17 +0800 (GMT+08:00)
Message-ID: <a73ea843-6896-4153-9a2b-668a91adba5d@rock-chips.com>
Date: Thu, 20 Nov 2025 20:59:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/5] arm64: dts: rockchip: remove mmc max-frequency for
 100ASK DshanPi A1
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
References: <20251120120011.279104-1-amadeus@jmu.edu.cn>
 <20251120120011.279104-2-amadeus@jmu.edu.cn>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20251120120011.279104-2-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9aa15906e609cckunmccfeb5ed18445b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUkdSFZLSRoeSxlJGU8dGkNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=hJAe7CO0ZSEZNO0KDe8CoVAiS/i+TOEMzk+xlDPP7dtwU5rI7mHgSjXkcIRlCwszrhOqlBh/KGk9OQFCia3hnH2R24GEGQzsr6qmmrtSC7uzRukV27Iz/XsZ21GsCOegP4VASBnS06u5jtjeCgwobC/MqGPBeyn+I0auIKIaVJM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=47n9smvsUtbRtdfwye4aUg0o9m4HmyLtFLAnv1nbXP4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_045923_362894_86BE5134 
X-CRM114-Status: GOOD (  11.93  )
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

在 2025/11/20 星期四 20:00, Chukun Pan 写道:
> The max-frequency property is already defined in the mmc
> node of rk3576.dtsi. Remove the redundant definition.
> 

Reviewed-by: Shawn Lin <shawn.lin@rock-chips.com>

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
> index cb04ab96d1e8..f9dc4fa39167 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts
> @@ -689,7 +689,6 @@ &sai6 {
>   &sdhci {
>   	bus-width = <8>;
>   	full-pwr-cycle-in-suspend;
> -	max-frequency = <200000000>;
>   	mmc-hs400-1_8v;
>   	mmc-hs400-enhanced-strobe;
>   	no-sdio;
> @@ -703,7 +702,6 @@ &sdmmc {
>   	cap-mmc-highspeed;
>   	cap-sd-highspeed;
>   	disable-wp;
> -	max-frequency = <200000000>;
>   	sd-uhs-sdr104;
>   	vmmc-supply = <&vcc_3v3_s0>;
>   	vqmmc-supply = <&vccio_sd_s0>;


