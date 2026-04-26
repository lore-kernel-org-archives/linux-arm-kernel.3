Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B063FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eArYNV9qMW7NA5ofqAeK/xoQOdhSycPGVRNOc5KCkQY=; b=smpaqVcOfSYN5HSIYIX9+ajOsV
	onhYrVwkVHmW4hV/MUiVrSGoB8VLGdeV2tKFrJc+zf63uUFTu1BW+SrXJ97C8FxbAe6BeKeaHqwAc
	Nxl2pzw+YyGnJTFW0MlE3zVQNVkh5py9ai2IL994hdNIyUQz42UWWI7I/R/sjf49taiIHB5X9ZUns
	NlTYDG51MK0Yl5J5iTlzj25Bnr0ruTGFDkMZGNoyIuesPPoF4E/KD0WYmCcYlnGbQhkSDgRTEk/kX
	biPiSy7P9531M6uYWqRNdpaPzJHgCzgCp2P3ZTIo4hcG1wFG6RkkXbAqyGIDDC/BpfCf9Be2H3huM
	Ii1gM7fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6DY-0000000Fp6T-2z0X;
	Sun, 26 Apr 2026 20:36:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH6DW-0000000Fp63-47x0;
	Sun, 26 Apr 2026 20:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FFBB44553;
	Sun, 26 Apr 2026 20:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2141DC2BCAF;
	Sun, 26 Apr 2026 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777235797;
	bh=vmLW+gcURuqyj6IuXHCZNkXaqIw1olQJu4lyUHHjuzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PemhRQtfVlUQaoZ/fz74gV89B06h6bN2JGqJRk73+BU0YWAjEdh09AhplT8Jk6OqX
	 XkuW5YNGck0h17wYJYaRYpNW0CQy/23BAikr+snLE2KqXWdZvyXFqluYS5g2IMSeek
	 wRTGvWu9kO2f0LZZP7PAfGqrdfZv4cV3f/hHqkc2Gnu2sd+k1xuSt2wbho2uJ+d0Sr
	 V7YpXyFcb5Q4X1RbB4z+tw9TYPdcSVb4SaXvCdKY09iArm3WloTaXafjtU0dNmeeDW
	 3Dr+TRW9mFbl12/guudSdiIuNJxHXniCVkzqmn56nR/UvlELSDIIDP5agZbQJfy/bB
	 ok9bQHXI4Ua0w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 60AAD1AC5821; Sun, 26 Apr 2026 21:36:34 +0100 (BST)
Date: Mon, 27 Apr 2026 05:36:34 +0900
From: Mark Brown <broonie@kernel.org>
To: John Madieu <john.madieu@gmail.com>
Cc: heiko@sntech.de, jon.lin@rock-chips.com, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] spi: rockchip: Drop dead zero-check on fifo_len
Message-ID: <ae53UlXrMIhARp7U@sirena.co.uk>
References: <20260425092936.2590132-1-john.madieu@gmail.com>
 <20260425092936.2590132-4-john.madieu@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GZHxFyYmxwXKHcnL"
Content-Disposition: inline
In-Reply-To: <20260425092936.2590132-4-john.madieu@gmail.com>
X-Cookie: Victory uber allies!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_133639_040989_B7879423 
X-CRM114-Status: GOOD (  13.67  )
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


--GZHxFyYmxwXKHcnL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 25, 2026 at 09:29:36AM +0000, John Madieu wrote:
> rs->fifo_len is assigned from get_fifo_len(), which returns 64 for the
> two known SPI controller versions and 32 for everything else - never 0.
> The subsequent

> 	if (!rs->fifo_len)
> 		return dev_err_probe(...);

> is therefore unreachable.

> Drop the check. If unknown controller versions ever need to fail probe
> explicitly, that should be expressed in get_fifo_len() itself, not
> through an impossible post-condition.

That looks like it's intended as a "you added a new hardware type and
forgot to fill in this field" type check intended to never fire in
production?

--GZHxFyYmxwXKHcnL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnud04ACgkQJNaLcl1U
h9AdIAf+JpSwV7HySan1dwT9+shLQY9YkAKLnc+sowrUMW5dB1wKPWvSUXjXYdfd
85c8dEba84NojF6lPbmaXyUHJ2CQqqhNXTy9po0skxo1cn/BivbK97uHrRNEK97A
eFyNhoNK3gtuHGi7ZxLBvESYSi9TPR/4vqjNuw0xprnxekzimoSnQ3UspAPwMVOV
XQJ0DzfjDdMnrFsNmdUN0MVM621s0l+051qYlkqt9FNMyKYUuuIX9we9OyHV2S7O
TPZ6udetrEHEg+TBxwmuLM0NgdDoLKObAD7DHWoCTOVXvy/Sn9OZ8xhyVxZaTCR4
fU7vMbcx5v7+Nih/4qhz0vWAR/aReA==
=BPiw
-----END PGP SIGNATURE-----

--GZHxFyYmxwXKHcnL--

