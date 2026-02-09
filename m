Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98E9E7E0C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 11:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeaatGTazdImiT/XM1FnhJJRe6EeXeVkuzHwA/9Wk18=; b=P9tTthBq371/QZ4Zb4t7NBxTbd
	t9uIUqk3buitKrVGVgzUeRobZ1tEInzj9YlzAJHGPBI3/WW7iuLuTb4cChN4l5clusTewKg6sBSvJ
	q7UwF76SGhijSgN4VoG8F3XvynPb5rpVP90cLEjddDvxM2mpKJmFsas6kqeRoaPfKVLUVlahiAqkM
	zuN8QgnZSMXL66tM2eGJhwq7e0e8JEha2ltL7EV21cRZGnTNP/h63TsQey6HVTTSSBwHl67mXUVKK
	4EjzFRv42Keu2OFdr12rvbiIsgK9MJAztIj/G1uMGKoKNoBnwPErmf/fDYNdzU6sMz3w34Bhhsmv9
	WKXuJSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPXU-0000000FJ0G-29Bi;
	Mon, 09 Feb 2026 11:34:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpPXS-0000000FIzX-1BBl;
	Mon, 09 Feb 2026 11:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770636883;
	bh=4QrS573yngF8n4NJk1Mnael+xbLQy+ZP/mKMuKo0Ysc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WwrKdaXGqV2ja4v3TQhhSZpBckr3H70ZFVczJeL8EUXvlZNRaLuI6fQTTSG0CVVHW
	 8lPe2ABwjsv3/lAwLiVYsRvnHYowhnbIKcImczfEuW9bQYiPha9vUAgel8vydBNojY
	 MOjhtHgVXRPWHDWMw7/AP1BCtVv7+7RcIXv3oUfJZ9aytAHR+KC+iqdrfneufQf492
	 2SxvFpjVn/4escftOJgZQO1kESdWPtZLsPBZjZ8PrfO60ABooWv6aPyA66ERArfUlJ
	 qRIsqMwI+pXkBgU5j2WI203EaPGl1C4gYci4Rprc9CsNcN+xs2XDR7awRE/KMEXZ9w
	 tbDXFgwbTrrfw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C60BA17E0699;
	Mon,  9 Feb 2026 12:34:42 +0100 (CET)
Message-ID: <3476c51b-9293-40f1-8b5c-9ac9802d7d97@collabora.com>
Date: Mon, 9 Feb 2026 12:34:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
To: Krzysztof Kozlowski <krzk@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, phone-devel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
 <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>
 <20260207-tricky-strange-swan-6f11b0@quoll>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260207-tricky-strange-swan-6f11b0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_033446_490624_033112AC 
X-CRM114-Status: GOOD (  19.22  )
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

Il 07/02/26 11:51, Krzysztof Kozlowski ha scritto:
> On Fri, Feb 06, 2026 at 11:20:48AM +0100, Luca Weiss wrote:
>> Document the Mediatek mt8516-syscfg.
> 
> Which is what? What is syscfg block?
> 

Not sure this is really a SYSCFG block.

This should be a GPIO controller range, which is split between IOCFG and EINT.
Now, the legacy drivers are declaring the EINT iospace in the pinctrl node, and
getting the GPIO controller (IOCFG) iospace from a regmap.

I don't have any board with MT8516... but well, the really-right-thing to do
would be to migrate that SoC off of the legacy driver, to the new-style one
that *properly* takes two iospaces:
"base" -> (0x10005000)
"eint" -> (0x1000b000)

Luca, if you've got such a board, could you please try to migrate this SoC out
of the improper (but working good) driver and bindings?

If not... well, I think this block is IOCFG, not SYSCFG...

Cheers,
Angelo

>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> ---
>>   Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
>> index e57add2bacd3..a67699f1faee 100644
>> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
>> @@ -91,6 +91,7 @@ select:
>>             - mediatek,mt8135-pctl-b-syscfg
>>             - mediatek,mt8173-pctl-a-syscfg
>>             - mediatek,mt8365-syscfg
>> +          - mediatek,mt8516-syscfg
> 
> Why aren't you placing it with all others mediatek,mt8516 syscons?
> 
> Why this is so generically called "syscfg", completely not looking like
> a real name from datasheet unlike the others in this device.
> 
> You have entire commit msg to explain that.
> 
> Best regards,
> Krzysztof
> 



