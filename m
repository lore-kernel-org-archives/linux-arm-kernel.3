Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05430606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1lOARklo;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BG1ECo7a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bK22br5gUxVkzFqqNv2xUfxvigTGevWZC5+h9zTzvM4=; b=1lOARkloaEanJiDyKxHs/vYOkK
	cASMX/M0kzBsu/yaMorSXoSsCy1ztm5fsuleWKUQ+BquZBxod8AecVEnmfLYcp7LuEbCM/68q9o0J
	8VSGrT8dDj0ImeIrPx0ZA0Q5PckJw1U03TGcAaxfsih1PvJxHdV59zDcv4Yf6p+ZB3q+1GwdZBWmB
	4eOiyXPo8ZukhTYIIos0udyJV4OAAOQldkqOgvlx1dnv9OW8HDAKA8z+jFp6U/AkWmdGAErWkAx3/
	bCXSYELl+3wxjEbeCzoRO3IONGd5/riyKlD+AgCFGhdzIU30LY33+dvg4UT1cVLl60elPXFBR/4xY
	TWQwfSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ4l-0000000BCFi-2Sh6;
	Wed, 21 Oct 2026 06:45:27 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ4i-0000000BCEi-2m8m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 06:45:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5490F2022D8;
	Wed, 21 Oct 2026 08:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792565122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bK22br5gUxVkzFqqNv2xUfxvigTGevWZC5+h9zTzvM4=;
	b=BG1ECo7a/eUGPHyzUDzpCIueDb20L/00R6W3OjQBPK79ljMYmwzIcfF/iyZnisj3mEunJF
	edV7kmLFrKtZpJEsxMRfCelBPAFbu5KX+IWGufI2l2XukAxQwHW3uZ50vlTJSQf35j6Xp/
	5SEQRGk0NBge/YiJ0DnY1ZnB9nY/b0fA2qJsUv+RCkfip/CkC4fWGJHrJCiP+ipOEMLhpp
	b0NWcZkw+FNid20dGDT8FOc2vGG9XUd1EGNsWB/SzzarVjJp2H9GAUp2muMOkLpiTNR1tx
	vdAf3eyOJduRAaMScf4nI4fhDelaC+4gYdYrUdERP5PPJc0nw9WPB3faRqIqOg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792565122; a=rsa-sha256;
	cv=none;
	b=UOyKV9kBE2PBMI0vpumPT7RSFX1Hxg1DhyN0epBwXEwSt3Cz2YgDhxwzbrOBEjVvrBSxU2
	50yZcESH58Sl/3PojrLDm6XMK4nQtg6Co5CWkI7Rl+7R1QejbKggmicCPzU0kb4o5NVXGE
	J60jUvgQJGOvWsqiD8Cgfduq+U4dBrwSnXC9n91q78Z6p9S3e9f8iaQlLDyQVaSuXdUhf8
	33NGEHVmBPK6dPhVsncHe+sMfL6AZyE4KrnuR0TmyJnd6F1z2ehbeqmUMI7Po4I1GeCvt/
	sdvtIDI6cYyk3mIV/Fc7oIdIylfEVGfMhVAPZklC6f7XKpiYIXUKCzR2YsRe+g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792565122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bK22br5gUxVkzFqqNv2xUfxvigTGevWZC5+h9zTzvM4=;
	b=d96X3CdYWS/PSFREaAqdpJtOuk4Xow16CQ/cfuAz4y9+zZK0jntOllrrtO91c1dtT646dz
	flCfe7hzGw4RWhJq4CU2AzFbfRApt1kbyB4UpXNn6cyx3ZMYFZgnbY5tbjNgSlgEacZ0nS
	e5QumnMgF53RnjlNwaDx7aDaUryF9ceWAj+hQXTXlGpaIFhG4or00G9QraWrpmgfHEG/5C
	8ZT3AFxd/CYeRFfHNPwfNIzmaiGUi88959Ij2QIXzvqQlx8qWG+mBKq3WqJAinvf8xQ9G+
	bqt21GwL1MxVBzwJ9kvW62l++JTLyo7h6AEoDwX2KUi1/ziT6+jKUX83FSeduQ==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xJQ4g-000WDV-0k;
	Wed, 21 Oct 2026 08:45:22 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id DBACD5CAC5C;
	Wed, 21 Oct 2026 06:45:21 +0000 (UTC)
Date: Wed, 21 Oct 2026 08:45:21 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ian Rogers <irogers@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, Christophe Leroy <chleroy@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for
 ARMv5
