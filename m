Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CE2C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 19:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bcw9WhJwy8zPhG5QYKyzowO/nlWGUJAb4ocjNVPbD+M=; b=UG252w03c+i8xrkF8V3oo2Vpvn
	fdVA/07TgBkvcGifKs28uMTAAFBKz7oHFS96Rpxe4E3AsCMvG608dNTNKfpgkMJhqQIy13EBPsFkC
	4mFokzyd3YR8JFU5yOyv1IFjh23EmJADHAtDhn995Cm1crutEeV9iqulyXmE9Pl7ZXbXwV2wYy8Ls
	ZthsK7kCU6x06+UIH4KKFl48k8Uq3ruf6oHTM5gD8ns2dmRB317bmYyVkSNoc+rYW6kapdzfbDKIg
	jTaQBMZ2GGSpRIb+7KxRB7qbSNsB70M/WqOGX9ufqa0uIGyf/QhwhQFTOPBAMQEgFujCDM5PK+XsL
	x5D3MiIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ueu-0000000E97C-2OP9;
	Thu, 17 Apr 2025 19:12:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Ud3-0000000E8uW-1IYY;
	Thu, 17 Apr 2025 19:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Bcw9WhJwy8zPhG5QYKyzowO/nlWGUJAb4ocjNVPbD+M=; b=eE9j55AmbmSEjJ79eSUkt8Ug8/
	ods2pey/Q/s9D0W0kHfocu8rE8/Z9z/WMtxqGXtVWe9L+s8G+jCBc3d/ptkxieHfnT9DCjwAxqxgp
	AmLgzcFgBoIseY1aOwh16oP9ENkDx8pVzXNDRUKSQHTVgrbxZcuHSbXoMuQ90zZVZAGnCTe+DflZn
	ZLkhDS+F/nlIF2KbkC6Y7hDziCCThaREaT7MnPFYL4VIn/bPYh3uNlo3RaXbYfi9p2iBBoBQoJwuA
	qd5FPWkxxK1+EAGm6GNNVDEi7dXv9CytuqL2X2WwKuTstCcUsEYa3S+7LVZgEkoY/LDsJjcqk/WB9
	RGdZL8og==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u5Ucj-0001E8-Bd; Thu, 17 Apr 2025 21:10:09 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
Date: Thu, 17 Apr 2025 21:10:08 +0200
Message-ID: <13753899.uLZWGnKmhe@diego>
In-Reply-To: <aAEUS7QQbXSvrcEs@pie.lan>
References: <20250417120118.17610-3-ziyao@disroot.org>
 <c6d3e343-7005-48a9-a133-bf39cb6790ee@kernel.org> <aAEUS7QQbXSvrcEs@pie.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_121029_594890_2A5AB696 
X-CRM114-Status: GOOD (  18.92  )
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

Hi Krzysztof,

Am Donnerstag, 17. April 2025, 16:46:35 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Yao Zi:
> On Thu, Apr 17, 2025 at 04:36:57PM +0200, Krzysztof Kozlowski wrote:
> > On 17/04/2025 16:36, Krzysztof Kozlowski wrote:
> > > On 17/04/2025 14:01, Yao Zi wrote:
> > >> Describe I2C controllers shipped by RK3528 in devicetree. For I2C-2,
> > >> I2C-4 and I2C-7 which come with only a set of possible pins, a defau=
lt
> > >> pin configuration is included.
> > >>
> > >> Signed-off-by: Yao Zi <ziyao@disroot.org>
> > >> ---
> > >>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 110 ++++++++++++++++++++=
+++
> > >>  1 file changed, 110 insertions(+)
> > >>
> > >> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/b=
oot/dts/rockchip/rk3528.dtsi
> > >> index 826f9be0be19..2c9780069af9 100644
> > >> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > >> @@ -24,6 +24,14 @@ aliases {
> > >>  		gpio2 =3D &gpio2;
> > >>  		gpio3 =3D &gpio3;
> > >>  		gpio4 =3D &gpio4;
> > >> +		i2c0 =3D &i2c0;
> > >> +		i2c1 =3D &i2c1;
> > >> +		i2c2 =3D &i2c2;
> > >> +		i2c3 =3D &i2c3;
> > >> +		i2c4 =3D &i2c4;
> > >> +		i2c5 =3D &i2c5;
> > >> +		i2c6 =3D &i2c6;
> > >> +		i2c7 =3D &i2c7;
> > > Aliases are not properties of the SoC but boards.
> >=20
> > Of course this should be: Bus/interface aliases are not...
>=20
> Thanks for the explanation. Will move them to the board DT.

I think we're having that discussion for every soc :-) .

Uarts. gpios, i2c and spi are always labeled foo[0-...] in all pieces
of Rockchip documentation.

The i2c0 controller has pins i2c0-scl, i2c0_sda; i2c0-labeled iomem;
i2c0-labeled irq, clk_i2c0, resetn_i2c0.


I completely _agree_ that {sdhci, sdmmc, emmc, sdio} -> mmcX is fully
board specific, but i2c0 should always get the i2c0 label and no other
controller should occupy that soc-specific i2c0-space, because that would
cause confusion without end.


And with the above it makes no real sense repeating the same list for
every individual board.

If you _insist_ on this, then fine, but I really don't see the point.


Heiko



