Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785FBC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3stYz9jx1b9Q2oH4Nnw+NNtqnXMxwA+Xc4jXa61Nfk=; b=xFBG2jcfsnjxm1zCxqiIR2om6t
	0gV5vnjfsRtfEXRwO8aInAA3JLdIDp4dWOPJfPNt2tKBkIjXDdUcsdiy/21BiwiUiJHxLHdvCzhFX
	ghYvidHBXuoGj+6ti83779GOFQceZ2BnoNEH1PGC8Lp+MX9e7ob3Qz9K+UHas2UvnzaOEsoBUv7qc
	tjdzs7j96KEXcvuR19xBpxpym04wHeovY1ZOHhleVIVZvnKNsGUDB3uF+E0MI66aIFzwOG07iPCEZ
	OsUk18Nq3hYZtJHFPgSCoNA6zgWg1JPp3sIAJWIhFKpnLm6ReGEvr7WYfRmayFrur0oyYBMr0C7CS
	/3+CnG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4edt-0000000ERr6-12c1;
	Thu, 10 Sep 2026 13:16:41 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4edq-0000000ERqi-0WrM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:16:39 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 3BC9E1D000EA;
	Thu, 10 Sep 2026 09:16:35 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 10 Sep 2026 09:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789046194;
	 x=1789132594; bh=e3stYz9jx1b9Q2oH4Nnw+NNtqnXMxwA+Xc4jXa61Nfk=; b=
	M65EOCsYFY8qmqItH4KPbmfa/S34hmo77EREMEDGsZBeXbI6ZTlc2vFWbUlEfM/j
	LDlo1+RtGHUsjG3bWAf7EFyEHA34UjpTgHeTP0bTIndd9renbVNYBNeguwKfngXh
	dI3PsBl2U3yoYay7zh7hGN1VeRBtfChmr/X8Bg4/osTsGphX0+SqJcUX3gLLHHRq
	rmpS0Vx6JvGkj12LTXpYO2KODhBtzWYY5BYimY1Mfsy9+h/fz5Ag2UAj50wulGNh
	1uN0uLWH9apk26Tup24MfPvpKpCsURkOIU3PGFccB/MPqbVr+7O8Rues6iirDn4e
	aKUIEaZWJihYmYwdam8u0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789046194; x=
	1789132594; bh=e3stYz9jx1b9Q2oH4Nnw+NNtqnXMxwA+Xc4jXa61Nfk=; b=g
	uO3ci0Bto6gNKUNATnUiKqMqxNt0NqnA5uLXCayUeaV8aQYYfJbe+czjGBt5wbjV
	uLpyZ7dqJLe7Owvqd8zRRlgKNyWBuYRaL02yYm6q0rJSbr0gafsuWtgOrkOyxlqG
	4wRhOVGwaY0p1oqm3ZvHLzDO8W1tT7h/NdavvLLm7CedmQSfJbCP9T3xpkOrtiTs
	AvU/EC6PwdMtaT4wCbNAS7d73LMamu5lvba86+p4sXwHKpML0OPHmKm5jq1Pj6co
	rNgR4FforNmJ6g28pmvzogG3ZePOBb1Sfuzq2nbAI41p7bVAKJM5zZ9ljJzg8IvB
	JxaEBANtl/RvVsbGOkeXg==
X-ME-Sender: <xms:rK2iaskI4Am06FtWWADsfzmMHorSeF92jvhOBx7tmiDMxq6BFQ6wyA>
    <xme:rK2iamonI79JfvsN3L2CrtgxTrTQdBqvNX1IiAGb30rOwIuIHDcbJt7Pi1gGX8vU5
    GUVb_mhPtev2m2APHfIU2uuYoG3hTnv_rt4CxYByCOPT6aPEfh0ObUV>
X-ME-Proxy-Cause: dmFkZTF3HB9fRiN65EDoc3yMO7VBmb45FRf2lV1lgfDonJBDFaMYlj3UtcPsxXYQQnXRgs
    bS+GdOCkZTgtyJs4zSKCinFCCrtA2bxdiH19evYPKT5QvJ/XmfrdjyHvo+vUPATGIk6Zd/
    zhvkn1FqT+fRgGmGZvUk0gq8HmYb6mHZEUTuRyaZ9LQg+x81N4FhWB1NJgSkvHSiuAC8YZ
    JRQQi2XqbVB5/HLWUzglPl3nPTNk+T+PX0heWOF/7kB/fHvNWhcFLserxEPe+SY9yZ+iD4
    Jlay7FyZ8ATt9dZosXZsBjAQUDN/xP5FjTgDPuP/QiRCzukLHdnLwmDZ62cDSY2r5uCLbI
    sEnfyPj/KS6oBvJGdB/D6Bi7nZrYT9PkuHsG6n8YT0dXzi8jppGjQ13UtgUc0oDUiakfa9
    kQt8vrWi/id48mOJpRT+DAjkKETcosiMo9d/NgqvHUEMdg/H0FUrDImcJhtm6A3xYjcdYf
    B/wB2UUjyC09sn/7hiUeWT+XzjrevoG/CdVOF+qgXXzNRW6zBKawQWFl1i+zAf5kzlqeuI
    NE5Oldc7bpOPQfUaDVra1I8Ff57DP0oDclNNMbKzJOPVZ1o2kuQkuXX1Rk70/aToYMeZj+
    u6eNmuZx9Lo98moAPmg3XEZ8Vt/8g1kdeT8ZrKvlqmzbVo6iRWPA+5rvElVg
