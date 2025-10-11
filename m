Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4725CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 18:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HY4m/FONveNaWcSS1mf6emH9GnjZnG2K76xoPH6Z0gE=; b=hiEm7z8Kp/CdaYrH17GuAIZrL2
	JC6NdktJ1pRqzb24oPdbIgeJCISs+IZlvN3tCKrT0Jb40ty5uYbSW5UvrBS20vQOqaWbd1TRVvcRb
	fcP+i+gFy10t9hJ/4W+4zjSzBRqRbuYhslu7dq2k04q/1t+tP4q7E4ECEo0xpun730RZLu8JBCeto
	K629yP5i0GQ7DnNuEd/o7ZLbarBU0sEp4T4XdlYUA9dxc3MnYC4r+0TyPj2ye+rtvILG2qJgCn/93
	9pkK8Kcsn3MKVKuKTpLmnjq8CJH8XkWhkluFG4i6hOPHGazEX4EOOAHlikNbTtCupMMFc5yJnDM34
	QuVC+VVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7eRY-0000000AUKj-2Qfa;
	Sat, 11 Oct 2025 18:35:48 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7eRV-0000000AUKO-2n0q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 18:35:46 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ckXNt1T5Sz9sQ0;
	Sat, 11 Oct 2025 20:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760207742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HY4m/FONveNaWcSS1mf6emH9GnjZnG2K76xoPH6Z0gE=;
	b=XNNHBd+BXpYDqvIbAMY++Khh3qfJIPw8kb8LKIqC94CRLcDZuZezKOzGE5/URv+Ljk6FkX
	2pQlj+buYYBakbfnH4G7h2NZ7m+S4YFN0fxSGGZBttjkIlXgx6IPck0NaV8ti+WVElUNPM
	dqHhIDHGpi+UBJpIsZ729tmNKLGRojZd3C5MmNt6SY0qNhK44A+n/zdbIg95zn8eNToOpi
	dnb+4CwPwNEphEoSgoSUFONynYa+pnYgwzyVXaNIPT2Z0rShRlWzuF4F6S5FGCRD4KPYTf
	AzPe206aGrTytDhghillMQ3uejKnzxpipT9YyVgILL+ZIOSUQS2EeYlxRlO54g==
Message-ID: <64d2edd4-b641-4f2f-b831-bf2f49da1508@mailbox.org>
Date: Sat, 11 Oct 2025 20:35:39 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] media: imx-jpeg: Add support for descriptor allocation
 from SRAM
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820163046.209917-1-marek.vasut@mailbox.org>
 <8d38e622-a743-41f9-81e6-d8608e3c60ec@oss.nxp.com>
 <83a65b18-76e8-4ad4-9d4d-c1ef68d3d181@mailbox.org>
 <6f6a149e-846a-45ca-b516-09482c87ea1a@oss.nxp.com>
 <b1a39526-92c6-4fff-9376-0354bf2f8ff2@mailbox.org>
 <c1289df9-01b1-4c0c-ba09-7cf18ee8baaf@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c1289df9-01b1-4c0c-ba09-7cf18ee8baaf@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 88s5m3yomg8di3i7cge4qxz99rh69p7j
X-MBO-RS-ID: bd78701d31789afd021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_113545_871266_D6A46529 
X-CRM114-Status: GOOD (  19.05  )
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

On 8/22/25 2:58 AM, Ming Qian(OSS) wrote:

Hello Ming,

sorry for the very late reply.

>>>>> Using sram instead of dram only improves timing, but doesn't 
>>>>> completely circumvent the hardware bug
>>>> Does it make sense to upstream this patch anyway ?
>>>
>>> I think this patch is helpful.
>>>
>>> But so far, we don't have any SRAM resources for jpeg.
>>> The i.MX95 does have sram, but it is very limited, and it has been
>>> assigned to arm_scmi and VPU.
>>
>> I found out the SM can work fine with only 192 kiB of SRAM instead of 
>> 256 kiB of SRAM. That frees up 64 kiB of SRAM for NS world. Each JPEG 
>> IP needs 20544 Bytes for descriptors, which fits into those freed up 
>> 64 kiB of SRAM.
>>
>> The alternative would be to handle those AXI read errors and restart 
>> the encoding. I always observe these errors in the CONFIG phase of 
>> encoding. Do you happen to have any details of this issue you could 
>> share ? Do you know whether the problem occurs only during CONFIG 
>> phase, or also during image read phase ?
>>
>> If the problem occurs only during CONFIG phase of encoding, it would 
>> be easy to retrigger the CONFIG I think. If the problem occurs also 
>> during image read, that might need some more creative fix.
>>
> 
> This is a hardware bug that affects not only the jpeg encoder but also
> the jpeg decoder.
> 
> This issue occurs under conditions of high backpressure on the AXI bus,
> meaning the latency on the write/response channel is high, while the
> read channel latency remains low.
> 
> When error occurs during CONFIG phase of encoder, it will trigger a
> interrupt. But in other phase, there is no interrupt, then the running
> job is stalled until timeout.
I sent a V2 now, thank you for the clarification, I tried to include 
that in the commit message too.

