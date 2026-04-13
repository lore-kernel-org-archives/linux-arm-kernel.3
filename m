Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34F4F34C63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 17:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyv0AxehRNOQolYCuoB+pRa5GzYKrq0BCQrOiqbyjL8=; b=ohUNnTahpeVpTEFrX4LqPCZTfi
	LNIR6V8PnC4IE07e/RxfgBLlr1ai3Rsawc44V+7tcE+HICP7Lb6IC88EW//yxR7WSr8wOkXjuw9lh
	oIrCK43xXRvJ+bucNrQoCY+WtvkpeWzzH86oKgvnNrGjkLg2NRiRAvVYrHRoUVVl+9KN2ZCVIxZ/Z
	tZU7BKjVkBDNMkQ36h+N3MphvKa/e5AKNiACSWPBZaV79H4kyLtM99YyWBm5SmKAlb66gY/dPW+ST
	5zr3oeLtiLY+rrpsubd2sW1cnRIFtmMQ4f5tjvVbkLu9+TfuIjWSNAPw87LF3zPwYdwnkplqWiB2P
	AsjEhCaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKdg-0000000G6LZ-43lF;
	Mon, 13 Apr 2026 16:59:56 +0000
Received: from out-181.mta0.migadu.com ([91.218.175.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKde-0000000G6Ks-2Yvu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:59:55 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776099582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyv0AxehRNOQolYCuoB+pRa5GzYKrq0BCQrOiqbyjL8=;
	b=ZtzKKlNrEZvrY0siISgE/Ud2mhjzBo1yzcjuC4tb9MyBLjR73qQtuDvHQlCLosiqRhdeC5
	MvippeHIVM5I6tQO6RpYzDwoa5PnPUAhCoWXcYCyF6Q+pHYs6/d3pBxwgK7CY6dQU4Ttlu
	Y/+WANgaGegDGnl4JCDWZwnxsBNfhZQ=
Date: Mon, 13 Apr 2026 16:59:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement
 gpio_chip::get_direction()
To: "Linus Walleij" <linusw@kernel.org>, "Frank Wunderlich"
 <frank-w@public-files.de>
Cc: bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de,
 sean.wang@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, brgl@kernel.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_095954_799325_19A66F04 
X-CRM114-Status: UNSURE (   8.36  )
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

Am 13. April 2026 um 10:01 schrieb "Linus Walleij" <linusw@kernel.org mai=
lto:linusw@kernel.org?to=3D%22Linus%20Walleij%22%20%3Clinusw%40kernel.org=
%3E >:
>=20
>=20On Fri, Apr 10, 2026 at 11:24 AM Frank Wunderlich
> <frank-w@public-files.de> wrote:
>=20
>=20>=20
>=20> Gesendet: Freitag, 10. April 2026 um 09:09
> >  Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> >  An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@ker=
nel.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthi=
as.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregn=
o@collabora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> >  CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, =
linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bart=
osz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> >  Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_=
direction()
> >=20
>=20>  If the gpio_chip::get_direction() callback is not implemented by t=
he GPIO
> >  controller driver, GPIOLIB emits a warning.
> >=20
>=20>  Implement get_direction() for the GPIO part of pinctrl-moore.
> >=20
>=20>  Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> >  Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chi=
p::get_direction()")
> >  Reported-by: Frank Wunderlich <linux@fw-web.de>
> >=20
>=20>  please use the email i used for SoB in my linked patch (closes lin=
k below), the other email i use only for sending patches due to mail prov=
ider limitation.
> >=20
>=20I can't fix this up because the closes link isn't working right now.
> Is it the same
> as the one this mail came from frank-w@public-files.de?

yes, closes-link works for me

> Yours,
> Linus Walleij
>=20

regards=20Frank

