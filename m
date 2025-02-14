Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E386CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDP/fbMqJwrONBmy/s2K9FGB5U6vUWfZuSrKtSohy5w=; b=ZrQnI3hFpfB0eaSOuowb6cpYod
	psYtEfGNqD5iGFWN1QgGYM+ihdd/fSagSH9pbBhWkMwNObBzpiY6Mtba9+tUuYFiPwFyZNGJwS6iE
	U3X44LHErBIV0glzScsMAfGGvkYycJWEQE645Fli8R4BCSKTfQzrVqa1bvyffyvq2LEQRrmbJqp+q
	k56bparVK1AGsew5GR4eYnIk8QdJoTheLo2OQRPufwKn7ad2Zs8gViWN9hllaSJwCd8kCnch7m7XU
	/wY9fGxFnKCA2w7YIVKGKNPmUoWYZ+YtXEUZPgAqYyuACPa+PkQKKCxGHbeAXqauRQTC/OF9o/ti8
	Hxq1pGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyaQ-0000000FW9J-314g;
	Fri, 14 Feb 2025 16:30:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyYz-0000000FVtg-14tX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 16:29:14 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1tiyYk-0006jh-A8; Fri, 14 Feb 2025 17:28:58 +0100
Message-ID: <d0dd61ea558ef8b18978301ef710925b83ef4037.camel@pengutronix.de>
Subject: Re: [PATCH 0/2] arm64: dts: imx8m: Add pinctrl config definitions
From: Lucas Stach <l.stach@pengutronix.de>
To: maudspierings@gocontroll.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Date: Fri, 14 Feb 2025 17:28:57 +0100
In-Reply-To: <20250214-pinctrl_defines-v1-0-fbc86a42ef3c@gocontroll.com>
References: <20250214-pinctrl_defines-v1-0-fbc86a42ef3c@gocontroll.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_082913_292972_9F1EBCEE 
X-CRM114-Status: GOOD (  20.00  )
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

Hi Maud,

Am Freitag, dem 14.02.2025 um 16:57 +0100 schrieb Maud Spierings via B4
Relay:
> Up untill now the extra function mux (pull resistor, etc) has been
> defined as a raw hex value, this is difficult to interpret. Add
> definitions for these parts of the pinctrl registers to allow for more
> readable pinctrl definitions in devictree files.
>=20
I certainly prefer the short form with the hex value, I find that quite
a bit more readable than very verbose swathes of defines ORed together.
But each to their own.

> At this point the patch is not complete, some pinctrl definitions set
> bit 30 (0x40000000) but according to the reference manual this is a
> reserved field, I currently have no way to identify what the meaning of
> this bit is, I hope someone in this CC may be able to provide an answer
> to this. It will then be fixed in the v2 of this patch.

This is not a mystery bit, it's used by the pinctrl driver to force
enable the input path of the pad (SION). This is defined in the generic
i.MX pinctrl binding, see
Documentation/devicetree/bindings/pinctrl/fsl,imx-pinctrl.txt

Regards,
Lucas

>=20
> It should also be done for the mn/mq but I currently do not have the
> reference manuals for these to verify these fields, though I can only
> assume that they would be the same.
>=20
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
> Maud Spierings (2):
>       arm64: dts: imx8mm: Add pinctrl config definitions
>       arm64: dts: imx8mp: Add pinctrl config definitions
>=20
>  arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 27 ++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h | 27 ++++++++++++++++++++=
++++++
>  2 files changed, 54 insertions(+)
> ---
> base-commit: 0ae0fa3bf0b44c8611d114a9f69985bf451010c3
> change-id: 20250214-pinctrl_defines-237e7db61c6a
>=20
> Best regards,


