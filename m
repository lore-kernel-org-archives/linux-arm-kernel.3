Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E17CEB2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5W225Xb1n1INaMEh/to5gfQKJIJdb6ZwHU6TvTI7BKU=; b=ffMGcLiY5wqU9NOTkV5O7zNlMn
	xlJk4JKEoSB8Q6K8mT8gA7A3luee5B+T9UB8eT2b4SgrX7IN+n5+Ifz2gIsIMTrhgxXLkf7qvBzgy
	Iv7lai0vN5GJnOL9nbBvjWSNGQt3qGNrzhIaEaBJsacYMrvVHY33JEZn55Spm/cwxBJutWBVi2E8M
	UI12QUzpAK0J6zChvGt2TknfX85YMFUGFABPXjDAeBiZ3goqqgZXhXvWFkjOyvr9+MPm08xPKdegm
	B4uGGjRms7wSm08j1a5i75NSU6vi9T6jbZAdBOhV54JHKgPF++jxAa/Qm047ZtxnaSJC/zXysadjd
	FFymhIrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCWg-0000000De0x-0ATi;
	Sat, 15 Nov 2025 09:24:58 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCWd-0000000De04-03HB;
	Sat, 15 Nov 2025 09:24:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 8FB35410BE;
	Sat, 15 Nov 2025 10:24:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763198691; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5W225Xb1n1INaMEh/to5gfQKJIJdb6ZwHU6TvTI7BKU=;
	b=lYaApLAYL74+f7bKqNsVaLnxWo8PFvmZY+SBvtLQTmioHwWXfg0zC2raMUm/UBzRlMId5t
	7Asp3nVyA0MhYxD9i4+icoDEuZxioJhZWUGaGguN9+TJDtCcZY0jVpOQvVI8VMdJEFe473
	aeJySqtFB2kUDdtU6iSZ3KOAZOv4qER3QaYlGBaDFv97XGkJQd+h+XbExOwxF5dgW11wOZ
	kljG5h4IaTgdOMWRjf/NvUYEZIF0eRU/xIJxmM61v1PQ3bcn8WhiUE7gOjOK6OOkbmQxia
	qzOV1AuWVOvO4Zj3V80pksHk5tDS1OYNgjzNYAN4mrVtLI8ybwTZKLFv1GHDMw==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <d6593ae4f59468f294fdddfef83791e0db100e13.1763197368.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <cover.1763197368.git.geraldogabriel@gmail.com> <d6593ae4f59468f294fdddfef83791e0db100e13.1763197368.git.geraldogabriel@gmail.com>
Date: Sat, 15 Nov 2025 10:24:49 +0100
Cc: linux-rockchip@lists.infradead.org, "Shawn Lin" <shawn.lin@rock-chips.com>, "Lorenzo Pieralisi" <lpieralisi@kernel.org>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan Sadhasivam" <mani@kernel.org>, "Rob Herring" <robh@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Heiko Stuebner" <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Johan Jonker" <jbx6244@gmail.com>
To: "Geraldo Nascimento" <geraldogabriel@gmail.com>
MIME-Version: 1.0
Message-ID: <a214ac9a-36d9-6505-64a8-92af2da42cf1@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 1/3] =?utf-8?q?PCI=3A?==?utf-8?q?_rockchip=3A?= 
 warn of danger of =?utf-8?q?5=2E0?= GT/s speeds
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_012455_274063_842BA3F5 
X-CRM114-Status: GOOD (  13.91  )
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

On Saturday, November 15, 2025 10:10 CET, Geraldo Nascimento <geraldoga=
briel@gmail.com> wrote:
> Shawn Lin from Rockchip has reiterated that there may be danger in us=
ing
> their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT chan=
ge
> from the default and at the same time, drive at 2.5 GT/s only, in cas=
e
> the DT max-link-speed property is invalid or inexistent.
>=20
> Fixes: 956cd99b35a8 ("PCI: rockchip: Separate common code from RC dri=
ver")
> Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21=
b@rock-chips.com/
> Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/con=
troller/pcie-rockchip.c
> index 0f88da378805..ed67886a6d43 100644
> --- a/drivers/pci/controller/pcie-rockchip.c
> +++ b/drivers/pci/controller/pcie-rockchip.c
> @@ -66,8 +66,12 @@ int rockchip=5Fpcie=5Fparse=5Fdt(struct rockchip=5F=
pcie *rockchip)
>  	}
> =20
>  	rockchip->link=5Fgen =3D of=5Fpci=5Fget=5Fmax=5Flink=5Fspeed(node);
> -	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen > 2)
> -		rockchip->link=5Fgen =3D 2;
> +	if (rockchip->link=5Fgen < 0 || rockchip->link=5Fgen > 2) {
> +		rockchip->link=5Fgen =3D 1;
> +		dev=5Fwarn(dev, "invalid max-link-speed, set to 2.5 GT/s\n");
> +	}
> +	else if (rockchip->link=5Fgen =3D=3D 2)
> +		dev=5Fwarn(dev, "5.0 GT/s may lead to catastrophic failure\n");
> =20
>  	for (i =3D 0; i < ROCKCHIP=5FNUM=5FPM=5FRSTS; i++)
>  		rockchip->pm=5Frsts[i].id =3D rockchip=5Fpci=5Fpm=5Frsts[i];

Looking good to me, thanks for this patch!  People often declare
PCIe Gen2 on RK3399-based boards as "works for me", which actually
happens very often, but such simple evaluations cannot be taken
as a proof of Gen2 correctness.

Furthermore, RK3399's internal interconnects limit the effective
I/O speed of PCIe transfers already, so switching to PCIe Gen1
actually doesn't result in some large I/O performance penalties.

With all that in mind, please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>


