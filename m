Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202BCC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9oYM2nhbNGXRPuJiBbUWz5fz1jwLD1jTEG4VwkIdxQ=; b=Yljn8/yus2Fv1v1OFGsOCe7HrZ
	rMj4l6W9fG97MW6csP/Yc4p9lHr1txHvmC+u8rysh7D2AFPiP5Bv8iL/EDXKZTRaRC6Rf+MuPeM3k
	10BCbCSIt5/QGn8FG4F+iNe70nvpSqSXzbImDiQftHQuQRiZgpd9hQr1eQHtsJoJgyJN8SxthWeQc
	JVjmkrzbN4X6EENvSYE7bUPrOJVOHia45u2FyMRXaMqL06V/kLGxqB2wf8jxs+lKvICB1e0UA5fEb
	cPWPjQR2FKZrW8tJruSyn2JNQpuVjJQG3oegNmvb8TW5mbvBgEwDRF2CHwTgLb9Epu94jCI+Lr/gX
	1Ls0gajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUdp-0000000FnnS-1dyt;
	Thu, 16 Jan 2025 18:30:53 +0000
Received: from smtp-80.smtpout.orange.fr ([80.12.242.80] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUcZ-0000000FnaR-0bcV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:29:36 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id YUcMt4fhDca4eYUcPt1pRr; Thu, 16 Jan 2025 19:29:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1737052172;
	bh=j9oYM2nhbNGXRPuJiBbUWz5fz1jwLD1jTEG4VwkIdxQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=Y6PQ3FvnW+AjZ1qS4Dw87U3Xkm1gObPNfFPCDBKm1bSd/CfbHSPO24P+07jzIFknI
	 CSZ9Qs5PO8hSkkjJCE1d1UBWShEeICLDZ6Wbe0Cv/nO/Gjlt9NyykteQrWWvUmg+NW
	 YTV2G1VJVBugXY7+TMrxtJUuhUZ/+1xtfm0SSzLufu9zO7Ma40h77kI69HKUAR78ma
	 bPKytJYiQuquFZTR4IDGYG7+H676kQ2I57lSqg1d7bytdKSN5ml8v+hXnenVwUVUM+
	 k20PLelLwwqXZQXB3iU6OCM3rEzU35dQ3lKPQAw/yTqQkKafhy5ksBzrFe/3ars1Ub
	 /qa//Z7hiwVGg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 16 Jan 2025 19:29:32 +0100
X-ME-IP: 90.11.132.44
Message-ID: <fbfea2a1-71e7-4572-ada2-0d4315c97e91@wanadoo.fr>
Date: Thu, 16 Jan 2025 19:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: devnull+fnkl.kernel.gmail.com@kernel.org
Cc: alyssa@rosenzweig.io, asahi@lists.linux.dev, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
 fnkl.kernel@gmail.com, j@jannau.net, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, marcan@marcan.st, neal@gompa.dev,
 robh@kernel.org, rydberg@bitmath.org, sven@svenpeter.dev
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
 <20250115-z2-v4-2-d7361ab16ba0@gmail.com>
 <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>
Content-Language: en-US, fr-FR
In-Reply-To: <3991ab78-d1a2-4cae-bea5-fb4dfa58aba3@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_102935_316887_9F05FC93 
X-CRM114-Status: GOOD (  11.01  )
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

>> +static int apple_z2_probe(struct spi_device *spi)
>> +{
>> +    struct device *dev = &spi->dev;
>> +    struct apple_z2 *z2;
>> +    int error;
>> +
>> +    z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
>> +    if (!z2)
>> +        return -ENOMEM;
>> +
>> +    z2->tx_buf = devm_kzalloc(dev, sizeof(struct 
>> apple_z2_read_interrupt_cmd), GFP_KERNEL);
>> +    z2->rx_buf = devm_kzalloc(dev, 4096, GFP_KERNEL);
> 
> This will allocate 8192 bytes because of the way the allocator works.
> It needs around 40 bytes for the devm stuff + 4096 requested. So 
> rounding rules will allocate 8192 bytes.
> 
> So either you could allocate "for free" much more space, or you could 
> allocate (and document...)
>      z2->rx_buf = devm_kzalloc(dev, 4096 - sizeof(struct devres), 
> GFP_KERNEL);
> 
> or have an explicit devm_add_action_or_reset() that would require less 
> memory, but would add some LoC.
> 

or leave it as-is, of course ;-)

> 
> See https://elixir.bootlin.com/linux/v6.13-rc3/source/drivers/base/ 
> devres.c#L97
> 



