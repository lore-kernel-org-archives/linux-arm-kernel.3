Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F203D5AE60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 05:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6tz/6yZdJc48Ct5wSNXHHSWeXsH6J5tpfO//kmdJIYY=; b=gD0IqNayabMrIzyzYUunxh0D4l
	XfoxPcILFOfj3EdgaUB4N8iD9uhNOKuMjK9+DjaauVpJmldDoCdWkieU2nSLedfm4DgnoR2URiDcB
	7IUuwIVSLyX5m+L1Zg7Wec3Hn1kLTFUPCuYIXt7tOWMe5fE48/nUrw6ftWsVKm6BERmemXBKVuHCe
	5fsXUX+ieXwjEYmEnhLJNM3HBtHKARuigfwWmzzmCohrgYJlyFzcs5nB4buobxQWQ/21FdDYeRxue
	VB/kP1zLukt4olFVep3EhQRcBRQ2UsnFmyfZrisJy6IbLEGDYIJelGwpAAkTZgnui2F3q4ZCoWLIE
	foJycxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vJw-00000005kD3-29Fx;
	Thu, 07 Nov 2024 05:44:40 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vI8-00000005jn6-1jwE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 05:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730958164; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6tz/6yZdJc48Ct5wSNXHHSWeXsH6J5tpfO//kmdJIYY=;
	b=eZE9H1T2PbQLG5dboEy+QoZ35hTCqJY6+sZkbf+zUNgBj15Ndrz2A0pACobIVqOWOFWMRq1OzvIXN92Nywm9ChsJ3Jw6A9DMz92nXMKs0qZAmQvwkFH7KBLl9xuoEL7codutwUFGWOBB9hpQE1pgFKsvccoCEr2m/wPB+QUa+nk=
Received: from 30.74.144.126(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WIuSc0b_1730958161 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 Nov 2024 13:42:42 +0800
Message-ID: <a2f244a8-cbac-4482-902d-fedcc461a417@linux.alibaba.com>
Date: Thu, 7 Nov 2024 13:42:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: sprd: sc2731: move fuel-gauge
 monitored-battery to device DTS
To: Stanislav Jakubek <stano.jakubek@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1730918663.git.stano.jakubek@gmail.com>
 <2959aa8567afbef17337829072adce01158f00bb.1730918663.git.stano.jakubek@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <2959aa8567afbef17337829072adce01158f00bb.1730918663.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_214249_147216_47EE5D22 
X-CRM114-Status: GOOD (  15.61  )
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



On 2024/11/7 03:05, Stanislav Jakubek wrote:
> The monitored-battery property is a property of the board, not the PMIC.
> Move this property to the DTS of its only user, sp9860g-1h10.
> While at it, disable the fuel-gauge node by default and enable it only
> for its users, as it requires board-specific properties to work correctly.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

Looks reasonable to me. Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
> Changes in V2:
> - none
> 
> Note that the 'sprd,calib-resistance-micro-ohms' property isn't specified
> as I do not have the board or any other source of information about it.
> 
> If the SPRD folks could chime in here, that'd be great.
> 
>   arch/arm64/boot/dts/sprd/sc2731.dtsi      | 4 ++--
>   arch/arm64/boot/dts/sprd/sp9860g-1h10.dts | 5 +++++
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/sprd/sc2731.dtsi b/arch/arm64/boot/dts/sprd/sc2731.dtsi
> index 12136e68dada..2d27427c41a2 100644
> --- a/arch/arm64/boot/dts/sprd/sc2731.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc2731.dtsi
> @@ -94,17 +94,17 @@ pmic_adc: adc@480 {
>   			nvmem-cells = <&adc_big_scale>, <&adc_small_scale>;
>   		};
>   
> -		fuel-gauge@a00 {
> +		pmic_fgu: fuel-gauge@a00 {
>   			compatible = "sprd,sc2731-fgu";
>   			reg = <0xa00>;
>   			bat-detect-gpio = <&pmic_eic 9 GPIO_ACTIVE_HIGH>;
>   			io-channels = <&pmic_adc 3>, <&pmic_adc 6>;
>   			io-channel-names = "bat-temp", "charge-vol";
> -			monitored-battery = <&bat>;
>   			nvmem-cell-names = "fgu_calib";
>   			nvmem-cells = <&fgu_calib>;
>   			interrupt-parent = <&sc2731_pmic>;
>   			interrupts = <4>;
> +			status = "disabled";
>   		};
>   
>   		vibrator@ec8 {
> diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
> index 94af7700f3e2..b1fa817ece1e 100644
> --- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
> +++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
> @@ -84,6 +84,11 @@ bat: battery {
>   	};
>   };
>   
> +&pmic_fgu {
> +	monitored-battery = <&bat>;
> +	status = "okay";
> +};
> +
>   &uart0 {
>   	status = "okay";
>   };

