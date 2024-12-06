Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3A0E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 13:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2mGikl9wgoPB6QGMDFbsKjPfadQvu6/96OReyITeFk=; b=ucS2/xqv6BmdZTyf+pCYLC4B8q
	9zJI8y57GfJpa/rUoDJtkyD6EbF4kSYYS1ap4tq+EUR36/IZ+o/vOd8GaZTFPZQsvDltYHwSX72qk
	6uecgcDiQ5EUVJvexAlzGi8HW+ZJJIaNW1yTJGs5mO5KKptkgRPNbU2AEOvo1LIXXNZ85zGhBlPTz
	pJ1Aq+k+HukpAJLSaRRaHCJtiT22ivvpUVN0/S+zPoVBNUXqil1/Yr30NkVElLRjm5i62dCHocn63
	D51F9r420hhVh9LVSYZAFnHcD20QqRO47InsBMN2LbeROjibcLOb6bGFg4Pzjl0FPZCjmT0h2OPxY
	20DN5r2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJY0I-00000001fsk-279D;
	Fri, 06 Dec 2024 13:04:18 +0000
Received: from fhigh-a6-smtp.messagingengine.com ([103.168.172.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJXzG-00000001fhY-1tkT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 13:03:16 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C36521140157;
	Fri,  6 Dec 2024 08:03:12 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Dec 2024 08:03:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733490192;
	 x=1733576592; bh=Q2mGikl9wgoPB6QGMDFbsKjPfadQvu6/96OReyITeFk=; b=
	dKnybjivCTbw/XFCh9sS01mLXRPJ4gwaN2B6x9pux0KTSppt8W9rOgJX4AmvR9Lp
	IwLOlu4qsLFaGzoGDtFxu9qxgkXJUiFK399tI8ECd81gVKM7k2tJfvZxHyKDRrcX
	Jkb1Ya6HHWEVwvOL22MZada6TLBuNrXAutaEUhcGDq9yh6QjOp1On7+2vg8sQgYB
	CJ7vMfRMpw6B1BL7x6LIUYfS6dwXyNlwixukEh8G59uRcmrmJwDi82EGB7osbaMz
	NzmXnSIuWiOo1H3pZPPVWVygfcbOrHJ7CWzjUNCz2sD7cMpUeHcSOa3vNgHnR/Y3
	/O5wNAyb2VoJmrSY0/SGNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733490192; x=
	1733576592; bh=Q2mGikl9wgoPB6QGMDFbsKjPfadQvu6/96OReyITeFk=; b=a
	ukdyfWQXN4yJCCSfeKTI2psfUC7pJP06lSaPlUVM5pqyloYDHiMRkHf3QHkac7Cg
	EXWqnXd+yJW2SKEHDyGwpUgesUa0v+By+UdUBKscL/6rUI2uQ1Yp7VLjVzzZDvMZ
	sK7AHLVV+21c1Ev/3KUTvLC7sZaOj8B3osOx6p56907Xi5mkyEIcZBwy7RZkES8Y
	JHh0LH229zLZ464HoprENmxjLtgTHPtVP/LhfmOQhdyU/R8dmKRKfHuEyYHUUpiC
	HXBlxEiDRq2iwhNM763m/GqiYCCzs6xcXD0jR4QJSyomNneKWiJagBUc15qqpCFi
	01qjtCSsGVg0bRkoIKP6w==
X-ME-Sender: <xms:D_ZSZ5GVoHzOXX2xDMFZXz3W-TGG3KlEkI33eTN5eKgDxZeVwu9_9Q>
    <xme:D_ZSZ-UQYj6xy_pn8EIHY3ZEntYgebtspmL2Y6fqkOJv2zaXbilJVJAfsJXLqEmPO
    Aauf6LcAt__DVbp8Z0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrieelgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedukedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhgvrhhnvghlqdhtvggrmhesrghnug
    hrohhiugdrtghomhdprhgtphhtthhopeifihhllhhmtghvihgtkhgvrhesghhoohhglhgv
    rdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgdrughrrghsiihikheslhhinh
    grrhhordhorhhgpdhrtghpthhtohepuggrnhhivghlrdhlvgiitggrnhhosehlihhnrghr
    ohdrohhrghdprhgtphhtthhopehpvghtvghrrdhgrhhifhhfihhnsehlihhnrghrohdroh
    hrghdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:EPZSZ7JHa8snLcz6I0aQ9FOzxkZv3FgUF_ANvcqXDMOSLCkbqMS1-g>
    <xmx:EPZSZ_HeErg6meZEepvltZtpdaRChcfLqyEFsSsSeC9ImXYwIBSTgw>
    <xmx:EPZSZ_U2xRQyP_fjmoONHc8EgZ47WLi1kj4cBrGOxQaDnfRKkVT1jw>
    <xmx:EPZSZ6MgG6jRXgrtkUsCvffzr2Mtu9lnxM-xlFob4emZkImbFLANKQ>
    <xmx:EPZSZxZEdqwV8nMEK3L96QZODrP-dJjTa4fIY8QQbLQth3tuImQurn7a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E4C762220074; Fri,  6 Dec 2024 08:03:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 06 Dec 2024 14:02:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 kernel-team@android.com, "William McVicker" <willmcvicker@google.com>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
Message-Id: <f6a04a2f-aed6-436d-aef1-4974a6fe35d2@app.fastmail.com>
In-Reply-To: <aa09bbe3-8f5f-42cb-a7a9-deaaef77affb@linaro.org>
References: <20241205175345.201595-1-tudor.ambarus@linaro.org>
 <20241205175345.201595-3-tudor.ambarus@linaro.org>
 <427caa87-b9ba-4797-88bd-a18a96eefdcf@app.fastmail.com>
 <aa09bbe3-8f5f-42cb-a7a9-deaaef77affb@linaro.org>
Subject: Re: [PATCH v3 2/3] firmware: add exynos ACPM protocol driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_050314_952145_06E56A90 
X-CRM114-Status: GOOD (  33.54  )
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

On Fri, Dec 6, 2024, at 12:59, Tudor Ambarus wrote:
>>> +/**
>>> + * acpm_get_rx() - get response from RX queue.
>>> + * @achan:	ACPM channel info.
>>> + * @xfer:	reference to the transfer to get response for.
>>> + *
>>> + * Return: 0 on success, -errno otherwise.
>>> + */
>>> +static int acpm_get_rx(struct acpm_chan *achan, struct acpm_xfer *xfer)
>>> +{
>>> +	struct acpm_msg *tx = &xfer->tx;
>>> +	struct acpm_msg *rx = &xfer->rx;
>>> +	struct acpm_rx_data *rx_data;
>>> +	const void __iomem *base, *addr;
>>> +	u32 rx_front, rx_seqnum, tx_seqnum, seqnum;
>>> +	u32 i, val, mlen;
>>> +	bool rx_set = false;
>>> +
>>> +	rx_front = readl_relaxed(achan->rx.front);
>>> +	i = readl_relaxed(achan->rx.rear);
>> 
>> If you have to use readl_relaxed(), please annotate why,
>> otherwise just use the normal readl().  Is this access to
>> the SRAM?
>
> all IO accesses in this driver are to SRAM, yes.
>
> There are no DMA accesses involved in the driver and the _relaxed()
> accessors are fully ordered for accesses to the same endpoint, so I
> thought _relaxed are fine.

My normal rule is to only use _relaxed() if it makes any
intended difference in performance or behavior, otherwise
every reader of the code has to understand why exactly this
was done. More generally speaking, use the function with the
shortest name to do what you want, since the longer functions
are usually special cases that are not the default ;-)

SRAM is a bit special, as you don't have to deal with
side-effects the same way that an MMIO register would,
though there is still a question of serializing against
concurrent accesses from another processor.

It's possible that readl_relaxed()/writel_relaxed() end
up being exactly what you wand for this driver, but I would
probably encapsulate them in a local sram_readl()/sram_writel()
wrapper along with some documentation.

You should also have a look at which ioremap() version
you actually want. The default ioremap() uses
PROT_DEVICE_nGnRE and has strong ordering but not the
"non-posted" guarantee like ioremap_np() that would
let you skip the read-after-write for serialization.

If you care a lot about performance on the SRAM access,
you can go the other way with a more relaxed ioremap_wc()
and explicit barriers where needed, or even better
see what the remote side uses and use the same mapping
flags and serialization here.

>>> +	spin_lock_irqsave(&achan->tx_lock, flags);
>>> +
>>> +	tx_front = readl_relaxed(achan->tx.front);
>>> +	idx = (tx_front + 1) % achan->qlen;
>>> +
>>> +	ret = acpm_wait_for_queue_slots(achan, idx);
>>> +	if (ret) {
>>> +		spin_unlock_irqrestore(&achan->tx_lock, flags);
>>> +		return ret;
>>> +	}
>> 
>> It looks like you are calling a busy loop function inside
>> of a hardirq handler here, with a 500ms timeout. This is
>> not ok.
>
> That's true, the code assumes that the method can be called from hard
> irq context.
>
> Can't tell whether that timeout is accurate, it comes from downstream
> and the resources that I have do not specify anything about what would
> be an acceptable timeout.
>
> I see arm_scmi typically uses 30 ms for transport layers.

I think 30ms is still too much for a busy loop. I see that in
the SCMI driver it implements both a sleeping and a spinning
loop, but I have not found exactly which callers use the
spinning version, and what timeouts those have.

>> If you may need to wait for a long timeout, I would suggest
>> changing the interface so that this function is not allowed
>> to be called from irq-disabled context, change the spinlock
>> to a mutex and polling read to a sleeping version.
>
> I think the question I need to answer here is whether the acpm interface
> can be called from atomic context or not. On a first look, all
> downstream drivers call it from process context. Curios there's no clock
> enable though in downstream, which would require atomic context. I'll
> get back to you on this.
>
> If there's at least a client that calls the interface in hard/soft irq
> context (clocks?) then I don't think I'll be able to implement your
> suggestion. Each channel has its own TX/RX rings in SRAM. If there are
> requests from both hard irq and process context for the same channel,
> then I need to protect the accesses to the rings via spin_lock_irqsave.
> This is what the code assumes, because downstream allows calls from
> atomic context even if I can't pinpoint one right now.
>
> I guess I can switch everything to sleeping version, and worry about
> atomic context when such a client gets proposed?

Yes, usually at that point the caller can be changed to use
a threaded IRQ or similar.

      Arnd

