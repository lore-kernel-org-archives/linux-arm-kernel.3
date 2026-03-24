Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD275F532C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TO2RzNGl3QaEmDTI2VDfAcOvLdhOrGE8ero57x/6NBU=; b=alDdoF+nT0jSzAzYoOYo7ta+Ee
	fELq5PCBGQp4i1AYP2/PnIn4YK513FWGdAhioTwr6yf0uIQy0bH+LKjZBfCOM6r+Y7rjU+8EQUfgX
	NdddFBC2TKlU12f8R0i3SGKO9kJWfkdbuawbmdR1KJa/130vBzS7ISwu6/RYggwaSFr/3Pny1X3vq
	K+p81Z9P1zuG/YHhkKS1hiAkuOUu4N9UZahcPRicP6j/JpXDOt92JrY8TkC70EHSMJVXO36i8RLWt
	+x4DQI7qhoEAkD26GWOeWhX8Qrt9JoOTkcvyWhn6bE15YWeTxI2kK5mjkJiJCU1tX6J87jCQkSY+2
	U6xaHWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rI8-00000000NaR-0hqD;
	Tue, 24 Mar 2026 02:14:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rI6-00000000NYZ-24gN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 02:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B770743EC4;
	Tue, 24 Mar 2026 02:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E374C4CEF7;
	Tue, 24 Mar 2026 02:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774318485;
	bh=TO2RzNGl3QaEmDTI2VDfAcOvLdhOrGE8ero57x/6NBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTek9b8CkkhrzvSimQb+Reep8rVSxPw5Og9X7W1B96JNpCSbpPdnsHl307dm0kxFS
	 8RTR2+TR32GuCCo63iMbGEvnNTOfUT1rED4pvLMc6OnP/jDG5AlZLu7CbSy3YOl62A
	 B46kxQ6R0pRyDubvl5y/JEhA88DEUAxIG7SjQsQoHlbpYZh2fIE1BDhtwyusldXUw3
	 xniGdIkcqhqqVxPyryWJhbhZS6bVCg2NO/F/aDGzlbw5RZEMNXoS4Ow9OZiO7/de9J
	 X1tf4yCO3MUwYmWvNzjomaPsb3/9mUT6SbIvlEBTH0sbsraNJJAXdf45+QB05Rsrkr
	 Mm3EipOy5DD9A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 096101AC52D3; Tue, 24 Mar 2026 02:14:42 +0000 (GMT)
Date: Tue, 24 Mar 2026 02:14:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH] KVM: arm64: set_id_regs: Allow GICv3 support to be set
 at runtime
Message-ID: <acHzkoowEHXZ5BJv@sirena.co.uk>
References: <20260323174642.3183075-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvTKe6LgctCn4IwY"
Content-Disposition: inline
In-Reply-To: <20260323174642.3183075-1-maz@kernel.org>
X-Cookie: Identify your visitor.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_191446_742434_AFC2F9B5 
X-CRM114-Status: GOOD (  12.20  )
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


--kvTKe6LgctCn4IwY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 05:46:42PM +0000, Marc Zyngier wrote:

> set_id_regs creates a GIC3 guest when possible, and then proceeds
> to write the ID registers as if they were not affected by the presence
> of a GIC. As it turns out, ID_AA64PFR1_EL1 is the proof of the
> contrary.

Thanks, this fixes the issues I was seeing in -next:

Tested-by: Mark Brown <broonie@kernel.org>

--kvTKe6LgctCn4IwY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnB85IACgkQJNaLcl1U
h9CCowf4yEm4L6SEBrzHzfDEPo9zYZqteeOj1r7q+vba6HHLd3YAtNDdsghS8r2A
8ByiqvccyeAcNpQsyESaNL2S85Qfqbx1KvT3rfzOAJBdAvOrobFrOfokpTkpT5oi
fa6236lfJvFSNA24Os69/yqWmUiCNY9zuvEtmMxt715t6qE6x89QU5X2spvqFz/g
pfXMb+CZ5wDrSCogJ2PJqOYaRKca1MlbqRaKPaivgfykCQ8XyXdBpHQgu7Uk5tWn
smq0Go6mkdJvqW8JEH83LDB04EaEyB8rGJzYV+wLdt/W9uGn8AnP80jhGeTvC2ck
WnEAHwf+gph6u6i0VWm1/rg+6otU
=PO86
-----END PGP SIGNATURE-----

--kvTKe6LgctCn4IwY--

