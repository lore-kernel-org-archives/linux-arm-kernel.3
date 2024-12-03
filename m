Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FCFE64AB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0AitMraiyeH1+8g40VF3ZR7FWvldbabHAQToxozxXw=; b=mgXD6i1bDRC8titRhyn8N5j3uk
	H3jw//mBdk6OxCbTlSMiK/a925JTgRXm2liaa4ZBl+5/j318XtAfyCvDRArnxRQgBr2lY7k3hiqIv
	S6M60TK0mGpOvGChSMx3ts+v79XY1fT7u+O20euE5odBlSE+VcwApLU+Iji/0lEfYoVB5jkie3qPN
	5thBA/hHcJS6r68isY0LzJfztTIwYEYT8+KpBIIlxWMknJRa0DnfIpFREGphRxXrTtuTc3J3dpuwj
	5uymmOZkzGL+CKnyXSKyebXoXv2KAeDjzoGXsjqVz60XG7zlzX1NyFDAgi6I6BYjJE09ZkJmwtTXo
	fmshiV8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITmF-00000009ktA-38YV;
	Tue, 03 Dec 2024 14:21:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITlF-00000009kkH-3q0z;
	Tue, 03 Dec 2024 14:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733235617;
	bh=pWkF2Bb5Gq9pQgLzlneBZEmWId9TYqkXXlfj6J23HWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CxSOzUHleEfy78K+Esg2j1PTKTlTEWEB4mU0JQmVw33Axdb+Xgdvi6V/bIvqIvrqh
	 /pPuET51Lm3hokG4sqBmFkhDz4rwXMvrpOrOda+UR/1JPlU0K5ObahFjYu+pQwt17q
	 hTAzkrbIIU346k5IVGXQnTn+bAOeN68AWEkAdeLV3qhDQ4tvn5vLNgyJtDyQDwRvg4
	 pfun9CO0xFCe6OL28XNLVWeZ3TFR+Y8c9DrmpyGIup7/QTgAJi3y4TIN4Ulz3YkUBi
	 iKbETl2bfBCYWn6eqwWqd8qXreVMcn1pn0Gd6A7SQhlwHIwDjYVfVkESz8mrWyNH2T
	 SIL4W7WVSYlEg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3CD3217E0DE6;
	Tue,  3 Dec 2024 15:20:16 +0100 (CET)
Message-ID: <4da0ab36-34c2-413a-90b3-bcdbdd4a6ac0@collabora.com>
Date: Tue, 3 Dec 2024 15:20:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/18] arm64: dts: mediatek: mt7988: add fixed
 regulators for 1v8 and 3v3
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-4-linux@fw-web.de>
 <016b77dc-2d33-4639-b241-2574ad877971@collabora.com>
 <371B3F0C-D468-45C8-B1F6-F4619B7C72DD@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <371B3F0C-D468-45C8-B1F6-F4619B7C72DD@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_062022_114047_5DB355C3 
X-CRM114-Status: GOOD (  19.45  )
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

Il 03/12/24 11:51, Frank Wunderlich ha scritto:
> Am 3. Dezember 2024 10:40:54 MEZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 02/12/24 13:25, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add regulator nodes used for mmc to Bananapi R4 board.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> If you're adding the eMMC regulators, I assume that there's an eMMC, or that even
>> if there's no device in some version of the board, these two regulators are always
>> assigned to the eMMC device - right?
> 
> Like BPi-R3 there is one mmc controller mapped to either sd or emmc. I can move the regulators to the dtbo,but then they are defined twice (at least 3v3).
> 
>> You should, at this point, do exactly that: you can leave the mmc0 disabled and
>> only enable it in a DTBO.
> 
> I enable it only in dtbo...
> 
>> &mmc0 {
>> 	/* eMMC gets enabled by DTBO if present */
>> 	vmmc-supply = <&reg_3p3v>;
>> 	vqmmc-supply = <&reg_1p8v>;
>> };
> 
> Problem is here that sdcard uses only the 3v3 twice
> 
> https://github.com/frank-w/BPI-Router-Linux/blob/6.12-main/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso
> 
> And emmc needs both
> 
> https://github.com/frank-w/BPI-Router-Linux/blob/6.12-main/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso
> 
> Only defining the vmmc-supply in dts and set only the other in dtso is possible but but imho not nice.
> 

If you added that in the commit description in the first place, I wouldn't
have sent you that suggestion ;-)

So, please add the reason that you just explained to me in the description
of this commit and just leave the code as-is.

Cheers!

>> Cheers,
>> Angelo
>>
>>> ---
>>> v2:
>>> - move mmc regulators to board dts of bpi-r4
>>> ---
>>>    .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts   | 18 ++++++++++++++++++
>>>    1 file changed, 18 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
>>> index d914eae2b524..df53512c6890 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
>>> @@ -8,6 +8,24 @@ / {
>>>    	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
>>>    	model = "Banana Pi BPI-R4";
>>>    	chassis-type = "embedded";
>>> +
>>> +	reg_1p8v: regulator-1p8v {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "fixed-1.8V";
>>> +		regulator-min-microvolt = <1800000>;
>>> +		regulator-max-microvolt = <1800000>;
>>> +		regulator-boot-on;
>>> +		regulator-always-on;
>>> +	};
>>> +
>>> +	reg_3p3v: regulator-3p3v {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "fixed-3.3V";
>>> +		regulator-min-microvolt = <3300000>;
>>> +		regulator-max-microvolt = <3300000>;
>>> +		regulator-boot-on;
>>> +		regulator-always-on;
>>> +	};
>>>    };
>>>      &pio {
>>
>>
> 
> 
> regards Frank



