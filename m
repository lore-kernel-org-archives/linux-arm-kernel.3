Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6497CC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 17:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GFYDHqlQzpJl9rL6j0rWVOfQYmcKGDAiJjmIMqNelc=; b=naeMXJqDrT+F+p6e0jha2Tic2c
	5bW+vYnD2nm6zF5DmKbYpbc5duYAXbZr6vytf2d+8zZGAyjPn2/mjIyLSEM6bBz2r1u8JyExa2jHT
	O0cX5ZRsUU3f2Q8qhdTIBG4yxl6Dy+Z4rkU+acoYYXpnGTb9EJiHy6yU1X6Fco9i0+EVpgK2Isl4V
	lLR6ROdMhUiEiELq7w5ewG3oddphiJM+Kks+51q0GLFcDiCSyWHFkI6npHBkUTTz50xRtZh7XwooO
	ibLEe6PGcv09FZk0w5vpkaIrSRoHAu34kbNtpH6MdjppQ4NjaMrD3VmDHfvbPJSvwz3MpabXyCIax
	d30wCMKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoHj-0000000ED7M-2siW;
	Wed, 19 Feb 2025 17:54:59 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoEr-0000000ECEn-2JXM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 17:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739987519; x=1740592319; i=markus.elfring@web.de;
	bh=2GFYDHqlQzpJl9rL6j0rWVOfQYmcKGDAiJjmIMqNelc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ls6dW2V6JhYAwKGdHgNr/DTHAWjJwlQtCquFJT2nKaDxW63cQO2iesbwNIF6O2KU
	 h+qFPye0rWU9F4QJpcdy3Ts8TgkjDCyoEDFJOEhIclyUYD2C+ASKBxsvjv9YYgtgg
	 o7NUpTaChyQpJLl1unnJiNxJZg40gdpjL/24NHpi3Y8hgHIvsdzLpNjCucxN5c600
	 2npkcTUTGfHhb2ZY2mNafQniwFHAZMfm4YiXQv/3doE2hIUykkoJtD5fPMfk3SozG
	 Tqswrfd0wvMLtRewFipCtbIMX8whVvnQoQsvL+8kRI4lKy38OkxJZZBt5jvnvZIeX
	 yeLOEHpRbUWcWCPyvQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.10]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCGSU-1tbUZ30T2o-00EK2P; Wed, 19
 Feb 2025 18:51:59 +0100
Message-ID: <c929975d-6928-4161-b062-64636a4f278e@web.de>
Date: Wed, 19 Feb 2025 18:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sebastian LaVine <slavine@d3embedded.com>,
 Stuart Burtner <sburtner@d3embedded.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@pengutronix.de,
 Abel Vesa <abel.vesa@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Devarsh Thakkar <devarsht@ti.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Spencer Hill <shill@d3engineering.com>, Tero Kristo <kristo@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>, Vaishnav Achath
 <vaishnav.a@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Will Deacon <will@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-3-slavine@d3embedded.com>
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250212195656.69528-3-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UWazyhhgLJErNLDk5cBHjE48IdmfMZl8bvuL5WGtFrLv7QPsGnV
 xjhR0feAbp68V6Z3PT/3/ImwcTznMRu9DAvUPD6DCggY0RbYRSY14gzXfxMaC+EuFD8AXmW
 B0D2Joi7xZMmkZvzIU4foa3mUl8raYFA/0nlrHD0vjV9T8qDORZBB1aXaf6XANrszKwUIN6
 v+rFLWtUXoW68aPdcecog==
