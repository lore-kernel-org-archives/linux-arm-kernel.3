Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 772FDF3D603
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YsutObXhsWGuXab+DoJHMbGUXvWjUqW2ZjgMM713EDA=; b=aawyI2aSZGbZJNsjAmM1wP6QEo
	vIP5Y9+Gda6FSBHjiFWZO5Ghda8OeiWM4Y//7e1FGvBgNl3gpKGVlhpzQmh9r4FcDTgXshpj60xvk
	jexOcSSWf5UwL3uwjO+whLTGONzUd0j0zRqPmkvWZ2VkXZpqff8AI6Tz7nOEOEnC5ge2ilt2iISNq
	DneQxa8xI4X0OBKM5UbgVnVVa6KZZk1iUPgT8unRADgo0NSiJTts+J1H7O6DOSKdnr/redk7hw6Fm
	40ZJKEGhaizK5rduxyz8VvQwyKslwHS5plB8JAsMk1Kp+ovVZPlR8rFelHDM27C3eY6qltv3GVgbC
	VLMpN9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6qT2-00000009zYE-1Uhr;
	Sun, 29 Mar 2026 13:46:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6qSz-00000009zXs-26Gb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 13:46:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4DFC42DD3;
	Sun, 29 Mar 2026 13:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3A9C116C6;
	Sun, 29 Mar 2026 13:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774791970;
	bh=st4JvI4NAoWoSh7mtrnC23ws4KEdwaq6g803oyRstdo=;
	h=Date:From:To:Cc:Subject:From;
	b=ag5a4GMWBmeA2iSrFzckVCCFDXMh7s+5+OaCQv/OHPNWicdoZvH3KJg/PPz+W8dvJ
	 Tf3OlWWyO8orAvlaL3kNy/Vvw1cZjoAeWABDhNQUqwosnJJepJCzvmXCN2DAHclAqe
	 UjQZfEagFlp6NcAArlgb/Vkyv4NZZLbfzMdYpr6JqBuJpR6QVXIQcpUxZI7unqntW+
	 AyTavCLVBVDOEydKmVZz50MoB3uMcYBBWa+Z3vY0Tb7tktgzgQq9qbwBaoBX/KN0Q4
	 e0RHLyMABT7VPP+wkisMFqa5Z3hO4phJCeMjFrjNeftqxNUhVABbcF3+v0Dxz6NNL2
	 nMkJiANzcmkBA==
Date: Sun, 29 Mar 2026 21:46:06 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Fixes for 7.0
Message-ID: <acktHkKlWDUbsE_a@home.wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v5LD4MI+NTyJgjjY"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_064613_557976_7F220E7C 
X-CRM114-Status: UNSURE (   9.97  )
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


--v5LD4MI+NTyJgjjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-7.0

for you to fetch changes up to 6896ca5a9d05275fbeb38640c9bbdb95698de188:

  arm64: dts: allwinner: sun55i: Fix r-spi DMA (2026-03-24 11:08:10 +0800)

----------------------------------------------------------------
Allwinner fixes for 7.0

Just one fix to make the r-spi SPI controller use the mcu-dma DMA
controller for DMA instead of the main DMA controller.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      arm64: dts: allwinner: sun55i: Fix r-spi DMA

 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--v5LD4MI+NTyJgjjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmnJLR4ACgkQOJpUIZwP
JDB/wRAAgihVyCHgeFcD+Nx91C6P5KXUh15zNXx78fDW+tHRGeKhvAKHhQpirUI+
jszpgwgOp2jAJ2oTGcJ5gPab58VbaBd0h8dSbvu5Tyd1tdN4tdcCExNVdtuIpycq
pQGpiHrgcgWB3OhoDYZ1/LJzkob2QreeL/6WdwHk4XKahjV/g9X1zPBNUjF+jS30
T7v2jHnrr0q8Caq0FBvJLrgeipYINulTfWTjP//5wg3nVHlLEdd1OMipWMcLelh7
XDqM0vFMuKC+VtzU292aV2QryrDOnkR4ekucG+99/Lm2JzWmdxsXC6MtwUy5Hb4k
6wzPV96RhRefpL4O1U1M0xGhD3dF+9aTinZNykFMXcg8dEPT0UoErVYjZUkBv3Zi
zRu7Ghp05HCgVcy4Ac+Uw2HVmDu6Y25JS/RrfHHzw6dzPLubHMCVaL0YSJOm4ziH
uTpVdnedV9r9M0RKI64rAvI6XAdHroiUwfp+FuGAWVwz80fluKLrFfEIJuDRxtb1
tWIwK2m8gFzQSv+wM6JAsUzIr7KcrtjZd6+lbVd/Q+pjjxGKKvQiPYkxWs8ydQEi
Pgza5tqGHrztfS0xGoXij/DYS6ycrDa5ql+HhDfqUIRCmBvq0WKRyQihokKCkYvY
1J7GQZWMqzEonhjQ+By3WDTm05YIs/RwouMt+JKKCt916rvbcSw=
=J1DE
-----END PGP SIGNATURE-----

--v5LD4MI+NTyJgjjY--