X-ME-Proxy: <xmx:rq2iajFyLkzrXydI_q2MVo78QEeePnXV_HcVtnMBgA99jPuVnnjBoA>
    <xmx:rq2iaqavdIaG18sH6W-GdmcgON1IPQ7wkG18c1ol2oT5Eu3JGqN13g>
    <xmx:rq2iaqE5MARX_Hgg5SpAvtjY4p6c-ylMx_KYTPZ8Fn2RQCAf14Enbw>
    <xmx:rq2iao0SqVRdIpK_8kZUWnutOlx9bRRX-ZN7DDSddSMasHs8JjBe-w>
    <xmx:sq2iaosSXlGB3x82dfvIMLkWakrO4QJFxUYQwKUB5_tt1HjSEDzm4T-t>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 51C7932A007B; Thu, 10 Sep 2026 09:16:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ATaKlDvsEa83
Date: Thu, 10 Sep 2026 15:15:48 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Will Deacon" <will@kernel.org>
Cc: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Hans Ulli Kroll" <ulli.kroll@googlemail.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Christoph Hellwig" <hch@lst.de>, "Ard Biesheuvel" <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Message-Id: <56fbf5bc-f138-4ad6-a1db-b16b8de601c3@app.fastmail.com>
In-Reply-To: <aqKMsKpYnAZOoKQo@willie-the-truck>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
 <2ea28a17-f36f-4dfb-8e2a-375e7a3a4d6b@app.fastmail.com>
 <aqKMsKpYnAZOoKQo@willie-the-truck>
Subject: Re: [PATCH 0/2] ARM: preserve DMA_FROM_DEVICE buffer contents
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_061638_476637_4066CFA0 
X-CRM114-Status: GOOD (  29.98  )
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

On Thu, Sep 10, 2026, at 12:55, Will Deacon wrote:
> On Thu, Sep 10, 2026 at 11:14:28AM +0200, Arnd Bergmann wrote:
>> I see this as a tradeoff that can go either way:
>> 
>> - the current 32-bit Arm approach (also arc, hexagon, microblaze, mips,
>>   nios2, openrisc, powerpc32, sh) is obviously faster as it avoids
>>   the writeback, but it relies on device drivers to ensure no stale
>>   data can leak back into userspace.
>> 
>> - Will's patch changed arm64 (later copied into riscv) to avoid that
>>   risk by adding the overhead out of caution, and avoid having to
>>   audit and fix all drivers.
>
> How would you envisage fixing a driver for this? There were two issues
> I tried to address by moving from invalidate to clean on arm64:
>
> 1. If the DMA transfer didn't write every cacheline in the buffer, then
>    we could expose stale data in the gaps.
>
> 2. If the buffer has a pre-existing userspace mapping, then we expose
>    stale data during the window between the DMA map() call and the DMA
>    itself.
>
> Fixing (1) in the driver would presumably require it to walk through the
> buffer after the transfer and zero all the gaps, with an appreciation
> for the cache writeback granule (!= cacheline size) and then (somehow)
> clean those parts back to the PoC. Is that something any drivers attempt
> today?

I'm not aware of any driver doing this, but also haven't tried looking
for them. I think the usual assumption is that a driver asking for
a variable-length reply should ensure that it doesn't access of the
data that was not returned, and that the driver understands which
parts were received.

One thing that the arm32 implementation (but not any others as far
as IIRC) does is to do a writeback+invalidate for any partial
cache lines passed into dma_sync_*(), but this of course does
not handle short transfers.

We had at some point discussed using KASAN to debug these better:
mark any memory that is passed to a device as unaccessible through
the DMA mapping API (rounded up to full cache lines), and then mark
the data as accessible again during the sync to the CPU (not rounding
up). As long as the driver only passes the actually received size
into dma_sync_single_for_cpu(), any later access would trigger
a KASAN assertion.

> Fixing (2) in the driver would presumably require ruling out the
> possibility of a user alias, which sounds hard and possibly ABI breaking
> for some drivers (depending on how they manage their buffers).

There are not that many subsystems that do streaming DMA into
user-mapped buffers, so I also can't think of any good example
here where things would actually go wrong in practice. Have you
been able to find an example that runs into this scenario?

Block drivers always transfer entire pages, and I don't think you
can access a page until a transfer from userspace has completed.
GPU and media drivers might be affected, but it looks like those
usually use coherent mappings.

>> - actually measure the performance overhead: you already did the
>>   work to test this on three separate arm implementations but did
>>   not share performance numbers.
>>   Can you quantify how much this costs us on the hardware you used?
>
> It's worth noting that many Arm CPUs upgrade invalidate to
> clean+invalidate (either due to the micro-architecture, errata or because
> of virtualisation).

Right.

    Arnd

