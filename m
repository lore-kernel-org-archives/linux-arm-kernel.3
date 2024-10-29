Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25014D3A67C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqDMydLf/cDTPbV0akLqqb6PaeTVceZ+2GxbnVChU8I=; b=DNatqriLlU+GorIlnP5i2fJCnu
	Z8CFJItGrfnFrym9qRWJyvBvLsVgczzd5YNQ/0ip/Po55GqhXu9b72v+oD/C4ZrrsBoKl3vJliTJD
	bas9BvnANSXzSdFx4jYtmNz4w72v79SYxNyVns8uprNBfQFZPetfVveplwziuBwdSj4pVnYZrvqWR
	ftu8wu+j+w/4mKK6DdqKjOjFhm8dac7NAXKeR4FBAK7voTuz92LuJz0uWd+khYAzg44nQzJbvqdVN
	OZfL2tRtSKBr580mVy2tFLPlxhk+j6ZiLnLo92T39CmNNl6M02w3fUYc3kFLk5n2qMfAIy197Vxh6
	oHpx8zSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rGw-0000000FZMO-23Mq;
	Tue, 29 Oct 2024 18:48:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rCk-0000000FWZC-1xJv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 18:44:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5C7E0A430D3;
	Tue, 29 Oct 2024 18:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E63C4CECD;
	Tue, 29 Oct 2024 18:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730227472;
	bh=SAzb5sox9WkQjVEsLFYFCAyGjvrQ4IUcSchM6PkjN0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUUydWmogXGqgt61Ed56Zb0+2midvytHivx01SyirWhMvRR9l5e98qbjWQcVSU93H
	 yIioJsr1mk/6GI6dvuHVoBtEauruZory9RcwC99PyEc0BLarSuiqMvq7Fw2+gZLoGo
	 srqJuvMEyUZq7lXiZRCenU1s8uLKaXVScpsbtuefYfvVTSPcjkjc8LtCD2WDh4ia5a
	 JcSq0osRK+0h/QAKJ2X/TwHgU4vO/PadTYZsffhhTT8zQYnF4lSvGBdpZ3uyPWTpuj
	 /TTRzwn2fJaA1G7jL9xJAX0bZSRUp0HhKhv3Or5i7OhiPxFTL/5xH4j3wGOU7zb5mU
	 46K9dL+P+6YMQ==
Date: Tue, 29 Oct 2024 18:44:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kselftest/arm64: Increase frequency of signal
 delivery in fp-stress
Message-ID: <92fb0694-7a55-4e2f-9b59-8263a9dc58bc@sirena.org.uk>
References: <20241029-arm64-fp-stress-interval-v1-0-db540abf6dd5@kernel.org>
 <20241029-arm64-fp-stress-interval-v1-1-db540abf6dd5@kernel.org>
 <ZyECqagB1tGdE4uz@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TBVH/4Eq+53Y0zo/"
Content-Disposition: inline
In-Reply-To: <ZyECqagB1tGdE4uz@J2N7QTR9R3.cambridge.arm.com>
X-Cookie: May be too intense for some viewers.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_114434_653160_60F924E4 
X-CRM114-Status: GOOD (  22.80  )
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


--TBVH/4Eq+53Y0zo/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 29, 2024 at 03:43:37PM +0000, Mark Rutland wrote:

> On those emulated platforms (FVP?), does this change trigger the faukure
> more often?

Yes.

> I gave this a quick test, and with this change, running fp-stress on a
> defconfig kernel running on 1 CPU triggers the "Bad SVCR: 0" splat in
> 35/100 runs. Hacking that down to 5ms brings that to 89/100 runs. So
> even if we have to keep this high for an emulated platform, it'd
> probably be worth being able to override that as a parameter?

I was getting better numbers than that with the default multi-CPU setups
on my particular machine, most runs were showing something IIRC.  I do
agree that it'd be a useful command line argument to add incrementally.

> Otherwise, maybe it's worth increasing the timeout for the fp-stress
> test specifically? The docs at:

>   https://docs.kernel.org/dev-tools/kselftest.html#timeout-for-selftests

> ... imply that is possible, but don't say exactly how, and it seems
> legitimate for a stress test.

IIRC it's per suite and there's a bunch of pushback on using it in
default configurations since the selftests are expected to run quickly
in other cases where I'd have said it was a reasonable change to make.
Stress tests are not entirely idiomatic for kselftest, it's supposed to
run quickly.

> > +#define SIGNAL_INTERVAL_MS 25
> > +#define LOG_INTERVALS (1000 / SIGNAL_INTERVAL_MS)

> Running this, I see that by default test logs:

> 	# Will run for 400s

> ... for a timeout that's actually ~10s, due to the following, which isn't in
> the diff:

> 	if (timeout > 0)
> 		ksft_print_msg("Will run for %ds\n", timeout);

> ... so that probably wants an update to either convert to seconds or be in
> terms of signals, and likewise for the "timeout remaining" message below.

> Otherwise, this looks good to me.

Oh, yeah - we should probably just remove the unit from that one.  I
never see it due to all the spam from the subprocesses starting.

--TBVH/4Eq+53Y0zo/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmchLQsACgkQJNaLcl1U
h9Dekgf/QkHHsQ5rnbl08prEV71y4ezYroRyWdjmWLGIbc9O9QxlMOEPprNm/+52
dLrCllyWV3SdcuV3PPCGwUg5VmCSSMClhi9Dui99rAQPz3Qy/pZ4lV4sccHRJUo6
xewGn83e9Lvelm5ahj9/BN/u6u6A9Z3kjHep1jKlN0E9eT3Vgwc2NbBnr0RMTXmT
RbDIiYb8M9JYOPZwbeV/D7A4+z3A4Zh8iA7uf/6xW7hFuq7UrSBgz/E4gsc9jC5R
rlvFLaJXZLvrOJ9W+1pNyENIEnHZuey5Ed4F1HkwyACF5XNrIs7s4Hkrrq6GSUsL
iIdAbaU51VDdTewqDTx/RFwS2aBWyA==
=CAoX
-----END PGP SIGNATURE-----

--TBVH/4Eq+53Y0zo/--

