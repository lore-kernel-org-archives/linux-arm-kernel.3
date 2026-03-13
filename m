Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F19105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeXmCnU6DkpJjDmOkF4Kl8YHcZPKKCKszdRslHD03ME=; b=LvQ4VcKUKsCmiptFOv6De/CnxK
	RkySfIOcwBvMZl7SvBUJmgRpHrLOwIJCGPTnj17fGUFqj0lqoNaM9xckVcuyRM7faOp6zh8zfcnvi
	HoosrK62oKxOt7szaAtjLrpQw7Lvyq4BAhJqxacoUtEyvCoJy5FlldC+ej8Y5EpZr5FB3CvDPr6jX
	ykdHHFB4TdbFfodKfbzQjQEx/5l7W0o0xC5SfiVvNue7FQ+rDb9x0Q+ZnFoE5oUFNAoQljE8IKwWB
	cCH7aZ+dfChK5bMVu81Wo7whTdGDgvY+p0lu1f7tUPSdaF9MP0YNOCFkHKvUdFfOcDYPhPYMrjk1O
	YMv9SM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ypN-0000000HO9E-37MI;
	Fri, 13 Mar 2026 09:29:05 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ypK-0000000HO8t-2TtD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:29:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5421E4E42680;
	Fri, 13 Mar 2026 09:28:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24B3960027;
	Fri, 13 Mar 2026 09:28:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B88510369555;
	Fri, 13 Mar 2026 10:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773394138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MeXmCnU6DkpJjDmOkF4Kl8YHcZPKKCKszdRslHD03ME=;
	b=EDn0BA/Np4DWs10goVewjq2nRwiiWAdgjN1OO52/TU46cKug/fB4LXKFTooud2iCJ7WFAM
	yIAqT5YepKsqHa3lrxEd2DYfzm88Ky+XC84kZzE9B4R3bS6R56Sv7e1wj5kDnUseMs9IMw
	bMD4qaRz3DmyYibHFl4Av5D6gVIKWihqomEPUaQboC2wXM6LGTD5GTr2czSHmtcboZ60iT
	qkNfahVXekJOPEc3EdTw4x8WOzD5nghJWlItGidksZkOhgDvHzAjqQXjpumqlGJODE54AU
	VnuUg8GSyjAjb/C6lVv1uwlwKe/lLeOVbZkKqXjuwLgK8CNsfPaz8ZcogAFaUw==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder@fris.de>
Cc: Annette Kobou <annette.kobou@kontron.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20260309085749.25747-1-frieder@fris.de>
References: <20260309085749.25747-1-frieder@fris.de>
Subject: Re: (subset) [PATCH v3 0/2] Kontron i.MX8MP OSM Devicetree Fixups
Message-Id: <177339410764.2782875.6884612032294375531.b4-ty@bootlin.com>
Date: Fri, 13 Mar 2026 10:28:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=439;
 i=alexandre.belloni@bootlin.com; h=from:subject:message-id;
 bh=nYRFnLPrTONi7U7O1Enq4WB5OEJpZYPZGRPBstu1j9I=;
 b=owEBbQKS/ZANAwAKAWOk3DBscDoyAcsmYgBps9jI1uZM7eWpDS8rTcWpBXfEtGRKFhN+YxZMF
 yZmooD0hC+JAjMEAAEKAB0WIQQGqwVVleHyz/Q7kmJjpNwwbHA6MgUCabPYyAAKCRBjpNwwbHA6
 MlhnD/4+HCdR7zX8Z+uBkvQwNxwW1gwSrniKNKkxjYztDiGeFGH7NWiLecjKwfqw/TYsvqY1Fz8
 y4GeFdusQtmplFJ90uqQ/2Oq7u+bgsM2p8O8LtEfdToqpnnm+lEiWfEOLG1J8cq63h5yhFeJdM4
 tvh97+PxquzdrOD3xSCTy8oUKUssqKPMzLpgifgYSysrdvvY6+vxv8lqD1fBeGEDFf4R80bH47G
 HX9suO2A1Jhjlf/n/3/c/LiHS2/lqfFpWpdiQ74xBIwMgXgNiqlJFm795Qr6OkWZ3ljxqrU+tUA
 maQ6I5l+B1Ep1IuGmNO6xLVAd+Gwza2isxomF4Ik05JhNufWiajlw0CDO1TepHh+8jRFqr5EtMo
 yK3f2PrXfqo0VZDf6E9TFtrtXc6WjGj5ARogE5EzKBaRltlsNKotm0YxiI95ioS50GQ/gTYaCr3
 1841EXYY3o8BX0vun2h93YRkVvxE8T678hc5olnnHMietCfNg+MhPGaEo1g5x4oP2cptZKdL/o3
 dg2nKsnazMcGYv4dDgknywEWYT/cHIT/eoj/DBom5Np0Xm2pghaYqDWBgoOtWrqeWFO7pLM95Nl
 wS75hU/bnsNrEi1Oua69YS1072MxINGSSadX0s/HOL8xm9+VDFB2fVJF1QsV7KSaJRn1Iv9x8IU
 pQNUThWh9LI9KRQ==
X-Developer-Key: i=alexandre.belloni@bootlin.com; a=openpgp;
 fpr=D42657F65BEB9D45A004FCFAA6CD9F096F642CB3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_022902_769800_FA1758BD 
X-CRM114-Status: UNSURE (   5.76  )
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

On Mon, 09 Mar 2026 09:57:41 +0100, Frieder Schrempf wrote:
> Kontron i.MX8MP OSM Devicetree Fixups
> 
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This contains three fixes and one cosmetic change for
> the Kontron i.MX8MP OSM devices.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: rtc: microcrystal,rv3028: Allow to specify vdd-supply
      https://git.kernel.org/abelloni/c/10663044bee5

Best regards,


