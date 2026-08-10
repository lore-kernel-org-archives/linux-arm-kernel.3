Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61F3C5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ef8gGpgByE68SRajlMKVl/YCh1rGsczGv2/5b09nooc=; b=1SeZOUkWtuXgNtFjVLdbNTminh
	OiI48sVU8PIbeiEBBjfDHVlk5+T7i+W/XaKHph/LOa+mzLePPQTBjwVGmYj/qAvobtoifsS+9Z074
	aknuV6ZF4ihtIxvfdYIXQObWqbDuIqF+oK5foahij3qFs39gn6vp+iGvjX/ZyjJBQS6KKExSF4DXF
	ztq2tj5k5Jc7KMSTgYNAEQS3W6F/nOcay5CY/S83nsh2fE+HoRCna1ZJFOc+iXVhSNIvUxWXAAjdv
	X6mW7N+VJIRrqboTZSjUGRyXKSFZNiw88C0//FNMCD227oOkarwnNF2jJP/uoS99OfTZ9KkChh3eS
	zTyYEaXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOAJ-0000000Bck4-3ILr;
	Mon, 10 Aug 2026 11:27:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOAI-0000000Bcjo-3oX3;
	Mon, 10 Aug 2026 11:27:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A807B405B9;
	Mon, 10 Aug 2026 11:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4071F000E9;
	Mon, 10 Aug 2026 11:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786361254;
	bh=ef8gGpgByE68SRajlMKVl/YCh1rGsczGv2/5b09nooc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TD52UFvbTk4Vwu0MpW/BVmfIFceOlXCqIlmAD3WhGXotRMxBldc9nVZ1kGvvD3CvS
	 P0wXkb0YBmBt2cKWHN4fbNqHvhsvPOy9owInbXkPsf3Vur/qTRWPJv/ylr4CVcivyT
	 2MyTnG9+7UWIIEy0xa67UbuPsOctke9tkaskTxka27ah2hSEoURQfv6V3RGvSzZIfw
	 n1F/K0mzB3B/4mSfxWiw0LZbxPLnQd4AbZOg3WBiCTME+zltjhp5KOsIIyoHi5mcsX
	 LIprK0nD1whnwuKhbIhRkRAsPXC+nym0YJCZV4D8yMIoEuKg4Rkm8LgcZe7IerP2+n
	 yDKkzEjifro9w==
Message-ID: <d5325391-1457-4a47-b15e-afb1a26d00bc@kernel.org>
Date: Mon, 10 Aug 2026 13:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: broadcom: bcm2712-d-rpi-5-b: add
 compatible
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>
References: <20260804-bcm2712-d-stepping-compatible-v3-0-1860094486eb@linutronix.de>
 <20260804-bcm2712-d-stepping-compatible-v3-2-1860094486eb@linutronix.de>
 <6ed9b2e5-b700-477a-8f6f-cb48c597a111@gmx.net>
 <vv6ufnanks27moditlav2ebaub6m5te5tag3m6qv5l65cm25iw@i7m54od3wz4k>
 <ddcb0d9a-2dd4-4808-84db-caf6ea64b48e@gmx.net>
 <pwdgjsfwdnkce4lkkda2hlopajuwuit6jkx2wztoeu4jzzv5ay@yoo4ofvwgrnu>
 <20260810-mustard-sloth-of-enterprise-84b68d@quoll>
 <urrsc6dippljgmlochdnetolkhqqj25bbyosgcrw5hy6jpbpao@cgf332hhgdjv>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <urrsc6dippljgmlochdnetolkhqqj25bbyosgcrw5hy6jpbpao@cgf332hhgdjv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/08/2026 13:13, Gregor Herburger wrote:
> On Mon, Aug 10, 2026 at 09:19:35AM +0200, Krzysztof Kozlowski wrote:
>> On Wed, Aug 05, 2026 at 02:52:44PM +0200, Gregor Herburger wrote:
>>> Hi Stefan,
>>> On Wed, Aug 05, 2026 at 01:55:50PM +0200, Stefan Wahren wrote:
>>>> Hi Gregor,
>>>>
>>>> drop Eric and add Peter.
>>>>
>>>> Am 05.08.26 um 09:27 schrieb Gregor Herburger:
>>>>> On Tue, Aug 04, 2026 at 04:57:09PM +0200, Stefan Wahren wrote:
>>>>>> Hi Gregor,
>>>>>>
>>>>>> sorry for my late reply.
>>>>>>
>>>>>> Am 04.08.26 um 15:13 schrieb Gregor Herburger:
>>>>>>> The bcm2712 found on the Raspberry Pi 5 is available in the d Stepping
>>>>>>> and in a c Stepping. There are two separate dts files. The
>>>>>>> bcm2712-rpi-5-b.dts for the c Stepping and the bcm2712-d-rpi-5-b.dts for
>>>>>>> the d Stepping. The d stepping does not set its own compatible/model
>>>>>>> string but uses "raspberrypi,5-model-b".
>>>>>> In case the SoC and not the board has a D stepping, why do just change the
>>>>>> board compatible without the SoC compatible like "brcm,bcm2712-d0"?
>>>>> You mean changing both compatible strings? Like this:
>>>>> 	compatible = "raspberrypi,5-model-b-d0", "brcm,bcm2712-d0";
>>>> I just want to mention that your explanation doesn't match to your changes.
>>>> The first compatible represent the whole board (RPi 5) and the second one
>>>> represent only the SoC (BCM2712). Since the SoC is different according your
>>>> explanation, i would expect the SoC compatible needs to be changed. And in
>>>> case the SoC changes, also the board won't be compatible anymore, correct?
>>> Yes the SoC differs in these two versions and the board is maybe the same (but
>>
>> Different SoC means different SoC-compatible. If the soc is soldered to
>> the board, then it also means board is different. Otherwise how can it
>> be the same board if it comes with different elements?
> That makes perfect sense. Thanks for the explanation. I will add a board
> compatible and a SoC compatible.
>>
>> Of course boards can share schematics and everything except some
>> component so you could have common compatible.
>>
>> 1. Rpi 5b d0
>> 2. Rpi 5b
>> 3. bcm2712-d0
>>
> 
> But I don't think that should be done here. As you explained in the previous
> iteration [0] we shouldn't add a non-compatible fallback.

Well, true, this was more matching regular case, where (2) is common
board compatible. In your case this is not compatible, so just 1+3.


Best regards,
Krzysztof

