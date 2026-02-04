Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00735EA7943
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 20:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd5J4KD+UWilIWXl775s3u3AtyqpuOqe1d0igb4DjAA=; b=k7SggY1htkXL2txmt9ELi9DxPy
	IzLVzbqusnl8u0HJfTGsnuVDUE58gYwAvkqt1fw/sgRs4Hu42Torn4mMfOOaQrrOJTLZxjOBj9bU5
	jsWQshsbRTTHpAHHnMmijgE9sN9YFqc0y7vrDLPyLtJCaM4IGRwr22gLCLG92koVRbewAPt236Nld
	IqI85Hux1NXsw3LqA8VxOjFV5v8aIND8Lt4trySqLXi6lVLeGLDUqYnaSyRKh0up/XufMmxrixaJZ
	bW7eJNEHOAiMrzdHCeasBN+rJzEA5uOvr82V+mPvurrXIdcCayFdYP5LdSm5uWJXuq/oS8sIvBEdY
	Oyl21K+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnj4G-000000091Ff-3TlB;
	Wed, 04 Feb 2026 20:01:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnj4F-000000091BP-1J9s;
	Wed, 04 Feb 2026 20:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Kd5J4KD+UWilIWXl775s3u3AtyqpuOqe1d0igb4DjAA=; b=Plki93Y0Vg2Z02yx9+FEnzgMGz
	Frkfzx0V8NKR4Lr+NCI7ylSr+VZTvlviKazEkMiKPHd5IwUjcNh4BGvNf8oAJsLtj8X+uBU04qai8
	wWvG/SBIpAGg5VcA1fTk499mXZ/ZM/N4ipqii10r41A8Mdajmur6vspH3hiISQEFG2DK1HXYwnoMu
	sk5ZwInCtUpoPCH80rFz7gJWyy0M5b8Pd90Qsv+KWdwh6a7R9HknzaHrBJKIuUf8hPqJiQE4k9FsX
	V9iv09y9VOLtZWNa+ovsYVgwILrUFUp9A4XgvxEdIZBYpL9QJIinzHwBXvtbmNYT6PE3NdXKUkBU9
	D/JiwJNQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnj47-00000001BQP-3IVf;
	Wed, 04 Feb 2026 20:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Kd5J4KD+UWilIWXl775s3u3AtyqpuOqe1d0igb4DjAA=; b=t1vzuh4BbUI7J8iR5DF6aPXWu9
	cRtor9rSOEClYtro/eJzqXsDxY1ywe6TGGvU5O9n5Hk8vm+q+BrFZJifHcC55IEY+0ODy+z5hyqM7
	B60pbQ9Jgn2LCQYdppcEiH5llI1QB4NbPb2B/7C/ybfAT3n9xcYKVhdalqfUVQwVM+u+r+Og4qEiN
	xgzswZdFjAsPvvBrJOuSDtLYippmhkiClUgHWbvzT792dOmvEdRaBv46sQbmrhmTTU9vlUra2V3NB
	sTITHHb1Xxb8/C8MbAiIczc+6fMdbJTVM2vikQ1mrertPl2tgRBrIk02sJuydrSBANQQCAjNsqe18
	WQt2CSkQ==;
Received: from i53875ac7.versanet.de ([83.135.90.199] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnj3v-0070xM-9X; Wed, 04 Feb 2026 21:01:19 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 4/6] net: stmmac: rk: rk3528: gmac0 only supports RMII
Date: Wed, 04 Feb 2026 21:01:19 +0100
Message-ID: <3881472.Sgy9Pd6rRy@diego>
In-Reply-To: <E1vnYy1-00000007hp3-0hKm@rmk-PC.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYy1-00000007hp3-0hKm@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_200134_602550_F189FD9F 
X-CRM114-Status: UNSURE (   9.24  )
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

Am Mittwoch, 4. Februar 2026, 10:14:33 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Russell King (Oracle):
> RK3528 gmac0 dtsi contains:
>=20
>                 gmac0: ethernet@ffbd0000 {
>                         phy-handle =3D <&rmii0_phy>;
>                         phy-mode =3D "rmii";
>=20
>                         mdio0: mdio {
>                                 rmii0_phy: ethernet-phy@2 {
>                                         phy-is-integrated;
>                                 };
>                         };
>                 };
>=20
> This follows the same pattern as rk3328, where this gmac instance
> only supports RMII. Disable RGMII in phylink's supported_interfaces
> mask for this gmac instance.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>





