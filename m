Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56ADFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXtEFyjILtWhbRutDQMSA3GXsEsE8vAYPtWZqB2feG0=; b=GZGuXPJYBjY+bohf/MBK5vZal4
	rcl45J6Nr9ZB5SHNOCL8pRLdfEtoO8NWFtgbq6OPqls8cYyMl5bcjPYBOPs5TQVL3/cuUcTW6GhiE
	bHDORGBAY/Hs072x9SFUMpSGkdboqAzI9rStpfCrS50eFaHqzaVi+vGXQoDPHfsnfnLdeuxbMPfbr
	5JaEvp4Ztb7ItSnl5uJWEIY5IJs0rWaO6FAJbMcgxLdxn+aXVRzaV6FNB0hyDZDtczDm71TrB5rHm
	RuVaLHAyqlo0DH+EGZwIPT0wHugLbN0VSR69K9+8icxQ0Ne3NWuQwBDeeKG93et+DVvcWQbFiXpev
	T0UoPUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pOH-000000063Q9-3XTu;
	Thu, 09 Oct 2025 12:05:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pOF-000000063PQ-3Qc2;
	Thu, 09 Oct 2025 12:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760011497;
	bh=1r1z0tu+/2i02NJ3LYyZb+KmF5RnrgujhZBz/NzLGNI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XWR9WEkQjABZZJ7IfU6ny9j8m1sVf9Ls3BE4r1Czi9tLN0i43vyK+cEYRt4IBuhfX
	 aqEKNcZuergrj4r39/UHaWIdh6ffZiOfUiuDr3qboMRJiTnXKFB7Sy3H9VMY3DQELg
	 aBQ+RkvPARo+WYUW15egQZu3uPBrJLT/J61DaM3CHfSjLPlO1A6xxiPT6Fz4m7Ywdn
	 4iob9aPpBY/xIx/WMcoXBrj09ll8EvcxDHhYDzenrjDsINzuhvIvSg5Z2H4oDOMsF6
	 Ho2/rBHdd6QjL62s2iegHtFz25Ga45hZulpxC1V7Jnvd5WC7EIpQfezq+HMyMSZ3ei
	 O4cILnK0s86uA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 31C7917E0125;
	Thu,  9 Oct 2025 14:04:57 +0200 (CEST)
Message-ID: <217a6749-9631-4f9b-a33d-648c34bd09ad@collabora.com>
Date: Thu, 9 Oct 2025 14:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v4] arm64: dts: mediatek: mt7986-bpi-r3: Change fan
 PWM value for mid speed
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>
References: <20250930021656.1394942-1-mikhail.kshevetskiy@iopsys.eu>
 <ce4bad93-2663-4c07-8cdb-fb6fdcbfc1ca@collabora.com>
 <15eb53dd-792d-4bab-84fd-2abd017c0a84@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <15eb53dd-792d-4bab-84fd-2abd017c0a84@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_050500_008545_1C4A16AA 
X-CRM114-Status: GOOD (  11.74  )
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

Il 09/10/25 10:55, Mikhail Kshevetskiy ha scritto:
> Is there any chances get it merged to linux-6.18?
> 

No, the window is closed - but I have added this patch to my notes, will be picked
as soon as RC1 is out, will be in linux-next soon after, and will land in 6.19.

Cheers,
Angelo

> Regards,
> Mikhail Kshevetskiy
> 
> 
> 
> On 30.09.2025 14:34, AngeloGioacchino Del Regno wrote:
>> Il 30/09/25 04:16, Mikhail Kshevetskiy ha scritto:
>>> Popular cheap PWM fans for this machine, like the ones coming in
>>> heatsink+fan combos will not work properly at the currently defined
>>> medium speed. Trying different pwm setting using a command
>>>
>>>     echo $value > /sys/devices/platform/pwm-fan/hwmon/hwmon1/pwm1
>>>
>>> I found:
>>>
>>>     pwm1 value     fan rotation speed   cpu temperature     notes
>>>     -----------------------------------------------------------------
>>>       0            maximal              31.5 Celsius        too noisy
>>>      40            optimal              35.2 Celsius        no noise
>>> hearable
>>>      95            minimal
>>>      above 95      does not rotate      55.5 Celsius
>>>     -----------------------------------------------------------------
>>>
>>> Thus only cpu-active-high and cpu-active-low modes are usable.
>>> I think this is wrong.
>>>
>>> This patch fixes cpu-active-medium settings for bpi-r3 board.
>>>
>>> I know, the patch is not ideal as it can break pwm fan for some users.
>>> Likely this is the only official mt7986-bpi-r3 heatsink+fan solution
>>> available on the market.
>>>
>>> This patch may not be enough. Users may wants to tweak their
>>> thermal_zone0
>>> trip points, thus tuning fan rotation speed depending on cpu
>>> temperature.
>>> That can be done on the base of the following example:
>>>
>>>     === example =========
>>>     # cpu temperature below 25 Celsius degrees, no rotation
>>>     echo 25000 > /sys/class/thermal/thermal_zone0/trip_point_4_temp
>>>     # cpu temperature in [25..32] Celsius degrees, normal rotation speed
>>>     echo 32000 > /sys/class/thermal/thermal_zone0/trip_point_3_temp
>>>     # cpu temperature above 50 Celsius degrees, max rotation speed
>>>     echo 50000 > /sys/class/thermal/thermal_zone0/trip_point_2_temp
>>>     =====================
>>>
>>> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
>>> Acked-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com>
>>
>>