UI-OutboundReport: notjunk:1;M01:P0:lPNuBB8wTIQ=;iBOV+TkYE/qZL4SzQiFuEJC5f3Z
 tITcdP7QCl52zwd+QpvMmDFB4zEfWKmFcWiijEKOFYMHJ3WCeFpE8s2+cMqywIUAPLfy/h8Rb
 KgdOFeFxjh1vnEeNjFB6sdTNdajlUVi7O2pST6N43G2fE5GEtwqB+CJ3Vhdvldnbkp5Vx7SFQ
 4hIOLQn9cDVj3JhvogOh8dFfLFq6kqzsSZ27XWMzJOoNPh9s2cKl2czqywDb8RfIF0liYIrgK
 FuJK/ExanfdV2omcDTTnwJEzxWL6v4CdVxChCR1UyHPisF5UL6umEYaI7mgJ5WK56FFBvXORB
 kCYCJQIwfJA85p33j8uRvvRxrGzQMC2NdDMlaUQm86Jj697ohFvVw4LCHzdC3mB+z+ljPCx3E
 hOqrTAsxmG+W+A6rvc0HG8CctPsUiomTQQacTXGMQXgrOO7qzDq7yPaQlG5cUqYZoSu2HXTRh
 VbE1ygM6VzsgHuOr1RUBVCX1BTkT7uR+fhiyZ+MkdUG3K9r9h/Wdx/zDBbVVBbgoqF0rVVVnV
 /Gbp49BgrwCrhK3UhdXaQ7fzqSfUt5/mcOK5hIENzfIMmAdkADg18h9loJBmLm1HlJ/maaM5u
 STe0CAGjQai498NGHY8pQvGoJswriXRBvhyca/NLka7IsXheqgZeEkV+k4ObGxStK8McJ7FYF
 Hmil4pmIcDJos8LU6xWcQXx8mNzi69u/M/MFtXAiF53d7ELxoNzIAlFrB5JSIVFUUXsRwe/8L
 d6cs6QOlAuds9cfAp5JjlTYXYifGUomc0hct9Lcxc8N9YPkQOVXF51j/vku3xh2CzSXiQWjQs
 etEXrJyJjifpTzmuFFXtYKrrXRVK0ArVq29OH/8JYYxEiPqXWtZH667tjb23sfPnWIOtDqnb5
 mCMX8zGzowpd7VKElSowTEcGC2/xoWXstOIbhMzTo3PhN/k7Ka1CLMPBkX8Bi2/JjMKjEOGS4
 gEZY7M7XFk6jyDalb2MsqFTrF45FWEvlztm3umru5dQA7dRl24B4+RWtiogreiaeTCTsA42jl
 6lZE6NThPiKp955LeGXd1exxpUymWGFvPZ5mz5X/DSPO0pf6N+71srsQd62OwuHP6YlNusRb1
 4MWIwjNECl9pbOZ5dZ5ag6Z7QhuFS+wozJkgi36tpA2HX/uxZCsI7SqZ58cCjS9Jt8QZ4FRtx
 Q+OIRAXIFtuSEFMH0zOF4fo5XiQ4qTczKTwcEHeqk/Iq/5RGIxLWJGYsaS8xvyYd0blIUsSGU
 nyqTs720/yeYI+3X86RiS44fJaQ9aFzPCwkv48nBaiXVtXEsS8c2o6aDr0osUwYIfIaYar8h1
 N3tU+nE3mg3fkhe6YvJAwKJZIgXA1UG1uFsMwdK9oiNjcJQSsx/h3OBQ8ygkFEYgbaNZWPHyJ
 1XRAQStkyXq60TUULOAYf5oxcvPtPe0vf/Jmr/at5qE0y2sqvmeU3Ra2g6AdIvcaDH/QwYqYL
 cuIgYfa6Wqlv498T/zfjVg5kujRU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_095201_987053_7F1B1C07 
X-CRM114-Status: UNSURE (   7.21  )
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

> Adds a driver for the Sony IMX728 image sensor.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc3#n94


=E2=80=A6
> +++ b/drivers/media/i2c/imx728.c
> @@ -0,0 +1,9655 @@
=E2=80=A6
> +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       struct imx728 *imx728 =3D to_imx728(sd);
> +       int ret;
> +
> +       mutex_lock(&imx728->lock);
=E2=80=A6
> +       __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);
> +
> +       mutex_unlock(&imx728->lock);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&imx728->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.14-rc3/source/include/linux/mutex.h#L2=
01

Regards,
Markus

