Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13E5606A82A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SzD8q+mJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHj7eU2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xPoZusWyH3D9fdoWkwrWqXdMyuACo60BjbvRfcDTRcI=; b=SzD8q+mJwUq05dQCc1Cwxc5Dwb
	WoyObCZD3qwRbiCQEG6TXUFUf6YAuW+rOSpDX40NolCUZ87X4Ko5GWID8/8rY/LbnRPnE0PyIZE4F
	soxvqa1yha2AbfQd74FsghCS4GiPmlCSD2bQi18ZJcdc09NTvr2DvbsxHuBDBssf2JUPqZGRD1z5p
	+24TzOV1wZwGCchqWvKLp9QE77ka66gcg4r7zdivlYTeFLtzg1fKdA2p5cE7RHYdiJL0Fs3FWx36p
	u4cC0P5HuVg7me0LG7Bf4nqdvVi/mpyfvC94cA4tcbXZJv2GzFGm2/dq6nWv844lwNVq2CMMlNBLb
	2Q/fZtrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCNC-000000028kl-1elq;
	Tue, 03 Nov 2026 11:08:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCNB-000000028kZ-2ogM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:08:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1244643CAA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 11:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB7B1F00A1D
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Nov 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704093;
	bh=xPoZusWyH3D9fdoWkwrWqXdMyuACo60BjbvRfcDTRcI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=UHj7eU2yyOQGjbmDeez3g+eYL0Bv/uBQFaVXwnSjXyABHS2vICEdmQxCEJrHP2qju
	 kEAGy47lVIwdWk3dqx9JXTvkAaEe7ImmoKHeTbrMAIPL6tsz/btjcHiUuzd9vYHgIs
	 ACLyFdhhQWwRQyNgLOPxHcVSHobGrMkreSap/1L/sJ6373OYfeVsF+YX84ejAx25A5
	 andD1CvJB/16z3poGAxQPCT7qbH7sp1VcsXrMnPslbovnNMPOpuh6ncs1SFjs4I8TG
	 TgwrunHp7mwg1CLdW7//hRh/UPy0m0rM5NQtIgq8etzTLFKyE/9PA2bxs6d/a2UfBU
	 UytNUnElfgWpQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab3dd966e1so36383301fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 03:08:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwWhRiOpSeKV2eBFrvF7xfE9hJ7ZFt2WXmTvcYLakijXz8JrXcivYijFzw92ibkzBepBt4vEnq3l78b7Qh2x5+3@lists.infradead.org
X-Gm-Message-State: APuU4Z+e6tSHvEb80N80jvFAa64otNmZ4wLKAvBBZS8tySZZgC8prtpf
	mDYNf8OJwjjCR4ZME0o/2ahkPD+N3fopL66Me1shrhOEsrmgCNLBBKzkFbevrVLdw/7ypPcqQoe
	gSp7wqAuBEXO8SfkSLRERBCW9Mt92ZZg=
X-Received: by 2002:a2e:a555:0:b0:3a6:5ec0:7977 with SMTP id
 38308e7fff4ca-3acb7b45f8dmr32247991fa.22.1793704091325; Tue, 03 Nov 2026
 03:08:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 3 Nov 2026 19:07:56 +0800
X-Gmail-Original-Message-ID: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
X-Gm-Features: AclHuK_7MCsHCFGRxCGrHLGiBJS1LagIQXdv248ODfyEYfHWYTzn5PL2aAFmzB8
Message-ID: <CAGb2v64fEDzpn-ytggienzYjOGiQYsJ=SLCVx4zz9psw=bvjYg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: rajanyadav0307@gmail.com
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

On Tue, Nov 3, 2026 at 5:09=E2=80=AFPM Rajan Yadav via B4 Relay
<devnull+rajanyadav0307.gmail.com@kernel.org> wrote:
>
> From: Rajan Yadav <rajanyadav0307@gmail.com>
>
> The CPU thermal zone in sun50i-a100.dtsi has a sensor but no trip
> points, so nothing throttles the CPU as it heats up and nothing shuts
> the system down before it overheats. On a KickPi K5C (A133) without a
> heatsink, the CPU reaches 90 C within minutes of full load.
>
> Add a passive trip at 90 C that throttles all four cores through
> cpufreq, and a critical trip at 110 C, using the same layout as
> sun50i-h6.dtsi.
>
> The temperatures come from the Allwinner BSP (sun50iw10p1.dtsi). The
> BSP drives this zone with the power allocator governor: control starts
> at 70 C, the target is 90 C, and 110 C is critical. The power
> allocator needs a power model of the CPUs (dynamic-power-coefficient),
> which the A100 does not have in mainline, so here the 90 C target

Does the downstream BSP have this? It would be nice if we could port
it over. Then you can properly use the power allocator and/or the
schedutil governor.

ChenYu

