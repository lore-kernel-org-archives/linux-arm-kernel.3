Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247DC105F7AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GN4mbAtPPqI7eb/w8hWseJ9vXifrvUMqwbIm6ZtN9p0=; b=k1CnpUDFzrPOgzjTj7oBp0fJrY
	Q0GMPbm+Rxw+VWM1DzMVp6PU4rbEURVgr+dChSBQLwR5egqbgW2cMNveJukgwWnJXpK71mttVqc6s
	3FYWoolbigwG4HCoQ8rs831Mmp1DUsAtEl0Q4IZwJ9n3xcvxAOvi65po5Az8dWNELpX4rMQxnN3i4
	qy5oo0GXbW7Cp2JiXMRWr/3sw1bajRlo143SkK9i80uzNt0zvzwWCNX37UKq1xo+RKARMw5lcKaNw
	iWzS3YqDURas+Vq4ls+rhOtkfO0yIIZZrE8pWV5So58vega/n8MtP/NXFclsXFxTkWRUpKW8QTOJv
	OgqIDs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w123b-00000000A1y-0fyF;
	Fri, 13 Mar 2026 12:56:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w123Z-00000000A1Z-2bRw;
	Fri, 13 Mar 2026 12:55:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F07486012B;
	Fri, 13 Mar 2026 12:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8865AC19421;
	Fri, 13 Mar 2026 12:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773406556;
	bh=Zjx0eOHVxG9gyRtEPqgdCcdKSmIhSdKw+KfUYhGrs8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKDNhWqZ9gcLlJdoxr0XynPiyUoe0daj5KnfLIG4JofOAQVLnpfys+tsWuBfR2BP+
	 6BJj6yZqfdm3hP9/V+3GjcABC4QPZaLJh+UehwPfjEiiPgBRLJ6mgswvf9usqZ5HyW
	 B35LWJTwY7IrxQ1ooNqsQWH1kQI+VgfVN7nqixPusURihdngD8rUG+kVXzeu3RPREe
	 HL0ID1LecKPKPy/Ia8QeXmRWoF6BA05QvmnIjDA4KKqSsmWbqzdha1+mMcteN7bbhf
	 Hzm7r3p3USkrdmFn6vaEWdLOJOjaqX2Y8UmAlpDxnlihm5RiCIr2WOGSb3NBQJJndm
	 MHJylAxBihjJQ==
Date: Fri, 13 Mar 2026 12:55:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 01/17] spi: axiado: Use helper function
 devm_clk_get_enabled()
Message-ID: <d54214f4-b57a-455e-991e-8700d03eea95@sirena.org.uk>
References: <cover.1773381582.git.xiaopei01@kylinos.cn>
 <d78ba5faa6ed3f5e009b41fc1ee1c2bcdaff882b.1773381582.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1oJhbZS/zdMQ8Obt"
Content-Disposition: inline
In-Reply-To: <d78ba5faa6ed3f5e009b41fc1ee1c2bcdaff882b.1773381582.git.xiaopei01@kylinos.cn>
X-Cookie: Monitor not included.
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


--1oJhbZS/zdMQ8Obt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 02:08:17PM +0800, Pei Xiao wrote:
> devm_clk_get() and clk_prepare_enable() can now be replaced by
> devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
> longer necessary to unprepare and disable the clocks explicitly.
> Simplify code.

> -	xspi->pclk = devm_clk_get(&pdev->dev, "pclk");
> +	xspi->pclk = devm_clk_get_enabled(&pdev->dev, "pclk");
>  	if (IS_ERR(xspi->pclk)) {

This doesn't update the remove function which while it doesn't free the
clock does disable it.  Please check all the other patches for similar
issues too.

--1oJhbZS/zdMQ8Obt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0CVcACgkQJNaLcl1U
h9AmBQf+NZmcjADEavTXUkEkwog1B2fWsPoumOErBPGPp/uNMBzFPkj7gtNd5btL
ucVKvAua02jhgHneB/r1FG0shTauJc9wVpal3XmgRnMdqN8XRjML+ZWlF1SI+tpc
v45g2somStcn0QaQOUiGzrwcZddKdUwXCKwidznhryq4fm4Qm0d0jSLg5ayUdLhN
iavAAr+18xMj0UyCJQttiVZ5oR4PdExtioX/4xm4pJhL+H9TPdBC1fouESmEEOG4
krxSjVZLRrIxK8ZTjQ4RCV9ykypPyOl3bheFPN7rtI234NlAhUQu6ujoUgoC4aXU
IoIqyGMXFEt63B8KRgz9kIl/lz6DCw==
=oV3/
-----END PGP SIGNATURE-----

--1oJhbZS/zdMQ8Obt--

