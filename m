Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B380ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEly2LZ/ci8gWOTL9VFmSwxUpRyknITeUsfSdfjGXWc=; b=xX37yeQOgVZVHqqxwsuqbgL9Ub
	yrmttyCgYqJN/wjnQVhm82m6p/PuxtygEp9uRfhm2F4sM+yQtBRm8UcVbTl+RcKpOZtwGv1DayLhv
	1HdhZDZZzF/1wctUNd2UMoGOZs9hBzPw/KTN+4ynNn2p85yWYmheg2Iq8k66Q+iJ0fOiVJ9jaRJIr
	StGvo6abf4kA7uUlLRBPxlZkrCvj2XJQlWoHiZ5+8icUSZ+jZcVZebjIqMQDa442x8GmYl5gcrAko
	VK7lDEQl4u1IKdlBYf6QIvhOh/JDi9Br67uLs40hQ2yzk8ZWgI4AmAg1VM4S7IHBd2XJ31vGPsy45
	bWIH+RtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HE5-0000000D4H7-0z7A;
	Mon, 13 Oct 2025 12:00:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HE1-0000000D4Dv-3UlY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 12:00:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 64EB24E4106C;
	Mon, 13 Oct 2025 12:00:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AAB3606C6;
	Mon, 13 Oct 2025 12:00:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 820F8102F2263;
	Mon, 13 Oct 2025 14:00:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760356822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KEly2LZ/ci8gWOTL9VFmSwxUpRyknITeUsfSdfjGXWc=;
	b=PON+IrG2YZZ0AQmxmKPBPmPxWfanJoZDq1KF1fXAZ8TfV8PpVQIGisX1y8TfAvY9gmI00e
	1hsO9q5JUnDEZCuZiuOCJp28t26rxy196nvxKtuakWafldeVBVvQQ3oFlQCX9qIAUqANJC
	Juiq/PGau5tF2xD6qVCMuSG3FwE12oRqWxGIVu+44H8BSvMP6zyZf/LLk4T4Ka3iGLn6tK
	VBfZW5GkpbLCGzuqn8+YDdKV+WRYnnY45i8BJE20v+q7Bji934nQRuhni+s/qpslGpt6aV
	bpfT95+bUr9rBci+SfTQn52zqQegF+LBMCb8z83UstmxzOACvRNPwn4u4Mp6kQ==
Message-ID: <7add8d87-0909-45f2-973c-299d86e26d58@bootlin.com>
Date: Mon, 13 Oct 2025 14:00:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] mtd: nand: sunxi: move ecc strenghts in
 sunxi_nfc_caps
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <20251010084042.341224-5-richard.genoud@bootlin.com>
 <13861163.uLZWGnKmhe@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <13861163.uLZWGnKmhe@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_050026_005346_FD52A02B 
X-CRM114-Status: GOOD (  18.97  )
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

Le 11/10/2025 à 12:41, Jernej Škrabec a écrit :
> Hi!
> 
> Dne petek, 10. oktober 2025 ob 10:40:31 Srednjeevropski poletni čas je Richard Genoud napisal(a):
>> H6/H616 has more ecc strenghts.
>> This commit prepares the change.
>> No functional change.
> 
> Format looks weird. Reword message to something like moving ecc to caps which
> will allow expand support for newer cores.
> 
> Also, there should be empty line before "No functional change."

I'll reword that

Thanks!

> 
> Best regards,
> Jernej
> 
>>
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 20 ++++++++++++++++----
>>   1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 10a48e0d361f..198dd40f9220 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -213,11 +213,15 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
>>    *			through MBUS on A23/A33 needs extra configuration.
>>    * @reg_io_data:	I/O data register
>>    * @dma_maxburst:	DMA maxburst
>> + * @ecc_strengths:	Available ECC strengths array
>> + * @nstrengths:		Size of @ecc_strengths
>>    */
>>   struct sunxi_nfc_caps {
>>   	bool has_mdma;
>>   	unsigned int reg_io_data;
>>   	unsigned int dma_maxburst;
>> +	const u8 *ecc_strengths;
>> +	unsigned int nstrengths;
>>   };
>>   
>>   /**
>> @@ -1619,9 +1623,9 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>>   				       struct nand_ecc_ctrl *ecc,
>>   				       struct device_node *np)
>>   {
>> -	static const u8 strengths[] = { 16, 24, 28, 32, 40, 48, 56, 60, 64 };
>>   	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
>>   	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
>> +	const u8 *strengths = nfc->caps->ecc_strengths;
>>   	struct mtd_info *mtd = nand_to_mtd(nand);
>>   	struct nand_device *nanddev = mtd_to_nanddev(mtd);
>>   	int nsectors;
>> @@ -1645,7 +1649,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>>   
>>   		ecc->strength = bytes * 8 / fls(8 * ecc->size);
>>   
>> -		for (i = 0; i < ARRAY_SIZE(strengths); i++) {
>> +		for (i = 0; i < nfc->caps->nstrengths; i++) {
>>   			if (strengths[i] > ecc->strength)
>>   				break;
>>   		}
>> @@ -1666,7 +1670,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>>   	}
>>   
>>   	/* Add ECC info retrieval from DT */
>> -	for (i = 0; i < ARRAY_SIZE(strengths); i++) {
>> +	for (i = 0; i < nfc->caps->nstrengths; i++) {
>>   		if (ecc->strength <= strengths[i]) {
>>   			/*
>>   			 * Update ecc->strength value with the actual strength
>> @@ -1677,7 +1681,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
>>   		}
>>   	}
>>   
>> -	if (i >= ARRAY_SIZE(strengths)) {
>> +	if (i >= nfc->caps->nstrengths) {
>>   		dev_err(nfc->dev, "unsupported strength\n");
>>   		return -ENOTSUPP;
>>   	}
>> @@ -2167,15 +2171,23 @@ static void sunxi_nfc_remove(struct platform_device *pdev)
>>   		dma_release_channel(nfc->dmac);
>>   }
>>   
>> +static const u8 sunxi_ecc_strengths_a10[] = {
>> +	16, 24, 28, 32, 40, 48, 56, 60, 64
>> +};
>> +
>>   static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
>>   	.reg_io_data = NFC_REG_A10_IO_DATA,
>>   	.dma_maxburst = 4,
>> +	.ecc_strengths = sunxi_ecc_strengths_a10,
>> +	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
>>   };
>>   
>>   static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
>>   	.has_mdma = true,
>>   	.reg_io_data = NFC_REG_A23_IO_DATA,
>>   	.dma_maxburst = 8,
>> +	.ecc_strengths = sunxi_ecc_strengths_a10,
>> +	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
>>   };
>>   
>>   static const struct of_device_id sunxi_nfc_ids[] = {
>>
> 
> 
> 
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

