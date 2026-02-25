Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D41FD375D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QT9ooeQwx4MDclDG5MflYqdMaSflFtTjGq86Lrpk5DM=; b=gqQDaCRPmXLQMlJzW29Q0KZish
	NFBiJ+m3dnjCuDbILv1QWJjcfB0K6rf2eDz7D71AYFAY1Oys9+DJiF989900BWLdcq9yU8WJndt6i
	znf3vd/SLN4Qy9f9S0TroqpEXtekhUD0BrOctFNAviXQIFLTiVdEOmOAtcVT1Od1zhd4e9LkOu8ib
	WS9H/4E9ODxfe3bpkcnvkf11ycPzUza/qvE2hYv/XT0Xk5uSl0NQ3BCqOgxv+CqOaeYrQW23L5F+v
	D0LicEy/088OU5721rBbQBPXTu2QmmQ6qI8oqFTfKkPmJkDK13pPJbkmGI++bBFj4DBs0R6kH80um
	YWHzWc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEmW-000000044UG-1O1O;
	Wed, 25 Feb 2026 13:18:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEmT-000000044SW-0jSU;
	Wed, 25 Feb 2026 13:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772025499;
	bh=OBPmVel8etDOsFPwy09vRPFiPn+XOTirLp8VxPuWQT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CXnqqRVOU+5ZupZeqTybWiwyfo1yrPseMhCvtva473bH2wisFSulL2HVy9FKbSS1v
	 E41wbZNfMQm3KQxssJS21aB8or0/0zUL0Homdt9CXse6Zt/DtfZIv22FaUguvmDB9W
	 8ZzsrJK3J4R+3l5imK23d90P/YLdNoDxDdUg4nwxLPPOWkZbHqlkP2s3Q7DF4LsY7A
	 cDeqsAZhpvshMV65GGlgP3g9r5idEW/JfDkWy//f7GsbDfV2+5xWIwTlK8jUSqmnq5
	 B0R+3IcU5+SJoAIN4NRHXomy28whqZJsv+ehM5MvvHd45PddBXTyW64J4p6W5gIK7N
	 g8WnRnhJAuDEw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1673117E03E6;
	Wed, 25 Feb 2026 14:18:18 +0100 (CET)
Message-ID: <f0e97a38-a11b-4e69-902a-e0ccd0dc4540@collabora.com>
Date: Wed, 25 Feb 2026 14:18:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/23] scsi: ufs: mediatek: Clean up logging prints
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@hansenpartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <20260216-mt8196-ufs-v7-16-b5f2907c6da7@collabora.com>
 <c333898413d249c017430d4ae98bc7be3bf33a64.camel@mediatek.com>
 <2575185.irdbgypaU6@workhorse>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2575185.irdbgypaU6@workhorse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051821_384052_F1102A8F 
X-CRM114-Status: GOOD (  16.49  )
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

Il 25/02/26 14:05, Nicolas Frattaroli ha scritto:
> On Tuesday, 24 February 2026 13:47:28 Central European Standard Time Peter Wang (王信友) wrote:
>> On Mon, 2026-02-16 at 14:37 +0100, Nicolas Frattaroli wrote:
>>>   drivers/ufs/host/ufs-mediatek.c | 99 ++++++++++++++++++-------------
>>> ----------
>>>   1 file changed, 43 insertions(+), 56 deletions(-)
>>>
>>> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-
>>> mediatek.c
>>> index ecf16e82a326..2b1f26b55782 100644
>>> --- a/drivers/ufs/host/ufs-mediatek.c
>>> +++ b/drivers/ufs/host/ufs-mediatek.c
>>> [... snip ...]
>>> @@ -810,11 +806,11 @@ static void ufs_mtk_mcq_set_irq_affinity(struct
>>> ufs_hba *hba, unsigned int cpu)
>>>   	_cpu = (cpu == 0) ? 3 : cpu;
>>>   	ret = irq_set_affinity(irq, cpumask_of(_cpu));
>>>   	if (ret) {
>>> -		dev_err(hba->dev, "set irq %d affinity to CPU %d
>>> failed\n",
>>> +		dev_err(hba->dev, "setting irq %d affinity to CPU %d
>>> failed\n",
>>>   			irq, _cpu);
>>>   		return;
>>>   	}
>>> -	dev_info(hba->dev, "set irq %d affinity to CPU: %d\n", irq,
>>> _cpu);
>>> +	dev_dbg(hba->dev, "set irq %d affinity to CPU %d\n", irq,
>>> _cpu);
>>>
>>
>> Is it more appropriate to use dev_info for state changes or for setting
>> changes?
> 
> Is this information a user would want to see in their bootup log in
> every case? My understanding right now is no.
> 
>>> [... snip ...]
>>> @@ -1571,7 +1559,7 @@ static int ufs_mtk_device_reset(struct ufs_hba
>>> *hba)
>>>   	/* Some devices may need time to respond to rst_n */
>>>   	usleep_range(10000, 15000);
>>>   
>>> -	dev_info(hba->dev, "device reset done\n");
>>> +	dev_dbg(hba->dev, "device reset done\n");
>>>   
>>
>> Is it more appropriate to use dev_info for state changes or for setting
>> changes?
> 
> Depends on your view of what's useful information for the user.
> 
> I can change both of these back to _info if I have to send out a next
> revision, just to get this through though.
> 

Definitely don't change that back to dev_info() as this is debugging information
that spams the kernel log for no reason.

This has to be dev_dbg().

Regards,
Angelo

>>
>> Thanks
>> Peter
>>
> 
> 
> 
> 


