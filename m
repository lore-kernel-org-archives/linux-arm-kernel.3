Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600BBE8FDA5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 10:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBkJaHWBMYgOiv48kF1QDYjafSqkHvQlKdfY3CelGy0=; b=vpJ76G0oHSRkBeLE6yfDOM88KW
	qvTYg4qAGzGP6uPZS73rujWUZhMzFXEBjDhsEiRxDepHzibHLg44XW3ZxGAs+Sx3L0y8j+ASJ9H+T
	M4fHKTAi1D1sI9LOziea2byGMsOaZvtTEtiClK2if3Tl1n6GSCPAL56ekiUJ2ffj3+DN59Ipfjm+A
	7R6/FY2U4lX/gWlpL6dWDEN8Fe05m1Z+5xqhZxd8UHzvDSNCnz967uw+ImI2ItO4KwzQfQ0RvSndH
	mJNHvSSl3wKNWseslXfBo2NR4NvIXZWFrXNvNrFoY9kS4AyWLjlQ7SVN9+vV1xQGN+v3BJj2je93f
	jdP0OQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ500-000000016GV-02OE;
	Fri, 26 Dec 2025 10:24:44 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ4zx-000000016G8-3riN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 10:24:43 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dd1v446tmz9tcZ;
	Fri, 26 Dec 2025 11:24:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1766744672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBkJaHWBMYgOiv48kF1QDYjafSqkHvQlKdfY3CelGy0=;
	b=WLd705T81Ccq/lqxekWccd52GzH9d1TaFErX6ISqXS0FvdOqOj6nOnDiIYgJu5ybv93BA0
	78FqoG66elWOdXVYBe8+d7argkB70apgjyITIJfffMH67HV8aR6SGDmbDAskKaA9LYDs1G
	sii4zE9ZsMZAWXjiTTYeIh+QbJxsr39vtvSdQ/mYCbzWy35xJtCpAVFMs5xJJtWwTUtBVt
	oCy5G07zb+3p8oLp4wb8IkyTs/VNKUOjDHS6pkWa84738EdTPM7V66f+hOO4o1gVZ2BsXG
	GsDLgmD2JSyuLeEXnGSAKWvQy7ga88DxcAcXNF3PIeeBYABr76sxhXzIwC7Vsw==
Message-ID: <14c48d93-8ee6-4769-8dc3-5c527134bc77@mailbox.org>
Date: Fri, 26 Dec 2025 11:24:29 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM SBC
 DT to rev.903
To: "Rob Herring (Arm)" <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20241226171404.84095-1-marex@denx.de>
 <173531253398.3886481.9345779510218290682.robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <173531253398.3886481.9345779510218290682.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: c872a8573b8c5cbe46c
X-MBO-RS-META: 1pimp8jhrujnxcy3xx9ihf7yxt4edirb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_022442_112542_3BC359B5 
X-CRM114-Status: UNSURE (   9.02  )
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

On 12/27/24 4:18 PM, Rob Herring (Arm) wrote:

Hello Shawn,

> On Thu, 26 Dec 2024 18:13:27 +0100, Marek Vasut wrote:
>> Update the DT to match newest Data Modul i.MX8M Plus eDM SBC rev.903
>> board which implements significant changes. Keep some of the rev.900
>> and rev.902 nodes in the DT so that a DTO can be used to support old
>> rev.900 and rev.902 boards easily.

[...]

> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: tpm@2e: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['st,st33tphf2ei2c', 'tcg,tpm-tis-i2c'] is too long
> 	'st,st33tphf2ei2c' is not one of ['infineon,slb9673', 'nuvoton,npct75x', 'st,st33ktpm2xi2c']

This is addressed in bindings patch [1] . Can this patch and the 
bindings patch be applied ?

https://lore.kernel.org/all/20241226171124.83735-1-marex@denx.de/

Thank you.

