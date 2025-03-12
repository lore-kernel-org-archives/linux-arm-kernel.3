Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2231C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmklfvLlFZxYw5WHt0NSMePxUydM1gh/qon5awTqfRY=; b=eRawBWy4EeoSubi2z1aEKb1T1H
	nP+fvoTJBATXB/kfTEyE08aPlgVrK8cGz64BcG9TNfP3YvkTAdT8zB835Dl4XUpjas3SKcIpWl0mz
	tAjHQEaiDSAE90LEJMj03FM4PIf6lbb7x3dQN+xiSO7kwdJxYbbXDZXfgWW71KQdzYPkX0UYi0ek2
	rF8OebOYHnY87jATpZNH6niEBI66GME0tGGHstffK0OINMbDog0YzS3wOMZT9I2eILXEFwBng3Ebv
	109GGLGOUVzaWHLScBDUQgUPS69rSfr8X24dyH5YcPZBQsx8+7C+56nOmS93RXbtA7MJJ+xZivY5c
	IJ3DVMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsM4E-00000008YkK-1VsF;
	Wed, 12 Mar 2025 13:24:14 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLEZ-00000008PLn-2kLj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 12:30:53 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 4F763A0433;
	Wed, 12 Mar 2025 13:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=cmklfvLlFZxYw5WHt0NS
	MePxUydM1gh/qon5awTqfRY=; b=qQ49a4EU6xjyrrZrVO8B+hvj25GZPeSjA0jb
	7nWqtx/yE+/PuOh6axYscnpPtJZnCUmT1XiXz34qdphteXIo2TKJ5KsVsaQbrXlk
	tUylJKdzUJ6EfDz4qFK6yVM1aVGbxPGaUdWI/bQOuiBI7c3nXLNeTFPrfx5bv68J
	vSJsJYx3lZujSrSva+A6xE/tym5fl0MQR/34G1oev+OcThulayAyqB90QYnXB8rS
	EsMyweSxMqzxmwvlG/62+oJXrrRx/23oPcywfMzqCIHPrTizUL5I1hKt9qJxNQ7G
	0hp4aELeQ8tdiUjwGqvTbbbqJykqBqzZzxeWmyZZ3TReORAfhJ7HnlLmirxrBbDa
	bzfwMJAPkNNpRba8Z2ahlXTtuP/nQbOtBnaJj4Lm561VyLg1pj6n4nQyecsminBK
	9JZ1iaOdx6ikfJeW+2aC9/eykxPtKm0CahpIScO09ixdrP6D2WUUHpAFdQ8AnqJT
	FIxcYKKDwenm5asoKkx7K75nJxFX8DHeGnIoMFn3kV01Le7YYX2H3POwTWR8TbRo
	Izrs5IjAB8SonwI2Nwdi3x4a1yt6XQNPRgXRZE6UQljKWhLFhfwTskZe+LdKCar4
	bBitkR5bthaRvlro6f2XsFW/g08V6CvdOTl7UVQOg4knyzU6/miZUM2x/aMmdqTZ
	nOE9+MU=
Message-ID: <505c2e3b-f1bb-4e3a-96f2-eef0d0d682e6@prolan.hu>
Date: Wed, 12 Mar 2025 13:30:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4] dma-engine: sun4i: Use devm functions in probe()
To: Markus Elfring <Markus.Elfring@web.de>, <dmaengine@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
CC: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250311180254.149484-1-csokas.bence@prolan.hu>
 <885ceb3e-d6c6-4e7b-a3b6-585d2d110ccf@web.de>
 <81f87d39-d3f8-4b6a-91cb-b0177d34171b@prolan.hu>
 <9ef781b0-8a63-42b7-91a2-fa8a8ea3c0b4@web.de>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <9ef781b0-8a63-42b7-91a2-fa8a8ea3c0b4@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852627360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_053052_161728_6316C795 
X-CRM114-Status: UNSURE (   9.51  )
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

Hi,

On 2025. 03. 12. 12:44, Markus Elfring wrote:
>>> How good does such a change combination fit to the patch requirement
>>> according to separation of concerns?
>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.14-rc6#n81
>>
>> It is a general refactor patch, it shouldn't change any functionality. I could split it to one part introducing `devm_clk_get_enabled()` and the other `dmaenginem_async_device_register()`, but I don't feel that to be necessary, nor does it bring any advantages I believe.
> Can it matter a bit more to separate changes for the application of devm functions
> and the adjustment of corresponding exception handling with dev_err_probe() calls?

The change in error handling is just the result of switching to devm 
functions, because it is no longer needed to separately dev_err(), store 
the error code to `ret` and goto a cleanup phase (as the whole point of 
using devm functions is to have auto-cleanup), you can just return with 
the error code (which dev_err_probe() returns for us) right away. The 
devm functions are used precisely _because_ they allow us to simplify 
this error handling.

> Regards,
> Markus

Bence


