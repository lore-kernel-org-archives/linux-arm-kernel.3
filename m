Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E7DCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REqrAQY4uKlWtuT6Rjt1VuMQRCebk3yBOhWbO+UCL2E=; b=ohe8xIuN5w5hhlzJk5wOCEOPca
	2rAfV5Qdp6d7Wfnbf//tpS3Le6nRr/oPOp8fKGKbQqwV2KqrG6uq6KumcWIISLJBsztr8x9sZ9WtD
	wUR2OW+AobvxdrGvw0VhekpsiN8yzEZUtdYJ0bipmQiYzlZV12/5yqEXBFxU8GJJQe/GwSZZvzEV+
	bS3Jtswjd3gPmkmoOcnjFurKK8a+t7c0XKlNPCBbGOhDlcgwD6YVbMUXReBgT3tOM1UnSyH/rNZJH
	7+3c1ewz1TqxpDVeUxgYenPKletIou+SGoXQ2bO79onveY+ivaG58Sb9YbO1K7gcpGImuKPZoofDF
	4MQNS2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwFC-0000000FS4S-0N8V;
	Mon, 18 May 2026 11:34:46 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwF9-0000000FS3V-3PcL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779104081;
	bh=REqrAQY4uKlWtuT6Rjt1VuMQRCebk3yBOhWbO+UCL2E=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=GPMPfB7wp23Hpil/z8xfSFoOpHRkAS89KniFB1Qm8LAc55RA2/mOH+Ml0vgY0Rzqa
	 MpGRWJqivCpy/NgcrDDRXAhnji4mrEtMcdZtp/Ck2wW6/xtIfOVB60P7pQVcKRZnho
	 wkIE3wv7SfE8TvNJPXwPSe3rXCJOT940liRpEMJDnEs9XCOgtRGi3reo6suvy28U1w
	 +ce5kkr0ybrEYdLuxl1DtArMQhNdWcwM6KzLPeBtmMKPWhRn2bkFjRYiLE6cc+9nRH
	 8uMvJJz8qv9kgzVv176PxqOuCvNO+nlmCpraVOmBSP2c/jDy/4Totf5hrB6Pjqb6uE
	 izsQ1G5TOXa4w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 381E36024D;
	Mon, 18 May 2026 19:34:41 +0800 (AWST)
Message-ID: <642d8a490626d4e62473baa37bef04ce85bddb96.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 7/7] ARM: dts: aspeed: system1: DTS updates
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, eajames@linux.ibm.com,
 robh@kernel.org, 	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 21:04:40 +0930
In-Reply-To: <20260421224551.1611818-8-ninad@linux.ibm.com>
References: <20260421224551.1611818-1-ninad@linux.ibm.com>
	 <20260421224551.1611818-8-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_043444_051644_94842747 
X-CRM114-Status: GOOD (  12.66  )
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

Hi Ninad,

On Tue, 2026-04-21 at 17:45 -0500, Ninad Palsule wrote:
> - Removed SGPIO node as not in use anymore.
> - Updated chassis power related pins as per the new hardware design

Can you please take a look at the discussion in the thread linked
below, and consider some of the approaches outlined there?

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

I'd like to avoid a stream of backwards-incompatible changes due to
platform design changes where we can.

Andrew

>=20
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 10 ++--------
> =C2=A01 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index 91c317267d6b..d7a934fe5860 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -424,7 +424,7 @@ &pinctrl_gpiol6_unbiased
> =C2=A0	/*E0-E7*/	"","","","","","","","",
> =C2=A0	/*F0-F7*/	"","","","","","","","",
> =C2=A0	/*G0-G7*/	"","","","","","","","",
> -	/*H0-H7*/	"","","","","","","","",
> +	/*H0-H7*/	"power-chassis-good","power-chassis-reboot","","","","","",""=
,
> =C2=A0	/*I0-I7*/	"","","","","","","","",
> =C2=A0	/*J0-J7*/	"","","","","","","","",
> =C2=A0	/*K0-K7*/	"","","","","","","","",
> @@ -440,7 +440,7 @@ &pinctrl_gpiol6_unbiased
> =C2=A0	/*U0-U7*/	"","","","","","","","",
> =C2=A0	/*V0-V7*/	"","rtc-battery-voltage-read-enable","","power-chassis-c=
ontrol","","","","",
> =C2=A0	/*W0-W7*/	"","","","","","","","",
> -	/*X0-X7*/	"fpga-pgood","power-chassis-good","pch-pgood","","","","","",
> +	/*X0-X7*/	"fpga-pgood","","pch-pgood","","","","","",
> =C2=A0	/*Y0-Y7*/	"","","","","","","","",
> =C2=A0	/*Z0-Z7*/	"","","","","","","","";
> =C2=A0
> @@ -486,12 +486,6 @@ &emmc {
> =C2=A0	clk-phase-mmc-hs200 =3D <180>, <180>;
> =C2=A0};
> =C2=A0
> -&sgpiom0 {
> -	status =3D "okay";
> -	ngpios =3D <128>;
> -	bus-frequency =3D <500000>;
> -};
> -
> =C2=A0&ibt {
> =C2=A0	status =3D "okay";
> =C2=A0};

