Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD87C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TTwQzlhRs37zq41FBmSpaMorQUxrV87sLo89EafKEc=; b=u1dozPA8lAETWM9nnrvcJgwBZV
	grXLazmlS1qL8W6lAz39MGVaTiQgtYJig6APBtn7nTIfGdF9CcmmtUX1CkCyU9A6o7zq7JxIORMxZ
	5+rs7F0odkm6MP392Eujjh2KDOHksyiCNH7wkQ+ls0JNaaVeqdQdRhGmAH3dK0LLAW10+urjboMMF
	FkgDNXH/7XrCP0mptcVyXROi9ehCcBV6DO7mIZr6CreGGpbo0E74WmS7NqWVd54SdwONB5B7FKHht
	YxsBINYADrZAF9qnC15B89u7FjazJIBN63a4zzFncxm/aAkMJTZLOOU2WqbmjXHfNTGBoW13IMojd
	m8fmlcpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXJDN-0000000BMBM-0cqo;
	Thu, 03 Jul 2025 12:38:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHy8-0000000B8fh-13nf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 11:19:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B8F05C628D;
	Thu,  3 Jul 2025 11:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35068C4CEE3;
	Thu,  3 Jul 2025 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751541546;
	bh=nyCHXu44AYG125jm9G4lxVXvhWsTPk95gOqRhQ+06NQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fe3QCXwDlnP9CTt7wsSz3leRINY1NfRDcuUqgjhzQjbVEX2TU5IlTrFXp8DoZrtk0
	 C70I6Hk7cBHS7fE/SvXIpvfMjRKAzsA/ildfa6+PCtSSHVkcgYiooXTGxZUzwvb94D
	 7p/c5slT+/29VUHj4OMrMa7FE5xU8x4XUvYS68LdRZpUDLcRm+Bd3jMrPhA14T59UO
	 At0u2pD4ESSRcZY4QNGxRxGUVaI81nSVO135BXF6tWXIJwVb1y9IMWt2qQHHIteDyy
	 JuWqneQo59bdxnqVlWCz/MqC/NvJyKojZ+6/Lgdp2EezsfcePI2N0XF1XqO+nMWlmc
	 XsMO8GZBY+ncw==
Date: Thu, 3 Jul 2025 12:19:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Willy Tarreau <w@1wt.eu>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Christian Brauner <brauner@kernel.org>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 3/4] kselftest/arm64: Add a test for vfork() with GCS
Message-ID: <6aa6e38a-c874-45ac-b2bd-c876cdd9c8a9@sirena.org.uk>
References: <20250610-arm64-gcs-vfork-exit-v2-0-929443dfcf82@kernel.org>
 <20250610-arm64-gcs-vfork-exit-v2-3-929443dfcf82@kernel.org>
 <aGZd0vdu8PpLKfX1@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rGV4m2bsRAZx+JSb"
Content-Disposition: inline
In-Reply-To: <aGZd0vdu8PpLKfX1@arm.com>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_041908_338257_DDAD5C5B 
X-CRM114-Status: GOOD (  12.07  )
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


--rGV4m2bsRAZx+JSb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 03, 2025 at 11:39:14AM +0100, Catalin Marinas wrote:
> On Tue, Jun 10, 2025 at 01:29:46PM +0100, Mark Brown wrote:

> > +		exit(ret);

> Should this be _exit() instead? IIRC exit() does some clean-ups which
> are not safe in the vfork'ed child.

This test is written to nolibc so that we don't get any of that libc
level stuff, but yeah it would be a bit more correct.

--rGV4m2bsRAZx+JSb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhmZyQACgkQJNaLcl1U
h9C3sQf/Zjyv/4tU0gG1+behcSAImRmsr++fqj4ba2/X9B+mbKG26y3hkGkNQ6eT
HhNBykYnmsG5nkBA8IEQ4sq8dhZrQ5HOs6k/Ez+n/ibeHm0GK024XG6qmUTEZ1ST
5ibrqVltjCSb6x4wBVpLm/zdQAR06toxHvUdA2Dk7dvlUUNkP1A+fmXdPC/F7wTl
MvSrq0LFIBJj6Ig0MC4BJorezR5en/omZKFJflypCmelM3CVsw1e6yGWpr1lm9cb
QFPLB3b50mtHcnspolCOpcbqpY1Io3mopOGA/Lasjs9L9tJ30MAGgRKNlrLy4Yij
5e6452XWIEVfUcKmLt79G8xYOi6K2Q==
=nUf4
-----END PGP SIGNATURE-----

--rGV4m2bsRAZx+JSb--

