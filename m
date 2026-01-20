Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF59BD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 14:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sag+H/BhPZ45KSkJ6zCyuoYRKvuE9xHt5nOXwQMVW40=; b=lHN5/9NVFIiXiGA0EaS+RP+JF/
	w9ex22/chaOTX5RC7pJwf6T+97pPm5A2aXmjg+2j2NGERwFibrRzwZsyXAGAL6o/xTT3oROTddoSi
	ebPAkehJSQ4EQz7Cec30NyrNtXAaVtwa4oqXG4I/SmvRXExioh/1/3d5HMhQRL0Y57CnW+LgF6tbA
	obmS+fA16Q7JV++6v61sG2LobQGCBRtiIVhTMjp1ayg6c6bWYA5XSbtbwh57IsYpvJWwK/A3QVK10
	4Xn7GU+Dmie/zKu0NNrJKZunec19+P4RJHkbZ/sMXWLQ3p0Xhkf9pzi4Umucd/rqRJo0TZzQWjdXu
	LiwkimBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCv5-000000040dN-3Fzm;
	Tue, 20 Jan 2026 14:41:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCv1-000000040au-0OSh;
	Tue, 20 Jan 2026 14:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Sag+H/BhPZ45KSkJ6zCyuoYRKvuE9xHt5nOXwQMVW40=; b=wlp0I5GKmkHGAajTVUbav838z3
	6hqseOEREYnEOKPj/nmBZZi/VZDgF5D6MNyxqFPU0be0Ids+mGYNL/DbmmjFKW4UL4X6Tf1IlNKzw
	2JzL/ufy7vBtteFvAA/uIQ5jhdJxU2d6EgQCECbgueW+iOAHk4zaAZpdf2gq4EPJEkAonK0ZmGJor
	q/T/DsRgoreG3A+qEK9gcRNjJr1I2sbYzd4U6W28Wat5tRGRkkLU4d7BIM9N9WbUzE1uQBE5g4FIL
	GgmOdXHfV96fRHsRrGuSGsgbYEwHLdEDX/quh3UR2izo/uXGz5y4QsnuixAmOxjB3EjGTaqorYDcZ
	cG+3jzaA==;
Received: from i53875a75.versanet.de ([83.135.90.117] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1viCuo-003T50-Vr; Tue, 20 Jan 2026 15:41:07 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Alexey Charkov <alchark@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Manivannan Sadhasivam <mani@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Explicitly request UFS reset pin on
 RK3576
Date: Tue, 20 Jan 2026 15:41:06 +0100
Message-ID: <4830042.taCxCBeP46@diego>
In-Reply-To: <CABjd4YwAMbH21jcjhks7ThoXzcF8GeOzBPYDvN+7cip0iA6stg@mail.gmail.com>
References: <20260120-ufs-rst-v2-1-b5735f1996f6@gmail.com>
 <9e51b504-e0f0-4d17-baa2-387339507c86@cherry.de>
 <CABjd4YwAMbH21jcjhks7ThoXzcF8GeOzBPYDvN+7cip0iA6stg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_064119_225071_14A3F9D6 
X-CRM114-Status: GOOD (  23.37  )
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

Am Dienstag, 20. Januar 2026, 14:14:48 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Alexey Charkov:
> On Tue, Jan 20, 2026 at 5:00=E2=80=AFPM Quentin Schulz <quentin.schulz@ch=
erry.de> wrote:
> >
> > Hi Alexey,
> >
> > On 1/20/26 1:53 PM, Alexey Charkov wrote:
> > > Rockchip RK3576 UFS controller uses a dedicated pin to reset the conn=
ected
> > > UFS device, which can operate either in a hardware controlled mode or=
 as a
> > > GPIO pin.
> > >
> > > Power-on default is GPIO mode, but the boot ROM reconfigures it to a
> > > hardware controlled mode if it uses UFS to load the next boot stage.
> > >
> > > Given that existing bindings (and rk3576.dtsi) expect a GPIO-controll=
ed
> > > device reset, request the required pin config explicitly.
> > >
> > > This doesn't appear to affect Linux, but it does affect U-boot:
> > >
> > > Before:
> > > =3D> md.l 0x2604b398
> > > 2604b398: 00000011 00000000 00000000 00000000  ................
> > > < ... snip ... >
> > > =3D> ufs init
> > > ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], =
pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > > =3D> md.l 0x2604b398
> > > 2604b398: 00000011 00000000 00000000 00000000  ................
> > >
> > > After:
> > > =3D> md.l 0x2604b398
> > > 2604b398: 00000011 00000000 00000000 00000000  ................
> > > < ... snip ...>
> > > =3D> ufs init
> > > ufshcd-rockchip ufshc@2a2d0000: [RX, TX]: gear=3D[3, 3], lane[2, 2], =
pwr[FASTAUTO_MODE, FASTAUTO_MODE], rate =3D 2
> > > =3D> md.l 0x2604b398
> > > 2604b398: 00000010 00000000 00000000 00000000  ................
> > >
> > > (0x2604b398 is the respective pin mux register, with its BIT0 driving=
 the
> > > mode of UFS_RST: unset =3D GPIO, set =3D hardware controlled UFS_RST)
> > >
> > > This helps ensure that GPIO-driven device reset actually fires when t=
he
> > > system requests it, not when whatever black box magic inside the UFSHC
> > > decides to reset the flash chip.
> > >
> >
> > Would have liked a mention on why pull-down in the commit log.
>=20
> Indeed. Heiko, if you're going to apply this to your tree, would you
> mind amending the commit description with something like the
> following?
>=20
> The pin is requested with pull-down enabled, which is in line with the
> SoC power-on default and helps ensure that the attached UFS chip stays
> in reset until the driver takes over the control of the respective
> GPIO line.

Will do :-)

Heiko


> > In any case,
> >
> > Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> Thanks a lot!
>=20
> Best regards,
> Alexey
>=20





