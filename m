Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D231C369B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9lIO30gqRBW0y/a78+ENmC3GbSysBdrk9cFsGss7QQ=; b=L2UXppYzgSJ66vP6bZrfB0hS/N
	VFNDx9mCRcDIlj7lDN8fGn54rizbdsG6D/qD40O3rasrhUYov12j3zWzG0IqnVs+5YO6llbQ6qkMA
	W1xvoATehAKcTVjUKb62/krh9T4LilP+sICFz3Hdv1r33gnZ62Ak9N7j1fySWXm0sMZRuaDCX7Wq7
	+omQCX2dJvW9Nn1q/q0bRD/B7ZiZPQ1nrIcdyBEFh575I94yjpbVhE+5+Uir9KG0EJ1Yhbxw5i2xp
	wXole8xwCF+F4JOKyHwxjYn3eQNhAu3y2n39BqSt8TnHfh6u6Kzm9wjOdyWfZJ4Nz+jZayLjZNH+K
	zyGCKD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b5N-00000004spy-3vDN;
	Tue, 15 Apr 2025 07:52:01 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4aqc-00000004pPh-1HG9;
	Tue, 15 Apr 2025 07:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744702604;
	bh=Gyqan9yP4T12N6ZMRWgle82MYUjBp6SE0Fd8GLFRa4M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OQ3cErnZenuC4mmP4FMwxHNVrjpN86+MlVyREFmpaMcqiJW6/QPaM5zgBvCTGlcRz
	 +SfMEAGeHUnnHdBxDDG63RKjzzejYguNsvJUaXv6rTrQlMTQDGca9oOFnCRnHrZyCr
	 VsKCs3qi/vAwzwbxKKBMnlIpo1vlH7wv+LuHwviH3ODapO4eJAsyQ/LUTv2JhPOSLi
	 75p6CGbfqiCqBxfC40Ri1eUKg2jhuktbjcUPWtKSYyL8tcafGLJszA41FaQONzB9y/
	 8zmN4vyB8j31+WKo3qwZTId7ip+8GnEgwi69/uGNDKFpgopnMv2fVBlXtp8eFaQ+XU
	 5BHXEWTRojqTw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BDC8C17E0ABE;
	Tue, 15 Apr 2025 09:36:43 +0200 (CEST)
Message-ID: <36fe0778-399a-4406-8516-54b968cd9073@collabora.com>
Date: Tue, 15 Apr 2025 09:36:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
To: Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <linux@fw-web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
References: <20250412102109.101094-1-linux@fw-web.de>
 <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
 <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_003646_526669_E8FDAC0D 
X-CRM114-Status: GOOD (  18.48  )
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

Il 14/04/25 14:32, Daniel Golle ha scritto:
> On Mon, Apr 14, 2025 at 11:27:23AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Sinovoip has released other variants of Bananapi-R4 board.
>>> The known changes affecting only the LAN SFP+ slot which is replaced
>>> by a 2.5G phy with optional PoE.
>>>
>>> Just move the common parts to a new dtsi and keep differences (only
>>> i2c for lan-sfp) in dts.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>> ---
>>> v2:
>>> - added basic dts for 2g5 variant
>>> - moved i2c used for sfp-lan to board dts
>>> ---
>>>    arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>>>    .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |   5 +
>>>    .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
>>>    .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
>>>    4 files changed, 414 insertions(+), 400 deletions(-)
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>>> index 58484e830063..a1ebc9aa4ba6 100644
>>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>>> @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>>> @@ -107,4 +108,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
>>>    DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
>>>    DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
>>>    DTC_FLAGS_mt7988a-bananapi-bpi-r4 := -@
>>> +DTC_FLAGS_mt7988a-bananapi-bpi-r4-2g5 := -@
>>>    DTC_FLAGS_mt8395-radxa-nio-12l := -@
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
>>> new file mode 100644
>>> index 000000000000..76eca976b968
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
>>> @@ -0,0 +1,5 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "mt7988a-bananapi-bpi-r4.dtsi"
>>
>> This should at least have some different compatible, if not probably also a
>> different model string - as it's a different device.
>>
>> 	compatible = "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt7988a";
> 
> Imho it doesn't make sense to declare compatibility with the
> "bananapi,bpi-r4" as the "bananapi,bpi-r4-2g5" is NOT compatible with the
> "bananapi,bpi-r4". It's a different board and using firmware meant for the
> "bananapi,bpi-r4-2g5" on the "bananapi,bpi-r4" (or vice versa) will result
> in a non-working Ethernet port.
> 

Is this device a BananaPi R4 variant, or is it a completely different device?

If this is a completely different device, then it's not even a BananaPi R4,
otherwise this is compatible with BananaPi R4, with a small variation :-)

Cheers,
Angelo

