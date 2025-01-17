Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0103C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bF0napYb4DivbmjViKTQNB4sqEIi/PUxHKatOjuEfZQ=; b=tnI1lPguFc+TIxnphOIwoEAV4G
	7XCSuHL9m1O/j1j5vu9AbBaFzG5OVjngEKpy//K9MbGO5QHa/an3QTo+esKKa68NSU69yAgb7fc2O
	SpFuASBZDCAdL20upzd99Zi9XYD84x9P6O36kILYbafIcd/N+ndgfts6lOIj9lj8cc6qu++XKCjVt
	hPTSzrDr2FQNGz/rkdZHds/dh7fG+/n+cS8KHRa9HNm6dYm06x+eQCw1KvdExnzzZsF2pGlTdX/4s
	BG1BjEuj9PhiaXkRZvq10N8aj1o0xYKJcFoFpSHvAVyaBHXCE5vrkqpuevZcf4NYNP6LxQAs5rK3Z
	ibUINtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrIy-000000017bh-0YIH;
	Fri, 17 Jan 2025 18:42:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrHg-000000017JC-0jNx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 18:41:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFE2C5C641D;
	Fri, 17 Jan 2025 18:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0120EC4CEDD;
	Fri, 17 Jan 2025 18:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737139291;
	bh=bF0napYb4DivbmjViKTQNB4sqEIi/PUxHKatOjuEfZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyIT96/4aRD3kZQVB4E0JCBTG4VLBF8ncKl7HVw7DHYnAM1WKFNoer7qCVkTSHDWo
	 0eRqcvOoSUbx8gU7pSKYZ7ZBw9wia3M3l+f5lweQZ1dDe0nRecHt1yJtvWrlAh1ZXL
	 WY9eSfBnKQmSeIGex25hRoDxCKEP8IdlvivT+csYhTDm7kJC15yMOSM9nzSG4bZpR8
	 pRiecZsvmTvs95SKk179p63mW17kF+HYPugnDTJWU5pB1xDDsO87LHlTo50h1Fij/9
	 C990XomxLlLeJbZw6INM7Ese5xgarrTNYGYaeB811c+c2Cw7g/DXqGcRshd73gy/jJ
	 8gWbisaeFcrXA==
Date: Fri, 17 Jan 2025 18:41:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] spi: zynqmp-gqspi: Improve error recovery by
 resetting
Message-ID: <1026d44b-0907-4835-bc95-32f9bbcf4831@sirena.org.uk>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <5942e111-24ba-4d1b-bd4f-6b81dcc6c5dc@sirena.org.uk>
 <87h65xi977.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dNX5crdLfDnIcD4u"
Content-Disposition: inline
In-Reply-To: <87h65xi977.fsf@bootlin.com>
X-Cookie: Q:	Are we not men?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_104132_252750_242FF3F1 
X-CRM114-Status: GOOD (  12.35  )
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


--dNX5crdLfDnIcD4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 17, 2025 at 07:31:08PM +0100, Miquel Raynal wrote:
> On 17/01/2025 at 13:21:58 GMT, Mark Brown <broonie@kernel.org> wrote:

> > If you're hitting a timeout that tends to indicate there's already a
> > serious stability problem...

> Yes, unless the timeout is reached for "good reasons", ie. you request
> substantial amounts of data (typically from a memory device) and the
> timeout is too short compared to the theoretical time spent in the
> transfer. A loaded machine can also increase the number of false
> positives I guess.

I'd argue that all of those are bad reasons, I'd only expect us to time
out when there's a bug - choosing too low a timeout or doing things in a
way that generates timeouts under load is a problem.

--dNX5crdLfDnIcD4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeKpFUACgkQJNaLcl1U
h9C9vgf8DscIliyg/nYFd0hYE1WWjcgHGEdvQCSG/q/T7ey5VwCDhMmjOG8JRXwo
4Dhpx6vDb0Rq40PmJht80xKwFKiody8zmYnGTeWMZPysgMj6NqmVGjn+rYiA9WtM
YROHfXQKyJoxZuquA5+D+QqS0IaWaq2jhUnsSsPsE36c+1RDReXKpW5sDUajYM3B
Xe6aDxwFwjCfdYtzsVypS7yRHCCOE2zaXbw6g6R6BiSr8LCLhBBJIAW3VPLh6CGe
vH8LvM6YEpuSmF9Peoi1P8If0089lKXq3iS8WMlB37w7N9WvlUwZoffgDc0vRUqO
htiRMtbWC4OQyZuWC53L7m9w2EMALg==
=uGn5
-----END PGP SIGNATURE-----

--dNX5crdLfDnIcD4u--

