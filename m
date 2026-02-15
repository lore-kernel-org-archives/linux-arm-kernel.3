Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB654E63F08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 21:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhV31VyrveJcfXQ8d+nUZ4pzcd2qb2o+AH/0c14zuUQ=; b=FpjBpwx1h8SOUbbWH2tVb6b6Ny
	+s5EvHL81PIfLmlxFprdShpk6W7Co+0T6dH0J2bWcwzHe1eBeK3zgJ5Ryi1iVDm91+RcKAGWj1Eg3
	MEBnS7/36JR7Nzm/f5OuxzdMoALtLwaEhQpU9qv0cQFPBOfvH4X14Sm1NvXNFSDG95gBnz1OZogH7
	WD+Xnq2dcwsVBhl7mf4zIvHfMzTyrItGNnoWUlc2pECeNIj6r+DFmCXM1s9IIPwP08QBq8avXFE0F
	7CUJCkXhOK+VcsIVzIK1rjU4VbyqVZcuW6n0NKEWtuvEXamcZaG5N78qBNf1dO5QjumAAFI/1AIsF
	DZapyrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrjyT-00000005gYP-1tgA;
	Sun, 15 Feb 2026 21:48:17 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrjyR-00000005gXb-0VfC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 21:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:From:Cc:
	Subject:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uhV31VyrveJcfXQ8d+nUZ4pzcd2qb2o+AH/0c14zuUQ=; b=ZoN2IgkhkJ2CQ2A4rCOzIcTNUY
	X5eNR5vMVbYQWsjKd8AW/v/BJwlDBBF59kDbfvZ+NvFaNth/VJ2sGWcPrOzxjWgfGFMNnwpCnqZx0
	DgWomYGQfnjsPqaXmpb0bntwE4Mo3cEdrSsH/ngdrlk0tEb0CK/xR3Nu8RbTBqV6cd3XaWiSGEdfV
	7Z9qOU23eyJ+mCqDTPHocOCAtbE48Fp/lpddUWZkoigGouEsNyCig03GexXFAjeGxwjOrsY0p2e0c
	3gJtbkbQLNjMEpduY6039x5jxMGGP48+LqEz8Dc53/Mn59PvRJFyi5DYHOoh2C68AmT2/VhO6W//S
	1WqbQY1w==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vrjy9-000Ekn-1t;
	Sun, 15 Feb 2026 22:47:57 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vrjy9-000FlM-1H;
	Sun, 15 Feb 2026 22:47:56 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 21:47:55 +0000
Message-Id: <DGFV6UIJCQCU.3AS44T9UDTHQI@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>, <dmaengine@vger.kernel.org>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: device-wide directions cause
 ASoC cyclic DMA regression
Cc: <vkoul@kernel.org>, <michal.simek@amd.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <thomas.gessler@brueckmann-gmbh.de>, <radhey.shyam.pandey@amd.com>,
 <Suraj.Gupta2@amd.com>, <marex@denx.de>,
 <manivannan.sadhasivam@linaro.org>, <harini.katakam@amd.com>,
 <marex@nabladev.com>, "Rahul Navale" <rahul.navale@ifm.com>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
X-Mailer: aerc 0.21.0-63-gbde0bca3c3bc
References: <20260211140051.8177-1-rahulnavale04@gmail.com>
In-Reply-To: <20260211140051.8177-1-rahulnavale04@gmail.com>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27913/Sun Feb 15 08:26:21 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_134815_459762_8534D4A8 
X-CRM114-Status: GOOD (  13.91  )
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

On Wed Feb 11, 2026 at 3:00 PM CET, Rahul Navale wrote:
> From: Rahul Navale <rahul.navale@ifm.com>
>
> On ZynqMP platforms using AXI DMA for ASoC PCM playback, upstream commit
> 7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device directions") causes
> cyclic playback to fail after the first buffer period.
>
> Background:
> The upstream patch adds the following line in xilinx_dma_chan_probe():
>
>     xdev->common.directions |=3D chan->direction;
>
> Its purpose is to coalesce the directions of all enabled TX/RX channels i=
nto
> the device-wide dma_device.directions mask so that dma_get_slave_caps()
> works correctly. This is required by users such as IIO DMAEngine buffers
> that rely on device-wide capability reporting.
>
> Problem on ZynqMP ASoC audio (PCM):
> On ZynqMP, Xilinx DMA provides fixed-direction channels:
>
>     MM2S channels -> DMA_MEM_TO_DEV
>     S2MM channels -> DMA_DEV_TO_MEM
>
> ASoC dmaengine PCM relies on these fixed directions to select proper DMA
> channels for cyclic playback and capture. Aggregating directions device-w=
ide
> can cause inconsistent capability reporting depending on channel probe or=
der
> or device tree layout.
>

as far as I understand it, dma_device.directions lists all slave
directions the device supports across all channels. On the other hand,
dma_slave_caps.directions is a bitmask of slave directions the channel
supports.

While 7e01511443c3 ("dmaengine: xilinx_dma: Set dma_device directions")
fixed the dma_device.directions bit in Xilinx AXI DMA, it exposes
another short-coming of AXI DMA: as with the ASoC PCM, there may be DMA
engine devices with non-uniformly distributed slave capabilities per
device channels.
To adress this, there's the optional dma_device.device_caps() callback.
So I think the right way forward is to implement device_caps() for the
Xilinx AXI DMA and override dma_slave_caps.directions with the
channel-specific directions.
This should fix the issue for the ASoC PCM while preserving
functionality for the IIO DMAEngine buffer use-case.

I'm working on a patch that implements the proposed solution. I'll
post it in the next days after testing it with the IIO use case.
Unfortunately, I don't have access to a ZynqMP device, so to verify that
it actually fixes the regression in practice, I'll have to kindly ask
you, Rahul, for your feedback.

Best regards,
Folker

