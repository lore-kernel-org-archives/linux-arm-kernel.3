Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0035CD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 08:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3U8QguzLwBboSwEZmUoW5uQ0Ge0zOfvjxUS3ieiyudQ=; b=cTDQqzvHdM7mNwpVND/qHEkyDa
	bdNE1gsi5xoTwRFqPcserqH1VHTqt7K6U2ovD5SlIixh4KHwhmlL/bOt+3FZNu8I6pu+a7h6Pj8Df
	m+4vg0yTVx/CsviXGGkRaFhXbh87SHRPq5zshNcsDOEnsSdPgvUuS/oqvoyxlz4dAVcwtzFbXDtcK
	WSp95muslnDUyDvqLh7t+icE/FoynlwiRGR6AKJ/Zz6CWgV2VnQuH8fvMPBTRXAE2o3JFSbg/zSIJ
	tWeukKtzsGeffR943Tlfrb0qXU71IOAJig4BOI2lLFs5mv8JjDwsmiyW6V2p4zHQnhTdql86MoqwN
	MKppguBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKXge-0000000ESXp-2aww;
	Sun, 16 Nov 2025 08:00:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKXgc-0000000ESXQ-1DZG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 08:00:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22FC9401A9;
	Sun, 16 Nov 2025 08:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D969AC113D0;
	Sun, 16 Nov 2025 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763280037;
	bh=oiCSedSb+vz06dq7HUd9ifzEUNgIQopka2q0mEATYDQ=;
	h=Date:From:To:Cc:Subject:From;
	b=WVWeVeAqJ2AoBJ77gYb0DoTnPiVddFkdyH1ySh+LRFNsrTcJ//zXzSTNy1FSQYzBb
	 GLaU1liEfmVRc9EVc9aoLyHKaJrEQzyBh0fnHj8xErQDQKuYd0s74aZL+cqyux02Gj
	 stLqJRiV56Ahmk/nqez6G/sB7rOO7fttXNZWurlf2dBQ52HyxAjC6gppjsSAw4GWIg
	 lzSirpLIlHzBQdYAkDLu0kjEdQtV3nLZNJoERF744EsggrshICcPm8xQjANGajbmaf
	 81thRYIDjkrqw6aM5aMvUUzq5bFkZ1r7e8AGBiezkV2QNlIG++0FWlPoeDxUiykmy8
	 sgD0AlUpM7DOA==
Received: by wens.tw (Postfix, from userid 1000)
	id 74AEB5FBF7; Sun, 16 Nov 2025 16:00:34 +0800 (CST)
Date: Sun, 16 Nov 2025 16:00:34 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Driver changes for 6.19
Message-ID: <aRmEosrxfxFVY9zH@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Zd2+LAuceIjyYVRj"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_000038_352740_5729205A 
X-CRM114-Status: UNSURE (   7.43  )
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


--Zd2+LAuceIjyYVRj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.19

for you to fetch changes up to 122df8416e7f4c68fb3248377a2b34cdd31a85b0:

  bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls (2025-10-29 01:10:10 +0800)

----------------------------------------------------------------
Allwinner driver changes for 6.19

Just one cleanup change that is part of tree wide cleanup of redundant
pm_runtime_mark_last_busy() calls.

----------------------------------------------------------------
Sakari Ailus (1):
      bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls

 drivers/bus/sunxi-rsb.c | 2 --
 1 file changed, 2 deletions(-)

--Zd2+LAuceIjyYVRj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmkZhKAACgkQOJpUIZwP
JDBLQA/8CLsp/zXl4or1re162VX0AlYeyUxwY2CKYbK/fk7eqy2RQnTHA712saoQ
4sSCBRvSj+E/NhX93+Q0ZSxzqlt0MfaB0fYfbEYHQbYroMMU/lXi6Or3XWBrQ1n6
LxV8tzM1ZtKXxRDxyhzR1wsN2VR2dR2VtZRpWAc2lntVzamyKJ1toxLihLwivMjI
NOsZSkHYfpaNs54Dv0lAPoSPhIecR/R8dYfQ8lG0sPfOs2CS0iNEXpiyfNzloIkT
QhCQEyviQWu8DeyyxGvN6hx7OBLxTD8xZYFVvnUpwGe4hnGPKnWonJ2lCJL+ya5D
cdqjeOF26K9LOvtZv+amwSc7Fjm9MeHD+VWXiNIxYa+S+S7FmJoCRhu+bHaHVxtw
PQ+PcVR8idhltFqd+G97OGGjN+VOkDUJKRLLgS3IvSABWDL2I/ljbgI0wCA2hPom
37O1/8rZ8U7+PFQ/JwTs1eomy6+FZWQUMCMwyW4XNPocjGErL+WrTc898LLruv+3
dqKVm9/9p0VKwLq5CVPULWbN9rtoCMu5fC6ET0zU4DDnIoY2KS6+6LGvLI5kt135
4gGBdkmp/HBfbCsOa9BgeQWBoyT3skUlglLRmsbyWLkh5c96pFMxMRa7tsTH6PQ7
FWkq+xBYjiiCh9K7o7iaJDBbGP7w7ncwDTB2qXk/lem3bezWNQs=
=jocf
-----END PGP SIGNATURE-----

--Zd2+LAuceIjyYVRj--

