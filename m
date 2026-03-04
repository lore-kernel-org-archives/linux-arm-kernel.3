Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB6DEB7EA3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6V4ZABAoBYAEDoOVQvmIQ76oRldfMwh5wzfjWSFa+/U=; b=Ql1YF0gqEe7v9sL5y2y4YH9zJN
	cfj8LLDHRXBRuqmoJ78fIKQP0F7p24aqZj6T4jiUJWUyS76MHQzzsDmRMHnc207lfxsJ0pp/JyT/4
	og1KZgIecLWE7zEaESB2eFDrmFfycEWi++Vhaif9HaZp9Sfd8+dLXtF63hGBZBBXVRkVrNWYjlFKo
	77HpxIBXJlbAsSoDO7TyKyXHEJHwIkUsZ1sC94L/j5cFcEGyYXgPMFKonrnnxGE3sYM3XCzN6gKMM
	JNwP+b8NmPrF950FTktNp30OstBzCX3CLIGMr04HKCE7+Atzy1KgzYh5mgZlFkxXcC0Y8JA0tItft
	Q0M7myoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhHe-0000000GhS2-1199;
	Wed, 04 Mar 2026 08:08:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhHd-0000000GhQS-0viD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 08:08:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6V4ZABAoBYAEDoOVQvmIQ76oRldfMwh5wzfjWSFa+/U=; b=kBrdsa3uYKNVOZ8xPGWY89AFuF
	J8otyHRWWf59ESKsgaxT+RZJjtjpqPRX6tZhemg3HXoc89stC9VQAzAlKVjlsP2IR9xnPdm0d5Zta
	4z04gqCfKzNu1LrVocs4WSLQh3AL4K+XcIgxzlFuBzlA/BkTtM2OKAnUORZdGQFkvSchsAAIylM1y
	3jrfSknaqpLBNwbSXrVFOHFklHHcmqx8TQFEYbn8/Fv2HTSHJJxtOgLsyUVWbrNKc2blvgVO6a+rN
	Wu/zKU/ZtWcqskmrbgAnqilQA4bxU26lPgAA58oYELueBakbl9rL8gnbBdXbFUSzeufC4o/7U/Bez
	gJpLl+VQ==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhHa-0000000459E-1W3Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:08:40 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-359866a1d02so2958469a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 00:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611715; x=1773216515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6V4ZABAoBYAEDoOVQvmIQ76oRldfMwh5wzfjWSFa+/U=;
        b=GeLsPWi0o2US/4x7jHwy5SEWD/Tic2YaHwvLO8pSB5u+v6sGGHoRKfZyd/c9LDbtJq
         5Z/2RlinWiiU6pQnWHNEhOcIge0obr7ulTLhSfObEpl7sil4M4Z9XznhT5wfRWGtnsP1
         fUY/8Y50tp844P/txnNzCt33Ls1Tn/ghbNKIMoF690el5H5abmh3+TQgw7ajzqYl+BPt
         r5avRK6pYCksHpv41mFlJFRRbWB+DB82c3O8AmNt1vS4/UEnHX4YLybGIMqERHhom3DT
         JSLmmEpfrQrEPTCKrPCMRTecBZI/B+zWjBqxwMwGuYFjark6m2nVUpMZYYegpTcWDTzl
         BtwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611715; x=1773216515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V4ZABAoBYAEDoOVQvmIQ76oRldfMwh5wzfjWSFa+/U=;
        b=K5rlvZd7RZrkma+srZ/poxvU/o/t+wprZ25FGEIHePYBwZkZ7yBxSIwwtkW+vUyD4Y
         a0+/52kmfHwNyAa0Yh5R6SiuGaeFhOjkD+hGygrMEQ6ah1FD4VuKYDWYIAYgF1EzWPzL
         woToyrvOi/f+83pme6SevwnNAg5UKHvGgv4ranAFJNEP+w76/lUhAo4WlhJgA8pOw/tZ
         eh4MnvMDNlvvk4KrUwsLZwOwxUpt/3UGTSUyvHn61RDqqlaDGCxqZ0b4a6StvE6vqyg6
         4A2g9kjEvcjquvOhSTBhLIfmtJjEl2YFdKNyxU7EFMq2UViKWT53drG5ztIv7jvqmJk+
         cYSg==
X-Forwarded-Encrypted: i=1; AJvYcCUHxKWpeby6zSpl32B4N7tpRTk73copMlTObOXHx228f8fpfCEWXFmpLACJeki64WRbQPK0zidY8HmeLJJtBfP6@lists.infradead.org
X-Gm-Message-State: AOJu0YyjPfKMvOvUVTPvKw5J3wmDFkVWoA6vHZJiv3NlP5H2AGyhdIdJ
	KZVDp2RUpH2U9iwtuNIJbuqsyGJt3SMFv8GyAB8mT82Ls8pky5BSHLI7
