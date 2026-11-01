Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADED606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 21:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tYbrNBYZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YywL5wq7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=og55u5n1Gdmul4ausS8JyuamV2xgkOuH347fjM0yp7w=; b=tYbrNBYZOhham3
	C8JcEbKvqmllZSXV0UUoTYi1xymf3iownKulKMhwS8l553xI9QXEAGSZPgDhj75rnM0kKLWu6MQ4+
	9Wwu2IbbNvq69bziPae83ipMT0yO7uEiZ4nfi3UT+1K23V2QYsS2tHCJvFFO0o/8ImkburaY9PVZB
	ZXVbzFHm6T0Pcf1/J0IvjhXLsKoTyn9IEMBd8I6cuWrEW+7FSV3/HWUJjNa+1Xe6a3/v04mkvtWR5
	Pem3OVdfoM3fB0vn2QaYzT4hjfMYqrQ4fqh9eMfMXVoUuZkwexp6bJQ/nI5ta8bEigRTUTElmwnFq
	cvaNywVDRIKIKYywknDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcxz-0000000EuWg-0ZG3;
	Sun, 01 Nov 2026 21:19:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcxx-0000000EuWM-1xto
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 21:19:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C2B4443F9F
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Nov 2026 21:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1561F00A20
	for <linux-arm-kernel@lists.infradead.org>; Sun,  1 Nov 2026 21:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793567988;
	bh=og55u5n1Gdmul4ausS8JyuamV2xgkOuH347fjM0yp7w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YywL5wq7YoRgBo0wqKFw5cxBW9i7ZWpgqdFhBBeh3ttths0AddZtuwFw6zHS2KNmj
	 r+8qOvUt8UqhKgoX7TijG9rSW8jKSMsSqhAINGtRy48wgj9aeZvV2tXiX9OEAGamoB
	 8+ibqcGfJvRzuS2FW8yb/ezHbrJitsDSbVz6eYgdpr9OlmJU4otkylCuUwe9NFSYpX
	 gGxZqyWjNdi74GiWdGVtZyM46GzOAsaBvcMBUliBQx23ypdldJMdg6wSBwMZY/pyMF
	 OseIRvv8hKno+pMVugCipuaV/AVxP9mR+vvi/91lOsFj3DJNK/gNL72t/xIsqe098q
	 JxybrAyuDCG2Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso28295571fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 13:19:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz43SbMahAywmRUj0eKe+cHZqRHuZB+aChH4W/6Og4eD5Mam24Mk99AfutpmMhPjWOB8vy64GBQyu9UtRrI7jPD@lists.infradead.org
X-Gm-Message-State: APuU4Z8dNMuN5EkW/aNXOiyA2Q444Cl30jvju9eisAwOSkiNAUuCgAFy
	I/jV7wD9WeDoKJf+R+TST4oHhs6BBxLnrfv71hckGRoO6ig0qivllCBJBxYsOc1K41mqW8t7Jpq
	yJZqSm7GxxjubT7PE24xlzAzGD3kc0kY=
X-Received: by 2002:a05:651c:1b8c:b0:3a9:d111:6520 with SMTP id
 38308e7fff4ca-3aca55f2846mr26417331fa.0.1793567987240; Sun, 01 Nov 2026
 13:19:47 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-5-daf5d177e113@kernel.org> <90c5efa22600044657e67b9e1297bda2fb53f60c.camel@pengutronix.de>
In-Reply-To: <90c5efa22600044657e67b9e1297bda2fb53f60c.camel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 1 Nov 2026 22:19:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL==hUSGDryCDuoQrfh=s+ZnRojVcuhneMGWFvkSNePbMw@mail.gmail.com>
X-Gm-Features: AclHuK9qYHSbdW0qFPKPlvZIS7KY8pzu0qIZa_AZ9GRrGb6SLD_bdgD5vQv0EP0
Message-ID: <CAD++jL==hUSGDryCDuoQrfh=s+ZnRojVcuhneMGWFvkSNePbMw@mail.gmail.com>
Subject: Re: [PATCH RFC 5/5] reset: Add BCMBCA block resets through the PMB
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, mfd@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Philipp,

addressing comments before reposting the patches.

On Wed, Oct 14, 2026 at 1:14=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:

