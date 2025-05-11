Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212C4C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRFRSL4n+C5Ljmoz7zXxqe6F+2Vxs8e68R7K0G+IUDg=; b=eqlYimy87tH9PCu/Xi8fJU8cpY
	W3UW2oxX/YEt3msCE7ZyazabZ/R6ul+78XwLdmvDNV6Qs/xc5fKoPLlSfYFpwPY1POTu+DUxdI3Ep
	T9WgPQnjvnDhPLII7uun6JFWvPLsaqAl4Q10XhKtEn2bnwEgakZfkNKg/A6Nyn4MaI/12mwKLTJsL
	u/gwCBhgU8gJvR9rDlUhjS2rxE6+OieDbr9PF868w64iZNVwv2g8DBSBVTdR8ytxsOwqshXyYyqqW
	zHiS35sd9gUDoK2lXMbzmTtwaZy4/042kDjDWg94cZtWaohplLcfhxCLdqyFssbWTwk/d8/eraBTy
	t+2A0A4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE8hP-00000007SLh-0Cer;
	Sun, 11 May 2025 15:34:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE8fO-00000007S4Q-00lZ;
	Sun, 11 May 2025 15:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PRFRSL4n+C5Ljmoz7zXxqe6F+2Vxs8e68R7K0G+IUDg=; b=KU5RE11TXzjKXsnuOH57r+OCky
	p3sAUfWcD4yMEvwgOuA+lslZfvovBV3A5kdr+q5XFYa5gXd+Iz5QUnVKIeOkgRTWjWMniiugaHLf1
	egiVETrR7pGLWeSqTd+9FTT7MiXBSOQFSdFZkPdHU883hGfU14E0wSNkOBdqtjwtf7R5OMnpGpoNi
	Hg9bK8oysxMomikVSGmNrU0XGKIvbB8Q7Zhyx9n3XhR+edbVNyFSsTyf5NU1RSA2tj60bx5UXDzDw
	BZcVr3rW7ATFZ49aun9Nf0mZsB6KUTN5yi8UfQFdt35i4OKh3qRITLfhcY3wpWnt8xJYk2TeRtv0z
	li1qLw4g==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uE8fH-0000IX-8U; Sun, 11 May 2025 17:32:31 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: amadeus@jmu.edu.cn, ziyao@disroot.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 4/5] arm64: dts: rockchip: add core dtsi for RK3562 SoC
Date: Sun, 11 May 2025 17:32:30 +0200
Message-ID: <6747980.G0QQBjFxQf@diego>
In-Reply-To: <20250511150101.51273-1-amadeus@jmu.edu.cn>
References: <3317829.AJdgDx1Vlc@diego> <20250511150101.51273-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_083238_065198_E2E3EF86 
X-CRM114-Status: GOOD (  14.46  )
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

Am Sonntag, 11. Mai 2025, 17:01:01 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Chukun Pan:
> Hi,
>=20
> > I might be blind, but I don't see a tab missing here? #adress-cells and
> > #size-cells are in the same level of indentation as the other properties
> > of spi0? I did move the -cells down though now.
>=20
> Sorry I didn't make it clear. This refers to -cells.
>=20
> > hopefully caught all pwms now
>=20
> The pinctrl-names of pwm4 to pwm15 are still "active".
>=20
> > +		saradc0: adc@ff730000 {
> > +			compatible =3D "rockchip,rk3562-saradc";
> > +			reg =3D <0x0 0xff730000 0x0 0x100>;
> > +			interrupts =3D <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> > +			#io-channel-cells =3D <1>;
>=20
> > > `#io-channel-cells` should be put above `status =3D "disabled";`
> >
> > moved now :-)
>=20
> It looks like saradc0 forgot to change.

adapted the rk3562 dtsi again, with those last remants :-)



