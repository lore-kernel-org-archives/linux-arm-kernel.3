Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404A6C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 10:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOYmWpl6tHiHhkUwu5Np2oPIDbB6eQPO6/XJPdy5jb8=; b=HGoDNX77dCPtrNL/ggedS+O3Hy
	0n7fT3E3RIgP/svo94y/OqAqG6Z1R3qElaLnGDn71bCyzRwP01tJFzvebVHailXkn6QC9xMdH5RhG
	NBjWWRojNFea9/6HdgL8oDCtF7R5R2qGbn4XKYWXThQg4yNl5UOTb7tXUPOUf+xJNc0GBf+bFYYc7
	K7v3uqc1dbvtvyWC3SEHqMW5XfCacpiV0Ad8titCPykavkS0Lk8Q+PZolHK3UMN+bJg7Ng5znTJur
	ykXDwp0mXJ/VwG9zDyRiFB66MJGQm5HhWk+vb2VemOjdXvaArr6wN5wFT6RLZQWoqBbs6j8EbmJD9
	wKQonuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4dKI-00000005IAK-38yD;
	Tue, 15 Apr 2025 10:15:34 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4d20-00000005EJ4-46it;
	Tue, 15 Apr 2025 09:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744710998;
	bh=bgeLGFc6Lu8MfOCTVrnl63YOXLXNQYS+dPUwg8vroI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ocIU88IZ7QwCkATYSbvGYuue3xupbDKk40EFkuPvP5DPuPBVg9O7BH7v13sO+iQN3
	 5U50K4eNH39QGjUQt7qtEES1DvnTT5HdINfKU6ajQD3LOZD6G2qC+prUENdAKnRxUp
	 jShtvkgDSrFPEoaoS9s4uq8S8qNEaKQ9Bfjr7k9tCjCkdzaXJHomdapENQqtM8oK9X
	 k1vn18rYuGidWCJ38yap+EJUVRe3AO33dXKBSJGL2twctxS9LLys8dcy/zUmSCQU3w
	 9JXKaP6EnnnSb5wVsowxQdUsquplEndg8/AoE9UCoIZYdSgYAuiqCW2uJZ8jl+ZXSS
	 DtWgbJRoEKlXQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE2C017E0FD5;
	Tue, 15 Apr 2025 11:56:37 +0200 (CEST)
Message-ID: <8fe762e3-a9eb-4a9c-81a2-b7a10539b615@collabora.com>
Date: Tue, 15 Apr 2025 11:56:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
To: frank-w@public-files.de, Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250412102109.101094-1-linux@fw-web.de>
 <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
 <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org>
 <36fe0778-399a-4406-8516-54b968cd9073@collabora.com>
 <D7682B25-5BEF-46D1-A5FD-32D2AAF84EFF@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D7682B25-5BEF-46D1-A5FD-32D2AAF84EFF@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_025641_167067_575289C7 
X-CRM114-Status: GOOD (  19.46  )
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

Il 15/04/25 10:07, Frank Wunderlich ha scritto:
> Am 15. April 2025 09:36:43 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 14/04/25 14:32, Daniel Golle ha scritto:
>>> On Mon, Apr 14, 2025 at 11:27:23AM +0200, AngeloGioacchino Del Regno wrote:
>>>> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
>>>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>>>
>>>>> Sinovoip has released other variants of Bananapi-R4 board.
>>>>> The known changes affecting only the LAN SFP+ slot which is replaced
>>>>> by a 2.5G phy with optional PoE.
>>>>>
>>>>> Just move the common parts to a new dtsi and keep differences (only
>>>>> i2c for lan-sfp) in dts.
> 
>>>> This should at least have some different compatible, if not probably also a
>>>> different model string - as it's a different device.
>>>>
>>>> 	compatible = "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt7988a";
>>>
>>> Imho it doesn't make sense to declare compatibility with the
>>> "bananapi,bpi-r4" as the "bananapi,bpi-r4-2g5" is NOT compatible with the
>>> "bananapi,bpi-r4". It's a different board and using firmware meant for the
>>> "bananapi,bpi-r4-2g5" on the "bananapi,bpi-r4" (or vice versa) will result
>>> in a non-working Ethernet port.
>>>
>>
>> Is this device a BananaPi R4 variant, or is it a completely different device?
> 
> The only difference is that sfp-lan is replaced by RJ45 socket with mt7988 internal phy.
> 

Perfect, then:
  - The only difference is one routing
    - The base board is the same
    - Same hw project
      - The two machines are compatible with each other
        ...bar one difference

...then the compatibles shall be as I said before :-)

>> If this is a completely different device, then it's not even a BananaPi R4,
>> otherwise this is compatible with BananaPi R4, with a small variation :-)
> 
> Sinovoip now announces a R4Pro with some more changes (e.g. an external 2.5g switch),but we have no detailed shematic yet. It looks they also plan a R4lite which is based on different SoC (afair mt7987),but this is for sure different device (and so not using this bpi-r4.dtsi).

In that case, R4Lite shall not be compatible with R4, as the name may be the
same, but in practice it's a different machine.

> 
> But basicly all are named BPi-R4. I guess R4Pro will also get own dts as too much changed.

If R4pro is a redesign of the R4 board, that would not be compatible, as it
would not be the same base design; otherwise, I'm sure you have well understood
how it works for the compatibles, anyway :D

Cheers!

> 
>> Cheers,
>> Angelo
> 
> 
> regards Frank



