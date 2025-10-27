Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC36CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHx2M6g+EAlFKiq+5G5E+4KFp696VRvzSrJ5XFbCxek=; b=4E7nDaKO/6X1U/z1/I8qHJavd6
	i40WjzumMa//86Pus9t3Fid05y0mZeD/Kt7XQxX7LC/+vw9+JsfJXSkvn62NAEl3dBYaGmBSGytPp
	oDEKvpIAiG4ur5Hv0Iyr3u6UM20qT5SFS8a0zHrnabsQnNKecooNIO82n6LWMuewfdZrlabS8pBIe
	HFlG+zmxjrxHgZIyCSHUz7O4d/2T7j5psmdJVXsMFjgoxV3z+YA80O3Jko1P+oqu1RbgCH3T0hFri
	EzEz01C0aVLH2MJFrhsnyvSPGtE3aEZOnJ//U1GY+q6Nfa0N1q3V1FiFEFoimbN7YpEFxR7QAVoQr
	s/DyPNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQIY-0000000ELmM-0wn2;
	Mon, 27 Oct 2025 16:42:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQIX-0000000ELlz-0DQC;
	Mon, 27 Oct 2025 16:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78A7160332;
	Mon, 27 Oct 2025 16:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067B0C113D0;
	Mon, 27 Oct 2025 16:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583340;
	bh=EHx2M6g+EAlFKiq+5G5E+4KFp696VRvzSrJ5XFbCxek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPvB2bfwFV6WYvMXAd8vU17nGchCLQ9RsLgnQxYYU/R3VLUs+ekwuSmdpcUdyQuRN
	 a+rAN1sk4Em9OU6d0PtOfnDjjOFxhmEFJ96ouIFz/rxKS1M6umWvkFkW7PDvCXJPVG
	 aglqrLm0lkcOfcIx7Gnwk1ZZXLZ1ZamXoeTZ03j9eS/eVnZouOLOrijvzwhe3J5ADk
	 6QUtjwaWIWHpEnS3UWOX6G8nV2n26TgRLw/4Ty5QDr6PDoGTY0/hbmZJAX1vSkpBim
	 WhZ241SB4vpXyGkoWMLPnUZGufouVaAp4BnwRAVauXIN+YNg01QDZUBhmZVyqrDAjp
	 oYVLXH6wshbGA==
Date: Mon, 27 Oct 2025 16:42:14 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	laura.nao@collabora.com, nfraprado@collabora.com,
	wenst@chromium.org, y.oudjana@protonmail.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 6/7] dt-bindings: clock: Describe MT6685 PM/Clock IC
 Clock Controller
Message-ID: <20251027-oblivious-antiquity-1c2b0f3972dc@spud>
References: <20251027111343.21723-1-angelogioacchino.delregno@collabora.com>
 <20251027111343.21723-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NeWl3Rg4icXQ/OM8"
Content-Disposition: inline
In-Reply-To: <20251027111343.21723-7-angelogioacchino.delregno@collabora.com>
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


--NeWl3Rg4icXQ/OM8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 12:13:42PM +0100, AngeloGioacchino Del Regno wrote:
> Add bindings to describe the SCK_TOP clock controller embedded
> in the MT6685 IC, reachable over the SPMI bus.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--NeWl3Rg4icXQ/OM8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaP+g5gAKCRB4tDGHoIJi
0qinAP4qLR3o3aZJbssQAeJ7otn4Uy3XT2CNs4xAyhDkX/oUOQEAhHZSAs3z/fUg
W6t168PxJh6XweOhoxLKJANAvx6JkQs=
=JA0w
-----END PGP SIGNATURE-----

--NeWl3Rg4icXQ/OM8--

