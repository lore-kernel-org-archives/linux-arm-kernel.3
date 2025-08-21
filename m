Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB31CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 12:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbHVx0AjhuMt4y2W1PFPxfaxziXKltNhN58wsnEMP24=; b=PNx7DJFQ69NzZP5mcdlpSwdncn
	InSmDP32YbVEo5XIrDunXB4QDg1NdwzHrbQ7Cm7RIGX7aOlgNjNkOMw0CMfziDZRjqcM1FiQYiltm
	Fiq1bLcgp3S7tIKll8XtjMCigy1gcslMTNLJcfn1nvV2oQQyPeiIsRr7FQjgc8j0KMWAdwYjPb82c
	FakwYjBHZiqwn8h4WlrOKuj0ekASxfL83vzuryHsix9GjXF7ye02NQIpUc7HUlhOPQQ3MC4bVcKr6
	tjeGh7D9Uq2dihu9PvyFO1lZaQi9DVGbGaho22yuVQ9GW1xKOAlHE9oVX5wfNpLEhmZL+pFNAqrOt
	a4XTwN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up40F-0000000GqJq-42VO;
	Thu, 21 Aug 2025 12:02:47 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1D6-0000000GL8s-1fyz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 09:03:53 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c6y6X3tZTz9tPJ;
	Thu, 21 Aug 2025 11:03:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755767028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zbHVx0AjhuMt4y2W1PFPxfaxziXKltNhN58wsnEMP24=;
	b=b2V6OGIK+9faRLgIyZYk6uRabl45mm0HCdGaL9s465n3dtJ3XMH35fcyk3NnBsqvmmxHAA
	dMUMj+e2RqYo3JYdzZEnKijCAugtBUaSj9Z4qnUwjRykf//RRJWqPri69DY7v9wGIA4nM1
	AB7FOUC4K3Z3gjYtotbnzv2wvvVvNO2kcjXZOqULnAMzCCbPJJeugtv+6rIUT7LBJMEqGT
	KAaQ/bHhOB7ZsVLuZCvBA/F2cdvb64Uw52U45xMROpDI12jU8SbNzC4lNzUOScBcpwhkjW
	n2XHjV9YzJxTIDjDsOyUNmNIj0FTdtMUqKayIsj6CZxCeLwwcuPPXm4t1j4XUA==
Message-ID: <83a65b18-76e8-4ad4-9d4d-c1ef68d3d181@mailbox.org>
Date: Thu, 21 Aug 2025 11:03:46 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <8d38e622-a743-41f9-81e6-d8608e3c60ec@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 79b755643f9efdfb172
X-MBO-RS-META: 5w55qm7f67jhh9dnw5fsdc7xw59emh36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_020352_587304_AB9F6D09 
X-CRM114-Status: GOOD (  12.28  )
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

On 8/21/25 8:28 AM, Ming Qian(OSS) wrote:
> Hi Marek,

Hello Ming,

> On 8/21/2025 12:29 AM, Marek Vasut wrote:
>> [You don't often get email from marek.vasut@mailbox.org. Learn why 
>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Add support for optional allocation of bitstream descriptors from SRAM
>> instead of DRAM. In case the encoder/decoder DT node contains 'sram'
>> property which points to 'mmio-sram', the driver will attempt to use
>> the SRAM instead of DRAM for descriptor allocation, which might improve
>> performance.
>>
>> This however helps on i.MX95 with sporadic SLOTn_STATUS IMG_RD_ERR bit 11
>> being triggered during JPEG encoding. The following pipeline triggers the
>> problem when descriptors get allocated from DRAM, the pipeline often 
>> hangs
>> after a few seconds and the encoder driver indicates "timeout, cancel 
>> it" :
> 
> It's a hardware bug in i.MX95 A0, and the i.MX95 B0 has fixed this issue.

Ahh, this helps, thank you.

> Using sram instead of dram only improves timing, but doesn't completely 
> circumvent the hardware bug
Does it make sense to upstream this patch anyway ?

