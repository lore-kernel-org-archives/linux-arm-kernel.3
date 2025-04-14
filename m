Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DA1C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+/aFzsUjGCWKExjIVE+0gWA+iOhpCqaaqFw26f8f0M=; b=ssOowvBdKaskOEEhEfB4thhGbI
	Ll8ponkfd/O7tVL+Q8Tj4mXe6jgTf6Dt24C9V2u+jz/SjW9XaDfJKpHp1j/3YfWvAaBH8oGgtXwIU
	v+4+MhgXt231WqLE+6xfiX97iLlZzpw+mqbjVQPXvZAGKJCMMYhkv3U1viTCysvfnsFK+o1IIrPpb
	F0Fh707UJuYnXfMDgmumpn4MuyHfii7ANRfFFRnyypXqSwJ1NK3gW1ZwRs9GpXxNIsFLzSFwaUF+Z
	BZMKApkJlI0W6/gmMWB0w93TtyshPr9EpIh8mKh1B8cssJ/yg6MDKG14bThbp8k/ZRFWhOxh3iFX9
	QJY0lsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Hz1-00000001lh2-3FNu;
	Mon, 14 Apr 2025 11:28:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HrA-00000001jxY-3Xc1;
	Mon, 14 Apr 2025 11:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744629603;
	bh=me7hnFUemACg5+LWnK3v5vg7rKKJpQlwUnNnkLHu5c4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a+bDrffThoN0yZarfWiV9G2YLin0HKv3155Brcsi8AVvEXhtw0YpnqbWvmHV1Qeaq
	 X+ISyMvLGulm0sFjohN1PfNn2S877H/92jq6OjP5P8m5giZ79aNNhyA8AaW4tYL6fr
	 Fc1/BXRaBG9TY29btQb/Bn9gz63FNwGMJJ8hxWWPFTxPfGek7PTH6Zhn+Ws7B0voHc
	 u5sHHXPi5zsfVM+VrCEuaX9vUMf2EUYkh2JiLMpIbj46FnCtGdARMMzO7NiPaZNjjh
	 B3lv0tpQccDa4Q2XqhBFTw1/LnGhhWgy1KTKwjwApaWU1hnA3IoQpnukU0MwryFi58
	 o1UXdZoo+3AMQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F57D17E0F85;
	Mon, 14 Apr 2025 13:20:02 +0200 (CEST)
Message-ID: <70231f99-5b41-4be4-8046-c73e32c68841@collabora.com>
Date: Mon, 14 Apr 2025 13:20:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Daniel Golle <daniel@makrotopia.org>
References: <20250412102109.101094-1-linux@fw-web.de>
 <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
 <4469DD7C-1C73-4767-867B-729819C2E1B4@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <4469DD7C-1C73-4767-867B-729819C2E1B4@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_042005_032817_CB199783 
X-CRM114-Status: GOOD (  16.76  )
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

Il 14/04/25 12:19, Frank Wunderlich ha scritto:
> Am 14. April 2025 11:27:23 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
> snip
>> This should at least have some different compatible, if not probably also a
>> different model string - as it's a different device.
>>
>> 	compatible = "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt7988a";
>> 	model = "Banana Pi BPI-R4 (2.5GbE)";
>> 	chassis-type = "embedded";
>>
>> ..snip..
>>
>> a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
>>> new file mode 100644
>>> index 000000000000..1ab09ed2f151
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
>>> @@ -0,0 +1,403 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/gpio/gpio.h>
>>> +#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
>>> +
>>> +#include "mt7988a.dtsi"
>>> +
>>> +/ {
>>> +	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
>>> +	model = "Banana Pi BPI-R4";
>>> +	chassis-type = "embedded";
>>
>> Please keep compatible/model/chassis-type in dts files.
> 
> Ok, should i add specific compatible to existing board (like 2sfp)? Just thinking how binding should look like.
> 

No, the existing board compatibles should not be touched.

I would imagine the bootloader reading the compatibles of all DTs and:

- On the 2G5 device, prefer a devicetree having that machine compatible;
   - 2G5: If no 2G5 specific DT exists, fall back to using bananapi,bpi-r4
- On the 2sfp device, use DT that has bananapi,bpi-r4 but not the 2g5 compat.

So all of the DTs can be present, and the bootloader chooses the right one for
whatever device it is running on.
If it's not possible for the bootloader to do so... well, that still doesn't
change anything: you need two different DTS with a difference in machine compatible
because those are two different machines :-)

> Else is there an example for adding optional compatible without adding a complete block in binding?

I'm not sure if you can nest oneOf statements in bindings... but that anyway
doesn't really solve anything, so just add a full block....

Just to be sure, though:

krzk/Rob/Conor, am I right on this?

Thanks!>
>> Cheers,
>> Angelo
> 
> 
> regards Frank



