Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2536606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 13:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0QqlImm/;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=TSu2ENMF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=WjLpN6tb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eL9jUC8Gq8PGksHH1scl+B7zay5oD19D22S1KebKPk0=; b=0QqlImm/hLuFEDm/8EAwuXUV+v
	s7/o5B5lt/GNFuOWvAdcL7YceqXPgRmqkOD5r9gxb/p89ipxCSZ+T6k8ZtrK+ey/3BfyPtyWr5R9n
	Da5krS4MOx9u9zd6uY3BABnyCSw66Fiou/1OQ1x46vk9AxiFIOjseKxHOkyKttktkmHZTtFbsJh+v
	I0MYTPSYzML7ssukt8qw1B6QHrsmTG1phdV4sAZa+LCUnUbi2f9sLSBmVkI9Xa7e8ttIsSYyeoevE
	yPbiSW5HChgO1QVumhp5t8OClwXACGY7DgfCdWW7Lbjtws+ovs2vfBU1nNrFF2McnkhX5iRlj+/7z
	xsPCCe/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW0Y-0000000BrMH-2POn;
	Wed, 21 Oct 2026 13:05:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJW0W-0000000BrLr-2WbH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 13:05:29 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792587922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eL9jUC8Gq8PGksHH1scl+B7zay5oD19D22S1KebKPk0=;
	b=TSu2ENMFGbS5RaQ11d/BnnpxrVNm3N2X8UiWOovvI5xwEFtaFO1NJulQ3JcIhN9mITQEKX
	pLSWJsl4zhf8P/wYD+UDbn66e9o1NCf/AfUbFIKt1FS4L/HcKYnLiLmLWRhf5aJaPineNt
	FZQmpf2J4BTAlFN+9qC12bs4wbdX3hkiHs5SgBGdjosRo10LY0CNnJ/B2TdLMzN0xyen0u
	FkDkZ+RZuDc/UujlUKEhI5DJ4efU0OQLHbb5LSpmqW0iHrgTtVDFARXOwG5+9UZudNV150
	F4fJA90KT0X5yq2ouapvkoi7vOSkgE+g3G2fKk3xLx4sZXcdOF7v7NfxdWDqHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792587922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eL9jUC8Gq8PGksHH1scl+B7zay5oD19D22S1KebKPk0=;
	b=WjLpN6tbt+hrVfLVYI4HvJVtbKNKfyDhc3KgpFNd8bDoZSjTm985oQNPcbuPmpfC2IAdft
	QtPzddvlwNI4DRBg==
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Paolo
 Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Song Yoong Siang <yoong.siang.song@intel.com>, Mohd
 Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Maciej Fijalkowski
 <maciej.fijalkowski@intel.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v3 0/2] net: stmmac: Fix XSK crashes on stm32mp2
In-Reply-To: <20261020140849.12fc79ef@kernel.org>
References: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
 <20261020140849.12fc79ef@kernel.org>
Date: Wed, 21 Oct 2026 15:05:20 +0200
Message-ID: <874iefjjan.fsf@jax.kurt.home>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_060528_808064_F9F4155C 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=-=-=
Content-Type: text/plain

On Tue Oct 20 2026, Jakub Kicinski wrote:
> On Tue, 13 Oct 2026 10:57:20 +0200 Kurt Kanzenbach wrote:
>> while looking at the TBS thingy [1], I've noticed kernel crashes. That
>> happens when opening or closing an AF_XDP/ZC socket while parallel Tx
>> traffic is going on.
>
> Let's respin this against net-next. The merge window has started,
> applying this to net would give us an immediate conflict and pain.

I'll send this against net-next when it opens again. Thank you.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmrYuJATHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzgr0qD/9CVSJZZLdINIWpU9XMk/x+nYy9jkIG
e/b4eMmky2Qaigs+Acxvk85WEa/cbWu3GqARO1PCHTogSyoiAMDv8exsgPG9odmF
/vQFfQTSQEnsnIArC1aJfxyifMZacKd4fioQkfXFPiWV+ISTF/RxsxAO+FGaG16V
dYNbWkpfFHg1yWJsXz20mzuQOAQr5/bL5CNDpkgpYH9EHAiDYgRadGTNpVEbQ0Fb
2FBgzNjb1y6cqzqPrlqp36g7Y5ceFE8iGUfCl50aCerXTN4C8X3s2dJHyZte0FyL
PJJcNez98JednomiGBlqlRcK3xV3+mm/O/FGYuV5InI5XrvqPMilUOLjmjHrucAV
6puGa0wtaviD1WjI8puiej6vgavJrZd+AQcKRKyVkvWZNGNhu0oFvon9R/JbTVpL
DmG8GDNCYzP3LdTb5xJCn2b3zq+dvKhqbd9LGRDzWGuHJNGslqFHThoBmewY/e8V
5wY20sP3vx1LQEbjJnqP6ADiX6IJpDNPG+7Xsq8JNSVYUxba5Ryoe4mTR2c9/C4+
tvKWykA0iDmVYSS72swVrEg0NptyMZ1aOx93PpRRoR3G5Ut8GM+3Dtudv5zztR8H
QwRt+6DNPq4x5ce4tqPddOYhL+WTFvevPtArfpO1l5j6BzLyuPGC2Ku98IDuv4Z5
Pnn40jVF8OF2Cw==
=t0X4
-----END PGP SIGNATURE-----
--=-=-=--

