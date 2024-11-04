Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0820D132BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgJ5BTpIJ76vDQhoFyd1Z9xzbY8ERzsZQHOdaJr4nBE=; b=R5iFcNHDY8pcLPJnoBJ3qY3qxz
	4Ck//4XF1wRx4qyoSBpALV1K4zcPaaM6KTaYpHMZG4JtD4CKbsFPI8rdqzNnZ7mRhPHL71G70XFmh
	13MTot+PBcRJxAwFupTLiQQ/Lj2FSnd4joYX7KOiKlwPK6bTJkraB28DphwGcZm/O93lLIPA4f/Po
	lRvShtIyi+WWh/agGpV6QuO41BKzmQETNg2HTLKE7eMwi8S3U8UzgSM6hQsFLARfIglwfYoGY9gQk
	+2klsPMYNoOBUJbuFNJcpupo+v9llbHH9h2vDz855Dg1C49RnAGn6YhREaBdqTh8MFrY+gUdOXdRj
	OIpSOPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wfa-0000000DlZC-3IdG;
	Mon, 04 Nov 2024 12:58:58 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wdS-0000000DlAE-2cUf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:56:48 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 3BA58A03F3;
	Mon,  4 Nov 2024 13:56:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:in-reply-to:message-id:mime-version:references:reply-to
	:subject:subject:to:to; s=mail; bh=ZgJ5BTpIJ76vDQhoFyd1Z9xzbY8ER
	zsZQHOdaJr4nBE=; b=WYe/PbbB4ax4WTjf5h1/XMavmEchdcOLxZLN+8EWnhgUn
	DueBvAgkhickNU7PF0+4Ia6fY7E4i+Uoj/aNithZYWyMrD3uWzle+WjmiqohWp7v
	3mdQP7M01Fvv2WfIXbnAbsDUnlKt9vVfnBFFQcVZdPHZymknOxkUlNN75ynMVSIi
	t0CbUTjwRxZUjUoJeHEM1PFziOAg9yVIrJySx9tBcS/XLv3D7U918I5BJpESyBuU
	puIfXJY/Iba216Kg+HKtLI6i19fPj6GOypDDCVFRPe0/sGAAxBJP95TBMW9Zvbij
	1fWopBSIs6QB4MlIlm5cWnuWSlCCIS1gEExzEHQZgEzxGXx07J0kBQFlB28OtMhR
	uMvA0MKeduvvJMRhPxh1brpu/etGNM0HDZq7PldPj4zi4pRJSGas8Exf8a4u7kWc
	JUQHXL2K73LeiE+06dJuRkfkXGIKw/3hq/+6dmdU1BVGbVpxROEczfxffqtDy6ry
	LEU4hNdR2lgum0WDVlFVH3uEyovBewMXq4QmJf0FIS2crhMiEg3OtICIczSRdFev
	YxxtwWltqpxgl/LGEIWjUr6Rc8sXEEzxPBIKsGDAShdejkO2GE0e599N8cQjcDzh
	d5jwH0GaI9Rv4YJFDELMecBTOvubUS9+U9UdaUPzN7C0bBhaLOcdU5ZhLuAKzw=
Message-ID: <ad585127-9e3c-414a-84c2-c4ea3e6d3c7d@prolan.hu>
Date: Mon, 4 Nov 2024 13:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] spi: atmel-quadspi: Create `atmel_qspi_ops` to support
 newer SoC families
To: Tudor Ambarus <tudor.ambarus@linaro.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>, "Claudiu
 Beznea" <claudiu.beznea@tuxon.dev>
References: <20241030084445.2438750-1-csokas.bence@prolan.hu>
 <7cc95e52-7509-44eb-8e30-d518283e7d87@linaro.org>
 <2b310b54-c215-40fa-b6d4-81faf75a8c9e@prolan.hu>
 <20241104-vanilla-operating-de19b033f0a8@thorsis.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20241104-vanilla-operating-de19b033f0a8@thorsis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667267
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_045647_155351_33776828 
X-CRM114-Status: GOOD (  15.11  )
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

Hi!

On 2024. 11. 04. 13:48, Alexander Dahl wrote:
> Hi,
> 
> Am Wed, Oct 30, 2024 at 01:37:52PM +0100 schrieb Csókás Bence:
>> Hi,
>>
>> On 2024. 10. 30. 12:09, Tudor Ambarus wrote:
>>> I think it's fine to split sama7g5 addition in smaller steps. But please
>>> add the sama7g5 support in the same patch set, otherwise this patch
>>> doesn't make sense on its own.
>>
>> Well, actually, we're using SAMA5D2. My goal was just to somewhat harmonize
>> upstream with the vendor kernel so that we may contribute other patches that
>> we have made on top of the latter, or in the future, take patches from
>> upstream and apply it to our vendor kernel-based tree. This patch was only
>> meant to lay the groundworks for future SAMA7G5 support. I can of course
>> send the "other half" of the original patch if needed, but I wouldn't want
>> it to hold up this refactor.
> 
> It would actually be better if vendor would bring their stuff
> upstream, so there's no need for a vendor kernel.  Did you talk to
> Microchip about their upstreaming efforts?  What was the answer?
> 
> Greets
> Alex

Agreed. Though in this case, the original patch *was* submitted by 
Microchip (by Tudor, originally) for upstream inclusion, but it was not 
merged. Hence this forward-port.
Link: 
https://lore.kernel.org/linux-spi/20211214133404.121739-1-tudor.ambarus@microchip.com/

Bence


