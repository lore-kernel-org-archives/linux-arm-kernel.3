Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F69E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fN2wxgO6KjU8jGjesmYRbI6NryNjNDPOxGwMPjOWvw8=; b=Kf4RPog57u2e3uSN//4bkr1PPk
	lhow6oci/3SCkO137UbMLmOWlFioDqRofrrs4ErB9dNvdAzk7YoD1mp0MP/9At+1QzARhcmuPu+zU
	2tKtrXrwyzQp3GbDpPcL52HWlhobVsfABRevv42qq/PQT0plf+XHlSEnbRRpoxPaTWen9+hzmJE4v
	IMC5wnPC+Xr+djYvn634K6WO9RNn/dSo6rDe3258Jm5IYAX6Gu7+BurVtMgyv1qVRHPgTZD7GS72L
	57eSaYyacp5+gj4uNQv3QcKQHLYDVOQxefEYVvI4ufpBj9E1QTKFOx/Bn9Mym+6dZswyq1jW2Wx6y
	jg0hVCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkVe-000000099vD-0KgH;
	Tue, 14 Jan 2025 17:15:22 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkUO-000000099lv-1gpY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 17:14:06 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id D0233A0D95;
	Tue, 14 Jan 2025 18:13:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:in-reply-to:message-id:mime-version:references:reply-to
	:subject:subject:to:to; s=mail; bh=fN2wxgO6KjU8jGjesmYRbI6NryNjN
	DPOxGwMPjOWvw8=; b=EpdVhTLJGQ42e1dPZG2pGmw6RYKjWs6NQIEnbEcpDy9mL
	JcvU11Sa5smWoFantBKLGJaa0/TcsO5m1gqAKST8Y0lQrCzGp8WZbuHWYjlqocy0
	clAQzGmKmmZTONdGUiz57HLQ6pLb1Q/q9p6kwxHuzeKlhlC4TpPateT8b09PqE1A
	wZNPm3wzJyzlvDNIabuKapdnECGH4AIDnVzNcvsiKu7azc0GiiX/9tcGcsSkZZ/5
	i3XkISFgtIKqZQgBIO/bKm8/Sdy7MOnIFD1N4ne2sKw7LS+Q38K+OebrlQ0FBB3j
	eQi1FVZDxQw3bZvvFpFTHncZmhuAJKg8GVJ/ofDuqfgD2cvypnGUf8ytEYsgKYIR
	sYBLpQgsRjeGIn7j8FvBBtuLRjBadHU6H0kL2bgY0dCF+ytJaadC2nCmRL09OEUG
	Hic5l4NVlumPq6z0mwjOaSoaSfefic05L7AEfE0S2FcVwun0SHs67RuWeMSyfDFW
	DstLmYAIGvXlsHvycKmudm+94RwRTgzJlZmepPOtCWyW40TMxyid2oKNhLPmy6jr
	KsuCyMl4KEsUPAZVwxOWyiidr8VyVnLQJgy99Y0oHg/GEZY9oai1v60kCoYS1dTp
	mAhoeoRRhv9HE0YYX3UwbAZw8CecQvSMeO8lhISRP36oARgbyG0a9PcamHuocM=
Message-ID: <47481ae7-6d27-4101-8f3f-b1b7b456b905@prolan.hu>
Date: Tue, 14 Jan 2025 18:13:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: atmel-quadspi: Add support for sama7g5 QSPI
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>, Mark Brown
	<broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Tudor Ambarus <tudor.ambarus@linaro.org>, "Jinjie
 Ruan" <ruanjinjie@huawei.com>
References: <20241128174316.3209354-1-csokas.bence@prolan.hu>
 <20241128174316.3209354-3-csokas.bence@prolan.hu>
 <20250109-carat-festivity-5f088e1add3c@thorsis.com>
 <20250110-married-program-83bc1a997ce8@thorsis.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250110-married-program-83bc1a997ce8@thorsis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852647167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_091404_905561_7E8E2C27 
X-CRM114-Status: GOOD (  15.35  )
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

On 2025. 01. 10. 11:40, Alexander Dahl wrote:
>> This function atmel_qspi_sama7g5_transfer() seems to be called from
>> atmel_qspi_exec_op() through ops->transfer() only.  I think the two
>> lines in the error handling of atmel_qspi_reg_sync() lead to
>> unbalanced calls of pm_runtime_xxx.  Compare with
>> atmel_qspi_transfer() which has no calls to pm_runtime, everything is
>> covered by atmel_qspi_exec_op() in this case where the pm_runtime
>> calls surround ->set_cfg() and ->transfer().  Right?
> 
> This problem has been addressed in downstream kernel (linux4sam) by
> Claudiu Beznea back in 2023 already:
> 
> https://github.com/linux4sam/linux-at91/commit/e59f646f516088fdab6d8213d8acda0c1063ec21
> 

You are correct. I have picked it and will submit it on the ML shortly.

>> The whole call tree from atmel_qspi_sama7g5_setup() downwards is not
>> covered by pm_runtime get and put calls, although heavily doing i/o.
>> Further down in atmel_qspi_setup() there's a write to QSPI_SCR which
>> seems to be handled correctly.
> 
> Same for this:
> 
> https://github.com/linux4sam/linux-at91/commit/5ff0e74c1d548599fe85113e2f1817cb8a052b15
> 
> Some hunks of that seem to have made it to upstream, not sure?

Yes, it seems to be an amalgam of patches from mainline, and original work.

> Maybe Microchip should upstream those fixes, now that SAMA7G5 support
> was ported to mainline?

I would prefer that as well.

> Greets
> Alex
> 