> > +struct bcmbca_pmb_reset_group {
> > +     const char *name;
> > +     int (*reset)(struct bcmbca_pmb_reset *rst,
> > +                  const struct bcmbca_pmb_reset_group *group);
>
> What is the point of this indirection?
>
> There is only a single array of struct bcmbca_pmb_reset_group and all
> entries use the same bcmbca_pmb_reset_sequence().

No... one of them use bcm6846_xrdp_reset() instead?

> > +static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
> > +                                  const struct bcmbca_pmb_reset_group =
*group);
> > +
> > +static const struct bcmbca_pmb_reset_block bcm6846_xrdp_resets[] =3D {
> > +     /* Keep the XRDP bus interfaces out of reset. */
>
> What does this comment refer to? assert_value being GENMASK(2, 0)
> instead of 0?

Indeed. I fixed up the comment so it's clear what is going on.



> > +     {
> > +             .bus =3D 1,
> > +             .device =3D 12,
> > +             .offset =3D 5,
> > +             .mask =3D GENMASK(27, 0),
> > +             .assert_value =3D GENMASK(2, 0),
> > +             .deassert_value =3D GENMASK(27, 0),
>
> Are the four different devices the packet engine and the tree runner
> cores mentioned in the dt-bindings patch?

Yes.

> Do the 28 bits refer to 28 different resets?

The only driver I have writes 0x0fffffff to all four registers
to release the resets, and this being Broadcom that means
that is also the only documentation.(I don't work for them,
my mission here is to have a working platform.) I could of course
experiment with different values but that turns out to
be more of a hardware safari, I made it like this because
I don't want to fix something that's not broken.

> > +/* Bits 6 and 7 select the lane configuration and must remain unchange=
d. */
> > +static const struct bcmbca_pmb_reset_block bcm6846_pcie_resets[] =3D {
> > +     {
> > +             .bus =3D 0,
> > +             .device =3D 18,
> > +             .offset =3D 5,
> > +             .mask =3D GENMASK(5, 0),
> > +             .assert_value =3D GENMASK(5, 0),
>
> Same here, are these 6 different resets? Does the hardware require them
> to be asserted/deasserted at the same time?

Same here, this is what the Broadcom driver does. If you insist,
we can do hardware safari, but there are no docs or other examples.

When I look closer at the PCIe support it has some more weird
sequencing going on, so I'll drop PCIe support from the patch
series for now.

> > +     },
> > +     {
> > +             .bus =3D 0,
> > +             .device =3D 19,
> > +             .offset =3D 5,
> > +             .mask =3D GENMASK(5, 0),
> > +             .assert_value =3D GENMASK(5, 0),
> > +     },
> > +};
>
> Why put these in an array?

Right there is just two of them. Individual taste I assume,
I dropped these anyway.

> > +/* Best effort with both locks held; never restart a partially reset g=
roup. */
> > +static void bcmbca_pmb_reset_cleanup(struct bcmbca_pmb_reset *rst,
> > +                                  const struct bcmbca_pmb_reset_group =
*group)
> > +{
> > +     const struct bcmbca_pmb_reset_block *block;
> > +     unsigned int i;
> > +     u32 value;
> > +     int ret;
> > +
> > +     for (i =3D 0; i < group->num_blocks; i++) {
> > +             block =3D &group->blocks[i];
> > +             ret =3D bcmbca_pmb_read(rst->pmb, block->bus, block->devi=
ce,
> > +                                   block->offset, &value);
> > +             if (!ret) {
> > +                     value &=3D ~block->mask;
> > +                     value |=3D block->assert_value;
> > +                     ret =3D bcmbca_pmb_write(rst->pmb, block->bus, bl=
ock->device,
> > +                                            block->offset, value);
> > +             }
>
> Could the PMB bus driver provide an _update_bits() function for these
> read-modify-write sequences? It is the one handling the locking anyway.
>
> This whole driver feels a bit like if PMB could just export a regmap,
> it would collapse into a few regmap_multi_reg_write()s.

You're damn right about that.

I will rinse and repeat.

>
> > +             if (ret)
> > +                     dev_err(rst->rcdev.dev,
> > +                             "failed to hold PMB bus %u device %u in r=
eset: %d\n",
> > +                             block->bus, block->device, ret);
> > +     }
> > +}
> > +
> > +/* Called with both PMB locks held, including during error cleanup. */
>
> Which two locks are "both"? pmb->lock mutex and the PMB_MUTEX hardware
> lock?

Fixed with regmap abstraction!

> > +static int bcmbca_pmb_reset_sequence(struct bcmbca_pmb_reset *rst,
> > +                                  const struct bcmbca_pmb_reset_group =
*group)
> > +{
> > +     const struct bcmbca_pmb_reset_block *block;
> > +     unsigned int i;
> > +     u32 value;
> > +     int ret, pass;
> > +
> > +     if (!group->num_blocks)
> > +             return -EINVAL;
> > +
> > +     /* Assert every block before releasing any of them. */
> > +     for (pass =3D 0; pass < 2; pass++) {
>
> Maybe   for (pass =3D PASS_ASSERT; pass <=3D PASS_DEASSERT

OK I'll take a stab and see how it looks.

> > +             for (i =3D 0; i < group->num_blocks; i++) {
> > +                     block =3D &group->blocks[i];
> > +                     ret =3D bcmbca_pmb_read(rst->pmb, block->bus, blo=
ck->device,
> > +                                           block->offset, &value);
> > +                     if (ret)
> > +                             goto release;
> > +                     value &=3D ~block->mask;
> > +                     value |=3D pass ? block->deassert_value : block->=
assert_value;
> > +                     ret =3D bcmbca_pmb_write(rst->pmb, block->bus, bl=
ock->device,
> > +                                            block->offset, value);
> > +                     if (ret)
> > +                             goto release;
> > +             }
> > +             if (!pass && group->assert_us)
> > +                     usleep_range(group->assert_us, group->assert_us *=
 2);
>
> Is that assertion delay the time the reset needs to stay asserted or is
> this really a delay that needs to be observed between successive
> assertions in a group?

The former. I will rename the variable and add a comment so
this is clear.

> > +release:
> > +     if (ret) {
> > +             dev_err(rst->rcdev.dev, "%s %s failed at PMB bus %u devic=
e %u: %d\n",
> > +                     group->name, pass ? "release" : "assert",
>
> Please use "deassert" to avoid possible confusion with the
> reset_control_release() meaning of "release".

OK

Yours,
Linus Walleij

