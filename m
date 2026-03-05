Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2E9F3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKbdSfvMKhaS1O9N44Ii5n4L97KLZKLOOIegRa3bjyg=; b=4eoDwrPWcXgGBxaW5KDsLodu8j
	pQ+lf3KNhB70Nug7cplEPs5Yk8VsCm/KYXv+hRL8zmPRXk2IC3fpa2NtsX9+5w/9U07RVcxyglmUA
	8pV01WeQLGpvAPyYXtEh3LLTHA8sJavkZ4HX5tW8NSfkdvzaqp2HdS0wBBwjZUzuFnh/gM4gEAMbf
	4GNcacypxHQczuVYCk9sSTeXOoWqTlfAOApnSn1GYkbu2eaZ4mQmr/rJ/WtuvdSykQmJ4o0ATkA+T
	caYhIDV0khx4AqgVi/HAod24pedHhFuveIg9QRMEWqGp1f1om1hi0p1Fl/VtR/aCqqHdMQ/JS6p+O
	/xHgep7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Fg-00000001Qy3-1my1;
	Thu, 05 Mar 2026 09:44:16 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Fe-00000001QwH-08P1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:44:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BCD30C40414;
	Thu,  5 Mar 2026 09:44:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 408DB5FDEB;
	Thu,  5 Mar 2026 09:44:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58761103697F1;
	Thu,  5 Mar 2026 10:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772703851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qKbdSfvMKhaS1O9N44Ii5n4L97KLZKLOOIegRa3bjyg=;
	b=KRWp0R58lV8TzOHIuFGXEwGag71Epk/I1rydLhFdA4nYNpg6z6XFlCp5WTRQKSCwOyowDW
	eq9UdDia3F4XGD33ynxvtaS6sONv2v4oenFH4dNgSzrHS2ktq1ihJ6c4fXakTeBHSZzR0/
	rHS0EHA8XVIemkpmyFFXvWL6XBY+s4JEE04TqJskJxAhE9tmTH3VUhRM8tZijpo8kBf+v2
	1JQa2xxvO0rFMiaMe8eGjlClB35cTgniewKBs8UulOCTTwmHPOrB3OmEK7j65RxiKWWZ3J
	FkyQDGknn/lNlM7nmVYlnlxUB1uYCx3d7vqPDLnBESz60izKVvCMjDrf28c+xQ==
Message-ID: <5579e0f7-ccdc-4a39-9e45-f3a1296f448e@bootlin.com>
Date: Thu, 5 Mar 2026 10:44:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] mtd: rawnand: sunxi: replace hard coded value by a
 define - take2
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-5-richard.genoud@bootlin.com>
 <13952574.uLZWGnKmhe@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <13952574.uLZWGnKmhe@jernej-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_014414_221049_23380771 
X-CRM114-Status: GOOD (  18.88  )
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

Le 21/02/2026 à 10:23, Jernej Škrabec a écrit :
> Dne petek, 20. februar 2026 ob 17:10:09 Srednjeevropski standardni čas je Richard Genoud napisal(a):
>> The user data length (4) has been replaced almost all over the file, but
>> 2 places were forgotten.
>>
>> The user data is placed before the ECC, for each step.
>> So, in sunxi_nfc_hw_ecc_read_extra_oob(), the offset of the user data in
>> OOB is indeed ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
>>
>> And in sunxi_nand_ooblayout_ecc(), the offset of the ECC chunk in OOB is
>> the same offset plus the current user data size:
>> section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
>>
>> Fixes: 1be7ac78b72f ("mtd: rawnand: sunxi: Replace hard coded value by a define")
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> 
> This doesn't really need Fixes tag since it's only refactoring.
Indeed.

> 
> With that said:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>


Thanks!
> 
> Best regards,
> Jernej
> 
>> ---
>>   drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
>> index 99d305bbda53..5d925b59b618 100644
>> --- a/drivers/mtd/nand/raw/sunxi_nand.c
>> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
>> @@ -1051,7 +1051,7 @@ static void sunxi_nfc_hw_ecc_read_extra_oob(struct nand_chip *nand,
>>   {
>>   	struct mtd_info *mtd = nand_to_mtd(nand);
>>   	struct nand_ecc_ctrl *ecc = &nand->ecc;
>> -	int offset = ((ecc->bytes + 4) * ecc->steps);
>> +	int offset = ((ecc->bytes + USER_DATA_SZ) * ecc->steps);
>>   	int len = mtd->oobsize - offset;
>>   
>>   	if (len <= 0)
>> @@ -1747,7 +1747,7 @@ static int sunxi_nand_ooblayout_ecc(struct mtd_info *mtd, int section,
>>   	if (section >= ecc->steps)
>>   		return -ERANGE;
>>   
>> -	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + 4;
>> +	oobregion->offset = section * (ecc->bytes + USER_DATA_SZ) + USER_DATA_SZ;
>>   	oobregion->length = ecc->bytes;
>>   
>>   	return 0;
>>
> 
> 
> 
> 


-- 
Richard Genoud, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

