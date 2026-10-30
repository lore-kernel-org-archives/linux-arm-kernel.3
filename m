Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A136606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TUkAzFSx;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UL6qCozx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GL+scJfnHWYGcb5ZDCDZq1DsFM4XmLZLO7gXJFvI4SE=; b=TUkAzFSxfcGS1C
	68btD+CSM1aKDuNlnb98bmMZN6YXjdWarZuKiRrfgzVVuMD1BtfeupcPKwj4uk3y9fqZCr9gNwwrr
	TUju+hWrMna9p7OfaN1un8dxjDk0ed4Ohls44G7cSj3SwFAtO7yWbsxtMVtEjdDAuLT12bk+/3G+s
	ypI73NVR75UO1Z6YvuZPvSaX6PuWRDGhApi/ymH5o7Pet9mDwn6oJ1P9hIKiF5vOcdLJLIYbPV3AM
	2u/zbICA/k5i9LkvkoKpzOHMnB2DQHEe7rWHqFpTLJ90dnVHazsue+jlqKZYr8DppFEXBB0As8W5m
	RamrcPwR57BrwTjegSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjQN-0000000BLI3-2fHY;
	Fri, 30 Oct 2026 10:01:27 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjQK-0000000BLG8-2bT2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:01:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 074E11A13BE;
	Fri, 30 Oct 2026 10:01:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4E19603C2;
	Fri, 30 Oct 2026 10:01:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1BBD910328D09;
	Fri, 30 Oct 2026 11:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793354476; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GL+scJfnHWYGcb5ZDCDZq1DsFM4XmLZLO7gXJFvI4SE=;
	b=UL6qCozxlBY7caFOEQgPh5XeTPxe0uKsEO4bkWj9MyqY+iB6UMEjvRtH21o5vvUXcVKUI/
	CcysYI7iXZOapAOxnIb6BQjZdAGx1qYjrMvBt0YRs7+E6O4aDVwGHjCk7OhzXkeZhDVO23
	TQHECJhi0LcZgT1o+KpDTc7YN8L1J5L2EKzanWVej8oZEGJ6Vzsn4R5joPQ/BlfzljTve8
	PmVSOem/IiDXooQmrkdr7+6vYj1l1oO978SJdcSMrim3K4XcjL2JGzD7Q4YBKbsHs433CU
	FcHLSyrQvT1ygOs2bTiBRo350ax7+Z/O+9J+3YqY0rAvCHSzf0Ekv2GDiK8KUA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/2] mfd: cgbc: Allow compile testing
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261030071137.100954-4-krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:00:48 +0100
Message-Id: <179335444849.822489.8403085231738038338.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_030124_804044_0B7F2964 
X-CRM114-Status: GOOD (  12.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> cgbc-core.c driver does not use any X86-specific headers, so looks like
> it can be build tested everywhere for increased build coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 87ed55c155f0..de957f574056 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -255,7 +255,7 @@ config MFD_AXP20X_RSB
>  config MFD_CGBC
>  	tristate "Congatec Board Controller"
>  	select MFD_CORE
> -	depends on X86
> +	depends on X86 || COMPILE_TEST
>  	help
>  	  This is the core driver of the Board Controller found on some Congatec
>  	  SMARC modules. The Board Controller provides functions like watchdog,

Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

-- 
Best Regards,
Thomas Richard


