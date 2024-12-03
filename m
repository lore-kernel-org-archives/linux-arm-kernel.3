Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5234EE64AB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wM6ixGya2qfoHnOYOmIDDeipa9HYYmrSyVA9/j6R2ck=; b=Mb5dJkMDYIELnJ4oIqjBK08NXl
	R4n+gkIzyslgCtuy+M0W5HHwRqrI4dWtUme35BZOWgNJ85+tmwRLS8CFyDuKJEcFJIEqPFxJUlbRY
	5PN/+/qwLxANg1zECKIOrSR4xewYGNP4xPnP4tg0KI1QBM6ppJnRRvTup3IUWLsrqV72SJxslGPoS
	PXajqaV1s+Xb9BJp7LNkkxW8LaKDnR1kIET5XITgdICY8sYEFbZZUhjOqXeAVnGXKo70VILf0oHwe
	GlnlzQ1QCYqeG0dr7QGE74rodqDMyfNgHJkegNoT12nuQTti+kZ8K/W2LeqmZR5wmvXSMpt4AtzIr
	nuS7JF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUWl-00000009sVk-0BOH;
	Tue, 03 Dec 2024 15:09:27 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUVl-00000009sMd-1Z1Q;
	Tue, 03 Dec 2024 15:08:27 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id BA1D56161F;
	Tue,  3 Dec 2024 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733238502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wM6ixGya2qfoHnOYOmIDDeipa9HYYmrSyVA9/j6R2ck=;
	b=gh+9pKTDowYNEt49kW3szUXnDKh3suAOyREkS27CIbcZFJyOQM1hyMHwKIhyyFiRIQx2PW
	Wx1Ie8eJZZu1EgH++xTGCkQRWWYYHeS6xUF2yhiyk43LwcAfnl83ZGlBEnZ8YEVFglLGnd
	0eV1XkE2CeKL2PdheJ5sShdGyel5kd4=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 349F940030;
	Tue,  3 Dec 2024 15:08:22 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 03 Dec 2024 16:08:22 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: frank-w@public-files.de, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 03/18] arm64: dts: mediatek: mt7988: add fixed
 regulators for 1v8 and 3v3
In-Reply-To: <4da0ab36-34c2-413a-90b3-bcdbdd4a6ac0@collabora.com>
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-4-linux@fw-web.de>
 <016b77dc-2d33-4639-b241-2574ad877971@collabora.com>
 <371B3F0C-D468-45C8-B1F6-F4619B7C72DD@public-files.de>
 <4da0ab36-34c2-413a-90b3-bcdbdd4a6ac0@collabora.com>
Message-ID: <942f0a95284be1e0c0c043b965fb42c2@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 4dbf75c5-d902-40ac-acca-4a8fb382bbb0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_070825_716279_D5A13D65 
X-CRM114-Status: GOOD (  18.90  )
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

Am 2024-12-03 15:20, schrieb AngeloGioacchino Del Regno:
> Il 03/12/24 11:51, Frank Wunderlich ha scritto:
>> Am 3. Dezember 2024 10:40:54 MEZ schrieb AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>:
>>> Il 02/12/24 13:25, Frank Wunderlich ha scritto:
>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>> 
>>>> Add regulator nodes used for mmc to Bananapi R4 board.
>>>> 
>>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> 
>>> If you're adding the eMMC regulators, I assume that there's an eMMC, 
>>> or that even
>>> if there's no device in some version of the board, these two 
>>> regulators are always
>>> assigned to the eMMC device - right?
>> 
>> Like BPi-R3 there is one mmc controller mapped to either sd or emmc. I 
>> can move the regulators to the dtbo,but then they are defined twice 
>> (at least 3v3).
>> 
>>> You should, at this point, do exactly that: you can leave the mmc0 
>>> disabled and
>>> only enable it in a DTBO.
>> 
>> I enable it only in dtbo...
>> 
>>> &mmc0 {
>>> 	/* eMMC gets enabled by DTBO if present */
>>> 	vmmc-supply = <&reg_3p3v>;
>>> 	vqmmc-supply = <&reg_1p8v>;
>>> };
>> 
>> Problem is here that sdcard uses only the 3v3 twice
>> 
>> https://github.com/frank-w/BPI-Router-Linux/blob/6.12-main/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso
>> 
>> And emmc needs both
>> 
>> https://github.com/frank-w/BPI-Router-Linux/blob/6.12-main/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso
>> 
>> Only defining the vmmc-supply in dts and set only the other in dtso is 
>> possible but but imho not nice.
>> 
> 
> If you added that in the commit description in the first place, I 
> wouldn't
> have sent you that suggestion ;-)
> 
> So, please add the reason that you just explained to me in the 
> description
> of this commit and just leave the code as-is.

OK, would this be ok?

arm64: dts: mediatek: mt7988a-bpi-r4: add fixed regulators for 1v8 and 
3v3

Add regulator nodes used for mmc to Bananapi R4 board.
This board has 1 MMC controller used for SDMMC and eMMC where only one 
can
be used at one time, selected by hardware switches. SD use 3v3 for both
supplies and emmc uses both regulators.
So defining both regulators in board dts and referencing them in the dt
overlay.

> Cheers!
> 
>>> Cheers,
>>> Angelo
>>> 
>>>> ---
>>>> v2:
>>>> - move mmc regulators to board dts of bpi-r4
>>>> ---
>>>>    .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts   | 18 
>>>> ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>> 
>>>> diff --git 
>>>> a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts 
>>>> b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
>>>> index d914eae2b524..df53512c6890 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
>>>> @@ -8,6 +8,24 @@ / {
>>>>    	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
>>>>    	model = "Banana Pi BPI-R4";
>>>>    	chassis-type = "embedded";
>>>> +
>>>> +	reg_1p8v: regulator-1p8v {
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "fixed-1.8V";
>>>> +		regulator-min-microvolt = <1800000>;
>>>> +		regulator-max-microvolt = <1800000>;
>>>> +		regulator-boot-on;
>>>> +		regulator-always-on;
>>>> +	};
>>>> +
>>>> +	reg_3p3v: regulator-3p3v {
>>>> +		compatible = "regulator-fixed";
>>>> +		regulator-name = "fixed-3.3V";
>>>> +		regulator-min-microvolt = <3300000>;
>>>> +		regulator-max-microvolt = <3300000>;
>>>> +		regulator-boot-on;
>>>> +		regulator-always-on;
>>>> +	};
>>>>    };
>>>>      &pio {
>>> 
>>> 
>> 
>> 
>> regards Frank

