Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DF0CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFZMT4X0ydXAwYokeo5s/xSwNHNRrrpYl6Xp97XCQkI=; b=FkklDNBtkCSkLa4hd6d9N70JBG
	mS9ncfmW/1pAodWD4nuzYccCY3MIxrn8hhegmG/F+l3GDaEP3dU+TjYID28Q2WNPJg7hAoOYTnW84
	MIsMRghp10JZHtXTi+fUVjqSWXYUjEyq3kH0sbcvwh6Tap317Yd2iBedbk+hOa8eVSrrDoBSJm9V0
	bolW6bOdNUpqk54rwMRtfw7yKNYeiVN2UdcAB9lKfODycddZmzFGQh9S7f+DO3iAGsiGhT45FNLJ5
	SaLQkxTkiB2zIVgt1jgnl/Ty9sQrPvTnsHlg4Q0+CtBIVLz4r8WDvK0yaDp9LhF1qv7pI1bHeBW3b
	BylrfGwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTzJ-00000008UKS-0NX9;
	Sat, 30 Aug 2025 22:23:57 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTwV-00000008U3Y-0EoA;
	Sat, 30 Aug 2025 22:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1756592461;
	bh=7k6q+f86ghK/n5B2VunwMH6m8MBXQ8m4bSBSm/fUtbo=;
	h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
	b=hwKdG4Z/bj7zMZIaxP+nL9Fm2QP6YdbTrxIg5YsgAXPLzNhhlbb1AfXosHe0tDz+b
	 p9D87AZO+rS8K6n78LaIvLa1MLTeufK+GEAFGi5fV8q8IIkpe64Lnfwml3IDpArcUH
	 Bty9g3c156i8nJAHu+8UoZp/cPWSjjIlyh9nF7UnoEtjSdS7rp6UD6c343X/6vgnSa
	 9hZbdJU4sM3GhhHvU4LGt3ysGab5TpqWvvTmnW652+JmTm3FUNw5SQlxArvHOMQzRG
	 DGdMwYPBW1IRlnjbiOC/xGYu7XcJyyVeuHQA8lXJvVMoF3LxpiEDq5zIsiUA+tqSjH
	 fZUMZ6K3P68CA==
Received: from smtpclient.apple (unknown [IPv6:2600:1000:b0ec:e674:574:f959:86e5:7770])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 547F427E468;
	Sat, 30 Aug 2025 22:21:01 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Erik Beck <xunil@tahomasoft.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 0/4] arm64: dts: rockchip: Add HINLINK H66K/H68K
Date: Sat, 30 Aug 2025 18:20:50 -0400
Message-Id: <AAEEDECA-1419-487E-B018-E0590ED532D1@tahomasoft.com>
References: <2803b3d8-332e-4ada-a28f-eeba8285b7ec@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Chukun Pan <amadeus@jmu.edu.cn>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <2803b3d8-332e-4ada-a28f-eeba8285b7ec@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: iPhone Mail (22G100)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_152103_293253_68A7B0B2 
X-CRM114-Status: GOOD (  13.88  )
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



> On Aug 30, 2025, at 17:30, Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> =EF=BB=BF
>>=20
>> As I worked on my dts, I discovered that the 1Gb ethernet ports, using an=

>> RTL8211, don't support rgmii-id mode; only rgmii.
>> (https://www.realtek.com/Product/Index?id=3D3976&cate_id=3D786).
>=20
> Which exact RTL8211 does the board use? You link to information for
> the RTL8211FD(I)-CG, which i assume is supported in Linux as RTL8211F.

Thanks Andrew; It isn't clear to me which specific variation it has. I'll ta=
ke another look at the boot logs and see. The silkscreen on the chips are fa=
int, but will look there too.
>=20
> https://elixir.bootlin.com/linux/v6.16.3/source/drivers/net/phy/realtek/re=
altek_main.c#L519
>=20
> This indicates it supports all four RGMII modes. And in general, all
> PHY drivers in Linux for RGMII PHYs support all four RGMII modes.
>=20
>> Changing this makes a huge difference in the ethernet throughput speed. W=
ith
>> rgmii-id mode specified, throughput is about 6.5 Mbs. Changing this to rg=
mii
>> mode increases throughput to about 960 Mbs.
>=20
> Here is some more information about that the four RGMII modes mean,
> and how you should use them in Linux:
>=20
> https://elixir.bootlin.com/linux/v6.16.3/source/Documentation/devicetree/b=
indings/net/ethernet-controller.yaml#L264
>=20
>    Andrew

Thank you!
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

