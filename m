Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052BFCD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjMxI0rZYwVnV9vNeuTO15pUJpl61GpEQMcW7U9iWKs=; b=Lltwmygs+95qBo7unBBEENC4Gf
	ekhtBBLXLSbmrcJTkXyN44XHO6JN+mkHf9u78nkb7bDkeMh8x5gKdeTDHDSiopAhR0F1Wah0PAknE
	jgkB6co2tv5ekkuz02K45IqIEEKIK8zAeImmbYd8VaAdzt8LF/ozCoPLZI0n2cv8w4q21Gwqm8OCV
	0b2a4XPNqFrLddd5Mcgb5WTj3Q0+ZNezxH/p7r0OYNSLTiifOg5IKmeX1ygmrRKw+NpjwsbnGzwJ6
	XDfloykLvMiQtGKa3eShkei8ilFI/tpyeRfNwKivplZ59Z2gLmQIJYH/9IXwFESPxhAx9+1K9RkIf
	ik+91vvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7G8-00000000lgE-0eEJ;
	Thu, 18 Jun 2026 07:33:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7G6-00000000lfs-2ZnN;
	Thu, 18 Jun 2026 07:33:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 066CF44146;
	Thu, 18 Jun 2026 07:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621E51F000E9;
	Thu, 18 Jun 2026 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781768033;
	bh=hjMxI0rZYwVnV9vNeuTO15pUJpl61GpEQMcW7U9iWKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oIkqaZEnuai5ih9lPd40PVg0x1+o9AkBx60gJR878OY28inJhTYspcBvK8qstse9m
	 jm7JLACnLUvBFQxzf7xbahErqMuuGi3IwdjzVVERkfjXafu/B9pC7ohnSX8Gdamxb6
	 7aXS+FU3x+M7PnI2sRMU1gG/fE64v5x2M7LyostDTO4dLHNMfLh9RxlBOJPSconIRX
	 cPwkB0e9yYGjJwprwLfbSDckRUJLVfT+KPp3uebi1n5g4QHEavPrf5tJlUPkRsG0G3
	 P2Zeuiy5wX6U2Q3684S8nQcIQ2TgZQv6TWL76CG2Hz/1a6Em529ZTeVYQ8wbPCLXLN
	 CYGPtKSDSwTiA==
Date: Thu, 18 Jun 2026 09:33:51 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Wayen Yan <win847@gmail.com>, netdev@vger.kernel.org, horms@kernel.org,
	pabeni@redhat.com, edumazet@google.com, andrew+netdev@lunn.ch,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: airoha: Stop TX queues on error path in
 airoha_dev_open
Message-ID: <ajOfX7RFoSrzopNN@lore-desk>
References: <178160729880.2156257.7978513589649053826@gmail.com>
 <20260617164448.31e189bc@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hz9vSoCD4yGittIQ"
Content-Disposition: inline
In-Reply-To: <20260617164448.31e189bc@kernel.org>
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


--hz9vSoCD4yGittIQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 16 Jun 2026 18:50:39 +0800 Wayen Yan wrote:
> > In airoha_dev_open(), if airoha_set_vip_for_gdm_port() fails after
> > netif_tx_start_all_queues() has been called, the TX queues remain
> > started while the device configuration is incomplete. This leaves
> > the device in an inconsistent state where packets could be
> > transmitted before the VIP/IFC port configuration is complete.
>=20
> Not sure if this was superseded by another posting but FWIW
> this posting did not apply.

I think we do not need this patch.

Regards,
Lorenzo

--hz9vSoCD4yGittIQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajOfXwAKCRA6cBh0uS2t
rHn/AQCS/e+lABQrjqQaBlZzOEnOM4iJBB83aLuUkcW2RcDJXwEAqw9wyBTx3Mqx
NCJ9SEynSiNrX7kK38yFjOOyveylwwQ=
=FtFY
-----END PGP SIGNATURE-----

--hz9vSoCD4yGittIQ--

