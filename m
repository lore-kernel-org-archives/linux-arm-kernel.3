Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9088CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jz2YYHrj1dgz9D267IoLZDXvPm7YaDuL+I5moOpvFWE=; b=u8b5/LvZHKDxHay2Re0nP2cAZ3
	sb6MDrdBdddcoHxh6pubLXb4+08diAzcx61b6xmllWVkCUuR/RH3uQJwrRsT4RL3kV+xLeDvgBa+/
	I01eVS7mpdUg3ls589tvQdrYuy63In1SHWu1Wo28UvRHjbXaxhP0bg+qhek+j5ZS/RV2umxcegtCv
	wGlJVBpUE5SvXKxSeFhotRH9wrG7DGp9f8DyHo0OyHNoy7ZH2EmThzPwgamJrVhD0r/bmYAnecdYt
	IJ2P6HeimiTYyxJU3uLx1EeLoqv3EEsl8l0pXjfyfILBvSV+WtRZCP6oQa0AWKylvSSgst7Du032I
	sxauSxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRn54-00000001Mjo-0AY8;
	Tue, 26 May 2026 08:24:06 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRn50-00000001Mj3-2Idw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Jz2YYHrj1dgz9D267IoLZDXvPm7YaDuL+I5moOpvFWE=; b=ZyGQyVQTYvZazDTz43A4s9V6U6
	RiYJ8cZTKGcPRbAVpyh2CSvaWNEwsxidxgPIBNUAcx2T+XJbHyGSh7Ih9laSNIh/hejE1Bn/XmX4F
	EabNmK8K64bIMz1tbBAZwGmuOXTF3253BwT8B9oRH+U/pUbRy1CGF1w6LeA3iltvR2/sySAiJNtvv
	NfbsJyltzrEARriRgXsdJTXJ1TCWCcl6jCTYJDkrrbOKQTjFGQZWzDrNKTKazDNoqe3s1AxTCekA2
	rl15FCUNp35Ws01m4aDnpvFn6vGyy8XfmGEuDE0zDnN3GuIqCeQbFrRSaEJg/H4vRPrY5nJHJJWbo
	oyc6dRhQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wRn4y-00078m-0z;
	Tue, 26 May 2026 10:24:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy06.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wRn4x-000EHC-11;
	Tue, 26 May 2026 10:23:59 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 0/7] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Tue, 26 May 2026 10:23:58 +0200
Message-ID: <2834667.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
References: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28012/Tue May 26 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_012402_691854_138FB4DB 
X-CRM114-Status: GOOD (  10.19  )
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

Hi Frank,

Am Dienstag, 31. M=E4rz 2026, 16:19:01 CEST schrieb Alexander Stein:
> Hi,
>=20
> this series adds small fixes and improvements for TQMLX2160A DTs.
> The DT overlays address specific hardware behaviour when serdes is config=
ured
> differently.

Any feedback here?

Thank and best regards,
Alexander

>=20
> Best regards,
> Alexander
>=20
> Alexander Stein (1):
>   arm64: dts: fsl-lx2160a-tqmlx2160a: Remove deprecated properties
>=20
> Nora Schiffer (6):
>   arm64: dts: fsl-lx2160a-tqmlx2160a: fix LED polarity
>   arm64: dts: fsl-lx2160a-tqmlx2160a-mblx2160a: use DPMAC 17 and 18 for
>     SGMII in SERDES2 configs 7 and 11
>   arm64: dts: fsl-lx2160a-tqmlx2160a: add aliases for all 18 DPMAC
>     instances
>   arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: add various GPIO hogs
>   arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: enable pcs_mdio17 and
>     pcs_mdio18 in appropriate overlays
>   arm64: dts: fsl-lx2160a-tqmlx2160a-mbls2160a: specify Ethernet PHY
>     reset GPIOs
>=20
>  .../fsl-lx2160a-tqmlx2160a-mblx2160a.dts      | 306 +++++++++++++++++-
>  ...l-lx2160a-tqmlx2160a-mblx2160a_x_11_x.dtso |  20 ++
>  ...sl-lx2160a-tqmlx2160a-mblx2160a_x_7_x.dtso |  20 ++
>  .../dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi |  23 +-
>  4 files changed, 357 insertions(+), 12 deletions(-)
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



