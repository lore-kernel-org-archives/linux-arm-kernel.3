Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2995EC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 18:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niH6CUFrEv5T7n0prkRI0zRszsv4Llho8h6DF1rwuao=; b=0RzvytC/OIBq6MdxP12vKlxl1f
	/oM5K30A+4Cgw/cK/m76A3U/hG3T+ZDjk/qC0XoQeWLhnM5/REEWRoZzMEfc9p79TRLsjRlD6u/6N
	Mkh1DVQIxLmvsH8CssZ21Uu0/YQN1bnBqunJms6CgHhEWivWGzMO4WxXOTwcMSL7Z/MLACec+k/Xg
	PmnpMX/tdRkxxRk4YIQYlvweRbBweoBUMGACMIB7f1o8Dr0mynd97sfzHD4rsDKKJaPN6sgOzhtjj
	24Tocps24sLAzmnDxiQJ8eAP1bd6UXia0BpQ1hyLaszW/AniyYapCbziyOVYk8LQcvdprXfg7E/Vw
	Xoms8pqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mCq-0000000CZC1-2XwG;
	Fri, 04 Apr 2025 18:55:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0mB1-0000000CYyI-1Lcq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 18:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A81C35C5A34;
	Fri,  4 Apr 2025 18:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AED8C4CEDD;
	Fri,  4 Apr 2025 18:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743792842;
	bh=niH6CUFrEv5T7n0prkRI0zRszsv4Llho8h6DF1rwuao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWbcBzh84tf4b9gz4jDJmlHI61qCbNRR5DMw8+5emP3onMUFnHZBJmGREljamenKZ
	 3NmqQJVqo9xe+kB3uY/LSO81TDfkxYWyfAMkySSXZYSQ20lBxEf4bHK2yFBuoyBmpv
	 z5pD+PzMOgqSU858h0r85gq7YX9TiP2LshFUTMddVIiXlC7Q7QUpFyL1rrmTmTtrVB
	 e6V8DQs7fhgAsitecCo8yYaUVp7tLCZE5bHVDCf0tKvC04W5ScTII5S80xX9QpLjPn
	 QS5AB0pR0QMe4WizsTs7tLte6tg9ec/r9wE2Hygr5TtA8GlDmlQLZKNa3i1gm3pK2o
	 fiQ0DgFwkGNpA==
Date: Fri, 4 Apr 2025 19:53:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
	catalin.marinas@arm.com, maz@kernel.org, will@kernel.org
Subject: Re: [PATCH 01/14] arm64/fpsimd: Avoid RES0 bits in the SME trap
 handler
Message-ID: <c793ca13-3780-4192-b950-1eb43425fee3@sirena.org.uk>
References: <20250404174435.3288106-1-mark.rutland@arm.com>
 <20250404174435.3288106-2-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yTS7m9EGuXuWgvjb"
Content-Disposition: inline
In-Reply-To: <20250404174435.3288106-2-mark.rutland@arm.com>
X-Cookie: You will soon forget this.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_115403_413231_8B8196F0 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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


--yTS7m9EGuXuWgvjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 04, 2025 at 06:44:22PM +0100, Mark Rutland wrote:

> For SME traps taken with ESR_ELx.EC == 0b011101, the specific reason for
> the trap is indicated by ESR_ELx.ISS.SMTC ("SME Trap Code"). This field
> occupies bits [2:0] of ESR_ELx.ISS, and as of ARM DDI 0487 L.a, bits
> [24:3] of ESR_ELx.ISS are RES0. ESR_ELx.ISS itself occupies bits [24:0]
> of ESR_ELx.

Reviewed-by: Mark Brown <broonie@kernel.org>

--yTS7m9EGuXuWgvjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfwKsUACgkQJNaLcl1U
h9DSiQf7BtU0Jj5993oqtKdKmQsA9unyvihq5zKrTZ1hYUrRTa49MMPJnOpkbyF0
Z6dU6qu31IJIeJol/hyKShnlI2zSU2OKfGBU9GVyG6NToBgVZ+MX/ENlEl0UXkn4
vFqv1vyb6FPdEzvBVDJN6ZF4f3f5RmRsHNSi61k9/9/Ydm3d2CM8+wjL6VP2sGbv
FppCT/cM+OalcdVFMGP+42bMzTwahOMbu+Uin3mpmOGoV/AhfURp7iiaPr1I+WCN
eVo4+/yAUUDdvfIFq82ZKE/5JfThlIa6lR0p7SihZyYlkGUEiozMbOlLta/lzjlU
bf3p9/Bnv8KcNXtPQy6VO6K4BB6AMA==
=9MH/
-----END PGP SIGNATURE-----

--yTS7m9EGuXuWgvjb--

