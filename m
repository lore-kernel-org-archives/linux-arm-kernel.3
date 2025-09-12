Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BBBCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyLlO1Uh8KjPmN5r1stp+pswBHh7RIt2q/x4MHSok28=; b=m6UhM1/ZHIosR66AsJS/ulgPKH
	JcySSN/expRbN1s+komiF8Y8Blv2buqNhgZkuP2ac6NOfvrFNaS/Sbb2rEW86W2A8Xw27MFXbjoyb
	fHvW+l/weY7pQU0PP1tR1D7hlwJfMGgTursSrDj6swaWkhhq6aeDpP0b1pKqQ2eZtsMtuqE/KUwBs
	MtmAHr7eTt4ATLWdaFQRbKeUpy8c1ZK/1+ncm5+G+9WB2m2LUZS3Z/v4Vne0v+lkz7P7eyP/ZSJC+
	au/J+3zA47r4+IQnrcwqFRITAZipp26Hs47h1Iq/v534wNjTpb51UmUn02E09t2ozw02sozRsXT4e
	k9R7DkTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3KF-00000009OBI-1nb7;
	Fri, 12 Sep 2025 12:56:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3KC-00000009O9Q-12Pp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:56:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BEF23C8EC49;
	Fri, 12 Sep 2025 12:56:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BABB360638;
	Fri, 12 Sep 2025 12:56:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 560AD102F28D5;
	Fri, 12 Sep 2025 14:56:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757681778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AyLlO1Uh8KjPmN5r1stp+pswBHh7RIt2q/x4MHSok28=;
	b=BEvI8wct8ikkdaAbOd7NpQ9LyKL7l/7iEoixB0pcpgvbTxlJynqr8zxzsGptizzOkJBr0f
	3Gpvte4Rj93zGCYh4EteNRVArgp1rNoLBBkIgqESFYnnRzI0/+ZNFIF5+dLOpS1zIIHtkz
	lF2butPbKxx9G0faYkB43TXk9k+6DHsnPX7rjs99Tel5db8l7moDqN1Gixb1dOOWIs3clZ
	2L65kAYFC+P7pLnk7c91uVsvbF6hQ4lzh4joORbFnmKHGaiNc6SZyK+lB+YgThNPQUlq/I
	62ZX/8KVVG8gJyt198YSSxRP2CxqPwi681NGJ7nGBjUYfk16m6S2p6N9TMUkkw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Josua Mayer <josua@solid-run.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Wunderlich <frank-w@public-files.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: marvell: cn913x-solidrun: fix sata
 ports status
In-Reply-To: <20250911-cn913x-sr-fix-sata-v2-1-0d79319105f8@solid-run.com>
References: <20250911-cn913x-sr-fix-sata-v2-0-0d79319105f8@solid-run.com>
 <20250911-cn913x-sr-fix-sata-v2-1-0d79319105f8@solid-run.com>
Date: Fri, 12 Sep 2025 14:56:16 +0200
Message-ID: <87o6rfommn.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_055624_677454_AA34C864 
X-CRM114-Status: GOOD (  15.30  )
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

Josua Mayer <josua@solid-run.com> writes:

> Commit "arm64: dts: marvell: only enable complete sata nodes" changed
> armada-cp11x.dtsi disabling all sata ports status by default.
>
> The author missed some dts which relied on the dtsi enabling all ports,
> and just disabled unused ones instead.
>
> Update dts for SolidRun cn913x based boards to enable the available
> ports, rather than disabling the unvavailable one.
>
> Further according to dt bindings the serdes phys are to be specified in
> the port node, not the controller node.
> Move those phys properties accordingly in clearfog base/pro/solidwan.
>
> Fixes: 30023876aef4 ("arm64: dts: marvell: only enable complete sata node=
s")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied on mvebu/fixes

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/cn9130-cf.dtsi         | 7 ++++---
>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts | 6 ++++--
>  arch/arm64/boot/dts/marvell/cn9132-clearfog.dts    | 6 ++----
>  3 files changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/cn9130-cf.dtsi b/arch/arm64/boot=
/dts/marvell/cn9130-cf.dtsi
> index ad0ab34b66028c53b8a18b3e8ee0c0aec869759f..bd42bfbe408bbe2a4d58dbd40=
204bcfb3c126312 100644
> --- a/arch/arm64/boot/dts/marvell/cn9130-cf.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9130-cf.dtsi
> @@ -152,11 +152,12 @@ expander0_pins: cp0-expander0-pins {
>=20=20
>  /* SRDS #0 - SATA on M.2 connector */
>  &cp0_sata0 {
> -	phys =3D <&cp0_comphy0 1>;
>  	status =3D "okay";
>=20=20
> -	/* only port 1 is available */
> -	/delete-node/ sata-port@0;
> +	sata-port@1 {
> +		phys =3D <&cp0_comphy0 1>;
> +		status =3D "okay";
> +	};
>  };
>=20=20
>  /* microSD */
> diff --git a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts b/arch/ar=
m64/boot/dts/marvell/cn9131-cf-solidwan.dts
> index 47234d0858dd2195bb1485f25768ad3c757b7ac2..338853d3b179bb5cb742e975b=
b830fdb9d62d4cc 100644
> --- a/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
> +++ b/arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts
> @@ -563,11 +563,13 @@ &cp1_rtc {
>=20=20
>  /* SRDS #1 - SATA on M.2 (J44) */
>  &cp1_sata0 {
> -	phys =3D <&cp1_comphy1 0>;
>  	status =3D "okay";
>=20=20
>  	/* only port 0 is available */
> -	/delete-node/ sata-port@1;
> +	sata-port@0 {
> +		phys =3D <&cp1_comphy1 0>;
> +		status =3D "okay";
> +	};
>  };
>=20=20
>  &cp1_syscon0 {
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts b/arch/arm64=
/boot/dts/marvell/cn9132-clearfog.dts
> index 0f53745a6fa0d8cbd3ab9cdc28a972ed748c275f..115c55d73786e2b9265e1caa4=
c62ee26f498fb41 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> +++ b/arch/arm64/boot/dts/marvell/cn9132-clearfog.dts
> @@ -512,10 +512,9 @@ &cp1_sata0 {
>  	status =3D "okay";
>=20=20
>  	/* only port 1 is available */
> -	/delete-node/ sata-port@0;
> -
>  	sata-port@1 {
>  		phys =3D <&cp1_comphy3 1>;
> +		status =3D "okay";
>  	};
>  };
>=20=20
> @@ -631,9 +630,8 @@ &cp2_sata0 {
>  	status =3D "okay";
>=20=20
>  	/* only port 1 is available */
> -	/delete-node/ sata-port@0;
> -
>  	sata-port@1 {
> +		status =3D "okay";
>  		phys =3D <&cp2_comphy3 1>;
>  	};
>  };
>
> --=20
> 2.51.0
>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

