Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C9FD167EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqMfhFsx34G5fyRzdDh6shoD9QjerKt/rKh74ytdLgw=; b=3a6ltdTvmQvUS3PShalUV1PAKh
	UEekKIBT7Q7K3DdIkr24rUzbefMpNAymKp5mSml3upRUQ0WShEKCJJjSWTyLxZp/c6wDGzHtox1qz
	iadgsjybCk2k3fn/sCPgAIB7qjPtJ1nYF1lfLkriHF1MnCSeXG5NdyUj7z+28mebG/6bk0QEVub7C
	eu/0mtm6EbEa9H/Oh/pSXMkrVxByJ+Ii73zZYfjIMBe5sC3pZM67Lmlyyr4HPNi+k4KLwfgfjxSbX
	RS0xwYtQaqQGh2Ks9h/2P3eabUYB6xPeu74bLXQ/89Fimqyssf/LCGiA3u8asQB527NUP4k0zMW6r
	p4sprmCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8sd-000000021i8-0lOP;
	Fri, 09 Jan 2026 09:34:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8sY-000000021hj-33VO;
	Fri, 09 Jan 2026 09:34:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D34942AB1;
	Fri,  9 Jan 2026 09:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF199C4CEF1;
	Fri,  9 Jan 2026 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951238;
	bh=LqMfhFsx34G5fyRzdDh6shoD9QjerKt/rKh74ytdLgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WE7gX+gq0wx1Wq7wrOV3RGcgOvIMiiEmJkoV65bLh1b2zfCAnZ+ToFhKyyP7yS5i3
	 AoxZXl4g8UbrSs27/1hL3F5OawlyhdGHab7zvIW45/xn7wHtw3Za/LXQiuyKRMbxkL
	 4pOR70OO/1JwvbkianUddqbqxYyW+v4JYdsRxsCZDGd66T9kuQVfWcfRKWndLEEt5t
	 pyY68F0TMXRVpuV5QFTwWTaaVgUdKo1fNY0rp9VSvwgQsNDNvK6z+wu0FfHSXWmLPe
	 Y1Q7WGzGrH3LUWtMB8kKapgrxkOayIOP57Fwq1/SFMjT6kNtG1pO0mZT2LgBujuJsX
	 +fiTnEg+37QCQ==
Date: Fri, 9 Jan 2026 10:33:55 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Fix schedule while atomic in
 airoha_ppe_deinit()
Message-ID: <aWDLg6RzI4s2VgIH@lore-desk>
References: <20260105-airoha-fw-ethtool-v2-1-3b32b158cc31@kernel.org>
 <20260108132218.GG345651@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qg/4Vam8mbknzqoZ"
Content-Disposition: inline
In-Reply-To: <20260108132218.GG345651@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_013358_787559_F6E87232 
X-CRM114-Status: GOOD (  18.84  )
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


--qg/4Vam8mbknzqoZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, Jan 05, 2026 at 09:43:31AM +0100, Lorenzo Bianconi wrote:
> > airoha_ppe_deinit() runs airoha_npu_ppe_deinit() in atomic context.
> > airoha_npu_ppe_deinit routine allocates ppe_data buffer with GFP_KERNEL
> > flag. Rely on rcu_replace_pointer in airoha_ppe_deinit routine in order
> > to fix schedule while atomic issue in airoha_npu_ppe_deinit() since we
> > do not need atomic context there.
>=20
> Hi Lorenzo,

Hi Simon,

>=20
> If I understand things correctly the key problem here is that
> an allocation with GFP_KERNEL implies GFP_RECLAIM and thus may sleep.
> But RCU read-side critical sections are not allowed to sleep in non-RT
> kernels.

yes, right, RCU section is atomic.

>=20
> If so, I think it would be clearer to describe the problem along those
> lines. But maybe it is just me.

This patch is already in Linus's tree.

Regards,
Lorenzo

>=20
> >=20
> > Fixes: 00a7678310fe3 ("net: airoha: Introduce flowtable offload support=
")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> > Changes in v2:
> > - Update commit log.
> > - Link to v1: https://lore.kernel.org/r/20251223-airoha-fw-ethtool-v1-1=
-1dbd1568c585@kernel.org
>=20
> ...

--qg/4Vam8mbknzqoZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaWDLgwAKCRA6cBh0uS2t
rIB3AP0a1KHAx3razHj4kPIvhW1x66e1t9N5r9lmaYx8cGtOIAEAxyyu/zyv/K1O
eZDfQKJdH04RONQj1O6W3ginvMBLPAw=
=bX6O
-----END PGP SIGNATURE-----

--qg/4Vam8mbknzqoZ--

