Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D7AC3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 21:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+s1iPc26YCmSpvShRrXdax3x1rFHs/iyPOXRBhDmYY=; b=SOrYxNZZ/eyJRRcKCd2xzuijAS
	w1xDtE1a1ixHk75X4P5SKpPFVW/uAplAneEZ0pJTcWPcFN1afpmPKof3RghR+mmKEtZGjz9BTZ7CV
	mbvhLrP03OpUv5vkRemsEHk9hffMTkCP9h+z5y6U9XyWVZUx31FWKHYPGvHPeYgwOoDwQsfUrSMLI
	qcK+z0lPP+u3gyCLFb4utd+xcwxzraEfAlmEI0fP46xfmsW2JLl8wQpnm9apbk1VIhjI+J5QjoWFw
	nAx6nWYpm5D2y7PEFouoDmqw+0Ov6yEWAaeY9Gpu1PKW3qp74dlXSJ5WXhOcsMVvmre5V1xufsdvb
	d/1Jbo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3fF-00000008f4i-0zjq;
	Mon, 05 May 2025 21:47:53 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3cQ-00000008elu-0dze
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 21:44:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746481493;
	bh=/+s1iPc26YCmSpvShRrXdax3x1rFHs/iyPOXRBhDmYY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GHuMv1rtBvksDbCJuFZxN5ToompGNH0vaiIaGpadcwgN6ZEuSgLUQMt27bEYyjhvj
	 UK0++hvoB4xoJY1MgF1X1yNOnHYR7ymEUf/V0wWeBCKgdviWoY9eQp1H3Vfgx9VrsA
	 OKychBZJDNQTmkE8FFOmEfCJofxzy8Bhifj8uMrFmGWSN9gy6fV0g20Jw65ECZS+RJ
	 EM3YOkZpFEhQOyJ3wjl7usRRvY6Y8vasnFQOCfaEtm1/2DkEy49kohqyLkTbEMwIal
	 Sp8u0XUZ6QvCBDeTKeetIHnlVS7/mC0raQHDlPPq9evDsflIyHE3tYd2TDbG36j+Q+
	 /RjGa5XBRkOng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zrw6Y16cmz4wbr;
	Tue,  6 May 2025 07:44:53 +1000 (AEST)
Date: Tue, 6 May 2025 07:44:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250506074452.65f4e0af@canb.auug.org.au>
In-Reply-To: <20250501113753.53f6fc88@canb.auug.org.au>
References: <20250501113753.53f6fc88@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zMy.MsZf4ijzjRR=.y.Gt/_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_144458_334540_95EC221D 
X-CRM114-Status: GOOD (  11.13  )
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

--Sig_/zMy.MsZf4ijzjRR=.y.Gt/_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 1 May 2025 11:37:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> The following commits are also in the arm-soc-fixes tree as different
> commits (but the same patches):
>=20
>   0530a74f3f43 ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp23 SoCs")
>   6485975d7832 ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
3 SoCs")
>   635ff238ff7b ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp21 SoCs")
>   2ae67a2e7e4f ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
1 SoCs")
>   97d0a619e248 ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp25 SoCs")
>   e5694384b07d ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
5 SoCs")
>=20
> These are commits
>=20
>   2ef5c66cba61 ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp23 SoCs")
>   3a1e1082097b ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
3 SoCs")
>   1bc229e9bb9c ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp21 SoCs")
>   02dc83f09c72 ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
1 SoCs")
>   06c231fe953a ("arm64: dts: st: Use 128kB size for aliased GIC400 regist=
er access on stm32mp25 SoCs")
>   de2b2107d5a4 ("arm64: dts: st: Adjust interrupt-controller for stm32mp2=
5 SoCs")
>=20
> in the arm-soc-fixes tree.

These letter commits are now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/zMy.MsZf4ijzjRR=.y.Gt/_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZMVQACgkQAVBC80lX
0GzyJwf/dlMQPP5xQckkJraDiIWaxvaUG5t0WidE1Zo8gsr4U+0BtV5HWeycgSe7
tKbO4AwXoLf+ACJ83EbpuLOah4oF+Gbn9Dp5DIMvS7ilx2+s5VsMnggdGP5dZtxr
h7KeByL73xlaZZQdcUZvxe0aDE+Yra9Dq+LfDKryzMkt7y0SCQtEghIx6hA4DLm7
E15Rrai23FvmHhQxx4ftWk3razwkR5IG0IFBg83Nh2aa6SnGn7rvGAif9Lcny6en
gYhZPEvcXbgfDxTHqYNNNnVSf9X4uQ0Oa9LOdJ7UDdOojmNaE85QIH8NjU43ixCs
Fwhlybs/VCx+x7u4R7RIibBZwlBvfw==
=4q8H
-----END PGP SIGNATURE-----

--Sig_/zMy.MsZf4ijzjRR=.y.Gt/_--

