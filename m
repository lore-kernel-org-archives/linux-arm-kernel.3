Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBB5E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqdP/q7jz5/cYPHRhOGlO8Dgz7Z7fVb1WpWpSjFHEtQ=; b=lXmfhJA9jeS5b+TE/zQD9XMrP1
	iCNyKOywJpJclWfKcOHVhEF+Fyyw4rKHOcimeO5XZjadjYPtmzcXZooc8tA5dsojpKgOS52DhU3dh
	QtR5cfPuCr8l3IQ4wU3caYLbCRaPVItIlgpJxsLUW31M7kXeNCa+HHYnHBOHEKfw0QIDxY3HaP1qX
	0/JQQigi9R5to9ENqboh5XkD11nz4sBQc7rWYC3nBrJQ1NNEXcGRvbMY+xYYVVW/26NL9BeW7teS9
	d5xcYFK3HkG0/AXiN+H7dtp2tEvRST0f/HBUoBz6jqlNqOodjt3d51crCtNHYGwv7J3HLlBQeBNma
	qOTUr3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJSZZ-00000000mUx-1TYs;
	Fri, 06 Dec 2024 07:16:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJSWL-00000000lxz-322Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 07:13:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 589305C57E3;
	Fri,  6 Dec 2024 07:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCA9C4CEDD;
	Fri,  6 Dec 2024 07:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733469180;
	bh=wqdP/q7jz5/cYPHRhOGlO8Dgz7Z7fVb1WpWpSjFHEtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbaEyGu11/UxJoI+wxVZKQze/GAiyViGlIHkW/LeTFayFPOP21hgFvJ9UQL16Of6n
	 oSFi59lFAGU0zrx/RohkY08DvXuR0VVpaeGxN1xx0Tf7/qXSLG8T11zP+M57cVh+JY
	 ITT1xrXF0oS+Za3klS9l6lxOteodrT7qa1MSYCRcee8O9F/hXUqsvoavGQ/2cjk8vF
	 CBE6z0z04SoUUDGF0JQRrm0IllLkGhUsXYZTYSU2qh3steCGZtdFaRj89WNfpctiM2
	 0jw2uJpI/yglEHWHuKoQiZklmUMtDU8E/yd6lHsgh7uyG/VaHstYWuHKxH/pidNskB
	 7RzhF0hivOOyw==
Date: Fri, 6 Dec 2024 08:12:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, hierry.reding@gmail.com, lee@kernel.org, 
	linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: Re: [PATCH V2] pwm: stm32-lp: Add check for clk_enable()
Message-ID: <cim6rnzdvhik4kdibfmglf6jiky7xccynqwazmxmnr2f5fvu3f@lvoo3drlgaua>
References: <20241206012605.2877412-1-zmw12306@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="24swak54o7mx3jph"
Content-Disposition: inline
In-Reply-To: <20241206012605.2877412-1-zmw12306@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_231301_807367_3B730B77 
X-CRM114-Status: GOOD (  11.99  )
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


--24swak54o7mx3jph
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V2] pwm: stm32-lp: Add check for clk_enable()
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 08:26:05PM -0500, Mingwei Zheng wrote:
> Add check for the return value of clk_enable() to catch the potential
> error.
>=20
> Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>

In reply to (implicit) v1 you wrote:
> We detected this through static analysis, instead of actually hit.

Would be nice to mention the tool that actually found it in the commit
log.

Otherwise I'm happy with that change now.

Given the issue is old (the offending commit is in v4.14-rc1), I'd note
send it as a fix before v4.14. I'd send it along however if something
more urgent pops up.

Best regards
Uwe

--24swak54o7mx3jph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdSo/YACgkQj4D7WH0S
/k58qQgAoaSkhGFgO/Kk52GXlgiISBHJAWIcISJ5+foNu36MAFY3eW6ti+GT0DBw
XuYgt/Z7uV4mklpmSb0NsHU9o1Rg0wqdqPpeOydgp+nDnWRLOU7Ym5ZLGGIna4M+
VuKtK4l3wY5wW9LXMR0YlBhNQ8LlSNIG3yGfektvc4kWLaTB1S3o3FkY3mx6PaFl
As6hDgS2eg5rGjRaAYqiBQ0RCPVDOtH4+dgVAXC7w4LNyJo6ujdPQdaSBmq05RQi
DDH6nEL/NVw3PSjoDcK3Q2YQ8Ch3O/XyzybATAlLlNNqN2/M1mwEK08vbeEnv5mP
OYIkTcu2MYynEx6XzaGy1PAATeTcqw==
=onJO
-----END PGP SIGNATURE-----

--24swak54o7mx3jph--

