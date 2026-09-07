Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55007C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgLK3o+julTVE6C/8v3utQVcxVTdU7XWXdzws8YaC20=; b=TmINlSW2OiYwyW99ztLZX0fmY/
	a0AngVULjlKFUSXuqmLfeCdGO7JGnL8W8IinyrvxtvQAjI/bNzWVLuRp2iigP9/1ZfsVcoO6WU0vJ
	mppPhzJWlIoAprx/ogdK+rMMUDPPC7WXJqbcmhTRDkq/Uhbs8I7uMWpKiYMlKDBJ5vZu3QJbw5H2r
	rRlaWoSfEJtES3RNLKQw44yL+V9Grj8qDLzjRStrTvpUWK5cK9GTdR12LMgP2G23Kxeo88QSATBNh
	OV353ArEVJ6VWrSQJ8eKLW5QJcovV1D8QqpcuzWf9DvtNntHaAsbDeBJjfaXgxLCLrX9qVRgzON92
	PbO++I9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZtY-00000006zxA-3UQw;
	Mon, 07 Sep 2026 14:00:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZtW-00000006zwm-47Ql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 14:00:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 476184086C;
	Mon,  7 Sep 2026 14:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 985261F00A3D;
	Mon,  7 Sep 2026 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788789622;
	bh=EgLK3o+julTVE6C/8v3utQVcxVTdU7XWXdzws8YaC20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gtOe0lI4tICmFeXO0VXaSZWun1zD97NtGKzB00Fxz4Ka/Zpm56GHzGCFmpkzXvwya
	 IjgdW5ASTJB+qKa5sg3xhHy+2z3Tif4EUzgG6v2G0AqXAMe/0BNO4ao6/A+PGKiEDt
	 LiunuR042Q+3iJ1jf+LikMpBoAosls+iqBo1ld1uAEuNgD3FyixqBGd1NK8XwlELz8
	 0aXr47TpsMtDRS4WsQVvIrdjIekWTZVzwY14LA7ppw9cLIVA/gJznyINUg586mqoJr
	 i4bMWj2QqqCUzgdxYWZPl2+vXlMSa8ApBf/xkklnj7o+nTfBb5pP16MUu53RogA7JW
	 PhrukphYxcyLg==
Date: Mon, 7 Sep 2026 16:00:19 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Rob Herring <robh@kernel.org>, catalin.marinas@arm.com, 
	will@kernel.org, rppt@kernel.org, akpm@linux-foundation.org, 
	sudeep.holla@kernel.org, jenswi@kernel.org, mark.rutland@arm.com, sumit.garg@kernel.org, 
	ardb@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Message-ID: <ap7CAowlFTFhSFP9@orome>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
 <20260902172436.GB1440252-robh@kernel.org>
 <aplF4NaoFk73d-c5@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ihzba4bzldpza5m"
Content-Disposition: inline
In-Reply-To: <aplF4NaoFk73d-c5@google.com>
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


--3ihzba4bzldpza5m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
MIME-Version: 1.0

On Thu, Sep 03, 2026 at 11:03:12AM +0100, Vincent Donnefort wrote:
> On Wed, Sep 02, 2026 at 12:24:36PM -0500, Rob Herring wrote:
> > On Wed, Sep 02, 2026 at 11:47:04AM +0100, Vincent Donnefort wrote:
> > > Keeping last-level mappings is interesting on some architectures as it
> > > allows mapping/unmapping pages from the kernel direct map without the
> > > risk of splitting blocks which, under the break-before-make rule, may
> > > trigger page-faults the kernel can't handle.
> > >=20
> > > Add an "ll-map" property for reserved-memory regions. When set, it
> > > splits the underlying memblock and sets the MEMBLOCK_LLMAP flag.
> >=20
> > Where is this documented? Any DT property must have a schema.
>=20
> Ack.
>=20
> >=20
> > Though I'm not thrilled about more flag properties. Handling all the=20
> > combinations of properties has proven to be painful. Can this be implie=
d=20
> > from the compatible string instead?
> >=20
> > Rob
>=20
> We need this before the kernel direct map has been created (paging_init()=
).
>=20
> I would have moved that directly into the driver lend_pool.c, but then it=
 is
> probed too late (unflatten_device_tree()).

Any of the node_*() callbacks from struct reserved_mem_ops get called
prior to paging_init(), so these could be used to manually set the
memblock flags in the corresponding drivers.

Thierry

--3ihzba4bzldpza5m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqew3AACgkQ3SOs138+
s6EXOg/9GV2dPaIR220HG9xlVLIy2HRX3X54lD7NjYUcMI5dH74ozC8XZ0/nWFsD
64xYzCwkpDDlOUBftQPPgM44IfYfqHh4kLJjur9/fq03owom1beg4m9zIVIw4dBw
ejIByjlSLI0Jy0xt5eQhc9VfpkfrO5/Oq44bkGKeBtuPRefpomIIcSV5C/aU8QDa
cQv6aVjg6ZR2XncJrS3BA53s5Zc9Khwv7/O/Lb85rppj7aEHj7newBIEakVNB4pU
lmOAY1Q3ckSBZ4xZkjGPGOc9eSMxdpXx7JLHPERWIXTz9qdumMHpXKT+WXUpRtgv
cYT/O3KlrdSOC8K8t/2/lXVQ3J4HKSxP3T+cxvoWmkPHSeE4w17I9+62IhX0V0n2
E3mxg820SetJTFz5VJAXV8QeheO/ZGqieBraWwvQcyDmQnqKddmQdFd8EuqKusC6
M4vCBNFLt2/XEDoir9Q+3zqiDVJW32wMboSGe4P6VPhW8ojvOs43jE1owQRXCuOS
Z3gqcw1c0fcxuvHYTEV77UI0la6H5DeWQJWJiolfJs74swqdx9Rp9sMNlqvGcHdS
dRb5ltaA1WoYYMBhatF1gLHeFoZDvcOfmzF0dSNNEUXgR6g26s3Y5bbTVkB6+7cx
hSybBcQOnVt7rYODTdksd+66a8PcOeXTzpy33pFoG9LaH9wWFbs=
=iMEe
-----END PGP SIGNATURE-----

--3ihzba4bzldpza5m--

