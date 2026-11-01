Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A027B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJy8YaMh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wk+Rtdnl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BzRuFBupQjQiDyoa/qXLe1S7CqDSM/Br1lwbCFNkGzY=; b=uJy8YaMhh7f+sWW34ofQoE7X9s
	Sf6IIVZZN2jz7uPZfEtIIOx5roVQndyA79YGMefAjMZUYfo4t9zfYFIrceKmNOVyCZKow1AXNCP2o
	25F3/b8XdVuE9SlsudyxalfUxK495iu8+Ux6V/FtBlTiJEVIyge6jnpYkIDneNY22Uz/jcBOXbvil
	D67153G48Uv0e7XQaZltqxoKWQ//TgCG5xvUydOo8pxZxDo2HfeyajjkegG/Py9wM27HjhqP1ru7U
	SdrDl9R7SnnctDPlCWRNfN9aJzisI9N93gc99AwjfZPsNtFpUA2LOW4QmCUaQfzB673MwwPMQxyf6
	369syw4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeIq-0000000FAkr-2Fgf;
	Sun, 01 Nov 2026 22:45:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeIo-0000000FAkg-3kTq;
	Sun, 01 Nov 2026 22:45:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57358601FF;
	Sun,  1 Nov 2026 22:45:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF791F000C1;
	Sun,  1 Nov 2026 22:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793573126;
	bh=BzRuFBupQjQiDyoa/qXLe1S7CqDSM/Br1lwbCFNkGzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wk+RtdnlNfF0ZU1JG+cJnT6+Cm3sXxVjQsN6TARzsEQX378ayC2zgTKW6xx9AOEo5
	 SyEx/0OuPrv7HTVQpfufdTXQOFuXF9JtHJ+qcYjlnl2TYByspxnxJr62180NhiVJVM
	 LJ8JgSYfK85y4E8U6OCDDOmIgxlZuoKrVvo6gZ2vWv/WKihj2lOK/2EmYhYaiMzPU8
	 CcJHn9A6ENzI11QIP4qI6TYpaiw0F3cO2j0Un0qjp46PzoQVVHMDc4E1l+9VkL9gVN
	 7b1fB1JQBA+BnG5XpWcEWMPYuFlLm43xq1SAm3W4Tgzf/P+Ux3axqj7xkfrtmSAIJj
	 ZS93vYt2DBpMw==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 50F102065139; Sun, 01 Nov 2026 22:45:23 +0000 (GMT)
Date: Sun, 1 Nov 2026 22:45:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: heiko@sntech.de, linux-sound@vger.kernel.org, luca.ceresoli@bootlin.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, huangtao@rock-chips.com,
	sugar.zhang@rock-chips.com, lxt@rock-chips.com,
	xing.zheng@rock-chips.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: rk3308-codec: describe
 detection and ADC routing
Message-ID: <aufBA7-uC7udM0qa@sirena.org.uk>
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-2-zhengxing@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bSSLOBRclnUyzkCZ"
Content-Disposition: inline
In-Reply-To: <20261101044149.2018744-2-zhengxing@rock-chips.com>
X-Cookie: Whoever dies with the most toys wins.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--bSSLOBRclnUyzkCZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 01, 2026 at 12:41:47PM +0800, Xing Zheng wrote:
> Describe the optional detect-GRF phandle and named interrupt resources
> used by the B/C headphone detector. Retain the legacy interrupt order
> and index-based lookup when names are absent. Document the detector
> disable and reversed-jack properties and their resource dependencies.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--bSSLOBRclnUyzkCZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCaufBAwAKCRAv73Ows9A4
iabwAP9Gmr6n9IX2ZB1GxaMa2+TbbQ+zn3trx0LRgC/h5052OgD9Gp6fMckCkXWu
OhGm7TPU0nV/e3bw6I0v2x60AncDWA0=
=ngH3
-----END PGP SIGNATURE-----

--bSSLOBRclnUyzkCZ--

