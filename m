Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CE9CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yI/LWbw4aHxVlWynpn2njorIzEWobjJWE83Engadbww=; b=N5jRou7Gr2l7T7Muu4lfcePEV0
	dZlSYlfoID0nOVdyODD9Fc9J2aikqFUKbjKQqgje2DlCCo7eDzYF4YPWSrqZ2sFrefg/HHBsafWXm
	SAWlYY+pPZpWIRUy9anr33WRjM5gMhGb9ZLr2T9dPuaA4vS59sFRmR4qPNStneiWX2Bai23zO1dik
	xUi6ESwik7Ep2qMz4uTRaarJ5OcQmdcIpNWhkebRJZiA14uc3Plz1QXv5clP9h/s0KtjUpJPBLc8p
	w97v1sykKn14Er/GPe6jDjuVzOTzeiEMGBAgCg1c3HweIt4+v4RaAEOF684ws7IYTgdJzXg5bwPZj
	z9wTWfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMVB-00000007jg2-2VEA;
	Wed, 24 Jun 2026 12:14:45 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcMV8-00000007jfW-15Dj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 12:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1782303279; x=1782908079; i=markus.elfring@web.de;
	bh=yI/LWbw4aHxVlWynpn2njorIzEWobjJWE83Engadbww=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=coSjJrBwiEFeIKl/e05LyzeFdpjSQ++XdPzMtz8AARR0PgK0g7MXtUnLx/m7qaKv
	 8hZQ/HaTEnyN8CRT4TnT+XlghkwHJqjZSclBSaVSJO0CYarEb/b9J1ihJ/BimjGlb
	 KNsXVSEnF7djjGxAT/1rLVytIonx2lB2ID3HvoTMgoTxutu1PMNn9zywSZ7txSDOd
	 ypbWt6G4+KTDyGwh8Jf7Wm+O6ot8+cF6ybyrpDs/96Apvrg2EfbQiqhKLw+tsC7tI
	 FGvnCC+LH74B8nwcduZGyOQ+7c+HxmPnnFPL55IKv5zkiDQz+m3FsCzMEDeyJwkdD
	 fI0hMSczYHMwBW+waA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Md6y1-1xAb3U0aKR-00amEB; Wed, 24
 Jun 2026 14:14:39 +0200
Message-ID: <3ab543eb-ca09-4d75-b75c-b8a4c71b2173@web.de>
Date: Wed, 24 Jun 2026 14:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: YH Chung <yh_chung@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Maciej Lawniczak <maciej.lawniczak@intel.com>
References: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
Subject: Re: [PATCH 5/7] soc: aspeed: Add eSPI flash channel support
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260313-upstream_espi-v1-5-9504428e1f43@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XVwodSElK2bARrHe3YMglBE6wXZMwKTpMuDSiv2niVSEWeetjGY
 CoWWjivzGMjBj8dJj2HaiHA45PFcvSUdfDFoi29cw6kKlZbHsozAqXr7gbojO6OzIcZFV7b
 fL4DjlAgAgdvTpMO9zbmqJIk1+N3BT+orGHn345u4qRMXWy7+NlHnEombL73z2QGpxladQc
 UbNsqm5vpePLAx34eTqQQ==
UI-OutboundReport: notjunk:1;M01:P0:YmY5+4smaK8=;z0pnejjUozqX84mh5VTYdiFnk09 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_051442_701510_B316C730 
X-CRM114-Status: UNSURE (   4.23  )
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

=E2=80=A6
> +++ b/drivers/soc/aspeed/espi/aspeed-espi.c
=E2=80=A6
> +static void aspeed_espi_flash_rx_work(struct work_struct *work)
> +{
> +	struct aspeed_espi_flash *flash =3D container_of(work, struct aspeed_e=
spi_flash, rx_work);
> +	struct aspeed_espi *espi =3D container_of(flash, struct aspeed_espi, f=
lash);
> +
> +	mutex_lock(&flash->tx_mtx);
> +	aspeed_espi_flash_handle_lun(espi);
> +	mutex_unlock(&flash->tx_mtx);
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&flash->tx_mtx);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.1.1/source/include/linux/mutex.h#L253

Regards,
Markus

