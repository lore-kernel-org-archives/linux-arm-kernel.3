Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DDFC73C66
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgrZOfyKtBkV3FRP+QW5pRebwqcUGFtff5SNDuOzWCw=; b=ZtH4n6Hkzx1ERNy8ziARTwF+lu
	wUx4Z42DpNsqO+wKxobKr8HBOrk00bAlfIhRZaoEiu/9oK2olAeK+c9fgBGnis8LTtWL3Uc93Zvra
	YFK2IJXyv/gDNYxacEPHiEZcUk8XVkpwTSnvsuUag+4uA4eR/seXvb1M5TYZ/mcg9IQeUCTc+P+Oy
	8aYxLX00v00lZVeFKKSSnT0ZeFk4sYWZILt9oa61K1bY6Nyl26I7NEmKguhM2MQNpvY1MxGtkxEq8
	S8wQgvPDDwdvCjMYlGagfZ7lFzhYj9ooSd06jVpGoCYrycJAqcbiXlrAtJee2J+ibD10fTa9/aNuO
	XObvp4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRugw-0000000Aaps-3f6x;
	Wed, 18 Jun 2025 15:27:11 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt1B-0000000AKgU-3t1I;
	Wed, 18 Jun 2025 13:39:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C06BA443BC;
	Wed, 18 Jun 2025 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750253994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dgrZOfyKtBkV3FRP+QW5pRebwqcUGFtff5SNDuOzWCw=;
	b=cBeCCwRWYKaXrBWXnieTF9Lfp7GlUSilFf3D5MOrwR7vnJVlg5HIUhkC4zaiFnlWTAm9pt
	GAci5crFZVOTHAu3pJztu6OxNsxECwMEcTHUR5zObr1EwCJL309nrgq4bT2gcgPD0ifOJY
	exIlKTj/XxkUd3AvNQOxf8nKoo8G1+NX1zT3wZ/dpJZ3dNSmuWYY+k6gJpLeUndPCUN8X5
	+0CJjy1KlZKlQuF3Ich9hVSrUhk42XprvvFWcqFfd9ubPl+ztpvQD65lxZmW4FGLv9WFnx
	K8/XeLDm1PCfp7vS1N00WMHj6jXLw7MAPtC7YubzDJMppH/OwP5cVoQUZkNnCQ==
Message-ID: <f5f4072f-759e-4086-833a-14868a8b8423@bootlin.com>
Date: Wed, 18 Jun 2025 15:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Remove unused property in
 PinePhone Pro MIPI panel
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250618-dtb_fixes-v1-0-e54797ad2eba@bootlin.com>
 <20250618-dtb_fixes-v1-3-e54797ad2eba@bootlin.com>
 <DAPNE849BAON.1DPGBKMHM552V@cknow.org>
Content-Language: en-US
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
In-Reply-To: <DAPNE849BAON.1DPGBKMHM552V@cknow.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvheejtdeifeejvedvffdtuddtheehtdelvdehvefgjeetveejfeeiveduvdejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgfkrfggieemvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeingdpmhgrihhlfhhrohhmpeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepughiughirdguvggsihgrnhestghknhhofidrohhrghdprhgtphhtthhop
 ehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_063958_587902_DDC2376E 
X-CRM114-Status: GOOD (  14.21  )
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



On 6/18/25 14:12, Diederik de Haas wrote:
> Hi,
> 
Hello Diederik,

> On Wed Jun 18, 2025 at 12:32 AM CEST, Olivier Benjamin wrote:
>> The MIPI panel definition in the PinePhone Pro DTS includes a
>> "pinctrl-names" property, which is unused in the absence of pinctrl-0.
>>
>> Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> index 5a7341fb6bcb0613af6f3ac31d99355a0f890e89..405140700208365c8631de86a2d7b6e577b7aa7f 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
>> @@ -485,7 +485,6 @@ panel@0 {
>>   		reset-gpios = <&gpio4 RK_PD1 GPIO_ACTIVE_LOW>;
>>   		vcc-supply = <&vcc2v8_lcd>;
>>   		iovcc-supply = <&vcc1v8_lcd>;
>> -		pinctrl-names = "default";
> 
> Why not define a pinctrl for LCD1_RST for GPIO4_D1 and reference that in
> pinctrl-0? (See page 11 and 16 of the schematics)
> 
That is a very fair question. I had simply missed that signal.
I'll get right on that, thanks for the suggestion!
> Cheers,
>    Diederik
>>   
>>   		port {
>>   			mipi_in_panel: endpoint {
> 

-- 
Olivier Benjamin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


