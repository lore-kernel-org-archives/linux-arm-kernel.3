Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9B7CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xn9CHPNUMgXF5eWjO16T9pJS08WP8G7GaEcEU5LwiB8=; b=qptz/8JN92MoKeX74hm8tkbP48
	eXq6uN2+0jdLSvZFfeV130P61TA3F1c8ZcKUuyYJO2jXkwZ2No5v2Bzn09rI/qdagVTi0qGz6Knnn
	uw30TKcqW6og6bIlBpmMOkZb/ERj5laoKXvePmXk6GP8y0X8SmKnBWrnEUXGZSiFaTk/55J4S+asF
	PAXiazQysHswW7rj+pH0KA8HbJF1zB2011kCdueisT3DYO5PR13GR7Fv1s8WjaHV/bS7zZZfALIdu
	zZdADgIBp7p4yLRqLeHA7GyC6/8i5t2Vss7cpUvmiAk9XOAZCXJkk6MdvABBv0DCAWbSoy6DLZcEc
	Tv6LBKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE84t-000000019DO-1hx3;
	Tue, 06 Oct 2026 16:31:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE84r-000000019DA-2oUo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:31:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D49843C19;
	Tue,  6 Oct 2026 16:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDDBE1F0089C;
	Tue,  6 Oct 2026 16:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791304301;
	bh=xn9CHPNUMgXF5eWjO16T9pJS08WP8G7GaEcEU5LwiB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b85/A9a3zJ2tHjg+mxFnHhqHDk8/ARNUI3HXYA91FMKbk+Y1gyDKUZbuVv0keOsSE
	 Q7PmamlF0h2K+efxqkWvY5ZsUleMA3z0XaHm4rCSZMjN1W7dguK6lMmI/MiDtXQ/7D
	 gKvqAf3k3Qf0caa1PhzWlubj8aXCMS8+cGmhj+O1aErevB8pbtjX2NCF4teSTRaGpG
	 lU8Xh603l9OwjR/N87kXLh+9emfuOpwKKfOE6iUSw2FKIXiPSBhEsdCXuYj1HH2wMu
	 FCYGGE5iO9e5X3UZMoQcNkK1CeP48W8Rs2pCKHVLXdsOvGE1y7IGWGLb/kUZQzdHae
	 tWIgy2ocG9N2A==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id A1EA2185F3BD; Tue, 06 Oct 2026 17:31:38 +0100 (BST)
Date: Tue, 6 Oct 2026 18:31:38 +0200
From: Mark Brown <broonie@kernel.org>
To: Bill Roberts <bill.roberts@foss.arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
Message-ID: <asUiaocg44i8n3zA@sirena.org.uk>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
 <asUIWgHk3hdaLEu5@arm.com>
 <asUQdaTtMF1X_Hsa@sirena.org.uk>
 <8c425dac-11f0-4267-8745-d23d6391a6b1@foss.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mQTRuwMjDg3vLtjl"
Content-Disposition: inline
In-Reply-To: <8c425dac-11f0-4267-8745-d23d6391a6b1@foss.arm.com>
X-Cookie: Use the Force, Luke.
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


--mQTRuwMjDg3vLtjl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2026 at 03:49:14PM -0500, Bill Roberts wrote:
> On 10/6/26 10:15 AM, Mark Brown wrote:

> > I was intending to do something soon to pull more of this code out into
> > some shared place since especially for RISC-V and arm64 where they're
> > using the prctl() rather than arch_prctl() interface so there's less
> > reason for things to be duplicated.

> Bear in mind that I do have patches out there, for x86 that enable prctl
> for them as well. I looked into doing the lock check in the prctl call path
> before
> it gets dispatched to the arch specific backend, it does require a common
> interface
> into the threads feature bits that each arch would need to, trivially,
> implement.

Yeah, it'd be great if that could land and we could hopefully eventually
end up with a shared interface for userspace.  We'd still need some arch
hooks no matter what, but the userspace experience would be much more
pleasant.

--mQTRuwMjDg3vLtjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrFImQACgkQJNaLcl1U
h9Cixgf/Yp5k02jhKO4YyuzTdlCZv0IsZWojY0A5nuXSz/3heNezN/naEINMdnHM
EYGzPw8UvpxXITQslcXZf1gUFO92Of/y10abhv1HfKAqHoYY0ij44MrDT0gEUlXJ
oOKraAReQ7H1vb0mDB74Ynn6s/rM72i34Vv670IIy8JGSUWr0eY2QrdqxXadia86
F0xV3EpZ8xAcJloXGWAb0kxiDPIK56CkYcLixFWKSGS1cigDwQDawbYtvriCJASm
x/0+/uKL4rVA4YP7yV3SAj46XX9SoiXrh6p6KJ8VBd7OU1NfWZIP+6xaq2/1+/A7
ktwaeE0+OBTy9CRAlr7/reVtGAKYQQ==
=nqUf
-----END PGP SIGNATURE-----

--mQTRuwMjDg3vLtjl--

