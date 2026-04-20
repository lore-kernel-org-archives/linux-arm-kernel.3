Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CDEF588C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMXGpa2t06SlgNty8s43Rjg5XVC27sa0mGwOgV/VuWU=; b=w6ezCIRuzJ4bWBLG91QoArlAuw
	kgsY/Y7SmyyAviESG01vXB11Yq+W0gfpB7Cyp4B0KS4pBSwAoCVbTOv7CUv3U+OJqtKSofYJg/tM7
	0ZZENrzLaQ7N/mZE/PYu9ghkRUVLUzQePm2AdioxtIVEna9MwlWWrj7LoS+/s8QN8cQzphEMtwOKK
	WYIWxQsocIfPtjr5z/KdZ3xsFkbTnIHexCQ982UTYqoa414EGowVafs0c6SEAyM+5KZEIpn/cSwyV
	HrzyYftCC4nG/Alx8X5XXhbfzNFu1FE/T+4wBL4uM/2GYARWBwPIhVcxoqpqnR1x7V58M9VPKTxGu
	u0gcvrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnrS-00000006tLZ-0EIq;
	Mon, 20 Apr 2026 12:36:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEnrP-00000006tLE-2nkb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:36:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED4AA40210
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 12:36:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB72C2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776688578;
	bh=aMXGpa2t06SlgNty8s43Rjg5XVC27sa0mGwOgV/VuWU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E6Umqfij26ygFveQISd8JSv/uVcnhVLtdWW7pTHHTjbxUxUXeWifwD/8w2A/7858m
	 DgWzsldlgOEB2BXL7RYXmCtvJE0GoUxQQKrR+eqhdIspwqIORIq/y9pwRmItqPO235
	 qsXJhxFOLdwZR6T3ZZ9Ao6/8htd4fTqrzKIHxDGV71by8wEPQriGM6cQ90ZQfxR5FK
	 Rz9PGKayPXo9u9BjgbJ2sZj200d71GqxXG10x3BRCNObdTN4XUvG14OKgLLPojd9jw
	 HgZNLv+wb67j8Cdl02vdGbtg6zCLw9Gwd4gkX/YOyM+3nDqiDwRtTwTODAdiLdXGF7
	 PgQgnY6dpyENQ==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3870778358aso21362571fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 05:36:18 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw2Xo36ULVvRwHAEYjxuyVHspKVxUoXAXURe7EdwArT0xMpw87l
	yEK8Cbyf4uPX96hr+LjfzTlo8R+UGiPtFDh7XSGbtBm6BTGPB8FBcsXx9ZLWXkU4gNkfoE8n3I6
	WlMXi+BhZ0zBedVx2I+9249ygeR5T4jc=
X-Received: by 2002:a05:6512:1dc:b0:5a4:19f3:f2b8 with SMTP id
 2adb3069b0e04-5a419f3f3a2mr2500794e87.10.1776688577537; Mon, 20 Apr 2026
 05:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260414211215.152850-1-stefandoesinger@gmail.com> <20260414211215.152850-2-stefandoesinger@gmail.com>
In-Reply-To: <20260414211215.152850-2-stefandoesinger@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 20 Apr 2026 14:36:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLmtUUkLh0RFw+pdfDYf6uHsEuXUPu0w6+LeZkPod=vMsQ@mail.gmail.com>
X-Gm-Features: AQROBzC_ja4hMQnBBqL3fEii_NNOIW8lJd1A9EjlevDJ0pWE_b6J_fAfTEzotLI
Message-ID: <CAD++jLmtUUkLh0RFw+pdfDYf6uHsEuXUPu0w6+LeZkPod=vMsQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] ARM: zte: Add zx297520v3 platform support
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_053619_732084_1B2B9ACC 
X-CRM114-Status: GOOD (  12.49  )
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

On Tue, Apr 14, 2026 at 11:12=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
> DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
> and sold by ISPs themselves. They are widespread in Africa, China,
> Russia and Eastern Europe.
>
> This SoC is a relative of the zx296702 and zx296718 that had some
> upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
> platform"). My eventual goal is to enable OpenWRT to run on these
> devices.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

From what I have understood the arm64 people would be fine
with having the A53 hardwired to ARM32 without VFP and NEON
as an arm32 machine because it makes their life simpler.

So from my side:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

