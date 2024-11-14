Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DC7D68B19
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQXl4q59fNjX85EwQ+m9pfVKNMy5RRT2Oq5kVUxSP8k=; b=Wp63l6Bu1VbVUzhqM1qdTo0S0c
	M8065CVfPe/zGcnKOya8wqv62rq4wX3vgkNPzXynOaLDn/egIkjpaELNloEVqKw6wJubONPUkU0Gd
	a/PguEqMKAWD8k4hMdqiaQkIpVojMiQO+ckhYRnzsBTuQy6sgvH2u6Sjs7dF7lMgjRMHhnAKOltj1
	iQXeIDk595YGL+WkjI9GSKpo3s2NFIxvNdG9iRx2tOseqSr2AzIDn5YI1yw4FEyGtFmmC2PR82OP7
	e5RbGH985K5z6YHDvNIcDeX+pkFb5n4RQZ0PITFqGio3yid0rFvvgKHgpZi5JN5TR2kjUplDV0/Vv
	jSF6VKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaN8-0000000A85W-19F5;
	Thu, 14 Nov 2024 13:58:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBaLI-0000000A7qK-3LSY;
	Thu, 14 Nov 2024 13:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731592620;
	bh=xXmKpFmqAMp48Y7ttayGjWqRYdxHGKlAorYsho+aMWU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EYOwq4+kKxuaOhDYbs8RKuUUPRF+f3aQPWayV9Nqu8LJ9IXJ4vuTG7EKa1QbkkuoY
	 0nJawHXVrCFbuf/jFbKvEC66c1koNvSPnAdAESpFMc6+yGzf3s1EDop25TdW++FbGH
	 2Z5PUz5FmwJN9Ym5Wjj+4EhItfFEYhDKqz6RosFxvlGq8JpTA56Fm7udasiY5OaHNR
	 JpHjIJtMgU5ZsOZMh4XR/mXkVQkcnkrjjlCdyQ1YwkCOZk/ZZJsKsk7lPO9Ht5rKyG
	 0U8dFrEkhNxY/L3zM2GlasIZTIZpKZhntVg05DjgW7PLet8XI6gJB5OBd0G64r6IbN
	 Lng+IxWOdIIaw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3025917E3663;
	Thu, 14 Nov 2024 14:57:00 +0100 (CET)
Message-ID: <1a36456b-4844-4827-ab53-598ec14d7437@collabora.com>
Date: Thu, 14 Nov 2024 14:56:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Set mediatek,mac-wol on
 DWMAC node for all boards
To: Michael Walle <mwalle@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>, Simon Horman <horms@kernel.org>
References: <20241109-mediatek-mac-wol-noninverted-v2-0-0e264e213878@collabora.com>
 <20241109-mediatek-mac-wol-noninverted-v2-2-0e264e213878@collabora.com>
 <bdbfb1db-1291-4f95-adc9-36969bb51eb4@collabora.com>
 <D5LWHT7OU9DQ.NCMSTUWT5991@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D5LWHT7OU9DQ.NCMSTUWT5991@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_055705_038817_A29DAE97 
X-CRM114-Status: GOOD (  16.19  )
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

Il 14/11/24 13:29, Michael Walle ha scritto:
> Hi,
> 
> On Thu Nov 14, 2024 at 10:26 AM CET, AngeloGioacchino Del Regno wrote:
>> Il 09/11/24 16:16, Nícolas F. R. A. Prado ha scritto:
>>> Due to the mediatek,mac-wol property previously being handled backwards
>>> by the dwmac-mediatek driver, its use in the DTs seems to have been
>>> inconsistent.
>>>
>>> Now that the driver has been fixed, correct this description. All the
>>> currently upstream boards support MAC WOL, so add the mediatek,mac-wol
>>> property to the missing ones.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   | 1 +
>>>    arch/arm64/boot/dts/mediatek/mt8195-demo.dts                  | 1 +
>>>    arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts | 1 +
>>>    3 files changed, 3 insertions(+)
>>>
>>
>> ..snip..
>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>>> index 31d424b8fc7cedef65489392eb279b7fd2194a4a..c12684e8c449b2d7b3b3a79086925bfe5ae0d8f8 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>>> @@ -109,6 +109,7 @@ &eth {
>>>    	pinctrl-names = "default", "sleep";
>>>    	pinctrl-0 = <&eth_default_pins>;
>>>    	pinctrl-1 = <&eth_sleep_pins>;
>>> +	mediatek,mac-wol;
>>
>> The demo board has the same WoL capability as the EVK, so you can avoid adding the
>> mac-wol property here.
> 
> Not sure I can follow you here.
> 

That's in the sense that they do WoL through the MAC and not through the PHY (as
in, it's the MAC that has to be configured for WoL and not *only* the PHY).

>>
>>>    	status = "okay";
>>>    
>>>    	mdio {
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
>>> index e2e75b8ff91880711c82f783c7ccbef4128b7ab4..4985b65925a9ed10ad44a6e58b9657a9dd48751f 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
>>> @@ -271,6 +271,7 @@ &eth {
>>>    	pinctrl-names = "default", "sleep";
>>>    	pinctrl-0 = <&eth_default_pins>;
>>>    	pinctrl-1 = <&eth_sleep_pins>;
>>> +	mediatek,mac-wol;
>>
>> I'm mostly sure that Kontron's i1200 works the same as the EVK in regards to WoL.
>>
>> Michael, I recall you worked on this board - can you please confirm?
> 
> I'd say so. Honestly, I've never tried WoL on this board, but I'm
> not aware of any difference to the *demo* board (not the EVK).

Thanks for confirming. I will ignore the devicetree commit entirely then, as this
would ...un...fix the fix (meaning that patch [1/2] is good!).

Cheers,
Angelo

> 
> -michael



