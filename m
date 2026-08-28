Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32242C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdvsH9Es0asehE5TRFzGuYdK3EGs9nWZXPtJhEl9x3k=; b=0Kd4GfSkNnbLcB2toem+ghBQ/K
	LABUbisoZ7uFBx2e4gQ+BIv92Q0gSoQ6Zb/2pLA5daywm9TKVWEWoxBfQar65xqqj5ekSt1TcM+x0
	Hi1VSF9ryJkuh09HP+BTktRlDXp+ziI1BrTDlvbsko8l9GTCa83jxVa70adxX2N2BapKNgwIx8FVy
	W0SOPrevWlfkyGZ5xgLkZk40FtPl+bO8lx+QjkMa/at5sO2TDnORp6rwawrWRwIyxqJV9m/wtk8Cr
	KS+QQFN4IY6ZS6TRIlBFJVJXHmcMOjzcQlJ3qUnFbSMwxH2KAWT5Gt++fywNkSlqUvzpxch0viVBq
	nz8j6lAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu6O-00000005ba5-48Ux;
	Fri, 28 Aug 2026 10:46:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzu6N-00000005bZX-0kHj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 10:46:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 763124E413FF;
	Fri, 28 Aug 2026 10:46:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43F1160537;
	Fri, 28 Aug 2026 10:46:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9594311C781D9;
	Fri, 28 Aug 2026 12:46:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787913980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xdvsH9Es0asehE5TRFzGuYdK3EGs9nWZXPtJhEl9x3k=;
	b=OX30jHomJfm6JBDOOcY9uADWhAjE62c/hd1NWu/zaOBNXjM0hvKzIHdHlKsBlueZDaixHI
	It1iP6TubmRLIn0ZDJNvVyLF+iIaith2yI9atPktWEgMyuIXRBVqdYtY5xDwBo8DyjI0CE
	EMdXCwFQWQZXGB9CTGeCZTjjjvJMw5upsYHPphlCwFnmRKczxY8QOfDPEwd8xu+CLQqPTy
	WKuzm/Cr/eUVegKs+3y01bGXwhRIJ9+5LMtfBFK/sX8oHtguEHjivqMmuopZCfz0BrcxVu
	j3IQ7qYtF3AQ8CgUvV4u8NWPjflwtBs/2mXpfnN5TJ3qiYVNIKPpHZLipY7tUQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, "moderated list:ARM/Marvell
 Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 39x
In-Reply-To: <20260823235613.77505-1-rosenp@gmail.com>
References: <20260823235613.77505-1-rosenp@gmail.com>
Date: Fri, 28 Aug 2026 12:46:18 +0200
Message-ID: <87v78uplol.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_034627_358430_18467F8F 
X-CRM114-Status: GOOD (  10.69  )
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

Rosen Penev <rosenp@gmail.com> writes:

> The marvell,armada-380-sdhci binding requires clock-names, but the
> Armada 39x SDHCI node only carries an unnamed clock reference.
> Add the missing clock name so the node passes schema validation.
>
> Fixes: 538da83ddbea ("ARM: mvebu: add Device Tree files for Armada 39x So=
C and board")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Fix already applied with ARM: dts: marvell: add missing SDHCI clock-names

> ---
>  arch/arm/boot/dts/marvell/armada-39x.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-39x.dtsi b/arch/arm/boot/dt=
s/marvell/armada-39x.dtsi
> index 218fcf99ae07..81dd4ca5fbc9 100644
> --- a/arch/arm/boot/dts/marvell/armada-39x.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-39x.dtsi
> @@ -381,6 +381,7 @@ mmc@d8000 {
>  					<0x18454 0x4>;
>  				interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
>  				clocks =3D <&gateclk 17>;
> +				clock-names =3D "io";
>  				mrvl,clk-delay-cycles =3D <0x1F>;
>  				status =3D "disabled";
>  			};
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

