Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51AD9C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zD53N/EHIMHVfbT4JxU4Fm2WFQ5MT2sTqDAA/y2RbGo=; b=ME2KNQy/gQjbUpD5xB09c2Dy4K
	gGY0wUvsRwxFAMj3FDukeIzV6I/8bnociOmuKF30+tEZNxn3Kn8Vlc9z3TlkC9v9vRSogx2Rnk5oL
	rpWs4cdTvBa4/Mj6HBEV9P4Rh9JKfcJCt4WhnnyNB4rm0QQbycThQUj0UbMBOrq2w3kGuQ/+kmd0Y
	RkDCSexhDO6eGsi30H7bXMlTPyAM00Yri1JoiVIu0UaRbfV4w3UFQZaMFPOPDhJRqpF5vcq2qLTex
	hf+l10AguU7U0PAu0CwzH1VeCxHXAHXoB/fWXRMtOiiHb+hl4FuBfZW//imk8vRpL9YvSE46nf994
	tunSnw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V6Z-00000002PzX-0xdn;
	Fri, 04 Sep 2026 14:41:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2V6Y-00000002PzR-2k3a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:41:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id E6F29601F0;
	Fri,  4 Sep 2026 14:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2421C1F00AC4;
	Fri,  4 Sep 2026 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532881;
	bh=zD53N/EHIMHVfbT4JxU4Fm2WFQ5MT2sTqDAA/y2RbGo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=A1b6FrNCmOwhDgGHd60VJn3LXE8NDiHJx3sKln5y/Mxa9wzOpGlFbs1EdpqkqnyXr
	 ohuK/Tr8D/Hb3fu+JYcC8TSvg0ogbKQPm8hGmMKnVN8VAd1dqbY5V8fPDVgUGIJxO6
	 tgADXu4KDoKW/Z9nZPs2uO0aLtOcKdGdkhos0p0vz4BFagEnFbpmRiJUJX5CMCwBeC
	 NbaTjhdGKgvq80cOr+DmV87XbhSmodh2V+Pc+5LBXpigECJXqnB08iPCgsSP/Jxnht
	 VsCUN/p1ZKlTB2JvaYnKoqdHUHhjFtywP7Mz3fZLR4KgYT9YxkLO8fYdUwTl8shVA6
	 /Khs0R/n7phqg==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b7a88bf97e556c6cd04c75ab73b7aa697a055d0a877df80f250b141c6f38;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 04 Sep 2026 16:41:17 +0200
Message-Id: <DL6LZOVDBDTD.DQNNUKIU3P3H@kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: add am62p/j722s GPU node
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>, <a-christidis@ti.com>, "Nishanth Menon"
 <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tero Kristo"
 <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260831-am62p-gpu-node-v2-1-69945a2db2af@ti.com>
 <33c6717c-5c24-488f-bd85-d0cfaacaf13e@ti.com>
In-Reply-To: <33c6717c-5c24-488f-bd85-d0cfaacaf13e@ti.com>
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

--b7a88bf97e556c6cd04c75ab73b7aa697a055d0a877df80f250b141c6f38
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Sep 4, 2026 at 4:27 PM CEST, Udit Kumar wrote:
>> +	gpu: gpu@fd80000 {
>> +		compatible =3D "ti,am62p-gpu", "img,img-bxs-4-64", "img,img-rogue";
>> +		reg =3D <0x00 0x0fd80000 0x00 0x80000>;
>> +		clocks =3D <&k3_clks 237 3>;
>> +		clock-names =3D "core";
>> +		interrupts =3D <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
>> +		power-domains =3D <&k3_pds 237 TI_SCI_PD_EXCLUSIVE>,
>> +				<&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
>> +		power-domain-names =3D "a", "b";
>> +	};
>
> Could you check once, if you don't need some assigned-clock-freq.
> and good with default freq ?

See
https://lore.kernel.org/all/20250915143440.2362812-1-mwalle@kernel.org/

-michael

--b7a88bf97e556c6cd04c75ab73b7aa697a055d0a877df80f250b141c6f38
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaprYjRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/imSQGA+0EFfXnMF0x7rvtUX9YBU/EEhH0bwrMu
DfS8Rwit1ki0p8KXhKtXF5EegntAkmO+AYD4L6fgH/DnvaFbB/AlzWpSEmkvg8Hn
S9J6JBHSnk6w0NGja4zHFhSoiYknmfaCixg=
=5d+V
-----END PGP SIGNATURE-----

--b7a88bf97e556c6cd04c75ab73b7aa697a055d0a877df80f250b141c6f38--

