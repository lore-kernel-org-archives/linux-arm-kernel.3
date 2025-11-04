Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFC9CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tI4PyzTCai+yW0q5uOm9mpxVGyRvru6JHvPPumwn9bI=; b=wx20FBJt7jZ9cIkQpuxKun7OVP
	UiqqArYmMapfHz0e2QRINskCQJ1n3ThBVhoVBbRoEHRVy1/E3gp4aHl71FnPjyrvocsho5SwvYq8W
	FuPy3mwXUa20CZpKD5trQMBKalJwoj8pLHxp1USYJYP0C3ioEPxz7os1f06Edn1+FPqc/r/HAu8+0
	5BzZ3VUPyId4TLQM+ScKAPEQdJQ6S6JcrcMsO+yXQdZ2IGkYDlgV97iFVV2a2q/0S+JKSKJtNK6GA
	+Gy9q7uLKkTaoIngmp+p7wRqiQDQHnzmHmR5EgRdqO+ekiJPLsM/RDN4Ob8HBpCzlK5U/iPKWCAaC
	Rz2kqQhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKqE-0000000CHA8-45Jh;
	Tue, 04 Nov 2025 17:29:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKqC-0000000CH9i-34JW;
	Tue, 04 Nov 2025 17:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E41E40257;
	Tue,  4 Nov 2025 17:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA42C4CEF7;
	Tue,  4 Nov 2025 17:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762277348;
	bh=tI4PyzTCai+yW0q5uOm9mpxVGyRvru6JHvPPumwn9bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YorEdEhWpDhiQn/NJZEVW1RFMt0ZT8Ch/UFT6N941eIHppjapbMWkDnjL/8IkxU1V
	 rhXwaP4RoWBTrswybIRIY9IYXK70xlwE/BnzQWtg3+quYzwcMuTgeH4dO8D1Kwu21z
	 w60S9nxeN9i/cWoQCyocGiPHnXhqQchmwYlWCCKrv8/N0q22MwwybSWK71pvNXtahA
	 7EWfS9HNjlnKR8o6uNQJS2t5zf/xoN8H2qp+cAil4wE4vEaIaK+r9+Vt82qE93aw1/
	 ar0gCro09h99D1kbK+zAY9v0MAq4i/ftbbuwpskFKncsgNZ2+nI296fVjQx/9Yz2yY
	 E0bu2DzTYAssQ==
Date: Tue, 4 Nov 2025 17:29:01 +0000
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
	conor.dooley@microchip.com, chu.stanley@gmail.com,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	naomi.chu@mediatek.com, ed.tsai@mediatek.com,
	chunfeng.yun@mediatek.com
Subject: Re: [PATCH v1] dt-bindings: phy: mediatek,ufs-phy: Update maintainer
 information in mediatek,ufs-phy.yaml
Message-ID: <20251104-banish-engraved-d26d5856d0fd@spud>
References: <20251103115808.3771214-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EqJ9mvMN5ps+fBwp"
Content-Disposition: inline
In-Reply-To: <20251103115808.3771214-1-peter.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_092908_812749_52DB15AC 
X-CRM114-Status: UNSURE (   8.22  )
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


--EqJ9mvMN5ps+fBwp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 07:57:36PM +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
>=20
> Replace Stanley Chu with me and Chaotian in the maintainers field,
> since his email address is no longer active.
>=20
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--EqJ9mvMN5ps+fBwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo33QAKCRB4tDGHoIJi
0slUAQDaNzoLm5qRDZGmaVZq1Z15G/qDvAUp/mAoKtEmWaHoBQEA7pl5SuOhpCFo
J+x+0i0xR53Wd/iJidGRqGo/gVi+5w4=
=IlDV
-----END PGP SIGNATURE-----

--EqJ9mvMN5ps+fBwp--

