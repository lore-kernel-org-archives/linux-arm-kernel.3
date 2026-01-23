Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3C0D74ED8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 14:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o5YTXRGY+9UZuU962mUgRVUGN8VhngZHik2ZnVcn+4=; b=c5mDUnd5vIIWmolg11XIVEcgmc
	qXThLFasz8whVvD5BjL3jorQHWUyBJjs6ngWLbfPYkoNWxLDwSNy895wrW/SHZJfibAHcJnzNVlEm
	lNRlXSPb9t+cDS+WMF83zDRmq6l1hAaVO6AysNTOzzcH2T33ze/4Hc/6l/7LNNl/J9A+ayMB83/eM
	uvVsonq+1+PC0UZsMpYMfr0lGLerhaVBQ7O5eMawQKJofnw5nFccTHnRN42ccNxeU0a4Ngw0tb2U3
	QsdEpY9oVg9RmMpci4bEZShrj5dQwStnaUIfa1NXzgtWPhSjohnznylwJI21tx5coJLGNQjLBSj9F
	WeqNM/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHxy-000000091GA-3DqS;
	Fri, 23 Jan 2026 14:16:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjHxw-000000091Fa-1Nxf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 14:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BA24405B8;
	Fri, 23 Jan 2026 14:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF063C4CEF1;
	Fri, 23 Jan 2026 14:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769177807;
	bh=Lfix2m7CHWR4q/4Ot9pPOvmNqObBdgXIVfhxOl5b3uY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQvr9df4pGkqey+o4bkEBtdj5qVuYvbinZtdsqULTu3EzgMnfLbyYFOUWeZ6evWWu
	 mQHxhIgMLk2YPmshlww1igGtvnsL+oDKlZNxDat+5Czy4zjDpJaX0g9sxOZj1T4DbT
	 dIiKq6dH/Swy3MlUJUnKLw+QM0KPmOMXrhpNIaAmwNwDWeXDxna7u2tQxku5jFJFH1
	 +rfGjL4lqBqks0ALw63aqrWUXTaVCjczZfxVKXIiGc7UjVm1ivWf4HwlbRw9diJXhW
	 CrfwhPIueyn2DKNl2bSY+tMom2tDJ4wpp7ZgADFZ7Xv9K6T65Ngku7pEfYbxrnI7I8
	 LExcG8EFGi+YA==
Date: Fri, 23 Jan 2026 14:16:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Andrew Lunn <andrew@lunn.ch>, abdurrahman@nexthop.ai,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] spi: xilinx: use device property accessors.
Message-ID: <0b74efaa-5ba3-432b-ac96-3a822d9d8853@sirena.org.uk>
References: <20260122-spi-xilinx-v3-1-8cea20e82f0b@nexthop.ai>
 <d6c5547b-0426-40d0-85b9-b64f183d37b6@lunn.ch>
 <ac0c9ceb-0c34-49f2-a486-1d87e488f607@amd.com>
 <a979b1eb-87c9-4c08-8d30-0fe18ad07a26@sirena.org.uk>
 <c0310e06-4a50-47e8-9de7-581eff6f53ec@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XqqYRgKMyYD36KE0"
Content-Disposition: inline
In-Reply-To: <c0310e06-4a50-47e8-9de7-581eff6f53ec@amd.com>
X-Cookie: HAIR TONICS, please!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_061648_387950_C8BD1AAC 
X-CRM114-Status: GOOD (  23.87  )
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


--XqqYRgKMyYD36KE0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 03:14:22PM +0100, Michal Simek wrote:
> On 1/23/26 13:40, Mark Brown wrote:
> > On Fri, Jan 23, 2026 at 08:11:47AM +0100, Michal Simek wrote:
> > > On 1/22/26 17:18, Andrew Lunn wrote:
> > > > On Thu, Jan 22, 2026 at 09:00:29AM +0000, Abdurrahman Hussain via B4 Relay wrote:

> > > > > +		ret = device_property_read_u32(&pdev->dev,
> > > > > +					       "xlnx,num-transfer-bits",
> > > > > +					       &bits_per_word);

> > > > It could be my grep foo is broken, but there does not appear to be any
> > > > users of xlnx,num-transfer-bits and xlnx,num-ss-bits. So it would be
> > > > better to just remove them. There is no point Maintaining an API
> > > > nobody uses. And it would be silly to spread that API to ACPI if
> > > > nobody it going to use it.

> > There are no upstream users of this driver at all so obviously no use of
> > the properties.

> We are not wiring this driver in any DT because it is soft IP but it doesn't
> mean that it is not used.
> But as you see Abdurrahman is able to use this driver is one configuration.
> These properties are stable for years and well documented.

My point here is that Andrew's concern about there being no users is not
relevant.

--XqqYRgKMyYD36KE0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzgsoACgkQJNaLcl1U
h9C/BQf/X1Nw6y1gy5HtlP23Kb88LW8EdZkFkQWDOyHnDTSAp+LR0evZ2GVksMDj
zVApyJieSvqNYpp/cUncQrxCvvcGGLoXi1Urc8E5ywkFE7940tt94AL1SmdNxZpy
dO0bsnnLaxFTF/rM6OJH91bCEsbs7g+fe3CJ3Rc+ZffCo+S9P/qUrCa5IRW7u8Sg
vbVrhlX4t06ZgpRtvjBOCfHDoxEPK1tfaiHz2qGhTAV+FsnnCWBxSQchOdmhCZ4B
DCWto5MNFprpNXKEbaeb1oaL7bE93EBNIwLfpN/EIGaIvzdE46PZR3dqgiRa2hEC
srVy4hUKFuX0IYfHNbGOdmoPwv0+vA==
=MGGo
-----END PGP SIGNATURE-----

--XqqYRgKMyYD36KE0--

