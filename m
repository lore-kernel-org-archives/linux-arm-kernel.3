Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC7ACA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 13:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5c+0+oYE+tS7iK4TXn4hPbelEo4k0fM5Jp/KTALRgDw=; b=c6WbNfaLFDUkVmp9DCa2rS/KeL
	N1qDGVoRbl8W1a5pZ25o2AFcvu5ZEAqWNMToQRc6JjBylmGp8x88jyGF3IYhfup0dyEUVoGRcroZs
	hYO8yglHjXS/UWHria7Elo/JFtuZkr+B7JPJYWreg5tXC3m79xN4pjpvSaSk3JO7boosjv7HgOwwW
	mHdH0TRzrZdrio9t5Ai8kMoEyUrFlcGkNccFPk3HabfDNVpTQmin2KfPFnkNS/HYZAZToD0fO4Yq5
	1ctdg2r/XF2g2PLGzx9lRbOSyh0iTwIfx5sWEBqTvGaI46YavKDGcmK3Xy9pDTNBTujsM1t7pfA+v
	SDH+eHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usiZm-0000000AFfR-1YmY;
	Sun, 31 Aug 2025 13:58:34 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usiX2-0000000AFYE-0jxL;
	Sun, 31 Aug 2025 13:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1756648542;
	bh=0JG/R7bAPQm+MlZqDUVOJ+JY4WzqiuAbKuf2QpGCbFA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D37S7zqU2/F08JIqFoIrL8DJEcIUVIgB/zPrNVJpOp5BSM2nUvb4LXkuIPWOrB2z7
	 GESW0lUajM8e6O0kd6lP+B2T4nG9MsvkXfmzGSKDcGjvtxCPjt5A0qPe2t6IlFOsjW
	 Tyq3lcDuJgySMWmzr4MY5ZmPlmp/WEDZCRlOmqrPQuO6flF/9L1IWbdKn7gpOL4WVr
	 6fikEV0C85y/GSryytNG06kKqqv0/mXN4I1CFFpcuyQhfSBxaMbg7cK1TExGSbaA/9
	 6bblqQ2A/iyL26sH4pl1XJCtE5HxCZ7q14uza8Dag5AG0hHMAfxVV6PMiwH1psrUzW
	 1d2XiN8gzeS+Q==
Received: from WahpenayoPeak.tahoma.link (unknown [IPv6:2600:4040:50be:5a04:7b87:89ea:8410:bae3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 78C2D27E468;
	Sun, 31 Aug 2025 13:55:42 +0000 (UTC)
Date: Sun, 31 Aug 2025 09:55:41 -0400
From: Erik Beck <xunil@tahomasoft.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: Add HINLINK H66K/H68K
Message-ID: <20250831095541.49568044.xunil@tahomasoft.com>
In-Reply-To: <AAEEDECA-1419-487E-B018-E0590ED532D1@tahomasoft.com>
References: <2803b3d8-332e-4ada-a28f-eeba8285b7ec@lunn.ch>
	<AAEEDECA-1419-487E-B018-E0590ED532D1@tahomasoft.com>
Organization: Tahoma Soft
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_065544_341878_6FFAF73E 
X-CRM114-Status: GOOD (  20.48  )
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

On Sat, 30 Aug 2025 18:20:50 -0400
Erik Beck <xunil@tahomasoft.com> wrote:

> > On Aug 30, 2025, at 17:30, Andrew Lunn <andrew@lunn.ch> wrote:
> >=20
> > =EF=BB=BF =20
> >>=20
> >> As I worked on my dts, I discovered that the 1Gb ethernet ports, using=
 an
> >> RTL8211, don't support rgmii-id mode; only rgmii.
> >> (https://www.realtek.com/Product/Index?id=3D3976&cate_id=3D786). =20
> >=20
> > Which exact RTL8211 does the board use? You link to information for
> > the RTL8211FD(I)-CG, which i assume is supported in Linux as RTL8211F. =
=20
>=20
> Thanks Andrew; It isn't clear to me which specific variation it has. I'll
> take another look at the boot logs and see. The silkscreen on the chips a=
re
> faint, but will look there too.

dmesg reports it is an RTL8211F.

> >=20
> > https://elixir.bootlin.com/linux/v6.16.3/source/drivers/net/phy/realtek=
/realtek_main.c#L519
> >=20
> > This indicates it supports all four RGMII modes. And in general, all
> > PHY drivers in Linux for RGMII PHYs support all four RGMII modes.
> >  =20
> >> Changing this makes a huge difference in the ethernet throughput speed.
> >> With rgmii-id mode specified, throughput is about 6.5 Mbs. Changing th=
is
> >> to rgmii mode increases throughput to about 960 Mbs. =20
> >=20
> > Here is some more information about that the four RGMII modes mean,
> > and how you should use them in Linux:
> >=20
> > https://elixir.bootlin.com/linux/v6.16.3/source/Documentation/devicetre=
e/bindings/net/ethernet-controller.yaml#L264
> >=20
> >    Andrew =20
>=20
> Thank you!
> >=20
> > _______________________________________________
> > Linux-rockchip mailing list
> > Linux-rockchip@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-rockchip =20


