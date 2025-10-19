Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A311CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERRtoG7bB418wgjyE9jDggkfu2QPAbzjTsBuPu44/cA=; b=sWFchjtRlZzB/aQH2vxFUxy45J
	MPiyKme2JZsEMqxGCOntzA2AvRY7+4AZIL36NoLox904RZR4bZb4omFm8Kshz+61G7uLO1w2GgNS+
	pAl0y0GEgXuk341wl+6GKX7G4BN8IboS6X4PWglalciU3yBXJ2q/gsP0wHlcbYOaq8Ujjjp8dE4d7
	9EHEGq1M33cFSQke75Lyzbci/Kppx6wvdMvU6cZx3jZTIOai+CfqebKQ93ePuFrHrNH0S5hrBJJ9c
	+Ljeu3KfH+Km0dQ1V5LbKVcgp1mJ4E44jTslpqIYHGSLWZpF5f93DBp8H7Esxqw+23NRJjPC112u+
	+Nj2jLVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAXrA-0000000BHrj-1BXZ;
	Sun, 19 Oct 2025 18:10:12 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAXr7-0000000BHr2-3wZ8;
	Sun, 19 Oct 2025 18:10:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 4684640A58;
	Sun, 19 Oct 2025 20:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1760897402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ERRtoG7bB418wgjyE9jDggkfu2QPAbzjTsBuPu44/cA=;
	b=VtVGybfY5fuB19L+2yb0xkzW1Ddf2ptzniOmXG98nENyurifzlZGRSMOGmOBOcD6SteVZG
	gm7eoN3oiKzyiLIAkrNryM5s2iWKpuLNQoglrmoT2jDE3sx/FNRfXAYU5KckAwevx3G6yR
	pRwplGe3bcp2d30R2QOBIMLcPhVpVTD6dRvS7g9FwvR8DdYSz4+8zv6uhEVCuIhXgs/wS4
	7Kv7iUfw1vhNO7JAfMFvGA0P96U4e2CYvpFNtG0wGCIINxoEkr5/b0bkLn6vSaqzBY/Hkq
	h4Ki5L4PC6QnTmnQiLacZoiWxsBwXAj+I5uroQrE9LvEVAkLx9NggaFoIDIP5w==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <CANAwSgTZa7PXBuyh9EdDOXCNuCTOHGsJz18pSjP6WUN8sOaqTQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20251017073954.130710-1-cnsztl@gmail.com> <7f0b1747-87eb-0b0b-6fb0-304811a4be21@manjaro.org>
 <d9d14ce2-2e65-422e-95fb-eb30b128ad90@gmail.com> <41154cde-a447-0707-4387-cd3dca90b97d@manjaro.org>
 <CALWfF7K0=J3E-zr41wV-28+SCFkT_so55Aee8BvQsB4KJZy6YQ@mail.gmail.com>
 <47931e9e-09db-3909-4531-dae6869171d7@manjaro.org> <b22425c3-01e0-4d2e-bf78-5db884d4ec38@gmail.com>
 <de5e8643-49bb-4e0e-45fd-51b25ecf530d@manjaro.org> <CANAwSgTZa7PXBuyh9EdDOXCNuCTOHGsJz18pSjP6WUN8sOaqTQ@mail.gmail.com>
Date: Sun, 19 Oct 2025 20:09:59 +0200
Cc: "Hugh Cole-Baker" <sigmaris@gmail.com>, "Jimmy Hon" <honyuenkwun@gmail.com>, "Tianling Shen" <cnsztl@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Grzegorz Sterniczuk" <grzegorz@sternicz.uk>, "Jonas Karlman" <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Anand Moon" <linux.amoon@gmail.com>
MIME-Version: 1.0
Message-ID: <047fe2b8-0f94-0f0f-5964-b65844834706@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= fix eMMC corruption on NanoPC-T6 with A3A444 chips
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_111010_220155_E39D6D12 
X-CRM114-Status: UNSURE (   8.50  )
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

Hello Anand,

On Sunday, October 19, 2025 19:25 CEST, Anand Moon <linux.amoon@gmail.c=
om> wrote:
> Would you consider the following patch?
>=20
> As per the Rockchip RK3588S SoC Technical Reference Manual (TRM) Part=
 1,
> chapter 21.6, Interface Description, the eMMC signals require careful=
 handling
> to ensure signal integrity.
>=20
> I2C2=5FSCL=5FM2 I/O EMMC=5FRSTN/I2C2=5FSCL=5FM2/UART5=5FRTSN=5FM1/GPI=
O2=5FA3=5Fd
> BUS=5FIOC=5FGPIO2A=5FIOMUX=5FSEL=5FL[15:12]=3D0x9
> I2C2=5FSDA=5FM2 I/O EMMC=5FDATA=5FSTROBE/I2C2=5FSDA=5FM2/UART5=5FCTSN=
=5FM1/GPIO2=5FA2=5Fd
> BUS=5FIOC=5FGPIO2A=5FIOMUX=5FSEL=5FL[11:8]=3D0x9
>=20
> $ git diff .
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> index 6584d73660f6..f60a1d8be0ef 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> @@ -327,7 +327,7 @@ emmc {
>                 emmc=5Frstnout: emmc-rstnout {
>                         rockchip,pins =3D
>                                 /* emmc=5Frstn */
> -                               <2 RK=5FPA3 1 &pcfg=5Fpull=5Fnone>;
> +                               <2 RK=5FPA3 1 &pcfg=5Fpull=5Fdown=5Fd=
rv=5Flevel=5F2>;
>                 };
>=20
>                 /omit-if-no-ref/
> @@ -369,7 +369,7 @@ emmc=5Fcmd: emmc-cmd {
>                 emmc=5Fdata=5Fstrobe: emmc-data-strobe {
>                         rockchip,pins =3D
>                                 /* emmc=5Fdata=5Fstrobe */
> -                               <2 RK=5FPA2 1 &pcfg=5Fpull=5Fdown>;
> +                               <2 RK=5FPA2 1 &pcfg=5Fpull=5Fdown=5Fd=
rv=5Flevel=5F2>;
>                 };
>         };

Frankly, I'm not really sure how would such changes do something
good regarding the eMMC signal integrity?  In general, signal
integrity depends mostly on the routing of the PCB traces, which
is purely hardware design.  Sure, termination of data lines also
plays a significant role, but that surely isn't at play here.

Moreover, the eMMC RSTn line is already pulled high to VCCIO in
the reference RK3588 design, so pulling it down in the SoC itself
would be pretty much wrong thing to do.


