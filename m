Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5762DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 11:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=asK2sRf6C2Innf5tCA3rGjkT06bvSeIo+EwUdsCsHXk=; b=ewS0g5qaBOpiODy54rRllUX1Kg
	XvXeLER1adNWEi9liKmkR8J8jT23xWtftyDErXqajscLq86uvyRC0bgw3pv616EpJuaHQGM5VASkD
	28u9vthsg6Bz/kja6ge3v1imuyHxNw4IYyVUl7Ssr3Kz+QbaLvZD7i7jUTIrVnBSGN8PsTU+z9jaM
	Upee/8SBjC5Cmcd4hKUYGg5KCUTgKk+o7zZGvXaw8kDScbxEnUPuJ8pXFLd9noUYMNVOFPSnCpSzV
	+sr2ZGZFa7YgUrtTzuLzJdEFkRRFuDpJSAQokPgPht3FppUg/BDndpuvtY0KlwbnGluAO0jFlDfHh
	egNeWHEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNZz-0000000DCfn-0BPQ;
	Fri, 21 Aug 2026 11:38:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNZx-0000000DCfc-2FWy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 11:38:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F352460008;
	Fri, 21 Aug 2026 11:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1A31F000E9;
	Fri, 21 Aug 2026 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787312312;
	bh=asK2sRf6C2Innf5tCA3rGjkT06bvSeIo+EwUdsCsHXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f99L/XtGP1f7TT+Wy3ciJQLYdr9tFWa+gdlKUQkowqFU40Xy+hJLr5eB68VxEPaG3
	 7N2eSx1IlcMiHQwcrkjrPc2gDzQdP5il4f4zowsIzv/Vme6LvmgbcSNiHrb9arzwvT
	 F5+0LVG5yrNeeCbHipkLJ/bTDaAiKPpXNJt6xqhLfzQNkbnQ3GlSknmwly+MdlW/8F
	 phqlYPEX7T084ERpR2Pn/KeELDLomef1/Hw4MWjJmAFA6TJ6j4Sv3HIjtD+qwLfiK0
	 j6oNjrVym0gYdWhgGXau1OGtWzlHYfjQVMsRbKf8SdaAkndZCfA13mNpe0C/zn73r8
	 HXYNFYBnkVMzA==
Date: Fri, 21 Aug 2026 12:38:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
Message-ID: <1ea35531-7d69-4c57-af16-e887e852735c@sirena.org.uk>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
 <aogSkJxWf9QndjuE@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Kw4Yk4XN3KV3U5E/"
Content-Disposition: inline
In-Reply-To: <aogSkJxWf9QndjuE@arm.com>
X-Cookie: Package sold by weight, not volume.
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


--Kw4Yk4XN3KV3U5E/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2026 at 09:55:44AM +0100, Catalin Marinas wrote:
> On Thu, Aug 20, 2026 at 04:33:26PM +0100, Muhammad Usama Anjum wrote:

> > +CONFIG_SYSFS=y
> > +CONFIG_TMPFS=y

> These are all covered by defconfig. Are these fragments still necessary?
> Or are they supposed to work on custom configs? If the latter EXPERT may
> be set, hence the PROC_SYSCTL above. You probably also need SHMEM.

In theory, yes since people might not run defconfig and it's supposed to
show what's needed for the tests.  In practice people don't usually
bother, especially not for things like those which are going to be on in
any reasonable config.

--Kw4Yk4XN3KV3U5E/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIOLIACgkQJNaLcl1U
h9COAwf/T/9AZMQTnBsmw6u0/45ObTEmP024W7EPWkw2fMtMwk2Avr0iXoVMPnCW
Rc3A1eeuN+qDeaM1ahCcAW8t1Kknh6ptUeRNyMHaoJqQXAZuEl2cf7vosm2s7NXm
gxwnamyHYZtRr3l+T+vl4MmThq5gES7Yo33PvQHmuc7eV/+pVHMFWzP7fzZB7DhJ
2YOdsXG3uqYA0fNNyW+0Vg8ST7hEyBdh5WaOz2QBe5FHnFiklsIVKA1JA9mXlhs+
jZh17TPWHOezx1GCDv8E8BjeRzUO2fdDYcX6uIFBZoN7cZaKHb8461+gYOdbyHr5
ERqSjHd9HRey5Gt85AiEv32nBDgoNg==
=F2rd
-----END PGP SIGNATURE-----

--Kw4Yk4XN3KV3U5E/--

