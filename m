Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F21C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3fedP2j29dzJv3iQBEaY09Mv/bRRJcSGOL0UIdLpZg=; b=kgbDIj4zKhkqkL40F0buXGafch
	Xc3tFIn/bv5kS9dcgmR7dwmUvtf0MK3UbexHeH/u8cru3IGTLW6QItaoGMsonS+rEdFNMtxg/rrFh
	Ew4prawbzu6jCF0mX/TLJKTNvzozu3QiQjoo+RGX8mniYEYxhtnqVq0nBZIUorwaeu6o03TRu0j1w
	tCfF/YqqD9a5QezzWhIc2JlohCAZQ0BO+LJzosTGrMjQ9JwwJgs7g37SB2ZaTsawUR7oZt7TF+FeD
	Fq+PVz9HG5R0V9Rg4rcxTsaehp06MEYB4C2IAK6EUj2MU+SMBBtm/1jn9h0u59/gsdwDxlnZN54bB
	X+cP/XoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvCX-00000009C0L-03zM;
	Wed, 05 Mar 2025 20:18:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsuO-00000008qK7-0PpS;
	Wed, 05 Mar 2025 17:51:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n3fedP2j29dzJv3iQBEaY09Mv/bRRJcSGOL0UIdLpZg=; b=KpRJ85NWygyAHN8HbcxaakUNFO
	ihqAWFrDoZvZSe3SuhLCxT6YmmPsamgr+rOxHYubtTj4ZNO44WafHpBCOaVzOF4DDJnnB73QCFQIX
	GwjN8YdXhA67meKqscS22p4I+iMizwIpETGqUuvZMmLVCXnMi5R2sNgtxkRJW5jWRU4LlLa49fIAG
	3TrXWVo3v26EVFt1pW28cHu8r0DiP1SNirY4lnvF6sgk5ynJ3TYZoIpF3fNnuWHrgIheZrZ/MgBas
	8ovbdMmbCBml1e8DNHxKaaTUr268Ejk/scgoABYiTiL+eTp8KtZq7w0J5EOad+NpLyAW9WeSacMJx
	nq6ghPaQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpsuF-0004MI-U0; Wed, 05 Mar 2025 18:51:43 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Yao Zi <ziyao@disroot.org>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3528 QoS register node
Date: Wed, 05 Mar 2025 18:51:43 +0100
Message-ID: <3543865.CbtlEUcBR6@diego>
In-Reply-To: <20250305171724.GA2149138-robh@kernel.org>
References: <20250305140009.2485859-1-amadeus@jmu.edu.cn>
 <52155b03-20f3-4e64-b636-70042db03ffa@kernel.org>
 <20250305171724.GA2149138-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_095152_159550_17A7E2F1 
X-CRM114-Status: GOOD (  22.67  )
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

Am Mittwoch, 5. M=C3=A4rz 2025, 18:17:24 MEZ schrieb Rob Herring:
> On Wed, Mar 05, 2025 at 04:41:23PM +0100, Krzysztof Kozlowski wrote:
> > On 05/03/2025 15:00, Chukun Pan wrote:
> > > Copy QoS nodes and add rk3528 compatible from bsp kernel,
> >=20
> > No, don't copy stuff from BSP kernel. It results in terrible DTS.
> >=20
> > > these can be used for power-domain.
> > >=20
> > > Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> > > ---
> > >  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 160 +++++++++++++++++++++=
++
> > >  1 file changed, 160 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/bo=
ot/dts/rockchip/rk3528.dtsi
> > > index 5b334690356a..794f35654975 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> > > @@ -122,6 +122,166 @@ gic: interrupt-controller@fed01000 {
> > >  			#interrupt-cells =3D <3>;
> > >  		};
> > > =20
> > > +		qos_crypto_a: qos@ff200000 {
> > > +			compatible =3D "rockchip,rk3528-qos", "syscon";
> > > +			reg =3D <0x0 0xff200000 0x0 0x20>;
> > > +		};
> > > +
> > > +		qos_crypto_p: qos@ff200080 {
> > > +			compatible =3D "rockchip,rk3528-qos", "syscon";
> > > +			reg =3D <0x0 0xff200080 0x0 0x20>;
> > > +		};
> >=20
> >=20
> > Did you just define syscon per few registers? Third case last weeks...
> > so no, define what is your device here. 8 registers is not a device usu=
ally.
>=20
> Well, it is just a new compatible on top of existing 'qos' compatibles.
> And in a quick scan I didn't see other things adjacent.=20

Also, those "Quality-of-Service" register-sets are generally identically and
configure the interconnect-voodoo for the individual devices they're
attached to.

And while we are not "tuning" stuff at the moment, the register contents
need to be saved and restored when the device's power-domain is
turned off or on.



