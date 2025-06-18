Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AEEC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BR2Js8AYTA3uqJ+dhjRGvYCUNC9Z3XvtFngEWfHaNL4=; b=PmEzwzUYtzAuijGUqIcYansOzv
	WOqLL6zHHrRmbM+aF7H3fTUXN0a+EnmRsFtdUj2yKMiBxGQjrlKvG1wfT12cld2Bg5d+i/ivr+ykA
	yE0XxRe3ssY4hTKQJ3KAovBZzZtHc8tEAH4GkcYVpDpJKCu+hzB4hPvswjno8TwdRBR5ZIMr14Vpl
	Et7Vy2TtLRFrWsC5vcS4q7WnfGqtKUP2wtudYKC63JMRyqBvIlynxNm73TPRj2E0g51pQioXJwfpe
	2Tuxi6E6WpULCO0ll91GkJflJPZgDc82933dP6NkcIDuDV4HPe0NwOZtlDLHljcoB1Qxhy5mCWk0k
	DcgdMZ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvKa-0000000Agz3-3CkW;
	Wed, 18 Jun 2025 16:08:09 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtYv-0000000AP8y-2eem;
	Wed, 18 Jun 2025 14:14:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44DE743A29;
	Wed, 18 Jun 2025 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750256086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BR2Js8AYTA3uqJ+dhjRGvYCUNC9Z3XvtFngEWfHaNL4=;
	b=M3GMdsgxD6lk12yug3GZIA8tEeyFYbrlJgFxgmCaHKFUrC5JJagMIGi3UonPF93IgRsa0e
	91VmMYNOWFqFjkgDwrtJCBNw0kqYZ78J7y/0GcpTTb5w9PScz8COG1ISoU+ymvY6deqwHU
	eFa8aDov6g1X5Z0U7XvCaG3a2TC3vJx8Q58k96AcZsZcGLy0o+/s8AiHhvL/XRjHZQ57V+
	t+oMgkfbyWN6LIZZE350GAwt4swQwwMRB8EIuQKKPAygPkzZQX4XpN0jddH+BhU7S55K1X
	9XFLQ7bAdz5CemKbwN+ahVr+YigNdMg5BZoI32c8u593JeheOJHk+9jqWIv2BA==
Message-ID: <3acaaf1c-b4ed-47ff-8de5-195a9cfc5338@bootlin.com>
Date: Wed, 18 Jun 2025 16:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Fix the mipi port definition
 for RK3399
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-2-e54797ad2eba@bootlin.com>
 <DAPPHL6RPWWM.94C7P26AUCCN@cknow.org>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <DAPPHL6RPWWM.94C7P26AUCCN@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvheejtdeifeejvedvffdtuddtheehtdelvdehvefgjeetveejfeeiveduvdejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgfkrfggieemvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeingdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepughiughirdguvggsihgrnhestghknhhofidrohhrghdprhgtphhtthhop
 ehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_071449_817417_BA98A4D3 
X-CRM114-Status: GOOD (  26.44  )
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



On 6/18/25 15:50, Diederik de Haas wrote:
> Hi (again),
> 
Hello again, I appreciate you taking the time!
> On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
>> The RK3399's MIPI DSI has 2 ports: in an out. The definition of
>> the port property necessitates the value of #address-cells to be 1.
>>
>> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> index 5ebc380a24df86ba7172b0950b89cac56b61c507..5a7341fb6bcb0613af6f3ac31d99355a0f890e89 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> @@ -468,7 +468,7 @@ &mipi_dsi {
>>   
>>   	ports {
>>   		mipi_out: port@1 {
>> -			#address-cells = <0>;
>> +			#address-cells = <1>;
>>   			#size-cells = <0>;
>>   			reg = <1>;
>>   
> 
> In rk3399-base.dtsi there is already a definition for mipi-in and
> mipi-out. AFAICT what this change does is require a reg property on the
> endpoint and I don't think that's correct.
> 
Those definitions do indeed exist in the base DTSI.
> It seems to me that all you need is a mipi_out_panel definition.
> So what I came up with is this:
> 
> ```sh
> $ git diff
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 04ba4c4565d0..b175aeed99e2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -466,18 +466,6 @@ &mipi_dsi {
>   	status = "okay";
>   	clock-master;
> 
> -	ports {
> -		mipi_out: port@1 {
> -			#address-cells = <0>;
> -			#size-cells = <0>;
> -			reg = <1>;
> -
> -			mipi_out_panel: endpoint {
> -				remote-endpoint = <&mipi_in_panel>;
> -			};
> -		};
> -	};
> -
>   	panel@0 {
>   		compatible = "hannstar,hsd060bhw4";
>   		reg = <0>;
> @@ -495,6 +483,12 @@ mipi_in_panel: endpoint {
>   	};
>   };
> 
> +&mipi_out {
> +	mipi_out_panel: endpoint {
> +		remote-endpoint = <&mipi_in_panel>;
> +	};
> +};
> +
>   &pmu_io_domains {
>   	pmu1830-supply = <&vcc_1v8>;
>   	status = "okay";
> ```
> 
Thanks for the suggestion, that looks like it might actually solve the 
issue.
> I don't have a PPP so I can't verify it, but ``make CHECK_DTBS=y W=1
> rockchip/rk3399-pinephone-pro.dtb`` no longer reports issues wrt
> dsi@ff960000 (after I also fixed the panel compatible like in patch 1
> and added a LCD1_RST pinctrl definition as indicated in my reply to
> patch 3).
> 
I'll test on my PPP and report back in v2.
> Cheers,
>    Diederik

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


