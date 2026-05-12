Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A83CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+cRw/w8Tw2VtVhO7fjoQQLrVp/OXSiMwNSTHnDhBCw=; b=Sq5hEh794/v6BSe8iKa1bRKxRa
	piKYBf73CFXYHp+2weZj+C7fsnKtgLuN0g0Bbl9HVWxjbuvARoT0VKFEXFbDKs174gBFFvUZTiktq
	O9wm1lyqJU6/xWxB5pLOqvSiExYtYD6tfImOufV0YsmMLd6TG8iPsk85/gSRmchjA3tovgVhBW5b4
	LxD1VZ8G14Ih/Ff/F726Kpj7qvecxIpeZRrqfvIdPPkfwZ2td+rRwjDCtutSgmDKahMeHTNX6DFic
	XB0ESvsCLg1qMN0vI8/RR2apu/WbWpm6VC4r8N1n12VJgo40vOfLXwMwvSOaf63OIaxCyD/oRP1f5
	5WCQW0FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpRm-0000000HHQS-2fLE;
	Tue, 12 May 2026 15:55:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpRl-0000000HHPj-2YXW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 15:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T+cRw/w8Tw2VtVhO7fjoQQLrVp/OXSiMwNSTHnDhBCw=; b=dFGdkXTvM0znnzuurT3l8L1dFs
	qQK1ME0q7dKz1F/cgU9yG1sT9LowWpXHi2aK3LJ6WZWnQr5HeIIyJghBdlxh9ryrg8N/EMdW8NoBb
	Gjgr+PAG20WX3CV31JQBSWUUU5iTJtyqcAj9m4FQFgCLHz0uMuqJIV5OkKxSfHsxT8IgLq2V5ygzq
	/Klv0z6I+a9Y3vXkEVrtvr6UuasZ3aFRlH5wXo3x5WPkxh2CCadBRzZLvx8PvssOenzshCu9QzZML
	E2UOAcx+7pEslvBm/F4gPBfu4ZfH2QOAfLfc0ggkOw5nAvgRZnI2+OZc6EUk1KsnHFBwVb2LYc+wS
	LVoiUKPg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpRi-0000000FDzO-10jB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC87E419D1;
	Tue, 12 May 2026 15:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB472C2BCC7;
	Tue, 12 May 2026 15:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778601293;
	bh=x96C7kQutkpEZcWiUIFWIivDdMrS5yAQtQyf7GWWB70=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mWnObZ5ueRQ8TBR7X3/Qbh3RbLcNntE9kfz4JIelJJIZzfz6H+3kEsUFfvYemSfvz
	 Z3oBIpQecJzCt4OxWEthqCNIm50zojS9KMhtzzDEQRlwP9rNU5aLmYWmSVT/CgDwgh
	 jbFu9BdGrO+oAGC7YMHooJMWqvX3Y21c5oYhHUIQKdHT9VMHJW1YtUSKBx+KIplCL3
	 VtzJaqQRmpjfgxFf+QFUb2NoOgulQ/I+7hWbCjrQkVmk9TFczoy93c0pQ6ySx7HOlh
	 4WUOZAzK/4FzJHtxL7dObM6YHsNls0Jhe6dCB3V4lwxKyNw2iSlwVSdWwyMRu/ZGLx
	 cxS66hxSL5pjQ==
Date: Tue, 12 May 2026 16:54:44 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Cc: Salih Erim <salih.erim@amd.com>, "Conall O'Griofa"
 <conall.ogriofa@amd.com>, Michal Simek <michal.simek@amd.com>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] iio: adc: xilinx-ams: fix out-of-bounds channel
 lookup in event handling
Message-ID: <20260512165444.4ae39d90@jic23-huawei>
In-Reply-To: <CAJgF-xum3OQ36keRW5gCnTTbnUhsHZUzL41xKn0hjJ3GqgyOZg@mail.gmail.com>
References: <20260414224245.8493-1-guilherme.bozi@usp.br>
	<20260414224245.8493-2-guilherme.bozi@usp.br>
	<46bcd2ce-bfb4-4fc3-b840-dba657f39a7f@amd.com>
	<CAJgF-xum3OQ36keRW5gCnTTbnUhsHZUzL41xKn0hjJ3GqgyOZg@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_165458_930849_F84B2B36 
X-CRM114-Status: GOOD (  23.35  )
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

On Tue, 12 May 2026 12:40:05 -0300
Guilherme Ivo Bozi <guilherme.bozi@usp.br> wrote:

> Hi Salih,
>=20
> Replies are inline.
>=20
> On Tue, May 12, 2026 at 11:22=E2=80=AFAM Salih Erim <salih.erim@amd.com> =
wrote:
> >
> > Hi Guilherme,
> >
> > Replies are inline.
> >
> > On 4/14/2026 11:40 PM, Guilherme Ivo Bozi wrote: =20
> > > ams_event_to_channel() may return a pointer past the end of
> > > dev->channels when no matching scan_index is found. This can lead
> > > to invalid memory access in ams_handle_event().
> > >
> > > Add a bounds check in ams_event_to_channel() and return NULL when
> > > no channel is found. Also guard the caller to safely handle this
> > > case.
> > >
> > > Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
> > > Signed-off-by: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
> > > ---
> > >   drivers/iio/adc/xilinx-ams.c | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-am=
s.c
> > > index 124470c92529..6191cd1b29a5 100644
> > > --- a/drivers/iio/adc/xilinx-ams.c
> > > +++ b/drivers/iio/adc/xilinx-ams.c
> > > @@ -871,6 +871,9 @@ static const struct iio_chan_spec *ams_event_to_c=
hannel(struct iio_dev *dev,
> > >                  if (dev->channels[i].scan_index =3D=3D scan_index)
> > >                          break;
> > >
> > > +       if (i =3D=3D dev->num_channels)
> > > +               return NULL;
> > > + =20
> > The added lines use spaces for indentation instead of tabs. =20
> I checked both locally and the raw mbox from lore.kernel.org, and the
> indentation uses TAB characters consistently (^I in the diff).
>=20
> To verify, I inspected the relevant hunk using cat -A:
>=20
> ^I^Iif (dev->channels[i].scan_index =3D=3D scan_index)
> ^I^I^Ibreak;
>=20
> +^Iif (i =3D=3D dev->num_channels)
> +^I^Ireturn NULL;
>=20
> ^Ireturn &dev->channels[i];
>=20
> I could not observe any indentation issues locally or from the raw mbox.
FWIW they look good to me as well. Salih, I'd guess you have a local issue.
b4 (on git.kernel.org) is really handy for ensuring none of those occur!

Jonathan

>=20
> >
> > Salih
> > =20
>=20
> --
> Guilherme Ivo


