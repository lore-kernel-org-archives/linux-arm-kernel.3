Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB38E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 18:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QpLb0LQPLncn2vIUTrzHwmznHPwcnLUVxcUk6FJXfI=; b=ZY2oH6DEq5j6WDkqWaWptYGr7O
	F44At9UERJvZkuBSqmw0kn6yFznvJqJkfnWR/Qd8qoy9zjv12F4IiqYe+jmuQHjWJmVPRkL4HME4E
	xcj/AOKaszApiVKfTCRPODN1QJ7ftX8VyI532unsgOyEgA4A2kTfco0ilEBIynap6nR7gzry/yVaW
	zqihbjKs5m99cjmBGIuEpzoBqy1UA8qLmKt4nHVOJCleJ+E+xrQX1qBCeBlPl3Wl+aPZnev17zSsc
	ltvFu1UPLG1G7Fa+MF+WJpgDuouEqr4QlM/3lgs/yiCiKAhLW2Rz++P5D4E0L5CLzxOSKlbCnHq7s
	2y0tbtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5Dg-0000000CREa-2JUM;
	Tue, 10 Dec 2024 18:44:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL5CR-0000000CQtt-2lfs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 18:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A251A40F5F;
	Tue, 10 Dec 2024 18:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21645C4CED6;
	Tue, 10 Dec 2024 18:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733856190;
	bh=LeyVSRDVsBs+4yUCaB87Pq4OseXmV/4M3itrMP0/wm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l3QZf2QU1+RKgBarpr3fmwhoA5L2UhFOM9C1RZQnVhg7boSvpELYwkm/EJ/f9atQd
	 vcOIEchsMsRDa9jgC/fglZJI4mvMN8alAfd84kefwG0FYRw9KC7vSHFuP09km5/IcS
	 CEYTczJEmB7IJNgFMxl4xacUh4LnlRveu+fsyKUwjmNFziOu2IJaDx/1TDPb2lVAJH
	 XPZD8d5WjtzFfxNjLIQQUKn24rKrurj5mnKjbj0jihY+320p6VCbzNOOZ6uUrh1Kf0
	 fPS4qcE2JDYYupqGny4KQBES6fDNu1O06rc9d2vfaK5+NPJrBOPt8m5DmUq4BEvGZU
	 p5ZGCHa9/GO1g==
Date: Tue, 10 Dec 2024 18:43:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
Message-ID: <b859bdcd-7343-4d53-9f3a-f374deca725a@sirena.org.uk>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
 <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
 <20241210170953.GB16075@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O7xabmfxJqulB9XD"
Content-Disposition: inline
In-Reply-To: <20241210170953.GB16075@willie-the-truck>
X-Cookie: Leave no stone unturned.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_104311_761505_B8B9C3E1 
X-CRM114-Status: GOOD (  12.27  )
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


--O7xabmfxJqulB9XD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 05:09:55PM +0000, Will Deacon wrote:

> Can we _please_ just generate this stuff. It feels like we've been
> making silly typos over and over again with the current approach so
> either it's hard or we're not very good at it. Either way, it should be
> automated.

> Others have managed it [1], so it's clearly do-able.

Yes, the issues here are not technical ones.  Though there are some
complications -  eg, IIRC the XML doesn't encode the signedness of
fields like we do and there's areas where we've deliberately diverged.
Given the amount of review I end up having to do of sysreg changes your
reasoning is especially apparent to me.  I've passed this feedback on
(again).

--O7xabmfxJqulB9XD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdYi7gACgkQJNaLcl1U
h9CY6wf/S1Ub6ZKKgKDElFV3e1bfepjDl2LGu2hOv6vTYntBUtYf58M4kC5iUUsW
VhM9pHp1mjel6TFgH+3a9a7LKOOBdnfROZzmbN/WJnMaggX6kUKJ7NdtfxoQptN0
ifPvJgGbPi5qIBlrVVBPwbw3Zk/Y9RQtbXZqPmz+SeAI2jCre4pjauoNoYpFPrha
fBV6p6e22M5wwV3E+7WfrBxuDvXcxbxoa9oQMNaozZgyFKkMRhW3rlVjKqQ6WtCp
vDYL9qGYhVUjVa0XxOlI7pph9xGF8qHFU7uEt14rssvlKisbIJzOn+WbtsQImdwA
kRgTDRh0VHV1QUFKgSC2MoK5ROEFNg==
=DVp6
-----END PGP SIGNATURE-----

--O7xabmfxJqulB9XD--

