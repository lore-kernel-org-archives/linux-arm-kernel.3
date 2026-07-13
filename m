Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA1EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oo4rIyniLa3IrOryYngEBRNx17hUDRIHRdfHv96/rA8=; b=JXpvZ1sTtSjP5JAogdfWGUUryM
	bfOZdYCu/QzX3UBFyQMWHmLbzna15KnjV1IhWIR8w3B5lJ2KRFyl1esfXT9gG/Zl4813h42jmRayg
	ymf81z6jzk9IoZJz4HGA/8NyoDALMF+jtwCjxEBoCJG4i7E/KN5AAAn15f7IZSvdTI/O/yLYGKEvW
	iZaVFV2q1Yu55IT0/f90UBvRjGz4R4s6Sl0RQW7OOmpDjHRPVq6U2KtPYsF13gWtzxAE6wtfLh/c3
	L4l/mZ6/8rrh4GEhoyMQ1DSRzval/uNWoni9hhBuN/g8dtUF3IjZqM/DTF7UWTa2ra3PsZsoZc/gx
	oIVX3VLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBJ9-00000008Tbf-0HOI;
	Mon, 13 Jul 2026 07:42:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBJ1-00000008TYR-0S9P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:42:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D4F294E40D82;
	Mon, 13 Jul 2026 07:42:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9FB2460341;
	Mon, 13 Jul 2026 07:42:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5C3BB11BD3A38;
	Mon, 13 Jul 2026 09:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783928536; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Oo4rIyniLa3IrOryYngEBRNx17hUDRIHRdfHv96/rA8=;
	b=rwZx25YCNBbEgGMtX75PvBzTlm1s61DtQzrE3ZeCtVUl+HzTfcVlC1R3kee22hR6JxcP4E
	S3NHkHLMPJkNknT6TwRDk8lYb4JH7a1Gdt1aeoUKgZdr8pu6BKAzBxidM8F5cVbGcq5+7k
	sBHcdsSB3CSzMIehKZC2UhNhCuFMt5mrMe38z8O//+6o7W0BYRgTBrB08dKDhhVO3FMlRs
	lvZiq1KqYKZPN1TYbDcDrG2ReR90cWcSpHcDMr1qND8rUhSB0k6qIbt55eV+gS0JZrfimE
	mMqD4zYxC3rJjeF0zrGAf5Pv8MhPZy8xWXc1dZwt2LxqIGaHiLW6uL3CLbRkXA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 09:42:05 +0200
Message-Id: <DJX9VUXFJBJ1.3SPE0QKF0528B@bootlin.com>
Subject: Re: [PATCH 1/5] arm64: dts: freescale: Import optee node from
 u-boot device trees
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Wei Xu" <xuwei5@hisilicon.com>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, "Avi Fishman"
 <avifishman70@gmail.com>, "Tomer Maimon" <tmaimon77@gmail.com>, "Tali
 Perry" <tali.perry1@gmail.com>, "Patrick Venture" <venture@google.com>,
 "Nancy Yuen" <yuenn@google.com>, "Benjamin Fair" <benjaminfair@google.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <openbmc@lists.ozlabs.org>,
 "Tom Rini" <trini@konsulko.com>, "Peter Robinson" <pbrobinson@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Frank Li" <Frank.li@oss.nxp.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-mathieu-uboot-dts-import-v1-0-ffe0210e50c9@bootlin.com> <20260710-mathieu-uboot-dts-import-v1-1-ffe0210e50c9@bootlin.com> <alFfeOFz2UA7hAbK@SMW015318>
In-Reply-To: <alFfeOFz2UA7hAbK@SMW015318>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_004223_329906_762D63BC 
X-CRM114-Status: UNSURE (   9.33  )
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

On Fri Jul 10, 2026 at 11:09 PM CEST, Frank Li wrote:
> On Fri, Jul 10, 2026 at 05:31:34PM +0200, Mathieu Dubois-Briand wrote:
>> [You don't often get email from mathieu.dubois-briand@bootlin.com. Learn=
 why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> U-Boot is importing kernel device trees for these platforms, but adding
>> a firmware node to enable communication with OP-TEE. Importing
>> changes here will allow to remove these additions in U-Boot.
>>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mm.dtsi                | 7 +++++++
>>  arch/arm64/boot/dts/freescale/imx8mn.dtsi                | 7 +++++++
>>  arch/arm64/boot/dts/freescale/imx8mp.dtsi                | 7 +++++++
>
> Please split soc dts change to new patch.
>
> Frank
>

Sure, I will split the changes.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


