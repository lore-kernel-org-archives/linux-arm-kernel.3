Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74296E677F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHkSNNNrwMqpzUY5rzOnLOxgjwpzlT3G1/0AWJvzSww=; b=a+Zkzz87Dui5VAOnFKFLNL+LDr
	8A8/ybZvualfRiLUxfoJIXe30l24vVqBOH9/QTe3kql39kl85Bke2ZL5vgvQfFRJbBJhH9WamKvP/
	dMR4ueZzKvS5farizERGNCq8Qm0kLRYbP408ST13HS8hYJ2Qy2kU+CI6c/aOa9nCnH4eHT+NIP7xR
	z1qOVeDkJYSnSQn0D94o3JmUu7xNni9Xcx/Ilw9RCZq9UUmz4vKDAOKBLVjjckHVzdH1AwuZt9ELh
	YV8TiR4F1CgI69wO2miO3w3ve439LA/atG0V8dLfFSVU3ZDmYElpTnXHI5jS05raK7janpdlV9cjo
	o7dxTM3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t79yt-00000009LHg-2VPL;
	Sat, 02 Nov 2024 08:59:39 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t79xC-00000009L7u-1kHH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 08:57:56 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 4A9CEA09BA;
	Sat,  2 Nov 2024 09:57:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=oHkSNNNrwMqpzUY5rzOn
	LOxgjwpzlT3G1/0AWJvzSww=; b=GecmhibfrMQ6yCpYosL1WkhOmP+xHjG0iK9T
	6HiDGbqFxSQJxakL1sdfOlYdSRyBZqJdv+Pe93HUUvlqmowepDO1C4XwWCsf9kOM
	2XJHP1ullatnEIWCLoxQbCPE55CYtzBV1FTQw8RqeW2tK7KiPdXREFqxtd8ecp0l
	kJKkBStlW1p86Y4irCxPCrursQBsfkZN7aclHCskVrzNDY68aIvvDESexkn0N9Zz
	Zb6NlxIo2iaQCqx0KcOIBJs3vD4LxEO7DMLZE1Z5IzyrTl1iRQlzEkQ+OlXZpTPi
	X9+hxobi0YYd7oht8C5/F4+H6yyLWrbxk1SE2S2HyV3jVzXEMCnhZydBUrOQrjCg
	zU6hnORa97kwcYB0P+gN9Ug2v3Bnd5xtiXW3PhpzIkb89GVaOmLLJ9zLlcCNUq0p
	CMZfuLCWgqabPYBkSGgY9ARpeg2JaUoMUVPI5B9xJ6PGbpymlNl/cQ7v7ay8DWGN
	3Bs/AWCUFwwo4nnvdbu4njLRzzJjaLMqVq8Xf8AA74rhZQ6GqoxRtlozDJ4uZDQc
	/imM9iHRGNQE/swcmEa7UrzZ57Xni7PqqnfXb3NWwwzMVFOZ3fGz0hQbga/UqN8W
	q4gcnmp2gFX0Szwejb5/JEejhgHtt3M2hmpdzNWY0W0wBQPApb+AQXwVdjFlUqqG
	vBokBzo=
Message-ID: <ce76f036-d8ac-4f3b-a229-ee1550c2422a@prolan.hu>
Date: Sat, 2 Nov 2024 09:57:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] dt-bindings: dmaengine: Add Allwinner suniv
 F1C100s DMA
To: Rob Herring <robh@kernel.org>
CC: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
	Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
References: <20241031123538.2582675-1-csokas.bence@prolan.hu>
 <20241031123538.2582675-3-csokas.bence@prolan.hu>
 <20241031181749.GA1260045-robh@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20241031181749.GA1260045-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.8]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_015754_934336_471C391F 
X-CRM114-Status: UNSURE (   7.00  )
X-CRM114-Notice: Please train this message.
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


On 2024. 10. 31. 19:17, Rob Herring wrote:
> On Thu, Oct 31, 2024 at 01:35:29PM +0100, Csókás, Bence wrote:
>> Add compatible string for Allwinner suniv F1C100s DMA.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Link: https://lore.kernel.org/linux-kernel/20241024-recycler-borrowing-5d4296fd4a56@spud/
> 
> You don't need a link to Conor's ack.

I don't? I thought whenever I collect a tag I should provide the link as 
well...


