Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9CFC56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSn56+DYSOXJ2iZ1w5qn43Y5g5CMEdHdImGwx9YHxy0=; b=Gu1McDyVm7K3uZBB5gAy8bl2VU
	FPK1utWjUsUyFtNLGq555DstQ1ZSLxNm3PzybQCKa3MOs6Lo3kPqKtvR3MKkTxW0yFbdIb74+VHN6
	L8bktef5bg1Mj/rISV0KVuvOxC/bk7aU273TH6W4QgcKrId9JzL0B/Mb1slF/oRvfjCvLx9VnphOc
	MxBeLVbX8+hWRSTUA6XpmrareX0EZaLXxZ+6iRE1Ed3Wj22hFPlUNBIXGNknY9y3lsYF9VIu65D/Z
	UxoEoYbJxD4AqN5J4VgShRLeWaWLCSN7OMePw0DyTfEyovXW6afdGtAG2MZ5l264qoaYQo+rOrhun
	QoKxENPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxke-00000005qOK-0zfX;
	Thu, 06 Aug 2026 13:03:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrxkd-00000005qNp-0u7K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:03:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C8D060A5C;
	Thu,  6 Aug 2026 13:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9EA1F00A3A;
	Thu,  6 Aug 2026 13:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786021389;
	bh=JSn56+DYSOXJ2iZ1w5qn43Y5g5CMEdHdImGwx9YHxy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VAqR/md3lY0Np7J5g+7PCy9Kv0s3ffF940IHzM16KmiNsQjNvC+mnpv+TTiC+nqlO
	 wmKXklNzOFsqWN34MogqyAgG2KVoMqXZoRqyGLrUwhednBUCl1jvxK3oyfT7pnKM2t
	 69DATYTJByZg14XIazIH+HcyTTxZ2mnIMebstBKku50uebtJwJ0+kUOlnXPBDX9uH9
	 TOPkaCzAquD3+NmyS+u/yplt4GxOLAx88aypCBbt1jIGzcZauxE0XbUAqLsOB1Q14K
	 E0MxTXFKMGYSSPFrEbuWM7QsuCd9rxpNXBcR+vEaDtY3K6UhvwHSxeh9mQdgnRbW3+
	 vCQOUA9j0gZ1A==
Date: Thu, 6 Aug 2026 14:03:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] kselftest/arm64: Fix abi test compilation errors
Message-ID: <7dbf3b5d-aa34-4bc6-b0b6-a289b9cee61e@sirena.org.uk>
References: <20260806111546.42042-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yq0d5faj/qF8uiCc"
Content-Disposition: inline
In-Reply-To: <20260806111546.42042-1-ruanjinjie@huawei.com>
X-Cookie: Brain fried -- Core dumped
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


--yq0d5faj/qF8uiCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026 at 07:15:46PM +0800, Jinjie Ruan wrote:
> The arm64 ABI selftests fail to compile due to missing include paths
> for kernel headers, causing errors like incomplete type struct sock_filter
> and implicit BPF macro declarations.
>=20
> Add $(KHDR_INCLUDES) and -I$(top_srcdir)/tools/include to CFLAGS
> to resolve the header search path. Also remove the hardcoded __NR_write
> macro and include <asm/unistd.h> to obtain the correct syscall number.

This should really be two patches but meh:

Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>

--yq0d5faj/qF8uiCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0hggACgkQJNaLcl1U
h9C7QQf2NiOCySiDgot8UbZfwsitm689g/jkmP0vR2jilm7PzliJ0UKBBLwgWTEb
yaviBeyp6IAlYUj5JiJr0RPtcCOIiEJtHrMrETRwelnMF8S8YZ3WZHze+lMmyU7f
JmUPRmBZAHRVMSV/dpWDWDuw5/wNmJtEd75PODOh5hj1kaTJMY6YVzwR9a6qpKZx
1BPwBaXGK19sV7M1GRAp3gtVnQqkPO0+xUDwrlPZBaqdlH+Ie4Ud+kVmf+pnzfo/
WLJmo5c5Wv1yiKP4mABVeEwU3J4VG7CVV8iq0JDWPpx/OVYd9Cj8JKsgasAWWKFf
iMu7+iYxwy+cozuvSNExg2rIoXtc
=W9U8
-----END PGP SIGNATURE-----

--yq0d5faj/qF8uiCc--

