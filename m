Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E5ECA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 01:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZkfwfwfTeX9xKiyluvpSeN+SljxQilGHMFzDl2Ut3o=; b=BbsgtpSux1VCa/x7f6VzEE706F
	GoxOKJGx0mDU0qCFmXXmgLuweEAu2zVnSvUdv56IyTtqtoqZwrMNuHNbm/1AemK9jkjScd2kLxd7B
	yzOix/+MSiLwgfc7/4aTL1Jz3D9LvhM+ZG35OGHzR+XFbdq1PiKTokALqkiWWyqN+eY2hhp4Zi/o8
	4dxsBCju0RAZqwiy7MEYo1ZDCBS+d/aGJhT4HwnWiMbsr3AXAGWpAUyNk51Zm3XQdnjFl2pyz1wJ8
	2kI2oJzt4tS/oczJ/VvzIqXIf50MEcelzoUnEMY0y6K8N8uBd/Q5RvgAHNoLXKEqA0znmSOO4KzRV
	iorxdIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotjP-0000000FN6X-2f1r;
	Thu, 21 Aug 2025 01:04:43 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopEH-0000000EolL-3CsZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 20:16:18 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c6d4r1PQ1z9tl3;
	Wed, 20 Aug 2025 22:16:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755720972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZkfwfwfTeX9xKiyluvpSeN+SljxQilGHMFzDl2Ut3o=;
	b=thmT+mqFkvUWxOST7w3lIhBT/ZnSS/23CZjb82gojGfPqOrYJlSxn+nl8uU2CM1Vapp7ZV
	MawHA3OwAM9h2erNKumdO+YhuaEAaqL6WOQvjaNHygFXgHiVJRNq4rnEdxRSlwmYxwlaVO
	RD8j44qRahAy7PP4p9062+y31PLfeyAhfclpQlbkdDr2HWgzM+W4l5M603sbx8qc89srup
	ESm2CRhGzmnEBOeZHVKlNRkMbIPGB5TtImnYoc2rg3haoL0GQFegI1sASLXgyEUfKwgkPA
	1ghQ+yrmEsu8v1Op0QqpDOjYQr0IC4eicCkYUr7WRnmJAw7Kzpb6ABPCrDf8Hg==
Message-ID: <7439c678-5369-4c31-9c89-5a015ce7582f@mailbox.org>
Date: Wed, 20 Aug 2025 22:16:09 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] media: imx-jpeg: Add support for descriptor allocation
 from SRAM
To: Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ming Qian
 <ming.qian@oss.nxp.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820163046.209917-1-marek.vasut@mailbox.org>
 <aKYRJap9Gwc2mFXh@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aKYRJap9Gwc2mFXh@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: tnphkcixmh1bsfberp5t1io7r5gk6qad
X-MBO-RS-ID: 21a2f8d06e7699e12a5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_131617_952885_82862BE8 
X-CRM114-Status: GOOD (  14.72  )
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

On 8/20/25 8:17 PM, Frank Li wrote:
> On Wed, Aug 20, 2025 at 06:29:53PM +0200, Marek Vasut wrote:
>> Add support for optional allocation of bitstream descriptors from SRAM
>> instead of DRAM. In case the encoder/decoder DT node contains 'sram'
>> property which points to 'mmio-sram', the driver will attempt to use
>> the SRAM instead of DRAM for descriptor allocation, which might improve
>> performance.
>>
>> This however helps on i.MX95 with sporadic SLOTn_STATUS IMG_RD_ERR bit 11
>> being triggered during JPEG encoding. The following pipeline triggers the
>> problem when descriptors get allocated from DRAM, the pipeline often hangs
>> after a few seconds and the encoder driver indicates "timeout, cancel it" :
> 
> Do you know why this happen if descriptor is in DRAM? why sram help this
> case?

No. Did NXP ever observe this ?

It seems to me the encode never received much testing, considering the 
severe bugs that showed up in there.

>> gst-launch-1.0 videotestsrc ! video/x-raw,width=256,height=256,format=YUY2 ! \
>>                 queue ! v4l2jpegenc ! queue ! fakesink
>>
>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>> ---
> ...
>> -							   GFP_ATOMIC);
>> +	jpeg->slot_data.cfg_dec_vaddr = mxc_jpeg_alloc(jpeg, jpeg->slot_data.cfg_dec_size,
>> +						       &jpeg->slot_data.cfg_dec_daddr);
>>   	if (!jpeg->slot_data.cfg_dec_vaddr)
>>   		goto err;
>>
>> @@ -2902,6 +2911,10 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>>   	jpeg->dev = dev;
>>   	jpeg->mode = mode;
>>
>> +	/* SRAM pool is optional */
>> +	jpeg->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> 
> Need update binding doc nxp,imx8-jpeg.yaml
Sure

