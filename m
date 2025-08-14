Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A38CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s97MAlDwomWWXJkni9RvSqvFaqBepHk3zZBs+yEln9I=; b=gZdh+KTsnCB9fBtX6pxdqxTeaI
	HPgLhpp/Xaq8pUkokfzSrKD3zHCpwxNcM65lFnPEvbzKvU722xb0eK4YHdGm8V5UM35ZpYw2syDcg
	s/OrF1bqk/aJbYiN5EqzFkatpTUCgbhcwpXejZlGdq8xfXqN71N5QaG4vObBsPZnaL2rMAd7W8WP+
	27FvVBSzWfCwZVGfb+fSMbr2UkImS0ffz7vBT37j6gtFgStsTxxoHRJKWO/JwZHfjihN9yStcUvIG
	AircVOwArNRMw9stN5zxCtclHuz7cqDkcNicsxADWma1NHdQBRAxWM1RN8FRu9i6uh4U++SpFrDgQ
	cxY48AVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umad4-000000001Hd-3GlR;
	Thu, 14 Aug 2025 16:16:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZtj-0000000HRSN-31Eu;
	Thu, 14 Aug 2025 15:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEAB743AA8;
	Thu, 14 Aug 2025 15:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B624C4CEED;
	Thu, 14 Aug 2025 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755185386;
	bh=s97MAlDwomWWXJkni9RvSqvFaqBepHk3zZBs+yEln9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7TfFErGme/r9vbo9zUCCMpzYUBGPn/hn9Q7C7cL/QmPN6MFFbVQ1XuN/vcmE9Avg
	 jSiL7QHHg63IFl3xwx3P8vCG8mPoUWY/qJkjspf4qlk/TnWa4Q4aYowvT51NqwUOn3
	 i7xjJruMBACp62sDt6p2oyMPNAXbJZNE5NoFx3W7Dawqg573L123gU9ekta34kP2eM
	 5lf3lE1M/7oD6p0d9aMO9Twcbb3fBHAQ6l4oTGpu5SNshJvNHIBtj0yejWucXTLh1b
	 F1O2rbka5gXNq3pMoShT14fs1xeSG86fbqnchp9+kRmE3UPUc6gON9iZVuC2ZlIHku
	 vyk5IDYR1OaLg==
Date: Thu, 14 Aug 2025 16:29:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH RESEND v2 4/4] spi: spi-airoha-snfi: return an error for
 continuous mode dirmap creation cases
Message-ID: <78542bbe-1def-4aca-8424-cc26542d9762@sirena.org.uk>
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
 <20250814065423.3980305-5-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6fSP3sMls8KI1L99"
Content-Disposition: inline
In-Reply-To: <20250814065423.3980305-5-mikhail.kshevetskiy@iopsys.eu>
X-Cookie: This sentence no verb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_082947_783013_93F655CC 
X-CRM114-Status: GOOD (  10.71  )
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


--6fSP3sMls8KI1L99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 09:54:23AM +0300, Mikhail Kshevetskiy wrote:
> This driver can accelerate single page operations only, thus
> continuous reading mode should not be used.
>=20
> Continuous reading will use sizes up to the size of one erase block.
> This size is much larger than the size of single flash page. Use this
> difference to identify continuous reading and return an error.

This seems like it just applies anyway regardless of the rest of the
series?

--6fSP3sMls8KI1L99
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmieAOMACgkQJNaLcl1U
h9Ce/gf/fkA6B9sVlHP4Xe2KTll2KPZmoVSpZ2HLM1D8sX6gin8ZUikC/pLkIKRi
jCC9jrFTlMqXJEU7JpRhDMb5DODMgrMYP4Af93m4rlcKCkujTovwz82LA6t7dILo
3NiTCY/S3vSoRPiqgTEzRv9FYzjkA77WolhZKC5zfnIQvFbADU2l64j5eeK+Rnwn
FoVXBhQxnu9B+KEXwMcxB3veP+vbqEexfWAV0jDd2N8pMx758UPoxsd9xHCYtIIC
YvyKZvIrj4lCmunNAb+LjljJRO6PQk/XQrJBK/5/gZjO2BgamcibPk3CVhbmJGS0
FOw/2eOsSFwG9ikfk+SEPWobdN1A8A==
=9/QN
-----END PGP SIGNATURE-----

--6fSP3sMls8KI1L99--

