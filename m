Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C32E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPyysO2XXxGEc/5u8x5QdBytXSE8H/9h7tzM+tT5s+g=; b=w6F8lra7gjJcxAYn1Bn+cdRd52
	jbNuD4m7W0kJyyAByvp4LIIJ2NFmzu7Qgr1yzInBZQcP2yE/Rc0ndyLlRCQrVPzIPRUo+BRWQ2IxU
	kh1xwghPphNdE4Y0YTAm6UhpaAR4ZBSgFuioQrTuEevYMxg2k1NVj1p8Xo+65Om2l+pKULUEkmsSc
	b5kB9M/W+d4IyxBFzJvurai/0xXu7Lq4rkg9lBmdeFMBl4uvuWMeCP95RKFh/Tj0h3tBbJAZh33Ox
	IUoaA5m5uR8MgGCCQD2S9OmG1PHND0RSCEq0e+q7aG8nTZHdFjsqbS0mgEZxfc3uy+Fk9NpJjW9JA
	K1riG+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKI5y-00000005Mdl-3RGE;
	Sun, 08 Dec 2024 14:17:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKI4u-00000005MZ6-3364
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 14:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7309F5C2DF4;
	Sun,  8 Dec 2024 14:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE203C4CED2;
	Sun,  8 Dec 2024 14:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733667365;
	bh=+0ng45+7kJ1yT7sur2+oF61LOQgPGMdnCNycAOs/GUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=buszkfdZC5LkMipnYOJQAOO6i4zNsvhOI9/GKlntUUnVIjfBIutfpDGEEJhoJfVKT
	 4APx9OzqOcOAqBnDC3FoCe9ZsbACKkVuKKgGtB0MToBKEpYFaAacfUA4fFJmlPWH5P
	 t+odPx/QPJfERMsYWajb1bcwBluM4rnzFj41hY6fgcoNG/cAJwoDYZg9yrbFc4FRpy
	 E1wZWDcgHQ/5tv3YoHdJOYSmVC7I/HHD7aGPI9A6oafUe/w0KSALOPUUNPAOouy9Vb
	 9wesrHCnux4rs0e+X5938ufy+wqeOsqZI/B4I+uq0P0ILrEFKhw4tsRmb9/uLb0fe+
	 hPMrZzn+qbraw==
Date: Sun, 8 Dec 2024 15:16:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v3 02/13] dt-bindings: mfd: atmel,sama5d2-flexcom: add
 microchip,sama7d65-flexcom
Message-ID: <copmhri4e43sjk6uiahgmhkqk6kuhuvm3kmusptytww6l5qs2a@xejs5hq4a7gl>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <550a6dc244a9955782c5b9d7863df4e15bba8a26.1733505542.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <550a6dc244a9955782c5b9d7863df4e15bba8a26.1733505542.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_061608_837538_4A89A43C 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-spi@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Dec 06, 2024 at 12:59:47PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add flexcom binding documentation for sama7d65.
> 
> Consolidated entries into one enum to match proper coding style.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml   | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


