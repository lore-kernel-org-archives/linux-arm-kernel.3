Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C69606D823
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l0OJR5jQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dr4LZMbS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mdSDaylEDCP6bzikHn/xkO4FCQje+FbG1kF5jyDEpv4=; b=l0OJR5jQRk3/q6j+jsZF0aOb7V
	wjtrOkGsE1aupHbWvjP15R944qPcvg3/Z8oJaHV9uiFdlF8hZ2/RIA48SBiqLeR8CMqr4ZUxzwN2g
	fz3Ez/KpMz8V9gOISYBP2STS0PrMV9BzbdBkuWzeb+AAxCV9SALX6hTWgz+WkZtEYc2w1PHrwt3MK
	F6SInUGfUfVlGG10j2U6Sij/EMj6BX1E1/WhLrZVCaC0guBsi/O3HSGfXev0zOtbmHcZLXjYWZrtF
	mhthUNJqlvOEqEl6411F9CtiX8yW3eAawP7atBV5bHij9j7oi1gUvxrhh7OdqSWtrKVls00IhiH/D
	NwCobPOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGVS-00000002yoZ-1maK;
	Tue, 03 Nov 2026 15:33:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGVQ-00000002yoG-2Cy6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:33:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0009760A00
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 15:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB5D1F00A26
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793719979;
	bh=mdSDaylEDCP6bzikHn/xkO4FCQje+FbG1kF5jyDEpv4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=dr4LZMbSEBAFmcA/cUbDDc1IenIMbDNdgmj4oDHTMRsIsJpkiJiF/5BwAu2R3Rl/K
	 u5LyhW1Wo9kblTPSl4Tbrr+U6RidpLtEsSSiPI5QoPZaT/L6xZA1FE8kiiAj/wAui0
	 UCY6rkOADElUv5wzSGJXn3Hr5qlECvbbhUlpXvhO8ICmiDlfqs5HigdVU3xHGoi1U5
	 jSCFd2xqJNEH4C5dDqi/OCsYUv4AaAH55yHBjNQhNWFxgqtsv1MwTBNcniSxUdHQQv
	 4DEOK9ZD7r9hLtI+THxSexWJGIXSvRC8On55nHwJMszAWkqzEWedB2+6a6ojBATVXY
	 H38miYnvtQq/Q==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-70bf1671c21so2478590eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 07:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByk2yevVNlRM+GweDHMJ10lO0BIW6bhl5PtbKudovjh6ea7dNkYtGvdN5jaXbm8Wo4HlWD9mP4Ip22rZ1xTACVh@lists.infradead.org
X-Gm-Message-State: APuU4Z/lh6sagXlwqpq38nElnfVAx2r3qEAomud5do0if/noH7S/Aj3i
	+vslCgqimgF4jONZSH7O4i6wnCVQPOCKpPiDI+nElvwBUgA/1S+F6+ONVtpnJP3Rfa0HSVftMmL
	rirP+6sYZXS7OoPbirnoxZQiB+176fGE=
X-Received: by 2002:a05:6808:c413:b0:4f3:e98f:fa0b with SMTP id
 5614622812f47-5640d9718e6mr9621332b6e.5.1793719978745; Tue, 03 Nov 2026
 07:32:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
 <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
 <CANxy8yTbu63ykQnqa_XA=HhV7JTDZd3ac2XWGzYNwuHBAd2DuQ@mail.gmail.com> <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
In-Reply-To: <CANxy8ySZ_ErH4gi3PbWv6bb+uLvvUV4_-WmBkDrMw+RJqazA5w@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 3 Nov 2026 23:32:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
X-Gm-Features: AclHuK9qbh-5u1j8zW4quirRvqcSTHBVHOecOsdol74xKAQ-eozqfaINKue7um4
Message-ID: <CAGb2v65D6ACO83fAm5_Jh4RC5X3H=26EQYHAz8tVOWEVerSPXA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: Rajan Yadav <rajanyadav0307@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 3, 2026 at 10:47=E2=80=AFPM Rajan Yadav <rajanyadav0307@gmail.c=
om> wrote:
>
> On Tue, Nov 3, 2026 at 7:07 PM Chen-Yu Tsai <wens@kernel.org> wrote:
> > Does the downstream BSP have this? It would be nice if we could port
> > it over. Then you can properly use the power allocator and/or the
> > schedutil governor.
>
> Yes. The BSP (sun50iw10p1.dtsi) has dynamic-power-coefficient =3D <190>
> on cpu0, and sustainable-power =3D <1200> on the CPU thermal zone.
>
> The energy model uses the OPP voltages, and Andre points out that the
> current OPPs are A100-only and don't fit the A133. So I'd like to fix
> the OPPs first, and then add the coefficient as a follow-up, tested with
> the power allocator on the K5C. Is that okay with you?

That works.

