Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3CD606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UZRrPeah;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9O0i2Ee
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jfcE8CDgamiFwy3XoIjlQTqfdF2WZ6cuol7wMJuYXpM=; b=UZRrPeahgY8dUy
	Fqh3ZsJPP6rNQ4JNtYRYk5zZWX2i209MSwD7H17ghNBh7KC75RHT6/zbD7+8p9pKnUSmgurSrelZd
	mALUaeQ5rlwmw4yMGc0GzCcrWTU8bFD078Q5K/hqOvAGj/InelK0GwqThpyLpXDmoz3otcyN9amnQ
	Fz0VhrJPL9l5AcYBalsm3p5WWlrMfLmZu466Mtseb7OU69hGM4N2J9Vp8ol7gZV020yKrHpHB/Tfi
	7ZSVfI0WOS3+Kw46QPmWqTs3ugqaRSrLfyra+LtP6ztyG8ley/C8Id5jsk1BeFvlGPBKI0bPxKTYs
	ZpCqT3x08mDmFCy1SC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdqk-00000005yeY-4Ad7;
	Wed, 04 Nov 2026 16:28:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOdqj-00000005ye8-3F3P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 16:28:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10EB960609
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 16:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFE51F00A15
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793809712;
	bh=jfcE8CDgamiFwy3XoIjlQTqfdF2WZ6cuol7wMJuYXpM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F9O0i2EeWYZLTUSNVhDoVubwkYnIPdxTEoHdsDPcx0xY73NGBvFXs31HuRiKVWhGy
	 y6E6Wyxj9/CEzJ81ljQ1Bh6dN842w3JNw6AZSJP5a1iLtWGYYjH3FFQKdcYJDbyREq
	 bVsqpMuW36ThESY87i37MEnaKCjL5dntBC8wb0VFCR8PB8L3btShPHrGAeYKvyr7UH
	 jOTzQm+L1r6zMx2W+wEzp7L6eAcNh1d8Aja8rxdqTjC5HimkR2YFQPHDKzPdXGRQ32
	 cbJvE26q0tougGzlZhAiUc+aHjzTtujE0PI+jla7Ome/rt7HlzeCEUl5heSrwaE1y/
	 s4lagM4q0dn1Q==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be47aa555cso758522e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 08:28:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxfPx+PJDRllEYVTxQLAxAph3iF2VYioOPf5rnGxIadsvolTm9vuMoEk5xm9KhMiB/HKy0K6MwIm9x+5XBiGtue@lists.infradead.org
X-Gm-Message-State: APuU4Z/IrUKU5p6ay4W9cH+WGLKPFtC2yPb1pEYt0Yp8b9wIZE3duPif
	sO5ZjF7UCnJ5/BEO34cjl5QHj01g6f8fD+v1l0kNwUwx9tOT3buthz/Y3Yzn0/bzYPAxxglum6L
	8sW5Gm1v4wBaf3I7TVRV+/M1FI6XFuFI=
X-Received: by 2002:a05:6512:130c:b0:5bf:e7d5:c22e with SMTP id
 2adb3069b0e04-5bfe7d5c338mr3508206e87.65.1793809711135; Wed, 04 Nov 2026
 08:28:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261003095924.1370238-1-thierry.reding@kernel.org>
 <20261003095924.1370238-4-thierry.reding@kernel.org> <928b3eaf-32da-43a9-9ca5-d59ef8a3b330@app.fastmail.com>
 <auslF5pwDHtcNoCy@orome> <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
In-Reply-To: <autADOKsSVVMn6r9@orome>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 4 Nov 2026 17:28:18 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
X-Gm-Features: AclHuK9jbg6mFv5SXKdFu2bSKH-sKGt4sGStSGUbedXh5N3Tvf8yZIcMh90hjQg
Message-ID: <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
To: Thierry Reding <thierry.reding@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: arm <arm@kernel.org>, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Hans de Goede <hansg@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <westeri@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thierry, Arnd,

