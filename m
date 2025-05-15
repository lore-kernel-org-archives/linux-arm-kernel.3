Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E122EC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3V5gzTsX4gPY+7P55gPPQfb0vt8QIMJnNwWN8DMMjE=; b=36b8iUrl42wie6jCDjythBMt9d
	VIJZaUN28zwBUHeOzv0ou4fAbYzwMBZ80uhBHz9dzqQVcdiDloCvPBe4TjACwlVbURLM0lm9Ffv6f
	ry/Z487qqaPTJnYHFr6hFUqoLnoBUgCGB2HfSSj1ZFkeZ8znQ9brSwdic+OdAyvqX4IbTYBt4Ihl+
	rvC552ped4n7Hh/9Hv8c2Hp/C7vrNloAJfamZh8r94ch949B1nM2+H9GxIg4SnUGKf8mhEuVySpJc
	+tM+df6A/0DshQvKAto0UU/QTRD8SMXI2EpuHon3ZBJMklD9D6LjHUVfdvPmS5Ns8pF09pqKBHhZ2
	L+lxBzSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUnX-000000008yJ-45Ft;
	Thu, 15 May 2025 09:22:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUkx-000000007wB-2bwT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:20:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7DFC5C068B;
	Thu, 15 May 2025 09:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E82C4CEE7;
	Thu, 15 May 2025 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747300798;
	bh=yAE5ZaqBHdVLWaZoDrZHlWAUy//bRfgw5fCUmaQcQXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lN542K2tpX5KeIGgI5eh1Qj9mt3QfJDXZrQxR2X5IRG3WttDFY3pHx2Zdv28uKO9h
	 NNRjgNVuZOptIjAmgcO8VBWBt0GFqfBETj3B2FbXWgZOXig/OF6cwo+mnAPtlNswzx
	 ny3y2JxKtfU7xKXsFBI2fasxxM3PmQmYgbasJol+hp7J051xlDPTXTN6jv54rMgqhA
	 wsfzNFh7LNm+pN0DgY+RcaVAKra0e0RJEoB0fpvO6yn/urlS9RCiGt0PgZYJk2AliY
	 g5j/+ekx6LRPo+sCcwI0tJJi1GPgD/g5P8SHQmf1HyjyerWvx5BMZUuQSaR+1K6g/l
	 LMWRL5Wcg1Ugg==
Date: Thu, 15 May 2025 11:19:54 +0200
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
Message-ID: <aCWxusdUYgeGRaqk@finisterre.sirena.org.uk>
References: <20250514-b4-upstream_ospi_reset_update-v5-1-7b5de0552c8c@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NvFxYeYGiMf1vQuJ"
Content-Disposition: inline
In-Reply-To: <20250514-b4-upstream_ospi_reset_update-v5-1-7b5de0552c8c@foss.st.com>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_021959_700905_2765C40A 
X-CRM114-Status: GOOD (  14.65  )
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


--NvFxYeYGiMf1vQuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 14, 2025 at 03:56:01PM +0200, Patrice Chotard wrote:

> This patch is dependent on commit 6b3754009f87
> ("reset: Add devm_reset_control_array_get_exclusive_released()")
> available on tag reset-for-v6.16.

When telling people about dependencies like this the standard thing is
to also specify the repostiory, or link to a pull request.  The git
repository is needed to actually pull the tag.  This appears to be the
PR at:

   https://lore.kernel.org/all/20250513092516.3331585-1-p.zabel@pengutronix.de/

which is the full reset pull request for v6.16.  The commit you
referenced isn't the tagged commit, it's further back in the history
but still has a whole new reset driver backed up behind it.  I'd have
expected that if this was expected to be pulled into other subsystems
it'd be on a topic branch and directly tagged?

--NvFxYeYGiMf1vQuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmglsbkACgkQJNaLcl1U
h9ClaQf/duEFMH9ku1tjFSWXgNBEHbSEBi9hfGtmNs2Vmy0bYAFCf/Ny5aHYrPmK
JJ7L1eHj3dfPW+ihDp5TgXjKgxHQdI5GMG2ywfUKCzT+I1Y12sb4g8F3CUWCAS1V
Wsu2gEje4X/5agpo3BprY1CgvAcuM9/u8/ycG7/DBXBmriq7BrYjbgxYIk8oxFpK
UAU49XCozl1o1It3RaLMSB3xnYnMyX+FaM2tMPrHXZJHLtAwuWChuCfQDo/qZIpa
yX7DwKID+h+/Lr5+EiUuaGLutyvNqjiC/kLtCi3LhSnVkgmFtvnfXQWZyCEZRkuL
J7OieaxVMHoILV2MPzAnMhSalQ5VGg==
=WTr9
-----END PGP SIGNATURE-----

--NvFxYeYGiMf1vQuJ--

