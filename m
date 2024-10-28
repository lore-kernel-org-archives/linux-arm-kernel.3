Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B61D3399B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF4WD82nuExUY2oTqv/evHaBCtuxzazXDWCQlk63cQk=; b=UQDEei2q6WezOQqDklxqvfOvQN
	YPjxgTmhRRatmvL4SHMWZCjhrmJCYocUGTeIWOLwKED4OgZObmoYmRIgxUlU5yIJ9J1PYfb0JgbOn
	Gw2sqxtosKV3aHjD5EFSi8OzqGjiLixd6/QNjXk4pja14Vt0Xoa89T/UIzHFdHUa0nTkemU62aehk
	jt9BCfzQcibk/thJU04yz8mSWgTOuJp1B9qg1WLBrVhznF1CRElTC44JocSs2S1qqsgZlbwMM++BZ
	ZIJnZ0cw5pHhlhaXlO+Jf1oumudiNqgpYCrLwuuQEWLQcGFGLjuMnSn9O+P40g6vutdozADKICu1+
	/12V+i7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SCI-0000000BPFE-41Gh;
	Mon, 28 Oct 2024 16:02:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ror-0000000BL4G-1Tv9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DF835C58E4;
	Mon, 28 Oct 2024 15:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE5CC4CEE4;
	Mon, 28 Oct 2024 15:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730129891;
	bh=mpanH/RWOt6jLt75EsDkjLmF7diSzO5Zc5R74hVVK3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSfqeO5DgLutgeOAsan21AgHmQaNB3PavNFf5zVhKjB5mzhdvwix65XNleZfMfyZp
	 UOlHwo7EpgePECjRES+XACp9GDQeTQNPwo7QfhthwNGJEBbx6BoGj9GxxlubSANJ+j
	 74T+gLLpQfOWPOPCxesJSJsylIn0f+xlwNjxO5D50ftOwCCD0aHwtojQvoDI0nRvJU
	 Mk6NZe3jvf3Hx7GasCfgPACdjofRf0awBrfyuzBb/ngtohZqLLeeSPqElIDsxUx2wp
	 1C/ECszxo/bYgqXJH/dvrwM6kJYWS66FVCJ8bK6AmTwYu6e2Fn2IjB6K73vCKbJ5Q9
	 HdQZZTlGpYhNQ==
Date: Mon, 28 Oct 2024 15:38:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] kselftest/arm64: Test floating point signal context
 restore in fp-stress
Message-ID: <3f3f3807-a363-4847-a543-c97f2f405ce2@sirena.org.uk>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
 <Zx-fEtzrpxrL4N3_@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mzPAUqQv9GMuniFg"
Content-Disposition: inline
In-Reply-To: <Zx-fEtzrpxrL4N3_@J2N7QTR9R3>
X-Cookie: Remember the... the... uhh.....
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_083813_506972_97E68025 
X-CRM114-Status: GOOD (  18.65  )
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


--mzPAUqQv9GMuniFg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 02:26:44PM +0000, Mark Rutland wrote:

> 1) We only singal the tasks once a second. Dave's original shell test
>    script hammered this constantly, and it makes a substantial impact
>    actually triggering a bug.

>    Without these patches, I hacked the fp-stress.c main loop to trigger
>    a signal every ~1ms (by reducing the epoll_wait() timeout to 1 and
>    scaling the overall timeout to 10000 accordingly), and those changes
>    make the tests reliably trigger the "Bad SVCR" splats within a few
>    seconds after a few hundred signals, even if only using the SIGUSR2
>    tickle handlers.

>    Can we change the fp-stress.c main loop to signal threads more often?

Yeah, the once a second number was kind of pulled out of thin air (IIRC
I originally picked that for UI purposes and then added the signalling
later without specific purpose, I wasn't particularly referencing the
shell scripts here since I never used them much).  I don't see any
reason not to raise the rate, we do need it to be low enough to allow
the main loops of the test programs to make reasonable progress so
miliseconds feels like it might be a bit aggressive for a fully loaded
FVP configuration.  That'd be a separate patch anyway.

> 2) The SIGUSR2 tickle handlers are left behind.=20

>    Given they're unused, it'd be nice to clean them up.

I don't see an urgent need to remove them, like the SIGUSR1 handlers
previously they're not doing any harm sitting there and could come in
handy when debugging things - the programs get a reasonable amount of
use standalone.

--mzPAUqQv9GMuniFg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcfr94ACgkQJNaLcl1U
h9Bt8Qf7BLploh05661KJyynNHiasO8b4194O/dwPlAmnt36eJcyNZyCIueWYCqT
CURcNmLPc/fJDDdvxKJXYexiXR37hdlXQqCSt8XrJSuN6fTRKyaLRFSo+vT1iwTx
3+C5JfP3CyV/0rYSpTf/eTrydoMmi8D4nIQrv3ku/R6SienpKbiDw0yl7utB7Drd
sp27NmviihfB8TO4/KPEqc6BWZC0D6C5v5g8PWDIevJYTrVuwXpe+/oWHRoHmgov
7HlOszL2j/Wfj1tNWd78aWfBUvx55GLxfD6+C+KNtzLpJOSa95vd20OswejobhLS
VRdWMegRkT77RmlnRdfU46K04sLC7g==
=w85r
-----END PGP SIGNATURE-----

--mzPAUqQv9GMuniFg--

