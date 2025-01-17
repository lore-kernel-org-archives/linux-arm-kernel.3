Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F13C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ND8V5fOcJsROr77aqViHLb97gtgIazDKB9/duPzSvNU=; b=0kbG7loLkZHgQZOXegl12msJFQ
	U+Qa0xoobP+C88IJiaLf+XmxZK+kswCrnm6AySukyFEchfnP3UMZGiOWomkLxSF8/7jpVpVPnG0Au
	2IQN60Fn0cr++rnfFy0B2ELC8zmQR33qdHg6WLq//fbNGE9CKAJDOWEGh7OUWhFLzzjZqVFu86IVJ
	37IaMPkWtNwCpeEPQ68A3NdbIkZyTjMh6/SkPnWWzwqpAYuyFvmp5CVTwYBJJrTkbNlEpeva4tHgN
	7aiJ8nV6ryFA490ZGiQyqaD9Vne2Pl/8+ZTU9ZehSV3modPvM5ROJOGhcTjmOZvfaBK6yTsfUiKNE
	Z8+lOnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpdZ-00000000sB6-30s9;
	Fri, 17 Jan 2025 16:56:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpWs-00000000qUJ-0Pgg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B83DA43249;
	Fri, 17 Jan 2025 16:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F3FC4CEE0;
	Fri, 17 Jan 2025 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737132544;
	bh=ND8V5fOcJsROr77aqViHLb97gtgIazDKB9/duPzSvNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XFUvNsrq871Pwk1ddwhuI3sQiWssnu/pg+7uXsKl020HGHAIH+Io/4fVnH6TSBBni
	 Bkzh8TFYgNuW3+RTeiublp10K1LlVzWNjJbLZGwHagEJorBZRl19sq/tPlrcfWIDUc
	 slu1U5KoqUZBSjPxxsJkQxMadh389I3tI6y3IUQCf4v+3OEgJrUDwNAQPqNMOkIf0p
	 I13+bWbXlWnCyLj0xfwtYyvW/4reTTBgDHlBwFQjBPr8+TxeJWnXuXOFZhQjm3NAFi
	 PAaqYJs8xTiXZetb657AtoxFW6deaNQ3rhq/0boMO7VGeh+C32N114ZmJ14SR2S9D2
	 5qjYSW5s7bkDg==
Date: Fri, 17 Jan 2025 16:48:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] spi: zynqmp-gqspi: Improve error recovery by
 resetting
Message-ID: <f694cd3e-f2be-48e0-8d84-038579cfca7d@sirena.org.uk>
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <5942e111-24ba-4d1b-bd4f-6b81dcc6c5dc@sirena.org.uk>
 <3a38cc06-d052-420d-812e-7f3c0c6ef24c@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="StRUInDXb5Xbsn+o"
Content-Disposition: inline
In-Reply-To: <3a38cc06-d052-420d-812e-7f3c0c6ef24c@linux.dev>
X-Cookie: Q:	Are we not men?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_084906_196920_C70C923B 
X-CRM114-Status: GOOD (  13.25  )
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


--StRUInDXb5Xbsn+o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 17, 2025 at 11:17:35AM -0500, Sean Anderson wrote:
> On 1/17/25 08:21, Mark Brown wrote:

> > If you're hitting a timeout that tends to indicate there's already a
> > serious stability problem...

> This was mostly hit when I was hacking on the driver. But of course
> there are probably still bugs lurking in this driver, so I think it is
> good to handle the exceptional conditions in a more-robust way.

I'm not saying it's a bad idea, but your changelog is written in a way
that makes it sound like timeouts are normal.

--StRUInDXb5Xbsn+o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeKifoACgkQJNaLcl1U
h9Bi5Qf/aOOONht9nF1QgH5eqogTXxnhXR3+6g2ErVy6+JnHfwpmvvYzi+ftFvmd
Mszb2jO07Ux7vvtyNqQlkcZSIwodZL2AQ3lBfo9g416HatBLak0CRnII0GKhRAmK
2rtW0mSJ0Y3KnzYfK7iHI6lIwDYVYZ3QybmIk5SSPiUZLedsmyE0WIg3VU4LLvyj
xV9eAV60zPp1sUVVIzCZ3IpYdPzmNsWRT0fXRYQQKtdYKZZ8UHFA2RkB8XPeQMFO
yYNZOPXwpoFEirKTPcfRUrjnEFe1YL463HAu9OxDoBoyvkMquTsXp2p0ZpoQ1siK
HUi4GvhqOdv5TBICd7alAaS9Q3YthA==
=X8IG
-----END PGP SIGNATURE-----

--StRUInDXb5Xbsn+o--

