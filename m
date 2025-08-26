Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BD1CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTrfIIo2NpXSs0VUQcS4tLNwuwhXMeQFQWFcRoLCwVY=; b=ltsBK+gJ/8A+1zv5OOGGSOHhtf
	j+QgL572+eMnFSSn9yhXvcioi2g4dCq8HcwA971gsPTmWJF2JHw5RcNtChG63p4wtksMYX7/Kf5JJ
	cj1OqNk5V9KimH0uDf+pfcaSXeGgQevLcvfXkY7TE0/prO3tZIOTiRiOk8FFOfY3rKfbuRFeLNfxr
	k+NsW6SSjCh275CW+bMECfhXWEkVoM+jDk9hgXtf2vD2zfeVjw01Jt4uY6NkU6O+Hbr2OduM/GHhe
	ZRP2KzJrmJ1oiKkuWd6ZfNQiHuZSgX32+aW0DwhxNx2zx4cZcWr6cVCc2s7P0BsAjp2yJQKY7mydH
	H427I6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvBu-0000000CNID-486Q;
	Tue, 26 Aug 2025 15:02:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqv7f-0000000CM0u-0VrV;
	Tue, 26 Aug 2025 14:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=iTrfIIo2NpXSs0VUQcS4tLNwuwhXMeQFQWFcRoLCwVY=; b=D2XHvLjjqX3PhhxJH6SySYYqgB
	1O9/+hsF1mXfum+scpQEW7fkvGngUSNtC2AEmRJiYeC+WkkdQF/J7Ju63n5qKhNqHRtj/b16BGD5P
	7B0427PHgn6FBjyUm43hrKpg9xaPP5nj26FNASxX1bI8hG+SKRfprtXLUJ+SmytMLdUlYV/hmMCkX
	UfESNgDDTa/reqn3EDauXyxzV6Iv7xUqbKnzpfN9ol/OR7LyeciRfLzh3XUxhfLj9iOoWy6viAd5w
	G4jnOyHlSvK5YiNw3aoPPKr7bNmUtRzjauWPtBP+WEnF/zk1Y5+oFAb4dWB9SNoCiXJ1tRAPTErGt
	qvk0NCpQ==;
Received: from [213.244.170.152] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uqv7C-0000eD-0n; Tue, 26 Aug 2025 16:57:38 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Hsun Lai <i@chainsx.cn>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Fred Bloggs <f.blogs@napier.co.nz>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 0/2] Add support for 100ASK DShanPi A1
Date: Tue, 26 Aug 2025 16:57:37 +0200
Message-ID: <12479023.CDJkKcVGEf@phil>
In-Reply-To: <175621649670.159455.15557432322730951360.robh@kernel.org>
References: <20250826030818.3485927-1-i@chainsx.cn>
 <175621649670.159455.15557432322730951360.robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_075807_179548_C74435F1 
X-CRM114-Status: GOOD (  25.97  )
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

Am Dienstag, 26. August 2025, 15:56:43 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Rob Herring (Arm):
>=20
> On Tue, 26 Aug 2025 11:08:15 +0800, Hsun Lai wrote:
> > This series add support for 100ASK DShanPi A1.
> >=20
> > Info of device can be found at:
> > https://wiki.dshanpi.org/en/docs/DshanPi-A1/intro/
> >=20
> > Changes in v2:
> > - Delete the pwm include file (Chukun Pan, v1)
> > - Fix vcc3v3_pcie gpios (Chukun Pan, v1)
> > - Adjust the order of some nodes (Chukun Pan, v1)
> > - Fix sdmmc (Chukun Pan, v1)
> > - Add phy-supply for u2phy0_otg (Chukun Pan, v1)
> >=20
> > Changes in v1:
> > - Add support for 100ASK DShanPi A1
> >=20
> > Hsun Lai (2):
> >   dt-bindings: arm: rockchip: Add 100ASK DShanPi A1
> >   arm64: dts: rockchip: add DTs for 100ASK DShanPi A1
> >=20
> >  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../dts/rockchip/rk3576-100ask-dshanpi-a1.dts | 838 ++++++++++++++++++
> >  3 files changed, 844 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-=
a1.dts
> >=20
> > --
> > 2.34.1
> >=20
> >=20
> >=20
>=20
>=20
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
>=20
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
>=20
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
>=20
>   pip3 install dtschema --upgrade
>=20
>=20
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/v6.17-rc1-22-g7d11b8c260ea (exact match)
>=20
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
>=20
> New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockchi=
p/' for 20250826030818.3485927-1-i@chainsx.cn:

both warnings are not the fault of this board addition, but instead
come from "unrelated" sources in the main rk3576 dtsi:


> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: syscon@2603400=
0 (rockchip,rk3576-dcphy-grf): clocks: False schema does not allow [[21, 49=
2]]
> 	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#

I messed up and forgot to add the new syscon to the clocks-required list.
Will fix that shortly.


> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: /soc/dsi@27d80=
000: failed to match any schema with compatible: ['rockchip,rk3576-mipi-dsi=
2']

the rk3576 dsi compatible is in drm-misc-next [0], so should
hit linux-next shortly.


[0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f05530bdaf42aa0=
e6bb4cde76ba6a081cf473d44



