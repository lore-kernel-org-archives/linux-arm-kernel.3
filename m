Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5DFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFhm8QSHFsaBzVtjUGvWFwTajdebEfWzr4twGJPGSbI=; b=HT69cN8q97bhJP+s2ySaRd2SGT
	MjBewUOHplGvGWq9fnfc/4eerl4JBhihF4RKeVeezxmSMb7Yq5Eg3Ho+Cf2IID6LPAQpucPX8iUBO
	r67uJIBo3/JIAL8hRWV1wSPAzqMrYmmJ0hQs78+HJzCHjrzKg1n70ptaEpO+/sIRDx1n/9vc1Zqcj
	zEIUWJDc/kYY7CzBq5SOGhhgC91ngw9c2SJy5UstbdHSeWDv+FL4SvONgTZBIQmN+aOUuWxfrXx7b
	DJaRJYv6OfLVoYhhwdweUGHkSbgK5AdQ6XlQJRlOOuCjY+h5Vuedo5c9gdQgfgwsP4Hxo2tohlx53
	Ovl+pS4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEr0G-00000006Jdx-3mJH;
	Fri, 31 Oct 2025 15:25:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEr0C-00000006JdS-3KZn;
	Fri, 31 Oct 2025 15:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E4D741925;
	Fri, 31 Oct 2025 15:25:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60665C4CEE7;
	Fri, 31 Oct 2025 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761924320;
	bh=KFhm8QSHFsaBzVtjUGvWFwTajdebEfWzr4twGJPGSbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1ijWR18kMG/0SkKaVg7f3w9jv18uN628InDoCYiZkZjUPvp5nvKELsS0mRqR5nxg
	 ZYEBsmM39/GvJGLwuFP8biHGj5U7k+2B6IyiA+wSub7yP46Zp2uLevvirb5IiBq9Qn
	 27aA2ymj1KiowLIu7POr+6KOEJTj3Kr8x/B8nO7OXG24zpxMGvSwSd4K2vm/zYT20i
	 IKF9lwpbYOKByVoQ6VwKgURufVDLdLOQNuzN7E6b7iIWEmbq7gP4uJuV3jHByaJkPl
	 nH2OMvAG3C2LagyKuFTHwIt9SDYAFI5FShmIsCUu57B74h5CspkWdKbiZFfpRgKN1z
	 74Du7awCWQTUg==
Date: Fri, 31 Oct 2025 15:25:13 +0000
From: Conor Dooley <conor@kernel.org>
To: peter.wang@mediatek.com
Cc: linux-scsi@vger.kernel.org, alim.akhtar@samsung.com,
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com, lgirdwood@gmail.com,
	broonie@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org,
	michael@walle.cc, conor.dooley@microchip.com, chu.stanley@gmail.com,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	naomi.chu@mediatek.com, ed.tsai@mediatek.com
Subject: Re: [PATCH v1] dt-bindings: ufs: mediatek,ufs: Update maintainer
 information in mediatek,ufs.yaml
Message-ID: <20251031-chokehold-whimsical-f170ff80a3df@spud>
References: <20251031122008.1517549-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FZhgm9MdlRUb4vyf"
Content-Disposition: inline
In-Reply-To: <20251031122008.1517549-1-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_082520_854822_34B38472 
X-CRM114-Status: UNSURE (   7.80  )
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


--FZhgm9MdlRUb4vyf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 31, 2025 at 08:19:12PM +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> Replace Stanley Chu with me and Chaotian in the maintainers field,
> since his email address is no longer active.
>=20
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FZhgm9MdlRUb4vyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQTU2AAKCRB4tDGHoIJi
0lxDAQDnqUv3F3CoI6VNQS/YLHR+P/uzSEC4D8N+dRkjtTURqAEA6gZf8OgzCdGv
/YO0n/TF4LFqZP8UAriDm1Ac3yPkfgc=
=0uFI
-----END PGP SIGNATURE-----

--FZhgm9MdlRUb4vyf--

