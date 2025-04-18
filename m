Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D932C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RKRGYbvX0d8/wCVSDrSUcwio1ED2W9cDRKkduf+/Jp4=; b=0Nw1o0iEln0T0C1ff0rE9p3T8s
	YGs1eGyXVMK2Flmwtnr2MOyYdQ3f+qBcHh7OEXnTj5uFiOKYBoo35zU7qEqmgEcXtq9RUoRUn6ZFZ
	b9UAIqVxVWHy/SdD5nl3ihOLUtct+n7eB/Izyjoe/+s/UTRHgMhYibzZoF7eeRMWSFP6AmOhfjzWB
	XnpGtMa7+Ji/kwJkivhKK+wJylQ3V18TiwbSol7/RuRThWyM032yRX6NndZJPqJTV2ZJJow8CTERg
	EwXXn31pGtig3vAr9IxjSrwX9ZWC4sHdp52GJWD9Cmt+Oe2HWb1BABf+hEa+QhEDThlDr6RKGuH/D
	4p05VFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hWJ-0000000Fglz-2zji;
	Fri, 18 Apr 2025 08:56:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hK0-0000000Fei7-11wF;
	Fri, 18 Apr 2025 08:43:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744965817;
	bh=rM5eZAwM+lkgkoP5sejzA3v4JK1mhsyQHalBXqeI3fQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bv68wFqySxgo/O774W4jNvf7YUlx0ykynSscT4gIZ1ZthGNwIorfkkTgWRyJ1mNqC
	 EmUt1SJUT1zNQ1B7i1KAWNnBsx2l6LwpasSop2nEWLwoSGsebuSjaP7wgeB5U/Xb9l
	 uEy8jVOpj2OhBWnlRg5ufQqWdHpo0nzKqFS3jVUVETATfoahWg419LtagdN7bckgD5
	 2BJr/6zDJFtm22ukPDVuZ9Bqe8vk2LvrKixWCH+UEdNr82sQUb+Y0nbqVj5Ztn2fV4
	 85/F/zyHkK3lMvcSTcIbI0cS1vj0ZSZs4y50KEV7DzSL+RhzYXkAa6xIWr9pxw2hh0
	 VDbZtFhagJJcw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 25C6517E08E3;
	Fri, 18 Apr 2025 10:43:37 +0200 (CEST)
Message-ID: <e783eced-114f-4fae-8ec4-fd665b40f837@collabora.com>
Date: Fri, 18 Apr 2025 10:43:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>, kernel@collabora.com,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-1-8733e192cc73@collabora.com>
 <3fa1573d-e3b4-434c-867d-38fa69ad3a8e@linaro.org>
 <7ab084b8-e77a-4881-a6a6-057b89613fb4@notapiano>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <7ab084b8-e77a-4881-a6a6-057b89613fb4@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_014340_433707_B919C5CB 
X-CRM114-Status: GOOD (  15.76  )
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

Il 19/03/25 15:25, Nícolas F. R. A. Prado ha scritto:
> On Wed, Mar 19, 2025 at 08:16:37AM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2025 23:22, Nícolas F. R. A. Prado wrote:
>>> Both MT8192 and MT8195 have an L1TCM memory, so it should be described
>>> in reg, and therefore reg's minItems should be 3, as is already implicit
>>> by reg-names. Override minItems to 3 for MT8192 and MT8195.
>>
>> I think that was the original intention already, because reg-names are
>> expecting min 3 items. Basically you just correct the missing lower
>> constraint.
> 
> Yes, exactly, that's what I meant by "is already implicit by reg-names".
> 

Nicolas, any way you can respin this patch so that we can get SCP for MT8188
in this merge window, please?

If you cannot do that, I can respin it on my own, no problem.

Thanks,
Angelo

>>
>>>
>>> Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>   Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> index adc6b3f36fde49eb3fa7ed3f08b0fa9e7f331162..ee33c233e44f3d51f0851b35697a24208c87f68a 100644
>>> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
>>> @@ -185,6 +185,7 @@ allOf:
>>>       then:
>>>         properties:
>>>           reg:
>>> +          minItems: 3
>>>             maxItems: 3
>>
>> maxItems can be dropped.
> 
> Sure, I can send a patch for that in the next version.
> 
> Thanks,
> Nícolas