On Wed, Nov 4, 2026 at 3:41=E2=80=AFPM Thierry Reding <thierry.reding@kerne=
l.org> wrote:
>
> On Wed, Nov 04, 2026 at 03:11:09PM +0100, Arnd Bergmann wrote:
> > On Wed, Nov 4, 2026, at 13:42, Thierry Reding wrote:
> > > On Tue, Oct 13, 2026 at 07:22:23PM +0200, Arnd Bergmann wrote:
> > >> On Sat, Oct 3, 2026, at 11:59, Thierry Reding wrote:
> > >>
> > >> Where is the ACPI binding documentation for this driver, and who is
> > >> responsible for reviewing it?
> > >
> > > Hi Arnd, Rafael, Len,
> > >
> > > Sorry for the late reply, this fell through the cracks.
> > >
> > > Admittedly there's not much of a formal process here at all. Anything
> > > I've received up to now seemed to be fairly straightforward support
> > > extensions like this where the ACPI tables basically provide the same
> > > information as the DT via standard resources like register ranges.
> > >
> > > I suppose for anything beyond this, we'll want better documentation a=
nd
> > > broader review.
> > >
> > > Is there anything in particular that you're looking for? Should I gui=
de
> > > people internally to always Cc linux-acpi for anything that concerns
> > > ACPI?
> >
> > I don't know, I'm also still learning about how this is done, I
> > was hoping that there was already an established way.
>
> Yeah, me too. Maybe Rafael and Len can provide some guidance here.

I cannot speak for Len, and he has not been actively involved in the
maintenance of ACPI support in the kernel for several years.

As far as I'm concerned, the code maintained by me is mostly located
in drivers/acpi/ (as per the relevant MAINTAINERS entries) and it is
mostly generic code related to ACPI support.  I generally don't
maintain device drivers using ACPI support except for the ones under
drivers/acpi/ which mostly bind to devices representing interfaces
defined in the ACPI specification (which is kind of a special case).

But there is more.  There is ACPI support code in other places (like
for instance gpiolib-acpi maintained by Andy and Mika, or platform-x86
drivers maintained by Ilpo) and there are experienced kernel
developers in the ARM ecosystem with quite a bit of ACPI-related
knowledge (Hans, Jonathan, Sudeep, Lorenzo - all CCed) who can be
reached out to for guidance (and arguably they have more experience
with ARM platforms than I do).

> I don't know how ACPI on more traditional platforms works, but I imagine
> that it's a lot of the same anyway, except perhaps that people have more
> experience with the spec and today might be doing a good job already.

If you have any specific questions, I think I should be able to answer
at least some of them, but I'm afraid I cannot give you general
guidance on how to do ACPI support in device drivers that would be
universally useful.  Different drivers have different needs.

There are things in ACPI that are not present in DT and vice versa.
It also depends on what bus types we're talking about (platform vs PCI
vs USB etc).

> > Having a review done by the ACPI maintainers would definitely

So as per the above, who exactly do you mean by "ACPI maintainers"?
If you mean "the people maintaining the code in drivers/acpi/", that's
just me and quite frankly, I'm not sure if my review, specifically,
would be super-useful for driver development (the fact that my review
bandwidth is almost completely saturated nowadays aside).

My recommendation would be to ask other people within the ARM
ecosystem who have more experience with ACPI for help.

> > help from my point of view, but I'm not sure whether they are
> > set up for that, in case there are a lot of new drivers.

I am not and had I been trying to do it, it wouldn't have scaled anyway.

> I think platform maintainers need to be a first line of defense here
> since they sit at the intersection of a lot of this. At least that's the
> case for me. Also, I'm eager to learn how to do this right, but I'm
> often at a loss of where to start. The spec is a bit daunting, and then
> there's various extensions, too. Maybe the AI genies can help me ramp
> up.

My advice would be to reach out to people within your ecosystem in the
first place.

> > I assume there is a knowledge gap in both subsystem maintainers
> > regarding ACPI (certainly this is the case for me for drivers/bus,
> > drivers/firmware, drivers/soc, etc) and ACPI maintainers regarding
> > many of the subsystems that we support with DT.
>
> Agreed. I've seen some patches where the ACPI support was as simple as
> just adding an ID table entry and the rest was all standard, but I think
> once we move beyond standard resources things might get a bit more
> complicated. I imagine that ACPI may not even have specs for certain
> aspects that we currently handle in DT...

That certainly is true, but the ACPI specification is under active
development and pieces that are missing can be added to it.  There is
a process for that in place and ARM people take part in it.

