Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D3FCD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 19:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8uQcTpVa5mUFmeEmrbH/dNU63tBNszSpBUJcWOlSZA=; b=W3Ig+NQH2z/Thy5mh48lUbU3Vo
	TlEv3Nd+zHUOUNFPNSh4ZJV9drmrdWnKa1CZxyGJ0K4a9Omrc2J3L4vtbHFCheV6GirblH6VNOat8
	NNkmIVBQ3OrrA/1CTLFiAw6dffKOwqRACgOgt3bvDjGbbjVjmp8Jpz+4p3bcrxP8MXrAjVrCriIfr
	XWpf2s+KndIBP/5n3ScVdmw/bNRin1ETKWgxbRKZyhZW3IrXaRuGY+CMZ3smb2MmPBqLwiy2CVp1W
	V/jE984mqeJYsUhDwrzGP98XtKkPuJOdlZ2uFf4sSolT26rh47kQi2y9eneo8heaWXrtjYtVyDsHf
	CoeJqYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZAt-0000000GFFb-48O7;
	Tue, 16 Jun 2026 19:10:16 +0000
Received: from mail1.manjaro.org ([142.132.176.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZZAq-0000000GFF7-0Nye;
	Tue, 16 Jun 2026 19:10:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 5BBD740F30;
	Tue, 16 Jun 2026 21:10:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1781637009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z8uQcTpVa5mUFmeEmrbH/dNU63tBNszSpBUJcWOlSZA=;
	b=rQdB9MRTtC7FWJ/w+93hNdZfyzpDvupX/0vN3mqYNs66IDLdjy1NX9pu63cHY6d+ZZ0t7e
	0rbzR+04IaNu1gA0bjRaGsKROPhGyV4eCByyA/AnCveeaPzfzzndQNWdt7Kk5Jpyl/2DGg
	12D3QHdk8T3vFpNpMtpVE4Ayx1CJSOtZ6BG8yEghg9XW45JVfxfybxxQADQLIEsIA+J8ge
	0tynwuj5HZOIZ8tQIPQyRl4Y13dkpQWp/2L+eocEwOoyAiyXAji8O/ybNBjQHJImW0Y3rN
	XrhukNqAzprIfPCUhLZg13OtLceDKppzzo7s4LjrG/DNbNRZk2/jiO4RlI6CTg==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <7421df7a7b7778ee99363cccfdfabbfa8aa6ab5e.1781622998.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <cover.1781622998.git.geraldogabriel@gmail.com> <7421df7a7b7778ee99363cccfdfabbfa8aa6ab5e.1781622998.git.geraldogabriel@gmail.com>
Date: Tue, 16 Jun 2026 21:10:08 +0200
Cc: "Shawn Lin" <shawn.lin@rock-chips.com>, linux-rockchip@lists.infradead.org, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <153da5a0-7d58-4e0e-6700-432e401c9048@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v7 3/3] =?utf-8?q?PCI=3A?==?utf-8?q?_rockchip=3A?= 
 drive at =?utf-8?q?2=2E5?==?utf-8?q?_GT/s=2C?= error other speeds
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_121012_436795_C434CD6F 
X-CRM114-Status: GOOD (  16.94  )
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

Hello Geraldo,

Thanks for the v6 and v7 of this series.

On Tuesday, June 16, 2026 17:26 CEST, Geraldo Nascimento <geraldogabrie=
l@gmail.com> wrote:
> Configure the core to be driven at 2.5 GT/s Link Speed and ignore
> any other speed with a warning. Also drop the 5.0 GT/s Link Speed
> defines from Rockchip PCIe header.
>=20
> The reason is that Shawn Lin from Rockchip has reiterated that there
> may be danger of "catastrophic failure" in using their PCIe with
> 5.0 GT/s speeds.
>=20
> While Rockchip has done so informally without issuing a proper errata=
,
> and the particulars are thus unknown, this may cause data loss or
> worse.
>=20
> This change is corroborated by RK3399 official datasheet [1], which
> states maximum link speed for this platform is 2.5 GT/s.
>=20
> [1] https://opensource.rock-chips.com/images/d/d7/Rockchip=5FRK3399=5F=
Datasheet=5FV2.1-20200323.pdf
>=20
> Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC dri=
ver")
> Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21=
b@rock-chips.com/
> Cc: stable@vger.kernel.org
> Reported-by: Dragan Simic <dsimic@manjaro.org>
> Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.c | 14 ++++++--------
>  drivers/pci/controller/pcie-rockchip.h |  3 ---
>  2 files changed, 6 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/con=
troller/pcie-rockchip.c
> index 0f88da3788054..456dcfd676ed7 100644
> --- a/drivers/pci/controller/pcie-rockchip.c
> +++ b/drivers/pci/controller/pcie-rockchip.c
> @@ -66,8 +66,10 @@ int rockchip=5Fpcie=5Fparse=5Fdt(struct rockchip=5F=
pcie *rockchip)
>  	}
> =20
>  	rockchip->link=5Fgen =3D of=5Fpci=5Fget=5Fmax=5Flink=5Fspeed(node);
> -	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen > 2)
> -		rockchip->link=5Fgen =3D 2;
> +	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen >=3D 2) {
> +		rockchip->link=5Fgen =3D 1;
> +		dev=5Fwarn(dev, "invalid max-link-speed, limited to 2.5 GT/s\n");
> +	}
> =20
>  	for (i =3D 0; i < ROCKCHIP=5FNUM=5FPM=5FRSTS; i++)
>  		rockchip->pm=5Frsts[i].id =3D rockchip=5Fpci=5Fpm=5Frsts[i];
> @@ -147,12 +149,8 @@ int rockchip=5Fpcie=5Finit=5Fport(struct rockchi=
p=5Fpcie *rockchip)
>  		goto err=5Fexit=5Fphy;
>  	}
> =20
> -	if (rockchip->link=5Fgen =3D=3D 2)
> -		rockchip=5Fpcie=5Fwrite(rockchip, PCIE=5FCLIENT=5FGEN=5FSEL=5F2,
> -				    PCIE=5FCLIENT=5FCONFIG);
> -	else
> -		rockchip=5Fpcie=5Fwrite(rockchip, PCIE=5FCLIENT=5FGEN=5FSEL=5F1,
> -				    PCIE=5FCLIENT=5FCONFIG);
> +	rockchip=5Fpcie=5Fwrite(rockchip, PCIE=5FCLIENT=5FGEN=5FSEL=5F1,
> +			    PCIE=5FCLIENT=5FCONFIG);
> =20
>  	regs =3D PCIE=5FCLIENT=5FARI=5FENABLE |
>  	       PCIE=5FCLIENT=5FCONF=5FLANE=5FNUM(rockchip->lanes);
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/con=
troller/pcie-rockchip.h
> index 3e82a69b9c006..b5da15601b585 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -42,7 +42,6 @@
>  #define   PCIE=5FCLIENT=5FMODE=5FRC			HWORD=5FSET=5FBIT(0x0040)
>  #define   PCIE=5FCLIENT=5FMODE=5FEP			HWORD=5FCLR=5FBIT(0x0040)
>  #define   PCIE=5FCLIENT=5FGEN=5FSEL=5F1			HWORD=5FCLR=5FBIT(0x0080)
> -#define   PCIE=5FCLIENT=5FGEN=5FSEL=5F2			HWORD=5FSET=5FBIT(0x0080)
>  #define PCIE=5FCLIENT=5FLEGACY=5FINT=5FCTRL	(PCIE=5FCLIENT=5FBASE + =
0x0c)
>  #define   PCIE=5FCLIENT=5FINT=5FIN=5FASSERT		HWORD=5FSET=5FBIT(0x000=
2)
>  #define   PCIE=5FCLIENT=5FINT=5FIN=5FDEASSERT		HWORD=5FCLR=5FBIT(0x0=
002)
> @@ -197,8 +196,6 @@
>  	(((x) & PCIE=5FCORE=5FPL=5FCONF=5FLS=5FMASK) =3D=3D PCIE=5FCORE=5FP=
L=5FCONF=5FLS=5FREADY)
>  #define PCIE=5FLINK=5FUP(x) \
>  	(((x) & PCIE=5FCLIENT=5FLINK=5FSTATUS=5FMASK) =3D=3D PCIE=5FCLIENT=5F=
LINK=5FSTATUS=5FUP)
> -#define PCIE=5FLINK=5FIS=5FGEN2(x) \
> -	(((x) & PCIE=5FCORE=5FPL=5FCONF=5FSPEED=5FMASK) =3D=3D PCIE=5FCORE=5F=
PL=5FCONF=5FSPEED=5F5G)
> =20
>  #define RC=5FREGION=5F0=5FADDR=5FTRANS=5FH		0x00000000
>  #define RC=5FREGION=5F0=5FADDR=5FTRANS=5FL		0x00000000

Looking good to me, so please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>


