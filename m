Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185ABC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 11:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mv9MGNdagdS3wBGTXJa0g4MWWemM5cjEOv9c5OwVJMM=; b=LsKazdoYi5m1x60P0gseJCXi5z
	2Paj8DC02yrEU9a8McJplNA0lS7l4wj6q8obINIGBw/YluoNxenzrVurPvEiX/NGW5Aig6fOMRn9j
	EXZmYhkQXlEwFP1g8CKuPOIl2nIFaiz83fnSDwwgxx574LKOMf8lKu6i1ffPZzoLaxpArtZK7PWBZ
	fKrYskYkZ7+GLfZ9wWhmorPDG6SlmV4RRIufg/ouAXLmpNJlPjvkDNtZfuLuri34YxTRtEhefq1F+
	xtS9wjQ3TiVQeFqSMxENpYBtG1C5D037dnkVX/J3WhaDXjMeN0JbTUt7UukbhQjQT+yUhTGi4Nvvg
	q+htArUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjue-00000002GXW-3upB;
	Mon, 07 Jul 2025 11:21:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjRX-00000002ClX-2m36
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 10:51:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 747CA44F13;
	Mon,  7 Jul 2025 10:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE75C4CEE3;
	Mon,  7 Jul 2025 10:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751885486;
	bh=slOPMNTVA3FLhW65MdVR4aR/1OsxKkcOkNICbnYATJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2gp0c+Kgl9cK3ut2JrE9CJJHpRfc/LdGEG/KOkwFoNM2tzjS6Gpgtdl0j73+sA3l
	 LZwsIIdjoZpSq9M+0BVFvIwGKR1JqPaoR7U9MHGaE/emID7fM7KE/PBaFsrAorSWeY
	 JN4P/OYiUOkcrxwVcCKv5sxcle9qFoAB20AsVcPG7kFGveEiY3GOpd//CRrMONQQV0
	 uqHvM6G2urwFfMYi6kzPuvAZG0PHBfjO5h9Y9skbuZNTVec/17yQeJIujj30IJ2ubj
	 XcnvVsZaaVaAjIN3T4DxdS1Tds+5rN/lI7K9YHC19wsPJuzl7GRUxNhWK/YwleTjFf
	 /vtjzlcW+4Rjw==
Date: Mon, 7 Jul 2025 11:51:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <a5c902f4-6f10-4a1f-8d57-b232583e4556@sirena.org.uk>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
 <ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk>
 <c3deef24-fed7-4405-9953-804bff118c11@gmail.com>
 <8ef60a13-015f-4228-b834-799592342ae6@sirena.org.uk>
 <225eb39b-958c-4e40-96be-272a8dc9ce12@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6IZozApVFuUcVoyp"
Content-Disposition: inline
In-Reply-To: <225eb39b-958c-4e40-96be-272a8dc9ce12@gmail.com>
X-Cookie: We are what we are.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_035127_747115_45542751 
X-CRM114-Status: GOOD (  23.54  )
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


--6IZozApVFuUcVoyp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 05, 2025 at 05:41:17PM +0300, Laurentiu Mihalcea wrote:
> On 7/3/2025 6:25 PM, Mark Brown wrote:

> > This also appears to be the source of the boot issues I mentioned on the
> > EVK, affecting ramdisk only boots:

> >    https://lava.sirena.org.uk/scheduler/job/1533032

> > as well as NFS.  The board seems to get to userspace but then not
> > respond to serial input, it looks like it's hit something while loading
> > modules and locked up but ICBW.

> OK, this is very odd. I've tried the ramdisk boot using the files from the CI job: Image,
> modules, CPIO and my own flash.bin (u-boot and ATF hashes match those shown in
> the CI job) on an EVK board and so far no hang.

It may not actually be hung, it may just be hitting long timeouts in
userspace (I notice that all the boots with a NFS root are doing module
autoloading, and the ramdisk ones have tried to bring up the network).

> What I've noticed though is that the bridge does indeed not get probed. So, for now,
> I think I'm going to submit a patch to enable the driver config in the defconfig so
> we can get the Verdin failures out of the way.

If the driver is now required then it does need to be enabled.

--6IZozApVFuUcVoyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhrpqcACgkQJNaLcl1U
h9Dwlgf+KcOwF5vR7PuxEJNsgZjoa9GnoGnVh+0CPAuGUe3yEo9/PeR8jVAdVjyO
gdI8ymNYVm+xOaeRJiIgxFxA/CocttzXKGcw23uB5cM9hwaVkAmOaoqLVE+ef9xn
hNu96YXWRPNskp5mB5d5WQcT/rfid/iaAzpCWktqFMLvZmzjaTdnSDDdJ1eqbUqL
kgpSxE12xPns8/o8SPVU9rB7ShPuc16AdOJ5phCrMNnfnu0IAVTTpQJpr8LZhV9M
MavTiyLgRI7EMXGXfQrxgRl8mbCIAe08ESsIjjNf+UB4nwXFZIAg00h9xqHt2LXp
6sqF82kfizbNMybb9BmMbzXehQoUCA==
=xYTV
-----END PGP SIGNATURE-----

--6IZozApVFuUcVoyp--

