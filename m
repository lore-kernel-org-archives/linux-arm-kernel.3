Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A6FC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 20:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c09lk6K3YO8nS0KvYKheCXbPOVWu+SLwqbVSB6+4KRM=; b=WnrdrDKJN+Wst+VwHcCWlJqPpG
	/V28MRqbuIM5hC3AvSVIP/AV2/PoP9IUUJz0dHlDEtwAQC3MPjvkO1RpBrxEGYXbHclEiVfuk6TjN
	tRj5Ii6XpBD8L0qvBA9Pgx6xZW3RbH1FZJdcqY8/akRud5faHKkXGAGAqm4wcekRJ8WcSzA+lU6v+
	r+D+AE6raEADA4DELxWAB9gAUszvfBxeF4MUiY6IFwFGRBH3tn9lJSCDiW0f3+W6kHMrOTdFOK27I
	Eenm8w9fthlCcF72AQ8n9HJW8scqzGs9tG4GcBVJb3YM9JSSxLUXkJTrG5tYw8qvkOyiBd3tENw/x
	D8P/1v/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaqC-0000000Gi3i-0zHP;
	Thu, 01 May 2025 20:49:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAaoI-0000000GgnH-27Uu;
	Thu, 01 May 2025 20:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8580868463;
	Thu,  1 May 2025 20:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1810C4CEE3;
	Thu,  1 May 2025 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746132429;
	bh=c09lk6K3YO8nS0KvYKheCXbPOVWu+SLwqbVSB6+4KRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fp3HaqMAExVxltGru5F6kWIKHOkCmpTjE5vDVBR3Ikh8PxRnbdZIC7UL/Zti8QSF1
	 9VAyk02BUKwonpMZ9R0UTng8GGYTTwisl4CU4NINn5d8GuKVmmt82MxhyLCb+aW4H0
	 1SpofpnbopLtOnk7NKO1QT727/EVjVnOFaowCdxUOXG2eN+7IYprrWSrVoAvkHTrOE
	 FNZhoHI/fgLQ1t2EZbkHXU+PmeX/KVo9pWZxU/VUk0eYBwQ2EQ/YyQ9k5s3FOtpVJh
	 pNVSMhbCcNVi2bjRrmyh3ox0NGxZC3I1g1SiHlxppWpepDb/q41uZ0Gczz+a5xnAW1
	 1WdetZSt+VgkA==
Date: Thu, 1 May 2025 22:47:06 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net v4] net: airoha: Add missing filed to ppe_mbox_data
 struct
Message-ID: <aBPdyn580lxUMJKz@lore-desk>
References: <20250429-airoha-en7581-fix-ppe_mbox_data-v4-1-d2a8b901dad0@kernel.org>
 <20250501071518.50c92e8c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c1jF/W4ziIWJGsAB"
Content-Disposition: inline
In-Reply-To: <20250501071518.50c92e8c@kernel.org>
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


--c1jF/W4ziIWJGsAB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 01, Jakub Kicinski wrote:
> On Tue, 29 Apr 2025 16:17:41 +0200 Lorenzo Bianconi wrote:
> > Moreover, add __packed attribute to ppe_mbox_data struct definition and
> > make the fw layout padding explicit in init_info struct.
>=20
> Why? everything looks naturally packed now :(

What I mean here is the padding in the ppe_mbox_data struct used by the fw =
running
on the NPU, not in the version used by the airoha_eth driver, got my point?
Sorry, re-reading it, it was not so clear, I agree.

Regards,
Lorenzo

> __packed also forces the compiler to assume the data is unaligned AFAIU.
> The recommended way to ensure the compiler doesn't insert padding is
> to do a compile time assert.

--c1jF/W4ziIWJGsAB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaBPdygAKCRA6cBh0uS2t
rNmWAQDg2BUSYvHrs8L2q54TesvQyahWGkNZ9Gvtio431NOhFgD/Z4fFaMqjgP5E
FG9oyib06hjPa7jUUJ/4Q6ZzHA4RpAU=
=8BzH
-----END PGP SIGNATURE-----

--c1jF/W4ziIWJGsAB--

