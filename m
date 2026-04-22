Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BBBFA1FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 19:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITLENIaPFykq9GMWzScULhWs+yy3WaLAezNKQpJL/mo=; b=GPtIYourm2Tb/pEH66sDwmQvqv
	DV/8btXC4+1EwcRjPY11kCwF+WfA4GPjVzJ7W5WfFrbKO7fNmW4vMToW0vChpjtLOqFfU0PhLNffv
	9ZbWrptLfn8SunFv8IowKgl8fOOB9fbWNZBFJhmcjCcMC8+6QHpzWZfe+dsoRh8vfLnqH+9SRa32A
	wGpz2nFgqm25nU7y0lGl+In/03m3M2vYyoc6KViLWeBxxIaE9lfFH49C+Tp69T0KNaFPc68T1LyeS
	Pq+RnShOcwt6HGeTQrrrdO5X7ntRTmBAwr92NpKzQ8JrP/xNdyCDcFxP4sdS4yxfFYk56bFBkOvbZ
	xuAvvb1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdbD-0000000AhIr-3BPh;
	Wed, 22 Apr 2026 19:51:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFdbB-0000000AhIP-2Hxf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 19:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE52244004;
	Wed, 22 Apr 2026 19:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8DAC19425;
	Wed, 22 Apr 2026 19:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776887460;
	bh=SF/t0lCLp8rxNBH3TmZkjwnIEQydKnrWCwsEMGKwoxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTjr74xA9zZuIHwpJXXpBFq+9my4ZktwT02TsS5McMxW6Ypgx1F2Xo5Pv4V9zg+Ot
	 92PAn3F+YoRTf44EQUZ02QIspqgdE0ZkOkf/HqpFfzEifU8AbTnGt5n8MNzK/xV2fg
	 LTcAz0oZxxEIYA+dNhnOwNlBV+gpvF55CmTgMSMHL1FmyBhUkZ2x6hicECAKphThGp
	 8rClcN41GWMzD5TUf/Uts9RmGRmqT0mw5FeQfzPoi1T0lx1gYvbm26HGhWaQvtTQX9
	 YpZ2uQ7d296PGSN972xZSxzA8sCbeCofC0Bkd6ZqOX4EpJT/kehexIZ8J6dWW9QF42
	 soZZqlJ0GWpyA==
Date: Wed, 22 Apr 2026 20:50:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Mehall <km@kevinmehall.net>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Mirko Vogt <mirko-dev|linux@nanl.de>,
	Ralf Schlatterbeck <rsc@runtux.com>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: sun6i: Set SPI mode in prepare_message
Message-ID: <f93e1bc6-608b-4c75-8b1a-80f701ff37ce@sirena.org.uk>
References: <20260420164755.1131645-1-km@kevinmehall.net>
 <66909301-ed23-4b36-8955-a69b64eed9a1@sirena.org.uk>
 <d199f72a-093b-41bb-b33e-b6685563f704@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZqhXwlf3qPSsVysm"
Content-Disposition: inline
In-Reply-To: <d199f72a-093b-41bb-b33e-b6685563f704@app.fastmail.com>
X-Cookie: I'm definitely not in Omaha!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_125101_606491_EB93CAAA 
X-CRM114-Status: GOOD (  19.88  )
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


--ZqhXwlf3qPSsVysm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2026 at 01:01:11PM -0600, Kevin Mehall wrote:

> SS_LEVEL (aka SUN6I_TFR_CTL_CS_LEVEL) resets to 0x1 (CS high = inactive)
> and is also written in sun6i_spi_set_cs(), which is called in spi_setup() via
> spi_set_cs(). Thus it should be initialized before we get here the first time.
> Once SUN6I_TFR_CTL_CS_MANUAL is set, it is never cleared elsewhere in the
> driver, so in any case, this can only affect the first transfer.

I do see that the driver uses a reset controller over suspend, are you
sure that setup() will be called again on resume?

> However, what's not clear to me is why SUN6I_TFR_CTL_CS_MANUAL was in
> sun6i_spi_transfer_one() in the first place. sun6i_spi_set_cs() is writing to
> the same register, and it seems to me that setting that bit there would be a
> more logical place to do it, though I don't think there is any functional change
> vs what I have here. Let me know if you'd like me to move it to
> sun6i_spi_set_cs() instead and how that should be submitted (same patch?
> separate patch before the rest of this in a series? standalone patch to be
> applied after this one?).

Smaller patches are generally better so splitting is good.  It does seem
sensible to group the chip select operations together, so long as we
ensure that everything else is stable before the chip select gets
asserted we should be good.

--ZqhXwlf3qPSsVysm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnpJp8ACgkQJNaLcl1U
h9Cz3gf/anL0RtrtBcUd5FxbCQvlrKb2rthUb6lYkUNPFC0FqttIX750LC7XBZRb
42Wk4+KyFH81Qu1T86/6XmW0ytr4xrhTFOsZvjBOcsx9UzQwnJYBzjzynMQFnh5e
IQYqydwe3uZeZhhjLSFcdJVoPoY195mKPbt9wvvBqepUTxIFdOHciPcItW3FkXbQ
AOwDGtnxmhFDqid8R0SIG0ZImvaAw2wk3EcV32L/lQDR0Y3CsUCmkvO/wfKPRtfY
Y23hwtftxFaTZdE3rh1KtEH5mB999Rj1CvPK970HGQvXBEJc2jw+HiQ8eSHAh8vy
excQbedSoX74O2VnQWYOZSn8/qbkmA==
=TBgN
-----END PGP SIGNATURE-----

--ZqhXwlf3qPSsVysm--

