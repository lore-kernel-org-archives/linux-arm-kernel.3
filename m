Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A3DE6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UB3ac7LBmeqyiSNaZiojKaC72aMNlvAd36yyxNrsRA=; b=xOXut9LSKxFeddlI//xFS49OH9
	snZTMrPkIR+Nd/mRaAoM6QH01sW3zgX0AipVUHYUWGhQ5ohA5tB71fR2Q1aC/e4z0Vj0pGJHzG44O
	U9nFoeU+jTaP4s9ejb4LhOi6f/ppbkofXWtAKbt/nBvf5R4K47gtzrG096Vb0/eQ01bVI7HWhjndO
	qxGUIc0XErrUhu3YYXI4aI7mnCNYKVkNLHjaedi1JYd9figXQykGvJIaKEcQ+N7PnHWbK1CmdFwXW
	6rSfb6uZva/zObWlnQrHvttWjMb+vhixVKOC016xM/MH/yQ+2GHCw4+O0EHOuOkLx5NNX5sq022b7
	8AWjTBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6u7z-00000007bAo-2jtZ;
	Fri, 01 Nov 2024 16:03:59 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tqc-00000007YUX-0RMU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1730475951; x=1731080751; i=markus.elfring@web.de;
	bh=7UB3ac7LBmeqyiSNaZiojKaC72aMNlvAd36yyxNrsRA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Jj7AcoFUcvb5OAlwS4Q6kVYWcKmEuY8+5zpeJ5WTD0pcI7n7grUNKyWlocW9GQra
	 dDwRH3FUXlYsG5Uj85tI3OfDYJZclmbk6kdetDpayUb25hwaXFWbJp5Cqccls30yq
	 4Bow5fsTgQGxApmTaWuC3/FFN8SF+LlPt/kTwzR2tgGWorSev9MEPyRQwVWETEH3/
	 GtpoZuEbKYY6InQcl1dUIGM2lruXn43IX+I0PZJiWlY2Ad18OZQqEAUvwMH3+XdE1
	 x40pyyr5brAHCXQGc9wBmsDNpAetIDAek2pYN9VycXLswWY0AUtMaqBvkbKWMKoEJ
	 2z8PuOlENTEo1CMU0Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6pUK-1tCvzN1kh4-00BxAE; Fri, 01
 Nov 2024 16:45:51 +0100
Message-ID: <fdf5702a-b739-4643-8288-86e6cfb8403d@web.de>
Date: Fri, 1 Nov 2024 16:45:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, s32@nxp.com,
 Bartosz Golaszewski <brgl@bgdev.pl>, Chester Lin <chester62515@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacky Bai
 <ping.bai@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>,
 Enric Balletbo <eballetb@redhat.com>
References: <20241101080614.1070819-7-andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v5 6/7] pinctrl: s32cc: add driver for GPIO functionality
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241101080614.1070819-7-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jj8tV1/5lvgDluPBwBwySefJgimRcKB6UJMv3JG+Rfhob34M4SF
 zpfZMhDKktYmP84RHCvTGMRiSo8eD0NXIcKYi0iJuMLPMKMkNEDgbDQ00Tu3zLt3yIR5swC
 e48XqFieUY4xPJkF6ksXNHRlO8FG5Rj1fT66cz39pU/OTQDchlM7fOVh76RvLj2jwuEjjfl
 jRgl7k75s3JcQFOrs36LA==
UI-OutboundReport: notjunk:1;M01:P0:7o16wLigwNM=;QX09HEZ8+jEi7umwCR8bn+fcqGK
 iwIJYJcfDDaFsY8IuY+91YTn1TGo54jj9+n48mICBQcofmxdKYke0JIQqJZ5RTaT0m1TOIYVs
 0WYcQY13IvGmPayFCgdk9f98I4hbgbbzdVm60fmcjajvWqCELsqFzIisOKey4dj5AInvLdnPm
 JPnk0whD1ihkVamcU8WuO7BleTB1K2bLnpOJX+rhxeSCy0/hxb0lpZRF0S1DENcbi2czN+vgf
 kMYO0d1heXCAZDam18SRyaGX8UN5b1vxAxvdBZEXRl4IafyjddgXOWU6NSRvarmQul/bmK2E0
 pjv+09sdadnPZSU1M7MxBKDdgxmj0hWRzbSuRsPvY/e4RO8RrvrfEZAyM1DM9/qsuMc6uBl9a
 t9yWvQyXO7qrXhlZSDJ4a6VE8NzakgBTN0Wk2Ob3kKo2DbfvbssS9NaJKjFgNzNkF/u7EiiYt
 VCvtOzcxM0bIERiOFQdAlJESvtnyzqM4fxSq5dFgFrwqPDrmWB3C6z06xziKlr/grIk5r1Jvq
 +3IUGIqsr/+rU04AkX/bBebF/prO1QCGUBZWcBFVMTguLeqRTsBfBvrEAoXBXMByRysar3VxC
 H34HcNDvP0KJ4/AL3Honk9AjXEvhd3wCjnMmY6uc3ExX1zIhmd6WMKX1iy9bNRgBf6khllb/h
 ozXTFFObKmhIzHTnZbMOcqCOjxYGUkOhIZy0hdbhdcD85kEj+KfgoZRcNNDl/uvUf7Kl6zdu/
 BD1t2+GFK9EYQH1oIoBlBxahx2DbN5Rf+K4777Aceclv50hSGqbYrTyBV0TkB4xg57/HQ0QMz
 Ig2svqAtWJFQZJUAp40Pab1A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_084602_557863_7B43206D 
X-CRM114-Status: UNSURE (   5.94  )
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

> Add basic GPIO functionality (request, free, get, set) for the existing
> pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
> coupled.
=E2=80=A6
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
=E2=80=A6
> +static int s32_gpio_request(struct gpio_chip *gc, unsigned int gpio)
> +{
=E2=80=A6
> +	spin_lock_irqsave(&ipctl->gpio_configs_lock, flags);
> +	list_add(&gpio_pin->list, &ipctl->gpio_configs);
> +	spin_unlock_irqrestore(&ipctl->gpio_configs_lock, flags);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(spinlock_irqsave)(&ipctl->gpio_configs_lock);=E2=80=9D=
?
https://elixir.bootlin.com/linux/v6.12-rc5/source/include/linux/spinlock.h=
#L551

Regards,
Markus

