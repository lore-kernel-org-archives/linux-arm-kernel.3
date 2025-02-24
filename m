Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E423C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHlM9lUjZccT/hO6qimQm/Cu7ACcDUwO9z1UJAm9UVA=; b=do355tTticZHsd1Wc2PWVkd5yl
	lOgt12fUim2sLlOypWhkyNHB3QfIp5CyAGpCYXgINuI37O3oq9nad/lNtkBvdPkl22gjTauFltyNR
	PtnpUQnarapF+Qsf2ceyDDPRIWtZ5u613s9Qq/ZKG975GdU4yiQakgLOWdfDUQ8YVk1s/h8NLQ3u0
	Cl7knN3zsT6kob4ivZcB9Da+HfZbbxV5+qZJTfN+gPj2fU2oo3GhZBnhDB6EH8RNyxZcg71QufqeG
	rj4AeukTisaV3xhqufUrrMPem8dkV0dkpkYhxDqalLIILgOo6IFEBDj6vUGzlhM0H92WaQ23gWwII
	MxZ7SRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHb-0000000DnQb-29RB;
	Mon, 24 Feb 2025 13:14:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXQJ-0000000DfRG-0ACy;
	Mon, 24 Feb 2025 12:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740399537;
	bh=TgNZAgjSLI03J+0oLYbfYvcRE9moSayu1l7EX/brVYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hQpPXP8ypkU1j0KONnWG3KE49hGsbMsEcL9kT47k/YJQs2fnJ1m8V/ezcvfUvH5jr
	 s2ZgH3FWlJZpogW58JV5dQMv55OmnJdRSsmJQZizXWFlWz3etQcqUaurC6FrD9bUtB
	 ZGKTj2m4BYEn7ysUTpCN1GWJsha7aECg7uILTrVeATjweKW6xZRN8VE+BOPpz+PHcS
	 C7Fa2rSyjbN3iHkECVjpdNBsWb9OIOXjZJDoRGMMnQTgkyEGxUiqMPJTOTEWU2Z14u
	 JdKVeEbL3rbnAFpyBI9CUDniQUtBB3OdVkV2mZPeuikzzZqU3bt49hknaL4OfXQFT3
	 qhsXQ8hCFjc4g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B21C617E00EC;
	Mon, 24 Feb 2025 13:18:56 +0100 (CET)
Message-ID: <fd173075-df66-4ee7-a9fa-07e840976f26@collabora.com>
Date: Mon, 24 Feb 2025 13:18:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add ports property
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Cc: "macpaul@gmail.com" <macpaul@gmail.com>,
 =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 =?UTF-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
 <Chris-qj.Chen@mediatek.com>, =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?=
 <pablo.sun@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250220142230.2530583-1-macpaul.lin@mediatek.com>
 <0e58bfb8f2f7b7e83e3da6075986ddbcc84531fc.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <0e58bfb8f2f7b7e83e3da6075986ddbcc84531fc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_041859_221956_5E388906 
X-CRM114-Status: GOOD (  12.13  )
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

Il 22/02/25 09:35, Chunfeng Yun (云春峰) ha scritto:
> On Thu, 2025-02-20 at 22:22 +0800, Macpaul Lin wrote:
>> Define the ports property in the mediatek,mtu3 device tree binding
>> schema.
>> Include definitions for port@0 and port@1, specifying their roles as
>> High Speed (HS) and Super Speed (SS) data buses, respectively.
>>
>> Suggested-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   .../devicetree/bindings/usb/mediatek,mtu3.yaml       | 12
>> ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>> b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>> index d4e187c78a0b..21fc6bbe954f 100644
>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>> @@ -155,6 +155,18 @@ properties:
>>         property is used. See graph.txt
>>       $ref: /schemas/graph.yaml#/properties/port
>>   
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: High Speed (HS) data bus.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Super Speed (SS) data bus.
>> +
>>     enable-manual-drd:
>>       $ref: /schemas/types.yaml#/definitions/flag
>>       description:
> Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Thank you
> 

Is everyone okay if I pick this (and the XHCI one [1]) in the MediaTek trees?

This is so that I don't get devicetree warnings when picking the DT patches
that are adding USB MUX/TCPC to the MediaTek boards.

[1]: 
https://lore.kernel.org/r/20250220105514.43107-2-angelogioacchino.delregno@collabora.com

Thanks,
Angelo

