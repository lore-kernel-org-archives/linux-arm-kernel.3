Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E0AC71149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8CyV+PF8BRL83ZIWsXM0zFaOJ0SygyyTztJISXeQxo=; b=uTxqsFmjwgYIsKnwhpKTzaFJLZ
	xueWr3WeK0A9QegfjkbFeB4290hxAPNT1pG8IioWIWeNrtend8h42ruQK1vGClwbtHuQ23dBFB8vI
	co/nkHFo24vn5E0O/yggpavCKMDuV8ireXAf+qIX/fW8AsI1gRCHUN7TpB/sk8fTps6FZSNvEIr6P
	Yacugnp6ZSnxxQwRZxf6oaYu25kOUzW+Gf0CY8cuy8RqOwKH8f+DnvUQE2KF0WEVE9hEWLzfteOCI
	lK2jCpZb4qD7zNbDjwE20u4q8crPfsmmCA7PqzSGEzdwj1EsA9diZvRGuXHIL+/YJsIcx9jC7dMgE
	otKKE2hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowb-0000000EXd3-1urO;
	Thu, 12 Jun 2025 20:54:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjH3-0000000Dh1T-0VIM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 14:51:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F01995C65BD;
	Thu, 12 Jun 2025 14:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB208C4CEEB;
	Thu, 12 Jun 2025 14:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739884;
	bh=Xf7pA1iH8R0kEK1Bi68lYJUZWLTkVcu0i//GjSh5l3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G5izHmloGxfvmAKtxCBCGoWnKOObEAsaaMsON8o2BrhMNIpeBRzNJEeGl0QzTFC8o
	 gI6IqastNqKeSsjpXyrXuodJWf/N7uO1+qPu97R4doYc0SmtDbGTNr/1yq3eDMYaSp
	 0GF5dPC/nShzhzTStxALDZtWfcbly6QUpqwy54DZTgKVHwFgAHFfjS3kPzl1FJZiyD
	 MV5jAOGevgyzGynH/dH+sjyyd6L2Xn3OEnRKaMQCk0WPTN461x80nkraPr1OkL9lfA
	 heZh4hysHTNyR+UYAws2Crt7UTvYSgtmiR9Q3xvzak001Z0F+1OTMvT/aD/x7LiPiP
	 S8CuvVrWccX4A==
Date: Thu, 12 Jun 2025 15:51:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Message-ID: <93a0f043-d5f6-432f-ac37-266dd5bbe899@sirena.org.uk>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
 <aEm-F04k0sC1tOCp@arm.com>
 <4b354842-2108-4904-9294-fb9b00978986@sirena.org.uk>
 <aErokN0vKT3urlmA@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rl3Atc6kzOHHJTuB"
Content-Disposition: inline
In-Reply-To: <aErokN0vKT3urlmA@arm.com>
X-Cookie: Biz is better.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_075125_194574_FB8E22FF 
X-CRM114-Status: GOOD (  21.62  )
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


--Rl3Atc6kzOHHJTuB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 12, 2025 at 03:47:44PM +0100, Catalin Marinas wrote:
> On Thu, Jun 12, 2025 at 12:40:42PM +0100, Mark Brown wrote:
> > On Wed, Jun 11, 2025 at 06:34:15PM +0100, Catalin Marinas wrote:

> > > Another caller of gcs_free() is deactivate_mm(). It's not clear to me
> > > when we need to free the shadow stack on this path. On the exit_mm()
> > > path for example we have mmput() -> exit_mmap() that takes care of
> > > unmapping everything. Similarly on the exec_mmap() path.

> > We need that one to clean up the GCS for threads that had it allocated
> > for compatibility, you can see the leak that results without it easily
> > with the glibc testsuite (or anything else that does threads, the glibc
> > tests just spot it).  Most of the checking for arch_release_task_struct()
> > is verifying that deactivate_mm() is guaranteed to be called eveywhere
> > it's relevant, I need to page that back in.

> Makes sense. I think we should only keep gcs_free() in one place,
> ideally deactivate_mm() as that's more related to mm rather than the
> task_struct.

Yes, me too - I just need to double check.

--Rl3Atc6kzOHHJTuB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhK6WYACgkQJNaLcl1U
h9CXoQf9FPQfd8EjZCLMPaTNqdJWnK+Imm3M4iiBTWQPw5Cs4En1X3aPzX06av/d
hRgfuipMS/WRm1uJFcj/yvkijXiSwywItHs6CbK2TU+cMrxSvWK8Ilk1gCg2n8Ac
Kek5jAtdA5ROBw9UZGw5/4mw8utZOP2DlrXpImQtFEU9G7fxMup2ipqfAVcsIoHo
LgE680V/Gg/ytylXWjP1aA8YpMPivqTUu+bMmPhGfblUzCTj7BYsrqB+9PUtt2ly
3mDthSe6MCXKm3g01RP5ursX5bnui2kvTIgPoYINxwcEDLz/ELjVbSCUBB9yf/VL
h4FnRm1zAapoQ/K+wV+s7uLYmO5InQ==
=FkRy
-----END PGP SIGNATURE-----

--Rl3Atc6kzOHHJTuB--

