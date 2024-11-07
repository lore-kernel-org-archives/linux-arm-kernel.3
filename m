Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AEFD29FBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Kv0j8n6OgbyEtl8S2ISVzAkmC/lfSFUHPm7gO3mtUM=; b=gf2KXO9Io2z+Vpc6NwH7USD7RT
	tMzkR8eFyHz/Ui+T/pxle0F8q4aHtzkB0ENhselEKfVdNKL7gUnMvfBtU7+MBY3v215v9IYZokqDe
	fysr4PXaTj1UTVIHQQb4223mXazRqGBXzMC4t2PhtdjABNgiy1i2JxabHJfHLxAf4MjnPoVY9wLYa
	JD8mpfVxi/3AF7zd1mPZzQKTrkw3QnU8tOUedMGqes/hNNqGYPdY+R2tViOrdK3y93qA2VZZ2nGxU
	3DcdVMOc5wPDZXKT7d2S4MeeeSc3wFFaUfUZPijoRK9EQ9QxzbwftVroFlmK1wFw26NwfPBi2EB7A
	cOa0Scgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rgK-00000005Ls5-02vK;
	Thu, 07 Nov 2024 01:51:32 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rXh-00000005Jrk-2Nho
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730943755; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=1Kv0j8n6OgbyEtl8S2ISVzAkmC/lfSFUHPm7gO3mtUM=;
	b=lhH2/HrHQDWP2FyrafsFtOlo9Q4sC0L6ZPlx9lnC8CEeX/eyPBZqZa8HVNNbbBs5wy9x0BWZBoF6h5gNaBfRdGYtKfEPZCO2PNKx9s20XrC/3G6JVrrJT4ISfIo3cdBCt7LTfLyu6cYgBvK3vQbqwt9IsCVsjIqTlQG18fXRZuo=
Received: from 30.74.144.126(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WItht-N_1730943752 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 Nov 2024 09:42:33 +0800
Message-ID: <d410c617-7917-4776-967b-058817f40022@linux.alibaba.com>
Date: Thu, 7 Nov 2024 09:42:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: sprd: sc9863a: reorder clocks,
 clock-names per bindings
To: Stanislav Jakubek <stano.jakubek@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1730918663.git.stano.jakubek@gmail.com>
 <d235438fbbd53c28b63cada2cf7e1234c120355e.1730918663.git.stano.jakubek@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <d235438fbbd53c28b63cada2cf7e1234c120355e.1730918663.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174238_109981_D055CFE4 
X-CRM114-Status: GOOD (  12.05  )
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
> DT bindings expect the SC9863A clock-controller clocks/clock-names to be
> in a specific order, reorder them.
> 
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
> Changes in V2:
> - new patch
> 
>   arch/arm64/boot/dts/sprd/sc9863a.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/sprd/sc9863a.dtsi b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> index 31172ac44adc..e97000e560e7 100644
> --- a/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> +++ b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
> @@ -163,18 +163,18 @@ gic: interrupt-controller@14000000 {
>   		ap_clk: clock-controller@21500000 {
>   			compatible = "sprd,sc9863a-ap-clk";
>   			reg = <0 0x21500000 0 0x1000>;
> -			clocks = <&ext_32k>, <&ext_26m>;
> -			clock-names = "ext-32k", "ext-26m";
> +			clocks = <&ext_26m>, <&ext_32k>;
> +			clock-names = "ext-26m", "ext-32k";
>   			#clock-cells = <1>;
>   		};
>   
>   		aon_clk: clock-controller@402d0000 {
>   			compatible = "sprd,sc9863a-aon-clk";
>   			reg = <0 0x402d0000 0 0x1000>;
> -			clocks = <&ext_26m>, <&rco_100m>,
> -				 <&ext_32k>, <&ext_4m>;
> -			clock-names = "ext-26m", "rco-100m",
> -				      "ext-32k", "ext-4m";
> +			clocks = <&ext_26m>, <&ext_32k>,
> +				 <&ext_4m>, <&rco_100m>;
> +			clock-names = "ext-26m", "ext-32k",
> +				      "ext-4m", "rco-100m";
>   			#clock-cells = <1>;
>   		};
>   

