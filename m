Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB6C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nR3ojYdSPg4b7MsuvJBgCbeiuiB3ulP91gPDR9T1B+Y=; b=2NXq4o85qlN0+vUimPh5Ap2ABA
	uATBzY/SYAuOzOXVO+iJXQjzdMki5Ae9fPz+pn0eSYkIF0LH5TqxtS/GCkDG0HwTBrUT4TmFD+/sV
	LBZRL0dfunMAWgVIuRwVIhbfBp3BYByhYpQbfwJ7Jh6Bqa0Yb9jVxafehHxE3fhuKzRsHTTp1a0bq
	AVvQ07WQw9lUgvQcCGEDwJHTzbFX9LjIvcH3ihGq3z3WAcRsjNIGjoszrwklw1MgkShorVvbfV1rB
	uJl//JBczbbAP++MtR9as798t2LkGHkmiVXDRkMT2Jjf95u9gdoYR1l8kFownYiadZXcEwHfwspkQ
	qqyFZUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCAX-0000000Gcci-3GkT;
	Wed, 12 Aug 2026 16:51:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCAW-0000000Gcca-3TFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 16:51:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F9B860A7D;
	Wed, 12 Aug 2026 16:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADB91F000E9;
	Wed, 12 Aug 2026 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786553467;
	bh=nR3ojYdSPg4b7MsuvJBgCbeiuiB3ulP91gPDR9T1B+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=erEPONZtisQIa+BkHupU2lDb30DtmnKQQuSKV5yRScXDGDqGWX8CQbB3HsIAQbN8K
	 HKjuk6Zheu0WoydJDeqPeL6RfhVUWHNb0CGutrWnVXBQDJWwjs93HnfHjC/sc0T6ol
	 ia5NZuBmebNNJP8hZxcjl/pCQP+6rqyT8kclaVGiz2Rzqe372hz2tmM+DZkK6dc3Qu
	 1L2FLRi5VJMDyKUS+g97d7t6aiSO99SP7PPXbMdBoeeD5GRxyv84rvubA+o5mf5hGp
	 tLhQd9Zo4IA/KA68aLHRGUJMnlJaasJ66IP4Wb9WNKsK2B+qlGMSC+SpMJrqf+BldN
	 1tmJG0ImWzJ2g==
Date: Wed, 12 Aug 2026 17:51:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <8817636e-fd2c-4482-b892-db47aa839aaa@sirena.org.uk>
References: <20260811185013.26960-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PC+YJE+FBRevnzcf"
Content-Disposition: inline
In-Reply-To: <20260811185013.26960-1-rosenp@gmail.com>
X-Cookie: Revenge is a form of nostalgia.
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


--PC+YJE+FBRevnzcf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2026 at 11:50:13AM -0700, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove. As a result, move the
> clk struct member into probe, which is the only place it's used.

This doesn't apply against current code, please check and resend.

--PC+YJE+FBRevnzcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8pHUACgkQJNaLcl1U
h9B5VAf9EWJCXVNl8MzibMG8K2UgWDBQWdPGWmdONI6B2OjkH2eO+OhfjO2j9biO
j35r1nTL4zU3wRvt/NPu9+T3Sy0tpzhdxFSSilnvF0t87hofQfdjClWWcxTGnwrF
P5dXovRb970jFZQkk2mkcjMDLUf580jUf/yXjFZc8x7epjgzPrgKQrQ8Ny5lsdiU
+SgsIZcPn5kiLkm0qyA3i4xgd3PD8aYyklcXEtTdTqwDKiOfm3elO9hN4ta81aZS
1N+pJLnU8IS0mdlfT33RhUZUmD8g0ywb7/CdjBMIeiisJbfH2/p8SbEAy40b7SxO
Ppq9r4o7UYPD6s7vkRsvjIf5Mv/udQ==
=ZZT6
-----END PGP SIGNATURE-----

--PC+YJE+FBRevnzcf--

