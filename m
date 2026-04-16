Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1669EF43841
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gl0Q5lzwMmxfxn+nsop3W8hwu06PK5GdVZhuc+ngXw=; b=Fk5yyYybY+GZLNpXE/5CaOOMJH
	M8jaCUnznY8mG7RtGkH+aolc6sS4WfQqgt5SDmCEwtrLZy2XaQovPH2CvsIus3MVZr9QJ9i89ikfM
	/PEq3iO3q4SDupkdc66VRsHW7R6mINFKR2qATz6Ie/rTmf/YG24808go8mbBhfNtSXhrdF7y0Uj94
	RIQk+QaU9ttg7MaILq1nZiBNHR9vICfoabLU2oIuVJd6Z1bs2QEpDkn6i+dY75bym56jtznAb5Th+
	4d/ZVlrXyNtr0IFtZWA98aD0uYrY8odNgxKxKgoKp3UKLIxVRdpik4NkqzlP3CS5lyhqKGl5nudXe
	hZTOl3cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGO4-000000023iX-18WN;
	Thu, 16 Apr 2026 06:39:40 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDGO1-000000023iC-34VR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 06:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3gl0Q5lzwMmxfxn+nsop3W8hwu06PK5GdVZhuc+ngXw=; b=P4OgWa9GwqfivTYMTkIqYFa4np
	aEWtzTILtPjzT9EZxk5Qk8REDpF4dp9C175bvElGoSsevjD3j5OI/JZvJd2Z9qufuhGQkmHseIpug
	lf39E6fx9xUrSCfU2/rGtLMAh8O7X08yE+PkuVQ1B7LLeeLy4Uh49eTGMahdNJ6i8OGlqBX3X+hDl
	tf7PJZyL7wT2XDldld2WW6Yf+B2hGdYdWDnf8EnJfTSPpS+tSKLcl3Q7MfMvhnjeXO98At2jqIoDB
	SegQtrwVi/nz0L1gWAsNfkibkq2Y4ZeszKb/NzQOdAvqoI/0/28vA57BYCT0hlQKzhZh9NI++u5I1
	kZkEGfVw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wDGNz-000GxI-2s;
	Thu, 16 Apr 2026 08:39:35 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wDGNz-0007Zf-0Z;
	Thu, 16 Apr 2026 08:39:35 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 0/7] TQMLX2160A-MBLS2160A DT fixes/updates
Date: Thu, 16 Apr 2026 08:39:34 +0200
Message-ID: <5096354.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
References: <20260331141915.2918927-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/27972/Wed Apr 15 08:24:27 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_233937_902402_538BE123 
X-CRM114-Status: UNSURE (   9.66  )
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

Hi Frank,

Am Dienstag, 31. M=E4rz 2026, 16:19:01 CEST schrieb Alexander Stein:
> Hi,
>=20
> this series adds small fixes and improvements for TQMLX2160A DTs.
> The DT overlays address specific hardware behaviour when serdes is config=
ured
> differently.

Any feedback here?

Thanks and best regards
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



