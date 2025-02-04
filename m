Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C053C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 23:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zb+m34IdtYqveaigwhhXFrJDqLFEUGcgtFJI0I4KZ7E=; b=2AN73hDg0wECrLj2H5rwFoQO5Z
	aOJc7qq8EEBQfmbuKqC22qlEnbDkcEb3Kn6hWcCdoZspOSkwMBuu5wcftqvUd6XUfl2iCfEALTTJ0
	J8WiAkbhhktLKwOqifc5YrTSBBjkR463JMXpBJwCMembmmqKZTinL1Anwgg2feDzIvtvSqJYoKsUd
	3o8DVWHTlWdT1jCAKcvPSsUnppA586ZXoyFIwiP674fBikpxRcigks//u6hwPms2qtM06qtEcPS2w
	rthb7yPhOgv0vjR5Q74QpUOr1kGwxKL1J7ImYQ+lMod4iT4NbkscQbr+X+vXIMmMFFBp5rmxzmc4k
	cC7N3KaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSVS-00000001r1p-2axL;
	Tue, 04 Feb 2025 23:39:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfSU5-00000001qhc-1iwh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 23:37:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1F8FA41FF1;
	Tue,  4 Feb 2025 23:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B77C4CEDF;
	Tue,  4 Feb 2025 23:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738712255;
	bh=vAY8VLfiDAEQkW2QlXq5vU119DGdr5y1FVx5inPsSCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKwivGzIB7KSq8KgreBnpiCDIjWvwHPgeYknYhX3Kg9ltR4fZRZzNRDG51LxUu/Jc
	 gVAvk+DnI1G7ghRdVUhcmgy+fSsdLf9bcno5Bv7v7jXBceCtmhzs5AUY1sUDv5nQmH
	 p4lI5fHO8QVFY2PQ+XVxcFx55XQ94tgxGrBuADzVofn3/QM+FgFH0XGdyWdIxNLj3C
	 w6M0DUGXhf9Dp9h8DNfP3IoPo9dhQE15o1JgqD6yx88avgOIPGHR1pAuPwJdJIDIKO
	 cz2nGON1ELjxaDLMl0fywiP1a4s5FWAYHi+4z2zPXVJz8WFNQ9ABzFYk8RdectrZY/
	 qjS4w3OSQueIA==
Date: Wed, 5 Feb 2025 08:37:30 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: linux-iio@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, timestamp@lists.linux.dev,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dipen Patel <dipenp@nvidia.com>, dlechner@baylibre.com
Subject: Re: [Q] Frequency & duty cycle measurement?
Message-ID: <Z6KkusvLFPcNvEfl@ishi>
References: <f2ec8a55-42ad-498a-b793-072444dcb92e@prolan.hu>
 <Z5efcokgHix-k3lW@ishi>
 <dffc0f18-799a-4fc7-a6b5-2fa270e1fc58@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2a9wQicw+mxwAn3v"
Content-Disposition: inline
In-Reply-To: <dffc0f18-799a-4fc7-a6b5-2fa270e1fc58@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_153737_582391_9CD4E4E6 
X-CRM114-Status: GOOD (  23.34  )
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


--2a9wQicw+mxwAn3v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 02:59:20PM +0100, Cs=F3k=E1s Bence wrote:
> Hi William,
>=20
> On 2025. 01. 27. 16:00, William Breathitt Gray wrote:
> > If RA and RB are provided as a memory buffer on your device, you can
> > instead expose them via DEFINE_COUNTER_ARRAY_CAPTURE() such as the
> > ti-ecap-capture driver does, then perform your userspace computations
> > by utilizing those respective "capture" array attribute values (via
> > chrdev like the example above or alternatively via sysfs).
>=20
> Thanks for your extensive explanation! With DEFINE_COUNTER_ARRAY_CAPTURE(=
) I
> was able to expose RA and RB as
> `/sys/bus/counter/devices/counter0/count0/capture{0,1}`, and could verify
> that by replacing `devmem` calls with read()-reopen(), our PoC code still
> works. Now I want to use the chardev interface, but I couldn't find how to
> set up the watches appropriately. So far I have:
>=20
> 	{
> 		.component.type =3D COUNTER_COMPONENT_EXTENSION,
> 		// also tried COUNTER_COMPONENT_COUNT
> 		.component.scope =3D COUNTER_SCOPE_COUNT,
> 		.component.parent =3D 0,
> 		.component.id =3D X, // also tried this instead:
> 		// .channel =3D X,
> 		.event =3D COUNTER_EVENT_CAPTURE,
> 	},
>=20
> However, with this, the first read() never comes back.
>=20
> Bence

Hi Bence,

Are you still having trouble with this? Is "X" the
capture{0,1}_component_id value?

I apologize, the Generic Counter character device interface is
underdocumented so it can be a bit confusing at first; I'll submit a
patch improving the documentation later this cycle when I get a chance.
For now, let's walk through how to create an appropriate Counter watch
for the capture extension components you have.

The first step is to decide which event we'll monitor and on which
channel: we want to monitor Capture events so that's
COUNTER_EVENT_CAPTURE, and we want event channel 0 (n.b. 0 because
that's the channel parameter value passed to counter_push_event() in the
driver).

The next step is to choose the components you wish to watch: Count 0's
capture0 and capture1 extensions. So type is COUNTER_COMPONENT_EXTENSION
because we want to watch extensions, scope is COUNTER_SCOPE_COUNT
because we want Count extensions, and parent is 0 because we want
Count 0's Count extensions.

Finally, we need to set the component id for each extension. You get a
particular component's id by reading the respective *_component_id sysfs
attribute: so for capture{0,1} you would read capture{0,1}_component_id
respectively. These component id values potentially can change with
future driver updates, so for robustness your userspace application
should read the respective *_component_id sysfs attribute itself rather
than hardcoding the component id in the Counter watch.

However, for the sake of simplicity in this example, I'll assume the
component ids are 42 and 43 respectively for capture0 and capture1. That
gives us the following two watches:

        {
                .component.type =3D COUNTER_COMPONENT_EXTENSION,
                .component.scope =3D COUNTER_SCOPE_COUNT,
                .component.parent =3D 0,
                .component.id =3D 42,
                .event =3D COUNTER_EVENT_CAPTURE,
                .channel =3D 0,
        },
        {
                .component.type =3D COUNTER_COMPONENT_EXTENSION,
                .component.scope =3D COUNTER_SCOPE_COUNT,
                .component.parent =3D 0,
                .component.id =3D 43,
                .event =3D COUNTER_EVENT_CAPTURE,
                .channel =3D 0,
        },

Does this resolve your chardev read issue? If you're still having
troubling, just let me know and we can troubleshoot further to figure
out what's going on.

William Breathitt Gray

--2a9wQicw+mxwAn3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ6KkugAKCRC1SFbKvhIj
KyJaAQCCZ5Mnusdt0BDtO1DMxjwY6w6GX5ZblIIVbjUWAzAvIQD9E7WICJ4aGJSf
5ohM1mSLRyf1qHJCM1IvPkVSD/qZrwg=
=2fNK
-----END PGP SIGNATURE-----

--2a9wQicw+mxwAn3v--