X-Gm-Gg: ATEYQzwZUfwPlAd9RRnaraxaWJ16PvYFgDRpGhtU3Qd7SvcuZqlDx4sjy4S2g+RgXfx
	Q6J+/rms0gHMTQeKfojUgVOx2K+5SUT5viF1urY0nRkNxVe4raJingrm2/Zp6UpYTfdVYf10fp+
	9uwXVukhHMw1x07dRGTAAFaXSpUssyykaRQQClW04oybdC1G32UJ7W75QNDiBmymQigqyXGpMxH
	QSJst/ZZA5dpjURxZ8H3BS3M+++j1gvwmNTm9NtkItKx0fsume/xxpXcF1wMYM6vptMkRFPNMGp
	FcdpiUCS7J4nBPnDBA0tWMHThlHsy80B4jLHH9cbiL2XyJ394lHgqjjFMnxTO0elnf7+PygfY/i
	lc0wwS26QwfoQsfnWZWlvLjOi88xKDoJ1pK73In+K0eJLYE4OWve9kDKmaYPFdj9NSAMVBBF+X6
	yJGmA+BwdsxFjptVFYoRI66K5UNrqRDu6Pr0dSOdQ=
X-Received: by 2002:a17:90b:2fc8:b0:359:8e1c:542 with SMTP id 98e67ed59e1d1-359a6a3c1ddmr1261053a91.18.1772611715477;
        Wed, 04 Mar 2026 00:08:35 -0800 (PST)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3acea3sm4504552a91.16.2026.03.04.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:08:35 -0800 (PST)
Date: Wed, 4 Mar 2026 12:08:25 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nbd@nbd.name,
	ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <aafoedMHhKNuEwFE@DESKTOP-TIT0J8O.localdomain>
References: <20260303190948.694783-8-cjd@cjdns.fr>
 <20260303213723.GA4075286@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303213723.GA4075286@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_080838_523151_EFF89F41 
X-CRM114-Status: GOOD (  29.25  )
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

On Tue, Mar 03, 2026 at 03:37:23PM -0600, Bjorn Helgaas wrote:
> On Tue, Mar 03, 2026 at 07:09:47PM +0000, Caleb James DeLisle wrote:
> > pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> > registers unconditionally. If the registers are hardwired to zero
> > (not implemented), both base and limit will be 0. Since (0 <= 0) is
> > true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> > gets created.
> > 
> > pci_read_bridge_windows() already detects unsupported windows by
> > testing register writability and sets io_window/pref_window flags
> > accordingly. Check these flags at the start of pci_read_bridge_io()
> > and pci_read_bridge_mmio_pref() to skip reading registers when the
> > window is not supported.
> 
> BTW, I'm still interested in the details of how we got here.  It
> shouldn't be too unusual to have a bridge without an I/O window or
> maybe even without a prefetchable (64-bit) memory window.
> 
Hi Bjorn,

I'm fairly new to the PCI subsystem, so please correct me if
any of my understanding below is wrong.

Regarding the I/O window check: I only hit the issue with the
prefetchable window. The I/O window check was added per your
suggestion in our earlier discussion, since the same logic
applies. Neither downstream device (MT7603, MT7663) has I/O
BARs, so I haven't been able to test that path.

The EN7528 SoC's PCIe bridge does not implement the optional
prefetchable memory window , the registers are hardwired to
zero. The downstream device (MT7663 WiFi) has 64-bit
prefetchable BARs.

The problem is that pci_read_bridge_bases() reads these
registers without checking pref_window. With both base and
limit hardwired to zero, base(0) <= limit(0) evaluates true,
creating a bogus [mem 0x00000000-0x000fffff pref] window.
This makes the allocator believe the bridge has a prefetch
window and route the prefetchable BARs through it. But since
the hardware can't actually forward through this non-existent
window, the device becomes unreachable.

This patch skips the register read when pref_window is not
set, so no bogus resource is created, and the allocator
correctly falls back to the non-prefetchable MMIO window.

As to why this hasn't surfaced before , I'm not sure. It may
depend on whether pci_read_bridge_bases() gets called on a
given platform and whether the downstream devices have
prefetchable BARs. But I don't have enough experience with
other platforms to say for certain.

Reagrds,
Ahmed Naseef

> > Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > ---
> >  drivers/pci/probe.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index bccc7a4bdd79..4eacb741b4ec 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
> >  	unsigned long io_mask, io_granularity, base, limit;
> >  	struct pci_bus_region region;
> >  
> > +	if (!dev->io_window)
> > +		return;
> > +
> >  	io_mask = PCI_IO_RANGE_MASK;
> >  	io_granularity = 0x1000;
> >  	if (dev->io_window_1k) {
> > @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
> >  	pci_bus_addr_t base, limit;
> >  	struct pci_bus_region region;
> >  
> > +	if (!dev->pref_window)
> > +		return;
> > +
> >  	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
> >  	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
> >  	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
> > -- 
> > 2.39.5
> > 

