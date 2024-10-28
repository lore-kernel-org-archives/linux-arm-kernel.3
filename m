Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F95D3E2C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 20:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhCQSKAzJ9tsQ+/Te4HmtC0TWacCvVbNEkAW60a1+cg=; b=qA0iO0S6C7IO3xG9ZSP0HKVc+I
	yolJeKbkiMGP5ON/qoVRS336dPqtriZCPMdOYRjXC9b3GT5nquPtMmkNmXYJ9B3+g42MAddAbHz2G
	XRp2YXvoRfFs1oMWyD+I5LnbcXhBwDRh8OQwlXSMoJTfnh2GH0U3Wp4sCjos+2rb1HrRabwnBhpxW
	P9sI5KlaTD3l5Wq+fIBpcfyupr4NcCgONE1uW0qfvGJp/pTO/ZbF4q4pHBlK5vetgL4eGvsQDrGlm
	09BkhBcIKYDO1YDZQ0U9/K6m2cqGlGy8uAVef7aDCiqHUoPRbc1fVFi9dOcj8umYFhOAbT9BPObh0
	A2vAdkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Vv1-0000000C5Vt-1AZO;
	Mon, 28 Oct 2024 20:00:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Vt8-0000000C55F-3BSh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 19:59:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01A1BA42C1D;
	Mon, 28 Oct 2024 19:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E64E6C4CEC3;
	Mon, 28 Oct 2024 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730145533;
	bh=yi5GD//oyGJgqQTF4vZx4zIWoIkEhZQZC+WnPRbK328=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUK/BsV/WXBkBPAlgv8OjGtRLG/wsaeYi8b8A/1AdjLoUbH20vYH4Zi7P/E2+g+am
	 fKUQbqz8uukGzNeumWYxps1Lc15jPo1IXkhT1Pl0egDPFNgQSuXeyeOwi1izYQ62Nw
	 u6Bwkn33lIu7Uk+26KWVAtyZubkizMGKfsYHwwZlmCQ1dYJ2QmuKVSH53dEsUgINKQ
	 FTSwmg4qDxYAE3Bmar1YEYYQXkW6beleFOQQLQ80iBgZAQX2uaLPLmdQMQ+d8G6Nmd
	 Zi2qE3TpJwWJtgcup9Why9IDPIMHl+tT8aM22eJqbIpzGPcEOFM5ncWQqQw8dpXRgQ
	 zshpDQE4OprPw==
Date: Mon, 28 Oct 2024 19:58:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>,
	Anders Roxell <anders.roxell@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: kselftest:arm64/FVP: arm64_check_buffer_fill - failed on Linux
 next-20241025
Message-ID: <c9980897-7b7a-47ec-a2d3-1410083f4d08@sirena.org.uk>
References: <CA+G9fYt0pqM_f-uiK=xH0RWrhfABdjy743yyxu4CLtb+kkS6-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B2ij6K8NYtCweVVO"
Content-Disposition: inline
In-Reply-To: <CA+G9fYt0pqM_f-uiK=xH0RWrhfABdjy743yyxu4CLtb+kkS6-w@mail.gmail.com>
X-Cookie: Remember the... the... uhh.....
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_125854_881883_E1903D98 
X-CRM114-Status: GOOD (  10.04  )
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


--B2ij6K8NYtCweVVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 01:16:32AM +0530, Naresh Kamboju wrote:
> The following kselftest arm64 and FVP failed with Linux next-20241025 on
>   - Qemu-arm64
>   - FVP
>=20
> running Linux next-20241025 kernel.
>=20
> First seen on next-20241025
>   Good: next-20241024
>   BAD:  next-20241025
>=20
>  kselftest-arm64, FVP
>     * arm64_check_buffer_fill
>     * arm64_check_mmap_options
>     * arm64_check_child_memory
>=20
> Anyone have seen these failures ?

Already reported here:

   https://lore.kernel.org/r/61461dcc-e455-450d-9c01-5465003fc31c@sirena.or=
g.uk

--B2ij6K8NYtCweVVO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcf7PcACgkQJNaLcl1U
h9CkLQf9Fc2xP/RalLbR8qhm8sehoQq6vMBzDovEbDMB6k1Tk4MKwpIxpSlQphnI
YbcEVLgQ9G0bbEIqqJWYAJIl5rgoTNvpSe20WctUPjCPD+uz3zMhEScKO7A2/gYH
Jp9y35VbKkfJEIiOfibFMef+o6cYcqQp4XxpDTbrPuIs7I3UsKtlIZKctLJW54ff
93hMnpctARzoMUX5w1ykX4pTPZVc4ovfo7UnyiKvJvq1x7jkR3jk1WuuXzN0w58+
a8bcB6U9qzhs8TDcvkog47kTRWtjDdkYtq3XzMTAg3HCM3vOWMYiTy2iLLvuKEG9
cc/QVGZoz1GuMaZhCDD/lHsDWvT4Jw==
=vRao
-----END PGP SIGNATURE-----

--B2ij6K8NYtCweVVO--

