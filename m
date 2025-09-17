Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DF2CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 11:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpWeEr6jhoPJjA92y7DF1fUa14367p9wo3V/fiqnMPk=; b=r9GywLSJIwWNx0xEqW94EQGvB1
	LqrGVXaXpwZTD1qBYTmmbuQGNckuifmrnyKyIB9pgS/rG3guMkIOdHL1jNYqK+MdAeO49QuTGdeKA
	ecK4v5oVvvTXJF/AIJtaj041Lf9r5g1N2mLpIDcnrxrD4rMYLN6x5PxwbCiqqIjDNJR7h5KWTDPyS
	TKXE6YfagRUTPy9k2bmZuggCcxVv0GlXspKVfYh+vVVMWU/fkgnL8WGzVCdkU/EymObVucGieOIv2
	llm4cSzh9OqP01xlJnXWcKHStLMU0S2ypGtBdq8lL6s9NOZsZpE0Kt5lp2wTsjg4ZqqdrOVPCl1Jw
	i3P05SrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqjc-0000000BCBZ-2xRP;
	Wed, 17 Sep 2025 11:54:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqjY-0000000BC9P-3FTa;
	Wed, 17 Sep 2025 11:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758110038;
	bh=gi4OziqmeqkoXsQcp7NMfSD4b7MAu5D/AiyhtslgU+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A77T/z21aH402bY6G6mCyLiy0Mc5p8WVI0s1d3ShvSei79Fh+v5o9xgdhp+tTQCP7
	 pUW22EagPett90K0MFdM+hQ2ldlUMaI33pKF2BQrD1zVbRFNU/JSd5vhka8Kd2+RTy
	 erxlmd4nN9xe3Yone+fjYsgcbt+SBmNQ7A+5aMQndk0ee/vjjsR2/2Z8s7bkEAWmMp
	 6gXv0y4xJ2HyWPkoL0hyMmS2YXFtOBTw87+NAeAr0wPxtJF+S/p/j6P8e7YpIYsWos
	 SfG4hoVADGpYhLIEys0UZQQufiROflCStuTDwKfnLyFN5Gar6x0fZJ71KlokRQU8if
	 iSh0YeSp9uphQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B1FC217E0A49;
	Wed, 17 Sep 2025 13:53:57 +0200 (CEST)
Message-ID: <9d895847-9dd8-45e4-bc3f-a27e80371836@collabora.com>
Date: Wed, 17 Sep 2025 13:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt7622: add 'serial' cell to
 efuse
To: Daniel Golle <daniel@makrotopia.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <18af6977cc34de75e64279141dee69dcbc81c420.1758063737.git.daniel@makrotopia.org>
 <87179c9f-cc7f-446f-9e8d-c84bddb48660@collabora.com>
 <aMqImGmz0uf_aTUR@pidgin.makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aMqImGmz0uf_aTUR@pidgin.makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_045400_977587_5EB129BF 
X-CRM114-Status: GOOD (  23.75  )
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

Il 17/09/25 12:08, Daniel Golle ha scritto:
> On Wed, Sep 17, 2025 at 11:06:13AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 17/09/25 01:05, Daniel Golle ha scritto:
>>> The efuse of the MediaTek MT7622 contains an 8-byte unique identifier.
>>> Add a 'serial' cell covering those 8 bytes to the nvmem defininition of
>>> the efuse to allow easy access from userspace, eg. to generate a
>>> persistent random MAC address on boards like the BananaPi R64 which
>>> doesn't have any factory-assigned addresses.
>>
>> Sorry, but I don't get why this is named "serial" and not "soc-uuid".
>>
>> Care to explain?
> 
> I don't have documentation covering the efuse content but only got this
> information on an informal way:
> 
> https://forum.banana-pi.org/t/bpi-r3-serial-number/14556/10?u=dangowrt
> 
> Either name is fine with me, I thought of it as "serial number", but
> obviously "soc-uuid" works fine, too.
> I can change it to that and send v2 tonight.
> 

Aaaaaah that's why "serial", okay - I got confused because the eFuses contain
many "calibration data" entries, and that triggered me to think that it could
be a "serial calibration data" entry.

After reading the commit description it became very clear that the initial
impression was wrong, but then still, when reading the devicetree without having
the description of the commit introducing that, it's easy to get confused again.

In any case, well, it could be a serial number, or it could be a randomly generated
UUID - but since we don't know, I think that calling this "serial-no" may actually
be wrong anyway.

We can escape this uncertainty though: a serial number is supposed to be unique,
and it is used as an identifier (which identifies one, or multiple aspects, either
an increasing number for chip number, or one that says the production date and
chip number).

Seeing it like this, calling it "soc-uuid" identifies this array as containing a
number that uniquely identifies the chip, be it a serial number or a randomly
generated number.

In case you find out sure information that this is really a serial number (which
doesn't really look right, it's too many bytes, but you never know) you can always
come back later and add a comment in DT saying that it is just.. that.

For now, let's go with soc-uuid :-)

So please, change the name to soc-uuid on all four commits, after which, feel
free to add my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

to all four commits.

Cheers,
Angelo

