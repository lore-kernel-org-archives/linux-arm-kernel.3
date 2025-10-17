Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66879CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 16:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcUWyXl440OW+7SVufCsEuKVAzGcFk2g4c3DEDJP6xo=; b=OjT6Yg7KdlRqW0UVll4pwVG4r8
	vqhz0WApnNHNrb3XA/aJhVfnL6i+tp7E3Nw/nS9/g9j9emtcW4EWnBQ0Z7L4vUOA4gpz3Dbu6QCZQ
	mneO1Om9uZ9dH++nO6cqlGSvC4D3goKZQW/yG0imzptu887K52UXztmvN+v/pyR4DYP+oCAaKBFNf
	gUCS9FOPS7VzluPy0LHbYHJdcczucbLUTzaGL+WYP2fKdJJOu6F5HYazBqFtY7g0M0B3tYfPMus1L
	flG9T++8Ea1QJDryA5yJKXamVlQJEQuRUaVPBDL0RiIlfGillYZ0NC2vjfTlaQ96vuPUnuEabZ9H4
	Cg+a0bDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9muy-00000008MbE-3fTG;
	Fri, 17 Oct 2025 16:03:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mux-00000008Mav-0cwe
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VcUWyXl440OW+7SVufCsEuKVAzGcFk2g4c3DEDJP6xo=; b=L/Y09XIaNaAi2fn78XVTKz3FEp
	xSBYQ4ayihnKLnEzpUUOT6+bQII6S8nq4rZa2ZOh6dbfXBceFuSFrwBvfsaaNm5aHCTwet4uvujx1
	sLQHwwkqkaGOAWssv5wsM2haPBVa33NPzfK0kBKXeeEk+VvhOha3Z7FHEv6FdE0fC/Wf7rxHSuJoB
	L/25kbKJEx83hv5ec+vKp2+1IRz2d0SiTgZdb17TteASh2aHMfT9V3DWGmJBCKMLXy/n5/1y05PO5
	XC/rdOmyi98bhlU3GtlqXiRFxtxnYUZ0EwIopbOfvwoMWga0uu+sU0Mpwdu5k/svzS/y/uhWjy3Pi
	4iKI6niw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mum-00000007iff-08It
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 16:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF2634B95C;
	Fri, 17 Oct 2025 16:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91458C4CEE7;
	Fri, 17 Oct 2025 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760716963;
	bh=xojrpFlz1LFNv97U0p6wiXyxxqPnBp1q0KSfoha5XPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHoSw/PZokmUd2Wc0/IYOV1WttAmj1Ak5JnKJdEt0h3QSQBtfIxDIQgkomsBc5l1n
	 el08IFWZToc9N5U0hSwBjvv342efsu0yc9Pu/pyZduyk7DUre0EMfyqYvky97Rtbyr
	 UwxD7s+NEdOCv2uCjfPi0bvGrM/DCp7rLM2p78bga74zGKcvBiuQ2hJgghXCYTpYBt
	 YhCluy32wjj8x2k1Wgl7X5llmtwOzeZd6aZV0HdwChvfpoNyeERpOl/Yxr5Ldz5WCX
	 G6O4HPO/muoUrNzAuvYRoJYtif8/ypWig3+XayEUkcGrrvIhW15CsBBBr3vrcDr9RS
	 SE7KW+1EMRJgA==
Date: Fri, 17 Oct 2025 17:02:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 3/3] arm64: dts: cix: Add pinctrl nodes for sky1
Message-ID: <20251017-expectant-tingly-95cd6d57962c@spud>
References: <20251017074646.3344924-1-gary.yang@cixtech.com>
 <20251017074646.3344924-4-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H64nj9AQoov3hoOl"
Content-Disposition: inline
In-Reply-To: <20251017074646.3344924-4-gary.yang@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_170250_370019_1BD63A5C 
X-CRM114-Status: UNSURE (   8.17  )
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


--H64nj9AQoov3hoOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 17, 2025 at 03:46:46PM +0800, Gary Yang wrote:
> +#define DS_LEVEL0	2
> +#define DS_LEVEL1	3
> +#define DS_LEVEL2	5
> +#define DS_LEVEL3	6
> +#define DS_LEVEL4	8
> +#define DS_LEVEL5	9
> +#define DS_LEVEL6	11
> +#define DS_LEVEL7	12
> +#define DS_LEVEL8	13
> +#define DS_LEVEL9	14
> +#define DS_LEVEL10	17
> +#define DS_LEVEL11	18
> +#define DS_LEVEL12	20
> +#define DS_LEVEL13	21
> +#define DS_LEVEL14	23
> +#define DS_LEVEL15	24

All of these just hide the amperage, please drop them.

--H64nj9AQoov3hoOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPJonwAKCRB4tDGHoIJi
0iOeAQDyBaIb9gA3BPzuk30EVWGx8N+rGqa+2Z8gxw7jelG+/QD8DPxps1C5UQBi
wFmCW5uuw60FSmq8tcTuX3dEPar0jgQ=
=Z8KD
-----END PGP SIGNATURE-----

--H64nj9AQoov3hoOl--

