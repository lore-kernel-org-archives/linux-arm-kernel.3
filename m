Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0C7CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpi76AE+F7Qa4uP9OqH5xZKI+wHeZRK1y+C6LV6S5c0=; b=4D+ElJAJqSxnS0Vy49x9ufsBtf
	KgptLwyQb4W0qMpJ+r6pVmqLut6gCE+IGFh09uajnlpZCeLgIM8KOBs5YKigCxVUc0bVRENXFWWCf
	kFPOXBAm1AA3IJNZ7l+v813XgjwkSZSFXvD/A3D3tWrfYxGq/J/FcC1lRDXiS7ReDoZBiI6/Gz7M/
	9T87NohyCIMnr+uU4wqgXDnRTU7DsYSHZXrZ0NVVYn7f8ht+8Pu/mOv8eYHpI5Autel7Bp4Wr8Dwq
	PjqxyhOVgpgcIrRSFDyjyx5ALP2gAJdW73Qshi2iy/RCy2ODRc87LgbXWiumQKBb7XKExERbZz+Qf
	w+kcTQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBFv-0000000GvUJ-0HUF;
	Thu, 18 Sep 2025 09:48:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBFs-0000000GvTe-3aU7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FFEC6013E;
	Thu, 18 Sep 2025 09:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7188FC4CEF1;
	Thu, 18 Sep 2025 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758188923;
	bh=G6UtyHUyxSaifPv2pVQU3+E+zPh48AFOKmgPtR63JuY=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=J2b4bvnyCB1hOIq0nXuoaz4YXQ76vylR0qq8+ZZntww0EUcIRhx687K2XAdbMdTgr
	 QeQtnxymNSkiun/Q3spIYBSNKEEmPm3qEy7jDuPQl7TjlGRtYqhK1X1Pvh7XjEe4pk
	 E4xuBBs1RM/nBv1+c/vATpxZLzI55HDRO0oU0Z614tpBnWE3UDD1y1tx6GbbZmPqU6
	 rmS00uFVndoqfgzG/GQZp1FNaaQjWCLdEaZpHhJoXmisC3ZerfslRUCjbJ4IVzB9Bc
	 1jDxXIMKO40472hwo+RlGhlcqMY4LdO1830bAhfKVSGmCc4CfTIO7KVOfWeS0/JrJc
	 KXWyjQ7VvXVGg==
Content-Type: multipart/signed;
 boundary=1fecadb09047536cf39b2c2fe88ea2cebdc9c9ca55c9ebcbd19b674ed89b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 18 Sep 2025 11:48:34 +0200
Message-Id: <DCVTYCVUCXWH.LAMARC8K4UNU@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Kevin Hilman" <khilman@kernel.org>, "Frank Binns"
 <frank.binns@imgtec.com>, "Matt Coster" <matt.coster@imgtec.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>,
 "Santosh Shilimkar" <ssantosh@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
Cc: "Andrew Davis" <afd@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org> <7hv7lhp0e8.fsf@baylibre.com>
In-Reply-To: <7hv7lhp0e8.fsf@baylibre.com>
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

--1fecadb09047536cf39b2c2fe88ea2cebdc9c9ca55c9ebcbd19b674ed89b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Sep 17, 2025 at 5:24 PM CEST, Kevin Hilman wrote:
> Michael Walle <mwalle@kernel.org> writes:
>
> > The TISCI firmware will return 0 if the clock or consumer is not
> > enabled although there is a stored value in the firmware. IOW a call to
> > set rate will work but at get rate will always return 0 if the clock is
> > disabled.
> > The clk framework will try to cache the clock rate when it's requested
> > by a consumer. If the clock or consumer is not enabled at that point,
> > the cached value is 0, which is wrong.
>
> Hmm, it also seems wrong to me that the clock framework would cache a
> clock rate when it's disabled.  On platforms with clocks that may have
> shared management (eg. TISCI or other platforms using SCMI) it's
> entirely possible that when Linux has disabled a clock, some other
> entity may have changed it.
>
> Could another solution here be to have the clk framework only cache when
> clocks are enabled?

It's not just the clock which has to be enabled, but also it's
consumer. I.e. for this case, the GPU has to be enabled, until that
is the case the get_rate always returns 0. The clk framework already
has support for the runtime power management of the clock itself,
see for example clk_recalc().

> > Thus, disable the cache altogether.
> >
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> > I guess to make it work correctly with the caching of the linux
> > subsystem a new flag to query the real clock rate is needed. That
> > way, one could also query the default value without having to turn
> > the clock and consumer on first. That can be retrofitted later and
> > the driver could query the firmware capabilities.
> >
> > Regarding a Fixes: tag. I didn't include one because it might have a
> > slight performance impact because the firmware has to be queried
> > every time now and it doesn't have been a problem for now. OTOH I've
> > enabled tracing during boot and there were just a handful
> > clock_{get/set}_rate() calls.
>
> The performance hit is not just about boot time, it's for *every*
> [get|set]_rate call.  Since TISCI is relatively slow (involves RPC,
> mailbox, etc. to remote core), this may have a performance impact
> elsewhere too.

Yes of course. I have just looked what happened during boot and
(short) after the boot. I haven't had any real application running,
though, so that's not representative.

> That being said, I'm hoping it's unlikely that
> [get|set]_rate calls are in the fast path.
>
> All of that being said, I think the impacts of this patch are pretty
> minimal, so I don't have any real objections.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Thanks!

-michael

--1fecadb09047536cf39b2c2fe88ea2cebdc9c9ca55c9ebcbd19b674ed89b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaMvVcxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ieAwF+NhC0QChHEdPzBo2eq6c4gPSFFsfbpOZw
yyhFNhdMeM/qzGsGyod+WUxyFBlyK3JRAYDoKCAopPEvlQH6lpl7sfIGHzNEl+Ii
sNWwWzCJKZdbLMn4731FC8c/X9xYrCfTL8U=
=CEaS
-----END PGP SIGNATURE-----

--1fecadb09047536cf39b2c2fe88ea2cebdc9c9ca55c9ebcbd19b674ed89b--

