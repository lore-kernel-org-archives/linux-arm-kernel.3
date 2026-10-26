Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68139606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wUd0aSo3;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eVOOvjOg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VP+SWOFadjsPgUdhl4fc+Bf9WWYdA81aKpsuWub6aN4=; b=wUd0aSo3aUZzHiHwGvqsNo/3Dv
	IBvGS94Q3WuBrsFEOTvfBMHLQCpX1iMXc5xBaIKCJT0Z7Mk7O0Jp6c93oBJMiARkNhi7PizhWVE9V
	ni1x4RGGwe+SEvHDyMegJTIt/zfK2CNJ0HwKcgeWb6XMjdLqgFp+GVr7wkqCcBAnCE9ngyEqX6C9T
	kwFev2r7prlDYxT/N/M6K3Os0hdxWlAQnHbNHD5vIkhQgJq2cuJmrHAuk3XFRXfck/JmBsIGIZ5uN
	Y4TT03/zVtc7g+JQ4jejQkmYlp5/HCzsxUycPcHE2EGYiB5FRxoUMh9DL9HJ2GylrzlgCX02vY/y8
	MwKY5tiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLP59-000000032MO-2lve;
	Mon, 26 Oct 2026 18:06:03 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLP54-000000032L4-0X02
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793037959; x=1824573959;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=/EXOvyLFl3MNKfQXtpK2SmkUPLhQq7Da43+mjsaKyVU=;
  b=eVOOvjOgbmJKC9Ogns/dBEqOS6AEcKAKQU8Zs9VhS2rX0wJpaVJaZwTP
   O9JKVVdJMzREMccvXkfckZ57M8IfsZ2V9ZAgwFGUc3HQYu/Lg9TeNy9t2
   CGt0ij067e+tyyXz0vh/0JV9QHd4EMRuu4OLgvoGAjFdhKyYxV3nayw6Z
   Nbt4tVA4CkxUoH15lVY2Xp0K8r0pK5egEf7vEJtBXXa5xZ09NzakoTS8r
   x7ILJdOEY4Vf2rOZeO9rAiRR+a+t0tjDH9k3CvmH51l5fbv7GFSD6npiT
   DtxGPJOhQHWz+03f9dSvtSPb1g11Nhm5EcH1a2fioHgy/23N7J2kl1UHb
   Q==;
X-CSE-ConnectionGUID: ASr3GSBqQhuiGgOVhW5Ppg==
X-CSE-MsgGUID: /UYrnekRRhqXpWLh6UYFcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1604790"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1604790"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:05:58 -0700
X-CSE-ConnectionGUID: Um+KQiXwSyKJr5UNKyI/HQ==
X-CSE-MsgGUID: mA5N0UOWRsq4zlA91tpg/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4439637"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:05:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Oct 2026 20:05:46 +0200 (EET)
To: James Hilliard <james.hilliard1@gmail.com>
cc: Raul Rangel <rrangel@chromium.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
    Tony Lindgren <tony@atomide.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Richard Genoud <richard.genoud@bootlin.com>, 
    Nicolas Ferre <nicolas.ferre@microchip.com>, 
    Alexandre Belloni <alexandre.belloni@bootlin.com>, 
    Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
    Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
    =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>, 
    Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Fabio Estevam <festevam@gmail.com>, 
    "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 0/5] serial: 8250: serialize DMA cancellation with
 buffer reuse
In-Reply-To: <CADvTj4okFSpw7Wo0e3DR4r4-1TDvOY1esoUDWftY27B7XwWAHA@mail.gmail.com>
Message-ID: <d4ed2b29-5717-7522-24d2-a13a5aa2baf2@linux.intel.com>
References: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com> <a011174b-d64c-305b-7dab-62017fc885fa@linux.intel.com> <CAHQZ30AfcwMTXPpCgiWkhz1OFoxHJOqcVmur8Buz72M45Acuag@mail.gmail.com>
 <CADvTj4okFSpw7Wo0e3DR4r4-1TDvOY1esoUDWftY27B7XwWAHA@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-629380202-1793035757=:1162"
Content-ID: <4cc64621-9a33-4cc3-8a63-38ad870a4ec1@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_110558_378152_FF93C8F3 
X-CRM114-Status: GOOD (  37.76  )
X-Spam-Score: -4.5 (----)
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-629380202-1793035757=:1162
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <65f07c57-a2fa-c2b7-465d-27f022b9966e@linux.intel.com>

On Mon, 26 Oct 2026, James Hilliard wrote:

> On Mon, Oct 26, 2026 at 10:24=E2=80=AFAM Raul Rangel <rrangel@chromium.or=
g> wrote:
> >
> > On Mon, Oct 26, 2026 at 5:16=E2=80=AFAM Ilpo J=C3=A4rvinen <ilpo.jarvin=
en@linux.intel.com> wrote:
> >>
> >> On Sat, 24 Oct 2026, James Hilliard wrote:
> >>
> >> > Reserve canceled transmit and receive storage until DMA and its comp=
letion
> >> > callbacks have retired. Serial-core write backpressure protects a fl=
ushed
> >> > TX FIFO while normal transfers continue to DMA directly from that FI=
FO.
> >> >
> >> > The series separates OMAP's locked completion processing and seriali=
zes
> >> > asynchronous write wakeups with the port lock before adding the seri=
al-core
> >> > reservation helpers and applying them to 8250 TX. Flushing
> >> > empties the logical queue immediately. While the old transfer owns i=
ts
> >> > storage, write_room() reports zero and write-ready notifications wai=
t for
> >> > retirement. Failed termination retains the reservation until normal
> >> > completion, without advancing the reset FIFO. DMA retirement release=
s the
> >> > reservation independently of port readiness. Serial core keeps write=
s and
> >> > wakeups gated during shutdown until successful startup or resume.
> >> >
> >> > RX delivers paused data before the PIO fallback and retires callback=
s in
> >> > process context. Track FIFO access separately from buffer retirement=
 so
