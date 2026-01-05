Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1880BC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBh3+Fc9fmKvv7ALR0Ga5+M3oQ1D+mCzNE32QmkZwog=; b=c3QwsO3fKTRfJ2qIZZOF6gkxyO
	k4U6b8irRyaIEDVUouQ2Y491nS6UKTIMyw3GzVKOB66iwB4tJsyt/DQ44gCEodg7Tj7cIZIj2noLu
	ZHEAiFE3hexLJH0a+Kf8sZ7a+tAatQS+5HGCpobiT2AvpCdhGedaQwEljrwLiyzw+5GUFF+Rq2zcB
	ckbK2Y2deweNfAqWT6baoryM3PgZT2fDB+j/csDQVoCa7GkWX2+hSsdOTGf2WuuoJcwU4/WS7S5rK
	CrqJqfchV/ymKrdU1z1qalSY0jAwF/m+p8EUZUkdJKB8Zatkj+RY3qUl0XziwBJyK+N8uTSKhuGY3
	pNbGo6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcf9R-0000000AvKL-1IxA;
	Mon, 05 Jan 2026 07:37:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcf9P-0000000AvKE-1vvl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 07:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E3CF6000A;
	Mon,  5 Jan 2026 07:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126D3C116D0;
	Mon,  5 Jan 2026 07:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767598634;
	bh=xZXhNGf8vmrb3CmFuHN4pbqIFbluYGuFSRI363D+f+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQARnNlfezTetrzJA3Ray5fzyIVC7UjBIgH+mtbm6iAII3CHO5cPZ/tTo2CFVCyR+
	 DVcS7Kf+SULOiiEUwHK+zBr3c6t2RDNvqWFx0g8IMhzcLPIxBvGTxj9LSdH7/gQfnh
	 jg3ZcE+6SAgF8GcJTDyHVjo6e6aizljBqBpNZrOSUX2A01xZv6E2RPv86uFsE4ADdl
	 kUccWGdUJQp9rs4iGzgVns76/lKBxKlJRY6rmVuu6woz1a+lXQYu8T8a+HSihzBCuG
	 esf0xbDHDWkpCIoxrL3ngYar990BhCFJs0hiZlu6koA1zN0bTHNUeoFavPAK2Yl9i9
	 T+Zhy5zaQHyZg==
Date: Mon, 5 Jan 2026 13:07:05 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v20 1/6] dt-bindings: firmware: Add TEE remoteproc
 service binding
Message-ID: <aVtqITUxy--E8HJt@sumit-xelite>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org>
 <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
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

On Fri, Jan 02, 2026 at 04:17:27PM -0600, Rob Herring wrote:
> On Tue, Dec 30, 2025 at 5:10 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Mon, Dec 29, 2025 at 05:25:30PM -0600, Rob Herring wrote:
> > > On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> > > > Add a device tree binding for the TEE-based remote processor control
> > > > service implemented as an OP-TEE Trusted Application identified by
> > > > UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> > > >
> > > > The TEE service node is a child of the "linaro,optee-tz" firmware node and
> > > > acts as a container for remoteproc devices that are controlled via TEE.
> > >
> > > Is this generic for any remoteproc device or just ST's remoteproc. Looks
> > > like the latter to me.
> >
> > That's true, the DT description of the remoteproc subnode is very
> > specific to the vendor which in this case is ST.
> >
> > >
> > > > In addition, the "linaro,optee-tz" binding is updated to specify the
> > > > '#address-cells' and '#size-cells' values used for child TEE service
> > > > nodes.
> > >
> > > I'm pretty sure I already rejected per service/app child nodes for
> > > OP-TEE when its binding was submitted.
> >
> > That was the reason to have discoverable TEE bus in first place and I
> > have been motivating people to dynamically discover firmware properties
> > rather than hardcoding in the DT.
> >
> > > If we do need something in DT
> > > to define some resources, then can't we have some sort of
> > > standard/common communications channel? I don't care to see some sort of
> > > free-for-all where we have every vendor doing their own thing. OP-TEE
> > > needs to standarize this.
> >
> > I suppose this requires a wider scope work as you can see the DT resource
> > dependence from here [1]. By standardize communication channel, do you
> > mean to say if adding an alternative backend to fwnode for TEE in
> > parallel to DT, ACPI or swnode is the way to go for discovering fw
> > properties?
> 
> No, not at all.
> 
> > Or do you have any other suggestion here?
> 
> What I mean is why doesn't the TEE define the communication channel
> (mailbox+shmem and notification interrupt) rather than each TEE app?

The synchronous communication channel is already there for each TEE app
based on (invoke commands + TEE shared memory). OP-TEE does support
notification interrupts too but those haven't been exposed to TEE client
drivers yet. I suppose this remoteproc use-case can be a good example to
expose that as a generic TEE notification interface too.

> 
> More generally, is having TEE apps depending on random DT resources
> really a box we want to open? Is the next thing going to be a TEE
> clock/reset/gpio/power provider? Where do we draw the line?

This is really a hard line to draw since silicon/OEM vendors based on their
hardware security architecture partition various resources among TEE and
the Linux world. And one general principle we try to follow for the TEE
is to keep it's Trusted Computing Base (TCB) to a minimal too.

IMHO, if the threat model is well understood then we should allow for
this hetrogenous partitioning of system resources.

-Sumit

