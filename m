Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A6DE9DE60
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RNSE3ufA8gLPjXh9tO8uxYCJoZORLDy0cXiQmS6dbg=; b=GokQoLBj3dlByrka1tqyzcWnZa
	9UDgcMrgLe3z0e/xXxDGELhb/WZLbQyVfCBoIz5Z9QQ6zDsCClKjX1iGxTVhgwjDi/605+JI2f/Mc
	KB7bmjbmtcOilTnqksC3WqI0A449OeabKmdn+Jx0CnhXWvp8H+ny7Pj5mRHcdaB3qkkeXnt37jqtL
	kdAlxW1qUmluXrTCJCspJkSJqlSYhO6pcNqfxZmQRps27ZUx9dArEAZX0nZ+WsSiY7PMVTmzSSOJt
	2hVTUcnWnUueUR4xyX0/qd/VUBEcTyarPbB1JVrjmkemBZQnjzT9kQJ3AcfO+j6pCwztc6tIZkrug
	gXI0A3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkY9-00000009vYF-1QTV;
	Thu, 09 Apr 2026 08:15:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkY5-00000009vWD-3hxx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:15:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D4094E4296F;
	Thu,  9 Apr 2026 08:15:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 114105FDEB;
	Thu,  9 Apr 2026 08:15:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADD2F1045022E;
	Thu,  9 Apr 2026 10:15:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775722532; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5RNSE3ufA8gLPjXh9tO8uxYCJoZORLDy0cXiQmS6dbg=;
	b=r1HkkXUHEaOVxOe99BnC2YM+DmWmHOzDzmLO73IAaDKTKo1l0vQbwrWBxpmPp9hW1FuAsF
	dTfKGWPuOv0c0DrmTKcNJPlV3WSBPS4hJNEnPiAyKyoQdaUV6G9Qfl7FeEpenCCM5uZeGd
	3rHBUXKaMnrJdH3HnGYY9KRZ7CG4Z2SxeoMSkefaALgMXLENyQwbTISUr+EyvZqjr2JwuV
	7u3u0R1qCOf9TiIWxD4GaYZRdaer5VQtQeZrrJv/CoHrsbEg5hJK80+1EBo/JYFeSnzqFn
	0mn6QU8dvvHhL2W8iYORQFntybooRYx4Yg1GphZC+8Fp/t7HpMp4XdBfxr7w2Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Robert Marko
 <robert.marko@sartura.hr>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Stanley Chang
 <stanley_chang@realtek.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: marvell: armada-37xx: USB3 PHY cleanup
In-Reply-To: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
References: <20260330-armada-37xx-usb3-phy-cleanup-v1-0-34d77f1a1784@gmail.com>
Date: Thu, 09 Apr 2026 10:15:28 +0200
Message-ID: <87wlyg35y7.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_011538_355309_2010F97B 
X-CRM114-Status: GOOD (  12.21  )
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

Gabor Juhos <j4g8y7@gmail.com> writes:

> There are two small patches in the series. The first helps to avoid
> triggering a bug in the USB core code, whereas the second one is a=20
> small cleanup to align PHY definitions of the USB3 node with other
> platforms.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Gabor Juhos (2):
>       arm64: dts: marvell: armada-37xx: use 'usb2-phy' in USB3 controller=
's phy-names
>       arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controll=
er node
>
>  arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi | 2 +-
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi      | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied on mvebu/dt64

Thanks,

Gregory

> ---
> base-commit: 2ff6cc999a04bcb094b8cbba68a9251f03a5c876
> change-id: 20260330-armada-37xx-usb3-phy-cleanup-922a5472794a
>
> Best regards,
> --=20
> Gabor Juhos <j4g8y7@gmail.com>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

