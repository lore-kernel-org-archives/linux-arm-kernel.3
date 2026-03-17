Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3194FD7072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+s2M7y9EWmfo3pnC8rfpaOTqH482fuTkp+K0CN0HGE4=; b=ociZWsNskyW0ERL96zGN/jNO+t
	s4xJNBUX0xbzz739AduchPguPQYjDPDg4hoDISKdlogjFuK1FRqbEjGVZoLoM302JNxYB8pau0PDk
	C8sgYz+juRU4Bj7MFQ/mTicO5JonPVUCtVAxNrH/aLU3ACtzXaJUtX1zfSVtDo1t0/ZtYiklfh78s
	ZcGnD9CxvSQxfsZnLUrNQ7mCz+Sx119G2oyf0yYgdP8MRhkhH6RawA6mpPtIUbNzc7fyBIqJUS2N0
	SxRZQxBVHvEPMBC1eZ7Cn1DH4Up9AifV4ffn71BkJU0Z8YMVaRRjLgophXBa25gMrdGi2vgmnMCkk
	c3tiHJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Reg-000000061HL-3XqK;
	Tue, 17 Mar 2026 10:28:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ref-000000061H0-0Btg;
	Tue, 17 Mar 2026 10:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CCE660008;
	Tue, 17 Mar 2026 10:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDBCC4CEF7;
	Tue, 17 Mar 2026 10:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773743283;
	bh=1xbKBSlkozJZVHo9aWAqFEve5sj6lCI9yEzMc1miQSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8xtv3vvdarHsmUyInVVAPUWhHzbvSKQhDx4fZK4XpDV/UBzN0OZIR24xJ2R4Dt5L
	 4hRILK7tJ0/V9pT5ryBqrlF0TBUT7uQxKTVZY8LWyD3DlRNwmzJBUHTnDrgULu71NU
	 dK+Qlbx2YcNx3HJ1gOWPakoZYxG8crAjXBz1qSa3ecwPxJMNfhOFrxqbpBu+NbESva
	 wqtZfW3kSs8MLR9P2wOUA+GX/DWynBZVts+mKGWl5U9ReZGOsRBJt1J00VfSqG0Bu0
	 7oAqB+pvVrJHBbMhjwD8U6rcw/vvtojEX0WHKBsow/19fu5zNweqcFVrGUrZFqQK7A
	 kHA80/SxGSIXA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2Rea-000000006oc-42C1;
	Tue, 17 Mar 2026 11:28:00 +0100
Date: Tue, 17 Mar 2026 11:28:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <abkssPv559MBM61V@hovoldconsulting.com>
References: <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
 <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com>
 <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aar1PDUB2t7DgEP6@hovoldconsulting.com>
 <CAMRc=Mcv+ZMGaC_MD8WRH113rDuuxdiZXuW5JAXWga1V7vM_ng@mail.gmail.com>
 <aa6hcT7MROZqxF1j@hovoldconsulting.com>
 <CAMRc=McXGZFVQm0B2OddSLLV8r513tDmbEzeY4hvPcakSv9N7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McXGZFVQm0B2OddSLLV8r513tDmbEzeY4hvPcakSv9N7w@mail.gmail.com>
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

On Tue, Mar 10, 2026 at 10:28:17AM +0100, Bartosz Golaszewski wrote:
> On Mon, Mar 9, 2026 at 11:31 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Fri, Mar 06, 2026 at 06:34:43PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Mar 6, 2026 at 4:39 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > > > You have posted changes that will prevent driver from accessing the
> > > > struct device of core i2c structures. This is unexpected, non-idiomatic
> > > > and subsystem specific and therefore a bad idea.
> > >
> > > That's not true, the changes provide a helper to that end.
> >
> > That was supposed to say "prevent drivers from accessing the struct
> > device *directly*".
> >
> > > > Again, this is a core feature of the driver model. You can't just ignore
> > > > it and come up with random ways to work around just because you disagree
> > > > with design decisions that were made 25 years ago.
> > >
> > > It absolutely *can* be done differently. There's nothing that imposes
> > > a certain API design on susbsystems. If you design the subsystem code
> > > well, provider drivers don't need more than one reference (taken in
> > > probe(), released in remove(), for instance via the
> > > register()/unregister() pair) so the counting can be hidden within the
> > > subsystems that control them.
> >
> > Yes, there is nothing preventing you from diverting from the idiomatic
> > way of doing things. But my point is that that's not a good idea.
> 
> "Idiomatic" is a just buzz-word.

No, it has a meaning.

> I don't know why you insist on it
> being the only "correct" way. People have been doing all kinds of
> driver data management for a long time.

Yes, subsystems do things differently, and unfortunately also gets
things wrong occasionally.

By separating allocation, registration, deregistration and put you can
avoid some of the mistakes that can result from combining these
operations.

> You recently looked at my
> series for nvmem - did you see that nvmem_register() only takes a
> config struct (which may be a stack variable in probe() for all it
> cares) and copies all the data it needs into refcounted struct
> nvmem_device that the subsystem allocates and manages?
> An nvmem provider driver only has to do
> nvmem_register()/nvmem_unregister() and, while it can access the
> internal struct device, it never has to in practice.

nit: It looks like drivers can't access the internal struct device
currently.
 
> There's no:
>   nvmem_alloc()
>   nvmem_register()
>   nvmem_unregister()
>   nvmem_put()
> 
> I don't see why we wouldn't do the same in i2c:
> 
>   struct i2c_adapter_config cfg = { ... /* dev id, driver data,
> whatever... */ };
>   adap = i2c_adapter_register(&cfg);
>   i2c_adapter_unregister(adap);

Because it's unnecessary, would amount to a lot of churn, and has no
clear benefits. We already have an adapter object, it just needs to
refcounted.

Johan

