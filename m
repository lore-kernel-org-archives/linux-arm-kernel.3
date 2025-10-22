Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD114CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLBi04RxI2O0RigdxNhStIqhpXBwVCCldfIsWnpvxxs=; b=n4UabyaKiF9ZouR39lRdLqJ3U9
	dY+Mann0y0lG9sryt2OLPtNSjq6wgaTmmcWWHos+fxKD4NN5/NtSYdGtcCfIDTk6RMucd/Tnp1JUp
	DiANKYzZFaoihcfcpqWGbGThHC/a/eyRHIe9Msk64q4HrHkUkfo035/I/pNM48jnldo2SezmsnSnm
	TqO604LXjkU1l39VHq3vaHoOvgx1OgrI2aCUyE1QZgiblo9rVbju9WoEoJ7IR2M933xcQeinUP1uZ
	y4nHpHkT2Vu/V7t5HJRhnwVCzRci27pZTGxWXe+wsfYV4a00Sh6/Ka4Atpe/7ixSmy/4GnA0NlzQ4
	6fyyQxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd4G-00000003u7O-277R;
	Wed, 22 Oct 2025 17:56:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBd4F-00000003u6T-04Lr;
	Wed, 22 Oct 2025 17:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 467894A719;
	Wed, 22 Oct 2025 17:56:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B06C4CEE7;
	Wed, 22 Oct 2025 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155768;
	bh=zLBi04RxI2O0RigdxNhStIqhpXBwVCCldfIsWnpvxxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cm3RpiWi04aJLnz2ZZaO7BKC23T065gjcOqZ3/6CORMFzTwphQq5h09SnMwBTvUMd
	 ShVCsfZ31u6K6xC+WyZT9pQ44cao0zcXcGIC3LGprce5oyyOE3o9DlH/CK+VAywqVg
	 2TTtgXgikGdl7KixyDu+YWDONxoxJRqUiUN+pslnoupPrqdaV2z2EnSQOekDfJ9zM+
	 YyWTDjUlLPkddg+TFDS7SWyqVxjQmoOf92Xy7KHLTyQXA+CzClK45Ivn2Ofu+G8v1B
	 EHICJbnt5aMBBb4VzmZ5MioF1HAC7Yl2jT6y/pLCriQJNW9pbCgmsTmuPXx5hoJUmB
	 xO/4dw8OyXX6w==
Date: Wed, 22 Oct 2025 18:56:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: net: rockchip-dwmac: Add compatible
 string for RK3506
Message-ID: <20251022-splice-swimwear-b4aac8baa143@spud>
References: <20251021224357.195015-1-heiko@sntech.de>
 <20251021224357.195015-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VGM0Y4Yfiy4ZRLY1"
Content-Disposition: inline
In-Reply-To: <20251021224357.195015-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_105611_085224_C9D9DB3A 
X-CRM114-Status: UNSURE (   7.09  )
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


--VGM0Y4Yfiy4ZRLY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--VGM0Y4Yfiy4ZRLY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkaswAKCRB4tDGHoIJi
0rF/AP46l7hsdSxhsDVFRzb7xHY517Q3P8GvjAI1g97P6NecmwEA3jy2Q55+Tnav
n7u98UvqjNZV7hY6LGukAHjOHVj/tgs=
=DDbK
-----END PGP SIGNATURE-----

--VGM0Y4Yfiy4ZRLY1--