> >> > PIO and the DesignWare empty-FIFO timeout handling can run once DMA =
has
> >> > released the FIFO. On failure, retain the requested interrupt enable=
s in
> >> > the existing IER shadow and mask receive interrupts in hardware unti=
l DMA
> >> > has stopped. Recovery then leaves RX on PIO until reopen. Shutdown e=
xcludes
> >> > new retirement work before releasing the channels.
> >> >
> >> > Based on tty-next with the posted shutdown guard [0], channel
> >> > configuration error handling [1], RX TTY accounting fix [2], RZ/N1
> >> > transfer-length fix [3], transmit-PM shutdown fix [4], serport
> >> > write-wakeup deferral [5], DesignWare BUSY-safe fractional-divisor
> >> > programming [6], and Intel MID RX DMA timeout locking [7]. The serpo=
rt fix
> >> > is needed before serializing the remaining write-wakeup callers with=
 the
> >> > port lock.
> >> >
> >> > [0] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-shutdo=
wn-v1-v1-1-3d3ce383c614@gmail.com
> >> > [1] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-config=
-errors-v1-v1-1-c067587d1ef2@gmail.com
> >> > [2] https://lore.kernel.org/r/20261021-submit-serial-8250-dma-rx-acc=
ounting-v1-v1-1-c11795914ab4@gmail.com
> >> > [3] https://lore.kernel.org/r/20261023-submit-serial-8250-dma-tx-len=
gth-v1-v2-1-c3106ef4d2df@gmail.com
> >> > [4] https://lore.kernel.org/r/20261022-submit-serial-8250-tx-pm-shut=
down-v1-v1-1-0e894afa3bb8@gmail.com
> >> > [5] https://lore.kernel.org/r/20261023-submit-serport-write-wakeup-v=
1-v1-1-74e7311638a2@gmail.com
> >> > [6] https://lore.kernel.org/r/20261024-submit-serial-8250-dw-divisor=
-v1-v2-1-032ca5338359@gmail.com
> >> > [7] https://lore.kernel.org/r/20261024-submit-serial-8250-mid-rx-loc=
k-v1-v1-1-2b9afdf869d7@gmail.com
> >> >
> >> > Assisted-by: Codex:gpt-6-astra
> >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >> > ---
> >> > Changes in v6:
> >>
> >> Hi,
> >
> >
> >>
> >>
> >>
> >> This series is moving way too fast with new versions. Please slow down=
=2E
> >
> >
> > +1. I think you should have spent more time refining your patch set bef=
ore submission, or sending individual patches that weren't interelated.
>=20
> I was doing as much validation as I could locally already but often I
> was missing
> issues the Sashiko review bot was flagging. Since the Sashkio reviews app=
eared
> to be release issues I was doing respins to try and fix all those issues.

Fixing an issue sashiko finds does not mandate you to send the fixed=20
version out right away. And yes, definitely, fix those issues as soon as=20
you want, no matter what's the source (sashiko, human reviewer, your own=20
mind finding flaws when given time to process the code you've=20
read/written), they'll then be in store for the time when it's time to=20
send the next version.

We do know this is a major problem with AI review that it pushes=20
submitters to do rapid refresh cycle on the false pretence that reviewers=
=20
must always see the latest and shiniest code (despite often the corner=20
cases sashiko find relate to a single obscure driver most reviewers would=
=20
have no opinion anyway) or that humans should only be bothered when AI bot=
=20
found nothing (yet they always have a huge cc lists and mailing lists with=
=20
hundreths if not thousands receipients so it doesn't add up with that=20
excuse either!). Effectively such a patch sending loop ends up only=20
feeding the AI review bot.

> Apparently not everyone is seeing those reviews posted despite them showi=
ng
> up fine in lore for me.[0]
>=20
> Is everyone here seeing those reviews or are they not showing up?
>=20
> [0] https://lore.kernel.org/all/CADvTj4oNz-bnSZP+kfau-7wBSWLjLTP5jrr6nLfd=
CHNPo3pS6w@mail.gmail.com/

It's quite irrelevant to me whether I can see the reviews Sashiko gives=20
(and I could look them up from https://sashiko.dev if I'd be interested=20
and they do appear there).

When I do review the patch series I'm not basing my review on top of=20
sashiko's nor on top of other reviewer's. Sometimes I end up reviewing=20
something that gets updated by a later version because of that but it also=
=20
makes me immune to false claims or fixations of others. But the number one=
=20
cause for me reviewing an older version is sender sending versions very=20
close to each other, often during weekend (in how many cases the part of=20
the code I commented on had changed, I don't have an estimate for you,=20
sorry).

At reaching v6 this fast, you've clearly done something wrong given=20
multiple people are pointing out this to you, and yet all we get in=20
response is that "I only did it because sashiko gave me things to fix".=20
What is missing is a clear indication that you've understood the way=20
you've behaved so far will not maintain good appearance in the eyes of=20
many of the community. So please consider if it is really worth the few=20
extra days waiting would require.

I suggest you never do more than two versions per week on any non-trivial=
=20
series. I can understand sometimes a quick refresh (especially when=20
at v1-v2) is warranted but to do it for many versions close to each other=
=20
is something that people don't want to see.


And I do know how annoying it is to wait with patches and submit=20
prerequisite fixes first, with all the annoying delay it comes with
for the main patches one wants to get upstreamed, so I'm in no different
boat than you when it comes to that part.

--=20
 i.
--8323328-629380202-1793035757=:1162--