Message-ID: <20261020-groovy-chimpanzee-of-exercise-8a9174-mkl@pengutronix.de>
References: <20261019201257.3805356-1-irogers@google.com>
 <31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
 <20261020-succinct-zebu-of-vigor-6cb2cd-mkl@pengutronix.de>
 <d2afb4cb-145e-488b-8f6e-c83e38735526@app.fastmail.com>
 <20261020-nice-turquoise-dinosaur-3079bc-mkl@pengutronix.de>
 <a34133df-224e-4cea-b574-097ad37a791a@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ber3bezd7mvhap2o"
Content-Disposition: inline
In-Reply-To: <a34133df-224e-4cea-b574-097ad37a791a@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_234524_855710_A72E8B80 
X-CRM114-Status: GOOD (  22.25  )
X-Spam-Score: -2.1 (--)
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


--ber3bezd7mvhap2o
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for
 ARMv5
MIME-Version: 1.0

On 20.10.2026 17:54:55, Arnd Bergmann wrote:
> > When booted via NFS-root to the login prompt, we have about 570k System
> > alignment fixups, all in the IP stack: :/
> >
> > __udp4_lib_rcv+0x78/0xc6c
> > icmpv6_echo_reply+0x160/0x504
> > ip_send_unicast_reply+0xf0/0x3f8
> > ndisc_send_skb+0x15c/0x40c
> > rawv6_recvmsg+0x114/0x3b4
> > tcp_rcv_established+0x3ec/0xba0
> > tcp_v4_fill_cb+0x70/0xec
> > tcp_validate_incoming+0x540/0x868
>
> That is usually a bug in the ethernet driver, which should take care of
> aligning the IP header in the rx skb. Many drivers do this using
> netdev_alloc_skb_ip_align(), but I see that fec has its own buffer
> management, so it may not be that easy to address here but would
> boost performance quite a bit if you do.

Thanks for the pointer - different topic though.

> > Comparing v7.0.12 with mainline "unaligned.h" and reverting commit
> > a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to
> > memcpy()") brings no difference with respect to alignment problems. But
> > I see the increase in I/O performance (measured with "fio" [1]) on a
> > UBIFS/NAND file system:
    ^^^^^^^^^^

> >
> > - v7.0.12 NFS root
> >   User:           0
> >   System:         573956 (tcp_measure_rcv_mss+0xe4/0x1e0)
> >   Skipped:        0
> >   Half:           4
> >   Word:           573940
> >   DWord:          0
> >   Multi:          34
> >   User faults:    0 (ignored)
> >
> >   WRITE: bw=3D272KiB/s (278kB/s), 272KiB/s-272KiB/s (278kB/s-278kB/s),
> > io=3D32.0MiB (33.6MB), run=3D120532-120532msec
> >
> > - v7.0.12 NFS root, reverted
> >   User:           0
> >   System:         574214 (tcp_measure_rcv_mss+0xe4/0x1e0)
> >   Skipped:        0
> >   Half:           4
> >   Word:           574183
> >   DWord:          0
> >   Multi:          27
> >   User faults:    0 (ignored)
> >
> >   WRITE: bw=3D343KiB/s (352kB/s), 343KiB/s-343KiB/s (352kB/s-352kB/s),
> > io=3D32.0MiB (33.6MB), run=3D95439-95439msec
>
> Ok, so about the same improvement that you saw on ubifs.

That test actually was running on the same UBIFS on NAND file system as
Stefan's original test. Although I bootet the system by NFS root.

> > Booting from UBIFS, so only the lab background IP noise...
> >
> > - v7.0.12 UBIFS/NAND root, reverted
> >   User:           0
> >   System:         164 (rawv6_recvmsg+0x114/0x3b4)
> >   Skipped:        0
> >   Half:           0
> >   Word:           127
> >   DWord:          0
> >   Multi:          37
> >   User faults:    0 (ignored)
>
> At least it seems fairly safe to assume that your original
> finding is correct and my worry about adding more faults is
> unfounded.

Yes.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ber3bezd7mvhap2o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCathffwAKCRDMOmT6rpmt
0tIAAP0dKhet7X01pv6Jrm8ojsxhxHRzlNFV5ftP9JAjAHmXVAEA7IQKE1OYnHIX
RUf2A3flqLg1uXT4ilqnaAw0Jhg+3As=
=eOTV
-----END PGP SIGNATURE-----

--ber3bezd7mvhap2o--

