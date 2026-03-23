Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D7AF483E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zr8+lYtKw72pHAPt5RM+e4aIZvvehLBMSQxMXfk5GvA=; b=Jwi6Q9mvOt6Ee8RmfMSnPUo6Ig
	YKAYrdMoLXZRIx9OfqZ8Qeidh6swbKf9mqB1PoqnXLtG3JHWS5k550BO4VLl7u86a6CWDC6WAsh1o
	B81m+x7SRNltIr4kqsb+jfzjms7Cbbn8k3bkj+czUbXYyHTfUo5Luza+I1dvMbWBruOo3Tlc4SYKc
	dEGiXT2EWq2qUuZ5S4xJCwU/mjijOk7ie3x2MyJ5xRT063fY1AfcBjDF16cFh+TG8jImh/zceS/7H
	z8NZkJCZjNO1UT5wDe1NDZPG3aPWTZOOj5qZWduQc3QSy1tZlrpx546PyTWcyIr+nC80f6UxWGCtP
	q2nSOeZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l9L-0000000HTHl-3SgB;
	Mon, 23 Mar 2026 19:41:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l9K-0000000HTH9-0gF4;
	Mon, 23 Mar 2026 19:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82ECB600AC;
	Mon, 23 Mar 2026 19:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06B0C4CEF7;
	Mon, 23 Mar 2026 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294877;
	bh=zr8+lYtKw72pHAPt5RM+e4aIZvvehLBMSQxMXfk5GvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tq+oxJt2YMht2bBZTFfKphF7mn6pccuIjaZ2WdoGqND03PSfnBcBQB1NIgNl3z61/
	 UYjZvaYvOqOLA7E7yYH/HWnze2466c1O7qr8kwURq3Awqez0yJLns68n/QUpifX44i
	 NGciV5iFQONI6v29a9Le0gLcVfC1bx1VYglGZLg2GWEDvGnLbMY3SkICaK5hKK5XkD
	 avgro6JAqTPWd/CiQqwSpmCTGS3nwGJk6qZqYH1oieE5MsIqFiCjJFlwAJAuUrVFLV
	 CmAIhZkRT5QaFJoHBEaM4h8+RF8SJRC4ha1+uWRl2AUhuZrju5id589FaWrhR+9y4I
	 k2MF7ywBcuyyg==
Date: Mon, 23 Mar 2026 19:41:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com,
	amelie.delaunay@foss.st.com
Subject: Re: [PATCH v5 05/17] spi: imx: Simplify clock handling with
 devm_clk_get_enabled()
Message-ID: <3fcb0dd7-ff17-4d09-b8ad-15f0f1211f42@sirena.org.uk>
References: <cover.1773885292.git.xiaopei01@kylinos.cn>
 <9d0fa929a4158e7f4e9adec21dd351e6cdd2984d.1773885292.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/sLNV2LkpKlEA+Pv"
Content-Disposition: inline
In-Reply-To: <9d0fa929a4158e7f4e9adec21dd351e6cdd2984d.1773885292.git.xiaopei01@kylinos.cn>
X-Cookie: The only perfect science is hind-sight.
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


--/sLNV2LkpKlEA+Pv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 19, 2026 at 10:04:01AM +0800, Pei Xiao wrote:
> Replace devm_clk_get() followed by clk_prepare_enable() with
> devm_clk_get_enabled() for both "ipg" and "per" clocks. This reduces
> boilerplate code and error handling, as the managed API automatically
> disables the clocks when the device is removed or if probe fails.

This one also uses runtime PM.

--/sLNV2LkpKlEA+Pv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBl1YACgkQJNaLcl1U
h9ALkQf+MCWziHjA3VCeQ6Z0O3ebkwfUwmCcxHPAsV+PSLGPTi2YbR/I9ctOMekg
tXlv5rI17nBcZCGCxil1OEOnjgOC7jRGuVmWaApY5nSEx2X4GZRS3GDna8dUsAJN
xQVd9DSQEfJv1mEe/jXE+eCG6eoVIPoltsgeEEIhZVAtQ1tkszyzlURiBKoteOLU
O4khFyG2m6n7gfyTKD6aRl3n8L8fhLz8Kd+75V58qWN711xIsaoqhyXSfJbucEgX
/CR+2K4QdEZFmVfW5zRzRMlbi6QniSd9lc/ROJWYjvQovVpyckuvH31KgwID8IHx
qLpvFYg7YLU7kgQy/nI7ksShV4LZsg==
=Gpc2
-----END PGP SIGNATURE-----

--/sLNV2LkpKlEA+Pv--

