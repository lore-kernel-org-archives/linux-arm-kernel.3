Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDB6D6ACED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 15:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wey84kIC4m1hDfkzPHCvmMBCoCQCb+1v3dfhbCeaCCo=; b=Ee+oz5R4hzQdeocHiUrrl4OQyv
	ujfGU4vht4E9TPdQay70eT+zvxQUDiboqF9MlFcpV7GWlGa0PzHQGqkD/OzD49pjWEhZrbK+vBWI0
	hKIfAngFkhY9v02OvdAt881Q1YyekP1Ndwdt50pDOaZkXuIueMesJRh9kDvNtreT10HkmF+AkYLWA
	gJPG3VfGosk1FTv/c6W22C0yoTKc6Dzxyg+/MYI/iqsT8vEZiHHtXRvDKolKvS6NB05qZl7L6CGTF
	0kC2uwAE5Y1XpVqbnmTLnxyd/lh4jGhw/oWVPdeAxEEqnjyefDxk0rCc0LFk6rXgbsZ4/PVdFuuwn
	FdmyfMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGK0R-0000000DVyM-1dTp;
	Wed, 27 Nov 2024 15:31:07 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJye-0000000DVeN-2tQT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 15:29:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id F247843587;
	Wed, 27 Nov 2024 15:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1732721353; bh=2vJooQxDCFwloAiYjdkYj6nOIAaBL9PWzbzwFJSF9X4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hIo7tdzyArdTp4Z8DYTMTyp7aaI3whJ2Rcw0dRCLCMAOlolDRG1FCc1cCVcharF+T
	 O9id0ZBAgSaGPlOmlLVFIMOpulNMtGwge1ucAjrUo0q+33INpbK901XBwFGMRi+ZaR
	 9vDvRzm4OEZQo58uXdDr0ekqKMXtt0QcfagGGi1eKhX8xlRs3AAY2gltjlsrR5IBDQ
	 ZelOG7bJE9bcrh0XUsUSXU2M9zGQDD3VohAi5kJGkR8PsWjl3Nki8SywbLImvP/C1a
	 ArcRa+tvw7/LEWmtjZWflh1S3Cxv6gj3V6TL0xQf6YWtFvZUMc05SjtRGml0WYyPQF
	 lNwtZ/QVz81/g==
Message-ID: <9dcdea44-974e-416f-9d59-204d519774dd@marcan.st>
Date: Thu, 28 Nov 2024 00:29:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
To: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>,
 Mark Brown <broonie@kernel.org>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <Z0Z7Lrv3rBfzac_e@google.com>
 <CAMT+MTThJoYLYhtYAHwh6F3LTApid9Em+eP2AZYc3JChC2b9ig@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <CAMT+MTThJoYLYhtYAHwh6F3LTApid9Em+eP2AZYc3JChC2b9ig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_072917_154816_0A98DC4E 
X-CRM114-Status: GOOD (  14.63  )
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



On 2024/11/27 17:29, Sasha Finkelstein wrote:
> On Wed, 27 Nov 2024 at 02:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>> I believe this needs to be done at the SPI controller level. See
>> "cs-gpiods" property in
>> Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
>> as I understand, allows overriding controller's native CS handling with
>> a GPIO when needed.
> 
> I have already tried doing that (adding the relevant gpio as cs-gpios
> on the controller)
> and for some reason none of my attempts worked. Since there is no hardware
> documentation, I can't really tell why, could be possible that we need both
> native CS and that gpio, could be memory barrier issues somewhere in
> the driver core,
> but the method above is the only one i could get to work.

Are you sure this isn't just a pinmux problem, i.e. the bootloader
initializes the pinmux for hardware CS only on one device and not the other?

See spi3_pins in the DTS in our downstream tree (and the reference from
the SPI controller). If the rest of the SPI pins are already working
properly you can just try with the CS pin (same index as on the gpio
spec). Ideally we'd list the 4 pins, but someone needs to reverse
engineer the mapping with m1n1 gpiola since we don't know what it is.

If it really doesn't work with native CS and proper pinmux then cs-gpios
on the controller should work. If it doesn't something weird is going on
elsewhere. There's only one CS line, needing both makes no sense.

- Hector


