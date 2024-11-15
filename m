Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B112D6DDEC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 09:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfnL8m/bej8ZDJjxsNFRt4XV2jjXbOwsdTV/H8z0v4E=; b=glLBhjboxjFwInWH4In2sXwKCj
	HBtdvhghZOT+d2umpysTn2zb1bQyrcycMSFUhjy18cqPUUSGM9W8D+sItydL2xlCGevp5jx2xyvFZ
	x9z1Xp44QeRLh8In4GDh5eP6yc0Hc0F0Bz5G3Mdq9RK/K3dO+EBuq7imExoZUIIo5TWIHsYn22r4C
	SYT15jkSX6+MCt6hNpOsGItQe047JJdi9Jve7KMFnTtdorlbP6/RzVvg1vM/JgjTLw2Sqj3FpFUtb
	cs7OBfNKADCkFibm4Bg6ONc7amynaf4fXYc7pqBAqY/5neazD8PCudC6GabrYr9lvRD1RvluBV7UR
	YryozLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsbo-00000002BvB-46Hx;
	Fri, 15 Nov 2024 09:27:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBsat-00000002Bln-1W8F;
	Fri, 15 Nov 2024 09:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731662781;
	bh=Guw0XR5d0BgTLqHT6YoapFxf8RK2MKtxRUr39yYdodE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dk/ckOrE/DWFWJW2vFRsRgMJ4FhMTQHBkF0Bi4nB+DpsWTTjAmh9Q9kjgGJH7cQDu
	 9lwZwx4FUcJ3AgkXiTSlKhM4aK+cvrd8ghAok0SA0WFCWI+UP3qk1dNVoFRyNCmHKI
	 lzn4f3P+bsYz0ekZ4OJAnrTTo30iuGgyIIqXEmTaQg05KbQOKuT9Nx7qLpNJJVNlSn
	 cYCZYf4afyyG1Jy5Tb1XqEMf2k3ieULQd1mI/gBeQrpGVS/LQv83IL64YbqE6PPJ3z
	 0DUFF9OpXm3FyEe3ZgRRqSihuGp6Vxn/nMYcGkC8XwXIeJEUa27WVZWZkmJX6SdZom
	 7bgfL8C5k/7SA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C76117E35D1;
	Fri, 15 Nov 2024 10:26:20 +0100 (CET)
Message-ID: <c681604b-d439-4815-b1d9-ad435b85b5be@collabora.com>
Date: Fri, 15 Nov 2024 10:26:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: Set mediatek,mac-wol on
 DWMAC node for all boards
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Michael Walle <mwalle@kernel.org>, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
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
 <d441b614-0b71-410f-af4e-30cb164d9cd5@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <d441b614-0b71-410f-af4e-30cb164d9cd5@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_012623_552646_7F2373CE 
X-CRM114-Status: GOOD (  25.11  )
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

Il 14/11/24 20:22, Nícolas F. R. A. Prado ha scritto:
> On Thu, Nov 14, 2024 at 10:26:34AM +0100, AngeloGioacchino Del Regno wrote:
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
> Not sure I follow... If we omit the property here it will use PHY WOL instead,
> while the genio 1200 EVK has the property, so it will be using MAC WOL, so
> they're already the same and omitting will make them behave differently...
> 
> Let me recap to make sure we're all on the same page:
> 
> This was the WOL configuration for each board before this series:
> MAC mt2712-evb.dts
> MAC mt8195-demo.dts
> PHY mt8395-genio-1200-evk.dts
> MAC mt8395-kontron-3-5-sbc-i1200.dts
> PHY mt8395-radxa-nio-12l.dts
> PHY mt8390-genio-700-evk.dts
> 
> After patch 1, they all get inverted:
> PHY mt2712-evb.dts
> PHY mt8195-demo.dts
> MAC mt8395-genio-1200-evk.dts
> PHY mt8395-kontron-3-5-sbc-i1200.dts
> MAC mt8395-radxa-nio-12l.dts
> MAC mt8390-genio-700-evk.dts
> 
> And after patch 2, the remaining PHY ones are set to MAC:
> MAC mt2712-evb.dts
> MAC mt8195-demo.dts
> MAC mt8395-genio-1200-evk.dts
> MAC mt8395-kontron-3-5-sbc-i1200.dts
> MAC mt8395-radxa-nio-12l.dts
> MAC mt8390-genio-700-evk.dts
> 
> The only board I have in hands and am able to test is mt8390-genio-700-evk.dts,
> which requires MAC WOL to work. For the others, your feedback on v1 was that
> they should all be set to MAC WOL. Except for mt2712, which you were not sure
> about, but it was already set to MAC WOL so we're keeping the same behavior.
> 
> That's how we got to adding mediatek,mac-wol to mt8195-demo.dts,
> mt8395-kontron-3-5-sbc-i1200.dts and mt2712-evb.dts. Let me know if there has
> been some misunderstanding.
> 

No, it's me getting confused about the current status - and I'm sorry about that.

So just ignore me saying "we can avoid adding" - we can't.
This commit is definitely needed.

Cheers,
Angelo

> Thanks,
> Nícolas
> 
>>
>>>    	status = "okay";
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
>>
>> Thanks,
>> Angelo
>>




