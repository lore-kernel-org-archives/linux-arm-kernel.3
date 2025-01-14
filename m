Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950A6C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lb7kJrxaj9Um8RxeR+IiRmrPwaOgUr3Pt6kJJDIgew=; b=okEW0PKnyXaoGuckUkDkxasE7Z
	sBKaLEIa3kI3d2TM4WxkB8y+49j8oKpP8Wl3HdusAWQOCUwbp+pkDbF2n6rNHBIC7JNkvSOX9k39J
	hdHoFpoXEiESqBaerFwEovbWTis6GSBGJdeE4JQGoXkTvOkK/+7Q7T9vk2X1AhD9Yo49fQJ+37Dt/
	QU2JMXCK11po1UzHkrhcmWCxzGN8qEZqVfuMDEFP26/7aS4hr32gZY5Bk+NwvWRMFFTY1LrGSWj09
	WHV4U6RlZsQLSdNkXnEib4aRMqxBavt5PD0alXu8bv1S3HNf4ZK+xfGMamDGFTY8DzkcOXiKJ36iT
	XxRp41pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkdF-00000009BLS-0TnM;
	Tue, 14 Jan 2025 17:23:13 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkbz-00000009B7Q-26qX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 17:21:56 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E30A5A0D96;
	Tue, 14 Jan 2025 18:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:content-transfer-encoding:content-type:content-type:date:from
	:from:in-reply-to:message-id:mime-version:references:reply-to
	:subject:subject:to:to; s=mail; bh=5lb7kJrxaj9Um8RxeR+IiRmrPwaOg
	Ur3Pt6kJJDIgew=; b=evtzxkAkT89iOfINLBGKnnxmPBfOVQ8gPJYeEH3I8zMON
	7T0AdPZK8fkNO8oWU5dBnEp61cMH3Ipqia/r6GcwmCQH+RhenTeTX79RftTa79vH
	IEalU0LEil/7FLF0MI3+tGGOCpnG51xtZyaKLWSeR/cIhgBsCWBVcqDO8R8B478F
	KYvz6GsHbrYfranKeknzhzZVZXvYlqjzBSUV58ubspUCdSePkCdfbVIagiBegclK
	JHMjokkM5lWw7izhhVt01Aid54avD1M55r9lB8njwe2+SChmOP/tJ9Z+Dtq18B4H
	wRgcJlgiDVAmICtCsfSMs0CLJxKkW/oyWuS4QGrguWlsyq7B7hpwZv/6n6Pu7fWn
	87l8qJj2hlrXSy8HJU5BsmLwGoLYboh3bhfYc7GBt/Wr6MfOHGUTXchpB7aK4ia8
	Bbf3wcmObLhyq2d/4Jtzcu3rATxVMl5I7GaobKni4cd7H3LOusmACQSqLa7I5QmX
	3tinew/YEnoQZJMYbm2LaAJitoT1Md2LfqgPZUC7AGg8pJPtrXEM7hduxqtuvRAL
	yU8maZ6oLxlHVaIhW8nlJlEe1Iti/w99jIE6zlVJ3l7Qu0Msa0QP3XObtEqkYoiU
	LiuZkGCk0bdqvbwbizv5VPMFccywbSW8cDvWzZoO/ei6uPxnqLXDYggQLG2Cxc=
Message-ID: <2768b17c-bba8-452c-8148-cfbf1ed5393f@prolan.hu>
Date: Tue, 14 Jan 2025 18:21:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: atmel-quadspi: Add support for sama7g5 QSPI
To: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>, Mark Brown
	<broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
References: <20241128174316.3209354-1-csokas.bence@prolan.hu>
 <20241128174316.3209354-3-csokas.bence@prolan.hu>
 <20250110-paycheck-irregular-bcddab1276c7@thorsis.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20250110-paycheck-irregular-bcddab1276c7@thorsis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852647167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_092155_692977_5436597D 
X-CRM114-Status: GOOD (  11.84  )
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

On 2025. 01. 10. 8:56, Alexander Dahl wrote:
> Hello,
> 
> found another suspicious area regarding pm_runtime in
> atmel_qspi_probe(), see below (irrelevant stuff dropped this time) …
> 
> Am Thu, Nov 28, 2024 at 06:43:15PM +0100 schrieb Csókás, Bence:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
> 
> […]
> 
>>   	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
>>   	pm_runtime_use_autosuspend(&pdev->dev);
>> @@ -745,7 +1444,9 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>>   	pm_runtime_enable(&pdev->dev);
>>   	pm_runtime_get_noresume(&pdev->dev);
>>   
>> -	atmel_qspi_init(aq);
>> +	err = atmel_qspi_init(aq);
>> +	if (err)
>> +		goto dma_release;
> 
> This error handling leads to unbalanced pm_runtime right?  The block
> below rolls back pm_runtime before jumping to 'dma_release', this here
> does not.
> 
>>   	err = spi_register_controller(ctrl);
>>   	if (err) {
>> @@ -753,13 +1454,16 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>>   		pm_runtime_disable(&pdev->dev);
>>   		pm_runtime_set_suspended(&pdev->dev);
>>   		pm_runtime_dont_use_autosuspend(&pdev->dev);
>> -		goto disable_qspick;
>> +		goto dma_release;
>>   	}
> 
> This hunk got it right?

Hm, I think this would be best handled by switching to 
`devm_pm_runtime_enable()`... I'll add that to my upcoming "make 
everything use devm_*()"-series... (but I'm waiting on new functions to 
be added to dmaengine for that).

Bence


