Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC73CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Us2CEKzb/LZYmkMd3REl+O/jRJoz5l7mOxNvoiHYNQ=; b=ReFu6XbhracZtUplGM5u6BNwbd
	VmgozTNzd1fWZ+mjrB4ik8te2PvgbGuWl563bNqJpQjGcPafzkooAY4goVfWVkDDQNhOao0I3HdCZ
	sSJ5dSUC+Ln7Wu00okhChqZvQXp4vGZdFJ0AuuNUm856uPzPrX79i2rof85hrc8tqALGbkK6YK4tk
	bE5sXRfqO18yT6DcPbNCGRDE1dABsr89emwpPnhHwRTg0Y9m9iFiWaoA8vDHkXOb8tXsx4XIGf6Ng
	uLq3HerHn6Yqky29OsqxIOQ92xSdzH+2Uz75qWfzP+j4FRmLLyor4QofkR183r3DBwttzpfbgRx5E
	KnyTebJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7hh-0000000HUU0-0o6K;
	Thu, 21 Aug 2025 15:59:53 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3yq-0000000Gq2l-1nkh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:01:21 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c723J0yFNz9tSH;
	Thu, 21 Aug 2025 14:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755777676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Us2CEKzb/LZYmkMd3REl+O/jRJoz5l7mOxNvoiHYNQ=;
	b=Tnx74/4zhxlKHa8xBZEEmYRlW05meeTn2fdl8UfYK9X7ZUPQUyppNEtMfvlyGnEmBf0NvC
	4w+8i+N1i4L3AoI/a/BcrywVmEqgzaWe0fgB/3yy6xN77fJv4JGuQJ95qZsWItLXOwVQ2I
	9J/2y1u1cXz826JgG0tP5gHQKjsCQO/Hq9it1YKEseUHFhucKdp+Tbu9gJLa6Gi3pdVpiv
	+xWlSojWNBaLYTx+goWOnRBfa0eJim/pxBW3NPYgvmS0ncKqwy7lHQtIYfAwswdWvcp4Xg
	U/15aAHsns+wCjna/G8PwJFJ8+sri32ItbsEbjTQTR8720ACaclvLbvtTFgKTw==
Message-ID: <b1a39526-92c6-4fff-9376-0354bf2f8ff2@mailbox.org>
Date: Thu, 21 Aug 2025 14:01:13 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6f6a149e-846a-45ca-b516-09482c87ea1a@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 67766e4211117622b8f
X-MBO-RS-META: 57yjiim1r1b9ka3azn4618hr575chnsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_050120_612549_D98BCD8F 
X-CRM114-Status: GOOD (  16.51  )
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

On 8/21/25 11:42 AM, Ming Qian(OSS) wrote:

Hello Ming,

>>> Using sram instead of dram only improves timing, but doesn't 
>>> completely circumvent the hardware bug
>> Does it make sense to upstream this patch anyway ?
> 
> I think this patch is helpful.
> 
> But so far, we don't have any SRAM resources for jpeg.
> The i.MX95 does have sram, but it is very limited, and it has been
> assigned to arm_scmi and VPU.

I found out the SM can work fine with only 192 kiB of SRAM instead of 
256 kiB of SRAM. That frees up 64 kiB of SRAM for NS world. Each JPEG IP 
needs 20544 Bytes for descriptors, which fits into those freed up 64 kiB 
of SRAM.

The alternative would be to handle those AXI read errors and restart the 
encoding. I always observe these errors in the CONFIG phase of encoding. 
Do you happen to have any details of this issue you could share ? Do you 
know whether the problem occurs only during CONFIG phase, or also during 
image read phase ?

If the problem occurs only during CONFIG phase of encoding, it would be 
easy to retrigger the CONFIG I think. If the problem occurs also during 
image read, that might need some more creative fix.

> This patch makes the jpeg can support SRAM. Maybe in some scenarios, we
> can assign the SRAM to jpeg instead of VPU.
> 
> So for me, I welcome this patch.

Thank you

-- 
Best regards,
Marek Vasut

