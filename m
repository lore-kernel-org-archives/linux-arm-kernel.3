Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0F3C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vXF18F4sgIg2jD9ptU1LZHnjRdgQrEW5rmy82LsXF4s=; b=fezcd3OzqDJ7wpz/WHGfsakGoY
	fJjh3NI7POykbzV/3+pySIY5t+zNXTJ/tFOJeCmRj8Blmft/5xiqXUqBoPs1s3C9cGgriXHogsji0
	FhxMPLRMVN4XXbdTJbvXQBejjZE5wyWlFoklqDXGYVcVDU5/Jr/OayFpAkuzThysg9wWkNqclSarw
	o+nRhwvADlih2AyEPUUlk8T+ACDJhNHYed9ZJLJJ7ab0YD5V5Rnn38X3rPtM63z+EeyztuLuSISoD
	NgE9TKFddYvLQheSIBzDvCkFk6r+jV/eFpH64dUyP8eP9rdd/Yzg+XxEEbmhcy9W4WpPSddk7HRo6
	xrRufVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyBy-0000000B9OZ-2a9r;
	Wed, 18 Jun 2025 19:11:26 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtW7-0000000AOkK-23Vk;
	Wed, 18 Jun 2025 14:11:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2463F43137;
	Wed, 18 Jun 2025 14:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750255912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXF18F4sgIg2jD9ptU1LZHnjRdgQrEW5rmy82LsXF4s=;
	b=QBSZx0pj5qIxdvnIs5yPuGcY31Ww95QxRTZz5xQ6MvKFyBxJperJouMSpwrLPbXqLnuhFJ
	yG6Gg95xudBvhnqiDZKbePaRxdU1sQ5xN+tZ7KhJLpwFYT7rXZ5pCdVp2xoKxQGIWbx29a
	eFK7ji7esOMZDrd92Wj3SuAHjnhL5A1ToFm6eWB2Gyr1ZphaXt5fObdUSS16Jkb3bsTdZu
	yUM/WpmdN8bnEFXtnrs2i1BBGxO2f7jZY7PlG2q52efBmEBLYDb2Kcbweb26dvPOQThzGH
	BKONq2bU5FXVly8SXPTW55P9354qyGQELcTETFod+XvGWpHuISxvLBQvHKXtiQ==
Message-ID: <865fc263-b3c6-470a-9fb8-3d6df51a2b74@bootlin.com>
Date: Wed, 18 Jun 2025 16:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Fix the panel compatible for
 the PinePhone Pro
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-1-e54797ad2eba@bootlin.com>
 <DAPPKP3OWLMU.C6HXTY24NZ4H@cknow.org>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <DAPPKP3OWLMU.C6HXTY24NZ4H@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvkeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvheejtdeifeejvedvffdtuddtheehtdelvdehvefgjeetveejfeeiveduvdejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgfkrfggieemvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeingdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepughiughirdguvggsihgrnhestghknhhofidrohhrghdprhgtphhtthhop
 ehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_071155_992753_C26E56DE 
X-CRM114-Status: GOOD (  17.66  )
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



On 6/18/25 15:54, Diederik de Haas wrote:
> On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
>> As documented in its bindings, the compatible for the Himax HX8394
>> MIPI-DSI LCD panel controller is in 2 parts.
>> The PinePhone Pro DTS currently only specifies the first part of the
>> compatible, generating a warning.
>>
>> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> index 04ba4c4565d0a205e2e46d7535c6a3190993621d..5ebc380a24df86ba7172b0950b89cac56b61c507 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> @@ -479,7 +479,7 @@ mipi_out_panel: endpoint {
>>   	};
>>   
>>   	panel@0 {
>> -		compatible = "hannstar,hsd060bhw4";
>> +		compatible = "hannstar,hsd060bhw4", "himax,hx8394";
>>   		reg = <0>;
>>   		backlight = <&backlight>;
>>   		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
> 
> Reviewed-by: Diederik de Haas <didi.debian@cknow.org>
> 
Thanks for the review.
> But I'd actually suggest to combine it with patch 3 and use that
> opportunity to also fix the property sorting, so you'd get 1 patch which
> fixes all of the panel issues.
> 
Makes sense, I'll integrate your suggestions from the other 2 patches, 
fix the property sorting, and squash the fixes into 1 commit/patch in v2.
> Cheers,
>    Diederik

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


