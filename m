Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED61C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VbQBsruciLa4JtVJQIpxOxnRwemjEZfvuocPun+iyvQ=; b=SmfiP/gh55aPG0gWaYzyrbS57d
	Vw5xJxfp+t166QsOC/p19gzqpJA8EGvdBnIxDBYBB7OuaPkUtFtVY7C1mPVUPE6S8slrLmrH1+XTn
	TOYQeqbqqlQum49bHv86T5gfPNIzSXo5Us07tiAUX8KGmoaesejS1PbAMug+O9yyWsWzJnOb47f9T
	+8cyUqUoffPPFk3o/nvPaJ98sbsxWMnIdFJDDc0GwYbYBKvQ9pSfG+14V5QcpkCPSvbeoDx/v9ZCc
	GYnugltgvp+cQ15mfk+k8aR12TyBqLVO5Lnc0T18qzGGzJHu0YtEFEGrZJls9K5L9G82Y0UKZedU/
	DoCGICcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf87-00000007no4-1R9w;
	Thu, 27 Feb 2025 14:44:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnemg-00000007hzD-1Uoi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:22:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC42A5C5A6F;
	Thu, 27 Feb 2025 14:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E64C4CEDD;
	Thu, 27 Feb 2025 14:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740666161;
	bh=VbQBsruciLa4JtVJQIpxOxnRwemjEZfvuocPun+iyvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kMavpRxMeUFMhmHED2zmedmFZtfHoUybQ+cz/i5pgONnYq7cJOwgvJLVosWFB9Jl6
	 gQPdoRBqW4ruRXHQrNlrphSnAmovi5BTXGl7dw/luhCibjrt9AJToFlW+AFazGnGp0
	 UoV4WNra9Vy73MhlJ3ASmBU4o10Hf3lpUGbyGG4lkgYou2ArOAGOFjTYynM/rX0ANf
	 phE06lz3eYlJlkQ2aTII4VpgkS3Vz2YTIPbOKWznNlrDbVRhPHzzbyU3BP2nCfmGlM
	 MNR3MIulN8m7+YgqVMz3A4lOInz0wpRi5GAnk3hLPjCTJpiWMbnta4CivJixzmBD87
	 uGbIk2L0iHeuw==
Date: Thu, 27 Feb 2025 23:22:36 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
Message-ID: <Z8B1LDT-n2XTTp8q@ishi>
References: <20250211151914.313585-3-csokas.bence@prolan.hu>
 <Z7h0AXV1zlgp9Nw-@ishi>
 <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi>
 <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi>
 <20250227135330.GC182392@tpx1.home>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="apdPA/3mp+t/HXU5"
Content-Disposition: inline
In-Reply-To: <20250227135330.GC182392@tpx1.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062242_472910_8161B581 
X-CRM114-Status: GOOD (  22.09  )
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
Cc: Jonathan Cameron <jic23@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--apdPA/3mp+t/HXU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 02:53:30PM +0100, Kamel Bouhara wrote:
> On Thu, Feb 27, 2025 at 01:59:57PM +0900, William Breathitt Gray wrote:
> > Let me make sure I understand the situation correctly. This SoC has two
> > Timer Counter Blocks (TCB) and each TCB has three Timer Counter Channels
> > (TCC); each TCC has a Counter Value (CV) and three general registers
> > (RA, RB, RC); RA and RB can store Captures, and RC can be used for
> > Compare operations.
> >
> > If that is true, then the correct way for this hardware to be exposed is
> > to have each TCB be a Counter device where each TCC is exposed as a
> > Count. So for this SoC: two Counter devices as counter0 and counter1;
> > count0, count1, and count2 as the three TCC; i.e. counter0/count{0,1,2}
> > and counter1/count{0,1,2}.

[...]

> > Kamel, what would it take for us to rectify this situation so that the
> > TCC are organized together by TCB under the same Counter devices?
>=20
> Hello,
>=20
> Indeed, each TCC operates independently except when quadrature mode is
> enabled. I assume this approach was taken to provide more flexibility by
> exposing them separately.
>=20
> Currently only one channel is configured this would need to rework the
> driver to make the 3 TCCs exposed.
>=20
> Greetings,
> Kamel

Skimming through the driver, it looks like what we'll need is for
mchp_tc_counts[] to have all three TCCs defined, then have
mchp_tc_probe() match on a TCB node and configure each TCC. Once that's
setup, then whenever we need to identify which TCC a callback is
exposing, we can get it from count->id.

So for example, the TC_CV register offset is calculated as 0x00 +
channel * 0x40 + 0x10. In the count_read() callback we can leverage
count->id to identify the TCC and thus get the respective TC_CV register
at offset + count->id * 0x40 + 0x10.

William Breathitt Gray

--apdPA/3mp+t/HXU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8B1LAAKCRC1SFbKvhIj
K96KAP95x4hAjvqmGv/vhrxFE85qghATuE1a2iHerA9+GalG7AEAwcjujFxyipDA
pe7+An53rZV6GE3xweOLUY/MTzCV8Qw=
=1Axq
-----END PGP SIGNATURE-----

--apdPA/3mp+t/HXU5--

