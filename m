Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65124CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSVBogs8wZlL8f+unkLgV7PAXChY4XYERFSmsxvSdas=; b=LsLz1i6yOskA2NE9y9+5fGtGv0
	V7NQAzLzTDbGEEpKPGYrQq5hcg6D3ZZwAzBzd8+ToTh1GSSJpIYN8ReG50o0EjWhzxBe58zIvJ2/U
	BWPDFoTmCipziZianmlrbrb2zMIgGrQyMd7OgN9KB76BccXQd6DGhAlOkJBYI16f7K2aS3SaUlTSj
	bEFuUgfYqGeoA1rZb7GvXEm2e66BSXL+lH9XujEdAuUgX27aiAAWMBlpGc9KnCkAhppPfAAlDzvHh
	7FA5P2fQ4uB6eMZdsFLPt7ydgYRfjkXmt6G5vxrnyxbOV5H2ZIAq3C62vJK2NOa2w+Hzy+XG6OqPM
	zGpQgB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3cK-0000000G0BR-0imy;
	Thu, 06 Nov 2025 17:17:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3cI-0000000G0Ay-3UXr;
	Thu, 06 Nov 2025 17:17:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33641416C8;
	Thu,  6 Nov 2025 17:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C7FC4CEF7;
	Thu,  6 Nov 2025 17:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762449466;
	bh=0ScbR3dIWZuGfPd/m1biwfKr5EFkVq/9KvUzKV5rBsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GAsOBwYvSmiWBMkQvbyIQQUdabHtyWtGNDm2Zs7IuGAanDw185mLPt8Q+b4oaGs/7
	 fwAkld0A+9b7DGUprifrQaeQN6t95BxZwy5DVS0atkInBH7LX40WHQOKiXreAKH2C5
	 2ViTH1EWk9AQKWOXZpSswEQVdYDO3g+x9Wb+seK2w2hgQIHEZM1gOetalL6zwLl9QQ
	 DiE9mCfmPHf2CT5GgBUjyCV2jVh72XIy/+FZubQmI+BG1h3jRx4BcFHYg+iXysgkJ0
	 PzsiQ50lKXdeBvlfl36vkQcn5DLi7oW/qmNzNsbb5w4qoGOx4yG4WMVju/LqjWycEH
	 5RZL8xdsWGE0g==
Date: Thu, 6 Nov 2025 17:17:39 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
	linux-kernel@vger.kernel.org, sirius.wang@mediatek.com,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, netdev@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, jh.hsu@mediatek.com,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Qiqi Wang <qiqi.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	vince-wl.liu@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 02/21] dt-bindings: power: mediatek: Add MT8189 power
 domain definitions
Message-ID: <20251106-spearhead-cornmeal-1a03eead6e8a@spud>
References: <20251106124330.1145600-1-irving-ch.lin@mediatek.com>
 <20251106124330.1145600-3-irving-ch.lin@mediatek.com>
 <176243607706.3652517.3944575874711134298.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+Xv0HMX2DI7Xds1A"
Content-Disposition: inline
In-Reply-To: <176243607706.3652517.3944575874711134298.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_091746_890658_E4232437 
X-CRM114-Status: GOOD (  13.17  )
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


--+Xv0HMX2DI7Xds1A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 07:34:37AM -0600, Rob Herring (Arm) wrote:
>=20
> On Thu, 06 Nov 2025 20:41:47 +0800, irving.ch.lin wrote:
> > From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> >=20
> > Add device tree bindings for the power domains of MediaTek MT8189 SoC.
> >=20
> > Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> > ---
> >  .../power/mediatek,power-controller.yaml      |  1 +
> >  .../dt-bindings/power/mediatek,mt8189-power.h | 38 +++++++++++++++++++
> >  2 files changed, 39 insertions(+)
> >  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/clock/mediatek,mt8189-clock.yaml:25:9=
: [warning] wrong indentation: expected 10 but found 8 (indentation)

pw-bot: changes-requested

--+Xv0HMX2DI7Xds1A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzYMwAKCRB4tDGHoIJi
0nmhAQDiZU8wBW88clHOFWBW6EUlbvwg8hpQsJHRsU0zYUeD8wEAhV9ZSL1yJnwX
Pto0YC70zerSxjKSh9vPW47pcpFiOgg=
=mZSZ
-----END PGP SIGNATURE-----

--+Xv0HMX2DI7Xds1A--

