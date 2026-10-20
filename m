Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6559B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e4kSxolI;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B35nCj9l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6Xn0GgbQ2LS6M/ihkwGknyXfBAZO+tMr2iX2I+xIjg=; b=e4kSxolIx770qN+n1m5pqpx2Sx
	KeESiI4xLYSoLnRix5R5tFc9aFIuBeXsDaK1WE3X7vHbmXR1uibZJXBEsIFhkX5lDXIPcPZA6v4rG
	g7eGR9N3/cMjw4yoruCpF3zhLpINWlilQFsLPV+HzpaJM7puQgRLujF9Js/l8aYiS9vR0SbSdmm+T
	9RpLvy+N3Oe8MucJFqus8mg6uX4qGWYRF1VKMb8bznZXD/lVfCykaeA90LH6TtLQDz7KsVBZPG1uo
	boCkYUkk5dH40dkjJ30tIetpkBjHzBOrCc7MRNa8gjR8PrJQDQI3Wt/J1J0NnlceSAss7tdYVINwS
	LMxGDB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCIK-0000000A7NZ-1UN3;
	Tue, 20 Oct 2026 16:02:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCIJ-0000000A7NC-0p6v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 16:02:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 599BF601F9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 16:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138D81F000C5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792512150;
	bh=T6Xn0GgbQ2LS6M/ihkwGknyXfBAZO+tMr2iX2I+xIjg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=B35nCj9lE+IOu8xrALDd8eweWBXCcKKwqmyCx8EimqQ7PHcYixv9qw8rEpb0fxnf3
	 7wky9Yuo6ZzRAeUKjN053cTjSTN1zpxT+gISDZi9KZ+t1ROwq+fo0JXgjBARoWlqC3
	 xvYY5oEAfsijTiG7mnuZwnRpmazM7zz7AaonU3q8BafJoQAt9/bAMV6sGHFGjDncsc
	 HP+mg/8zO7HUoLmKL7j1q5h+5a02ylEt9BJpUbfZSVD3jjXPouWlD63b3Q6eL62Qf4
	 Urm3bTbJgFBmHOdyfvMxTiIgugJTwikLD8fty0Dp9CIQxFJcQSLGyoeNdpPf3U5KgE
	 XmXAFzGbolRBg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso2883675e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 09:02:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxo02IwpcuD7rHxG2RtnDynGSNZpUYTPhTWWIjYWJrscNeAWtZcpytYvAOTJR8T+vuo6AeBECBiko7Am+uDiX77@lists.infradead.org
X-Gm-Message-State: AFq9FYL9K3dvzGGxa9zs5QK/KqnnnQ4w6Y1sUWLcMkALSzNHSsu+oXub
	xypPvz/rEGXirhNhgnRkNlOlUwMzqxVYYqX29CcZENWUZe8Fp36tP/j3g8ZqOdrzaTpgLPdfhe1
	IRYQTmny0lqpCkAKA49NP4L4GehaHXyg=
X-Received: by 2002:a05:6512:3d8c:b0:5bc:d9d6:6a98 with SMTP id
 2adb3069b0e04-5be50a471cbmr3402594e87.10.1792512142493; Tue, 20 Oct 2026
 09:02:22 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260925-acpi-static-table-irq-probe-defer-v1-2-2c62125d0085@kernel.org>
 <arZDwutoadki7tiZ@ashevche-desk.local> <arZNL9BnTGK0Klwc@red-moon>
 <arZS4vwxps01dGb7@ashevche-desk.local> <arqSqcoWAkhy-8do@red-moon>
 <d1720b63-65bf-4019-bc19-1852555f7993@arm.com> <asieTvinZ7c2QpQm@red-moon>
 <CAJZ5v0hVLSJs1j8J1TV3yJ8Psyaf=B_0UfHsYSMtM5xTup0B_Q@mail.gmail.com>
 <atXyIadz1TEKSodg@red-moon> <CAJZ5v0joJBZg==DWPsNviPfL7Jo=qupRhb6GinqOLoHXGnvevg@mail.gmail.com>
 <ateI-JcExDyfXKrs@red-moon>
In-Reply-To: <ateI-JcExDyfXKrs@red-moon>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 20 Oct 2026 18:00:04 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0h+S3z3YqpJYCwcZXpPNEawedSof1z4+ydWn=tZbL8L6g@mail.gmail.com>
X-Gm-Features: AclHuK8HDf2yPjcd4rawrCfnLbX27pb5S5MNqmvyCllH3hG9fIPbIUdmHBI-lNo
Message-ID: <CAJZ5v0h+S3z3YqpJYCwcZXpPNEawedSof1z4+ydWn=tZbL8L6g@mail.gmail.com>
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	driver-core@lists.linux.dev, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 5:30=E2=80=AFPM Lorenzo Pieralisi <lpieralisi@kerne=
l.org> wrote:
>
> On Mon, Oct 19, 2026 at 08:05:50PM +0200, Rafael J. Wysocki (Intel) wrote=
:
> > On Mon, Oct 19, 2026 at 12:34=E2=80=AFPM Lorenzo Pieralisi
> > <lpieralisi@kernel.org> wrote:
>
> [...]
>
> > Basically, yes, the idea is to defer the creation of the platform
> > device until the dependency is met.
> >
> > > till the dependencies are cleared but then, without a _CRS, where wil=
l
> > > the consumer driver find the platform device resources ?
> >
> > Well, good question.
> >
> > > There are multiple facets in this issue and possibly some of them hav=
e
> > > been already solved but I need to pull them together.
> > >
> > > > Note that the dependencies can be added to acpi_dep_list after
> > > > creating a struct acpi_device with acpi_add_single_object() and
> > > > acpi_scan_add_dep() is not really suitable for that, but it should =
be
> > > > doable if the dependencies can be found.
> > > >
> > > > > I need to have a deeper look into this next week but I wanted to =
ask first
> > > > > whether there was something I missed - most likely.
> > > >
> > > > Well, it is not really straightforward.
> > >
> > > Yes it is getting messy. This RFC, with all its flaws, does not trans=
parently
> > > prevents enumeration but rather relies on -EPROBE_DEFER to sort out
> > > dependencies - though it does so by adding more stuff into ACPI stati=
c fwnode
> > > that to be honest I'd rather see gone.
> >
> > I think what you need is a notification mechanism that will trigger
> > when a specific device (enumerated via the ACPI Namespace) becomes
> > operational.  It doesn't look like any of the existing ones (platform
> > device probe deferral or ACPI device dependencies tracking) is really
> > suitable for your use case.
>
> Yes. It might just be a notification from ACPI core to say "the driver fo=
r
> this ACPI device probed, go create platform devices that depends on it".

The ACPI core doesn't know about driver probing, so this notification
would need to come from the driver of that specific device.

In the regular _DEP dependencies case, the drivers that provide
dependencies generally need to call acpi_dev_clear_dependencies()
which triggers a dependency list walk.

I guess driver_bound() could do something like that in principle (it
does a similar thing already for deferred probing), but I'm not sure
how generic it needs to be for this particular use case.

