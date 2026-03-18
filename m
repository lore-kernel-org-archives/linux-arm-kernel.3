Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BFFFCD0C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 07:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/wnit4uOPVq9r5YYUpYnHPITSDBvtEYXdALfE4LR18=; b=Zz58hVYoVwcQ2iR4577HEfBNng
	ab+nygfxgDBtU33Z6up8v8dWKZtuBVAwsDBCL8miUrSEpDNij1RbJhKBQOn6rzEP/LhG9TKVvrNUt
	Q9pm25If0yulfn8iatnVJ2VKWQEY2SCynP0Rk804aLwPPeXAF92qKggPLEzpouLl9KaVq5JY2n33l
	U/kUJ9Br7EIYDl/5mLAo+Gi18Bn+HwYJVGzBYoZsJwsHf+SRKbCn7Uaxya4Kr6/mYJ1J+1X74qgpU
	VDNr+XVpSLX0fQ0G0mqtZBo096aBn080jtoJ0r7gwPYM1iDlemg/lpImLDSki1p0jPSQcd49lI8zY
	6HxejD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2l8J-00000007uYX-2Vi8;
	Wed, 18 Mar 2026 07:15:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2l8F-00000007uWX-1HqG;
	Wed, 18 Mar 2026 07:15:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 211FA1A2E95;
	Wed, 18 Mar 2026 07:15:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9D3E6004F;
	Wed, 18 Mar 2026 07:15:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBCEF104506E6;
	Wed, 18 Mar 2026 08:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773818134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f/wnit4uOPVq9r5YYUpYnHPITSDBvtEYXdALfE4LR18=;
	b=MVz6+6FroWlHDW6mHXGBgHiCJxCjhwZKsOAGUkwiONmck9b4YySN1cTUmfcih1U2tnoXMu
	OfOKaONHfmMdsmNqeYxN9hXpuZ4ZWGFdSNTzBZfORX8abPOwIoNCN8P3Klxz93J8LDBtpY
	aZ8WeKwHGUL/pzZh2UVvDjsJ1pAfbPgSXTnAQHMsQ3faY/PKQdBJrJWHiQ5X/OQU5oI9Ek
	omix2N/SK9A5WrXMoaK/cZXLXrwoqFxTLLHH8mRQ+K0l5lCfolJCTtbqQnSSHeTh3TM6GT
	hZI0PbR/WSGzlfmH8mXtT5SwuiAuZuxRYhWhV6HOLWiXYTKSnINke3xRo475MQ==
Message-ID: <9c9d7aea-0227-491b-92d4-5cc4d142e1de@bootlin.com>
Date: Wed, 18 Mar 2026 08:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free
 code clarification
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
 <20260317142437.580204-2-richard.genoud@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20260317142437.580204-2-richard.genoud@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_001555_830977_78270D5D 
X-CRM114-Status: GOOD (  17.58  )
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

Le 17/03/2026 à 15:24, Richard Genoud a écrit :
> The available length is really USER_DATA_LEN - 2 instead of just 2 (the
> user data length minus the BBM length)
> USER_DATA_LEN being 4, that doesn't change anything now, but if
> USER_DATA_LEN changes, it will.
> 
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Sorry, I forgot to pick-up the review from Chen-Yu in v2:

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>   drivers/mtd/nand/raw/sunxi_nand.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> index e66adfcca7cd..915f1240546f 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1755,12 +1755,12 @@ static int sunxi_nand_ooblayout_free(struct mtd_info *mtd, int section,
>   
>   	/*
>   	 * The first 2 bytes are used for BB markers, hence we
> -	 * only have 2 bytes available in the first user data
> +	 * only have USER_DATA_SZ - 2 bytes available in the first user data
>   	 * section.
>   	 */
>   	if (!section && ecc->engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
>   		oobregion->offset = 2;
> -		oobregion->length = 2;
> +		oobregion->length = USER_DATA_SZ - 2;
>   
>   		return 0;
>   	}
> 

