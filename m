Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C679CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 12:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:Message-ID:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgcTGlM5XZb41JZNrvypn2a4MkcK6CPOtTLQs0sodm4=; b=WIHgDZ0yqsDEcYlgLiGMf+ZPry
	nxZZYDmlxHYydH1eZ1QFyhSvOuqWJuUqvT9bftHBcIXeQpSBPICOgHoBTC9qzPGBaJbpwXVvFChxZ
	exlEWCMOtyY5WAK42AMAxDojkf3PILURNBV0PnexOTClZubc+GGDYCJNFqEmYz1GNNYKlPUF1kNEC
	AMOTrQs29tnNTZTtqfPA/WbT0sSZmoaezp17uuTA6lKZvIJTz6zntWBlVB1TqwRT4GW2eCzl6ESy/
	0ghzhik0SfEo5h8I/peK76Fj4KqagtsC37lSPM+3vnpa3Z/Cu7nqNmDnaQM6dpTundd7yFTDzZ3g2
	PzRTLFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQT0-00000002Pdx-1kPD;
	Wed, 07 Oct 2026 12:09:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEQSz-00000002Pdo-0CgZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 12:09:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7869C407A3;
	Wed,  7 Oct 2026 12:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392E71F0089C;
	Wed,  7 Oct 2026 12:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791374988;
	bh=rgcTGlM5XZb41JZNrvypn2a4MkcK6CPOtTLQs0sodm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WhpBvoFeAON//atDsGYRjDx9HsSMC41n4ldkYN1cDRufkCe3asCOr5KxU8AWBor4n
	 PEflzUuQDdyADcDZRfwWWolif6qN6WTHOarkxXM1/7iDhSmhLTY1lhr0rP7yywPSeP
	 vi8AwCZdSSwyW9yDiMM0a4b0/7sMUgqwsGleGIj9xfbkEXQxKjJAzI9Kcbxq/ct9Tk
	 QGv2WwoReKsdlrZ7IAc+o1m/ASmsYfj8ofOIbiP/bJiKTAs+Xk8TQysWFReqeJEPpT
	 O7pb8k6zWd/xRzyeKETsb6VXcvhIB8pFmOvXz9YPFoc/J3Mi3KBEt29C1N/+AUCOJm
	 zElIQCe5bMG6Q==
Message-ID: <sashiko-outbox-162978@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/11] module, sframe: Add sframe support for modules
To: "Dylan Hatch" <dylanbhatch@google.com>, "Catalin Marinas" <catalin.marinas@arm.com>, "Roman
 Gushchin" <roman.gushchin@linux.dev>, "Mark Rutland" <mark.rutland@arm.com>, "Weinan
 Liu" <wnliu@google.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Jiri
 Kosina" <jikos@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>, "Jens
 Remus" <jremus@linux.ibm.com>, "Will Deacon" <will@kernel.org>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, "Indu Bhagat" <ibhagatgnu@gmail.com>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, "Song
 Liu" <song@kernel.org>, linux-toolchains@vger.kernel.org, "Puranjay Mohan" <puranjay@kernel.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, "Prasanna
 Kumar T S M" <ptsm@linux.microsoft.com>, joe.lawrence@redhat.com, "Mostafa
 Saleh" <smostafa@google.com>
In-Reply-To: <20261007114335.440322-6-dylanbhatch@google.com>
References: <20261007114335.440322-1-dylanbhatch@google.com>
 <20261007114335.440322-6-dylanbhatch@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 12:09:46 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] unwind: Integer overflow in SFrame header parsing on 32-bit bypass=
es bounds checks, causing OOB write in sort()
--

commit 37859a60480c542bd986b5fe41b863323e42fd98
Author: Dylan Hatch <dylanbhatch@google.com>

module, sframe: Add sframe support for modules

This commit adds SFrame table support to struct module and enables SFrame
PC lookups for incoming modules. It parses the .sframe section and sorts
the FDEs if they are not already sorted.

> diff --git a/kernel/unwind/sframe.c b/kernel/unwind/sframe.c
> --- a/kernel/unwind/sframe.c
> +++ b/kernel/unwind/sframe.c
[ ... ]
> @@ -471,10 +517,72 @@ void __init init_sframe_table(void)
[ ... ]
> +static void sframe_sort_fdes(struct sframe_section *sec)
> +{
> +	void *fdes =3D (void *)sec->fdes_start;
> +	size_t num_fdes =3D sec->num_fdes;
> +
> +	if (sec->fdes_sorted)
> +		return;
> +
> +	sort(fdes, num_fdes, sizeof(struct sframe_fde_v3),
> +	     sframe_sort_cmp_fde, sframe_sort_swap_fde);

[Severity: High]
With module parsing introduced, could this sort() call lead to an
out-of-bounds write if num_fdes is maliciously inflated?

Looking at how sframe_read_header() validates the incoming headers:

    num_fdes   =3D shdr->num_fdes;
    fdes_start =3D header_end + shdr->fdes_off;
    fdes_end   =3D fdes_start + (num_fdes * sizeof(struct sframe_fde_v3));
   =20
    fres_start =3D header_end + shdr->fres_off;
    fres_end   =3D fres_start + shdr->fre_len;
   =20
    if (fres_start < fdes_end || fres_end > sec->sframe_end ||=20
        fres_end < sec->sframe_start) {
            pr_debug("inconsistent fde/fre offsets\n");
            return -EINVAL;
    }

On 32-bit architectures, sizeof(struct sframe_fde_v3) evaluates to 16.
If an incoming module sets shdr->num_fdes to a large value like 0x10000000,
the multiplication num_fdes * 16 overflows the 32-bit integer and wraps
around to 0, resulting in fdes_end equaling fdes_start.

If the module also sets shdr->fres_off equal to shdr->fdes_off and
shdr->fre_len to 0, fres_start and fres_end will equal fdes_end. This
evaluates all the bounds checks to false, fully bypassing validation.

When sframe_sort_fdes() is subsequently called on this parsed module data,
it would invoke sort() with the attacker-controlled num_fdes (for example,
268,435,456 elements). Does this need overflow checking (such as size_mul)
to prevent out-of-bounds memory corruption during module load?

Additionally, could fde->fres_off in __find_fre() similarly overflow when
added to sec->fres_start on 32-bit architectures, bypassing bounds checks
and causing out-of-bounds reads during stack unwinding?

> +	sec->fdes_sorted =3D true;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007114335.4403=
22-1-dylanbhatch@google.com?part=3D5

