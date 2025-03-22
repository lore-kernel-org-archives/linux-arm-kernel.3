Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A346DC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 19:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlJEbPPbIUzOYO/Yzg2oCOOmqaFv09aLLXibTWsy+xg=; b=HjFQ3aQpaQhxa8QvAWLsKPlZzo
	6LjIDqHn4UKN0Xz1MDFyCjswAT+eiRTi59gVPayZ92wLBsaD5Aay2SirrSdaJIlWr+SFP5hLRhzFx
	XdNLNUdRvu9IS/w6e+oFy8XB/R3QiLLqYUSafzbpB0WnuUXRcZODG9Qs2wK6feMsADYLZdi5kHuMC
	/xmQ045lNRk649KNc/3WT+jvXFGkC5/rsSm5C4xeJzPwa3PUm/JXD7CGnePGPiDMGj7Y9fopEKNs/
	UBqG6Iw9pmP+zVWHEhL1ghBeRgYTma+KtihbyJhoSuFkct1hwCAr5Do1wgpbi9oPeTnKyRZ/jNCHZ
	EA4ghe7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw4ey-00000000F5m-3tjZ;
	Sat, 22 Mar 2025 19:37:32 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw4dH-00000000Exm-3vpt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Mar 2025 19:35:49 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 2C8B2A02DE;
	Sat, 22 Mar 2025 20:35:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=rlJEbPPbIUzOYO/Yzg2o
	COOmqaFv09aLLXibTWsy+xg=; b=t32GIkcQ7LeV857VWYYWeXH1zP9LRfEexX2q
	1ZGm4TZv67eHxty97zWKjGe98Hl/ti8TcVdvbUYdif08FSTwBWQ83KTfixHRO5sN
	pGqA1pRKvHbPNcJKe37Ko4AyyUghSz1vAhgRX7ZgGXiJSjaJCiu6T6m/9sCM1NVW
	r69cDWPAHUS8yq5q3tnSOeXUHtNPXqsmaPmKWrHqqx7bvKvL2OmWsnM8rtVNdgS7
	JC/9zllFCtNHWROAcGklDqA+vQQM4EtcDAeiP5Uui54APGdl12o+cbbCBPFQq/Fx
	r9NJOFrwGLG1/uKzNbDXZGrz7CnGGujbaAomtOGqow5H58csdzuKQ/UFdQaKZYcS
	VvaTRHS+Rqns02rY6STsl64tB5tJMixAYHva6mPsNPQVSIHob650DShkL/lKxp0K
	ewKGhv4Ol/z7CraEcxw+auco+1YbVFYqcOexA8J5srBAcG02EA/PAu2Q+fWuhgYM
	iKBnQ/WJOXnZRpmTy3D10jYZ9o9NRQ7+xX0s9fUxrcy/YAg9BUwUyBN+lCQuPhs6
	RReluQPb1uFluFZ+XkA3P97jqwdAApw/wbkcCoL2tjDz5QQIJtkyusYj3/LaThx9
	1/ek3yLINhjHFWeD/t3n1jqWar8m3HgluW24LIJdtbQRdvG74dWxaS58hxsySE4Y
	QPWrTu0=
Message-ID: <2da00161-723b-438a-9f70-1729312ec819@prolan.hu>
Date: Sat, 22 Mar 2025 20:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dma-engine: sun4i: Use devm functions in probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	<dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, Vinod Koul <vkoul@kernel.org>, Samuel Holland
	<samuel@sholland.org>
References: <20250311180254.149484-1-csokas.bence@prolan.hu>
 <e4249f3c-ca05-4fc7-b367-6ce280d0d749@wanadoo.fr>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <e4249f3c-ca05-4fc7-b367-6ce280d0d749@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.2]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526D7266
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_123548_134351_E77E0FFD 
X-CRM114-Status: GOOD (  12.68  )
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

Hi,

On 2025. 03. 22. 20:13, Christophe JAILLET wrote:
> Le 11/03/2025 à 19:02, Bence Csókás a écrit :
>> Clean up error handling by using devm functions
>> and dev_err_probe(). This should make it easier
>> to add new code, as we can eliminate the "goto
>> ladder" in probe().
>>
>> Suggested-by: Chen-Yu Tsai <wens@kernel.org>
>> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Acked-by: Chen-Yu Tsai <wens@csie.org>
>> Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
>> ---
>>
>> Notes:
>>      Changes in v2:
>>      * rebase on current next
>>      Changes in v3:
>>      * rebase on current next
>>      * collect Jernej's tag
>>      Changes in v4:
>>      * rebase on current next
>>      * collect Chen-Yu's tag
>>
>>   drivers/dma/sun4i-dma.c | 31 ++++++-------------------------
>>   1 file changed, 6 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
>> index 24796aaaddfa..b10639720efd 100644
>> --- a/drivers/dma/sun4i-dma.c
>> +++ b/drivers/dma/sun4i-dma.c
>> @@ -1249,10 +1249,9 @@ static int sun4i_dma_probe(struct 
>> platform_device *pdev)
>>       if (priv->irq < 0)
>>           return priv->irq;
>> -    priv->clk = devm_clk_get(&pdev->dev, NULL);
>> +    priv->clk = devm_clk_get_enabled(&pdev->dev, NULL);
>>       if (IS_ERR(priv->clk)) {
>> -        dev_err(&pdev->dev, "No clock specified\n");
>> -        return PTR_ERR(priv->clk);
>> +        return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk), 
>> "Couldn't start the clock");
> 
> Why removing the trailing \n everywhere?
> 
> Any reference esxplaing why it is correct?
> 
> CJ

Well, printk() will add a newline unless LOG_CONT is used. However, 
while looking up this feature, it seems that the consensus is to keep 
the `\n`s, even though they are not strictly needed anymore. I'll update 
this.

Bence


