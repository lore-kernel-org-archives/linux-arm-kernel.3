Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76508CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JqZt72XhG/KVFrIYIEjhPAAXnkJGN044O5l0gt/AWw=; b=AaCaOFNhvdy4IB7l9jnST03krK
	Ew6SG/zYAoBaQqSuT6Xvt86kGyV69CAMcXz8Oi8y9KJCrdCVtKREcWiMr9WBWyoviSQouciKro62n
	qkIOMhadTAKcR2RlNxvEYG5KRLHN3K0gpEHrZCIWVCdVbe4HWw28XcbjOdko4LzvGQGeBRWzfxf06
	yd5QlFhPrAaZPXOK/3zM91OEFOyAPSBLpblIAieuLbsXSWufwFUNvJk8RaLvZyJkxTS2+ni04hM5h
	A0O+k7QVaAwEWxalrtEVvtcTk2DjtqGG4vaqyRjIO7Qrtbyp6CeGfUqs/2RivCqfkYQSnqPv46l4n
	TrpfsBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNna-00000006xHz-1msY;
	Fri, 08 May 2026 16:11:34 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNnW-00000006xHD-490T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:11:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56DA31134D3;
	Fri,  8 May 2026 18:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778256688;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7JqZt72XhG/KVFrIYIEjhPAAXnkJGN044O5l0gt/AWw=;
	b=gq0X83b4+4vBDpzWg8OO/K6cemloiZ1gTbue8rmAr0JHBskORf0VUxDVgYzZWJsKXkExmJ
	RLgjK68ZEoEbuuCsW/zliAlpjzI0674KQTqh5aCz+g0pQPlA1F6GdxEvhkVprMnJRmnA8W
	gxCzTT3ISV2n/oLom5FFPFqEs5EO2+fRI/brHE8UMpYYjzurFYXtxA3ScFRY+Rd7ITwImx
	CLYY0NZ0ANTHwCbvYWhlSxKLCHUf4DcMGfn9hd1erUI1b8LWszq0WUNwHV40ZOl8BaxG6Q
	9pBaF8wO9LCwPabdQBHtHluo7vVEUh20rQXR/rz1d3jkpkMOFQQCWYWNoEMtmQ==
Message-ID: <65e27834-03b8-41a6-a418-126959bb64da@nabladev.com>
Date: Fri, 8 May 2026 18:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: linux-arm-kernel@lists.infradead.org
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org
References: <20260326044411.222907-1-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260326044411.222907-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_091131_256798_A62174FE 
X-CRM114-Status: UNSURE (   6.44  )
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

On 3/26/26 5:43 AM, Marek Vasut wrote:
> Add DT overlays to support DH i.MX8M Plus DHCOM SoM variants and carrier
> board expansion modules. The following DT overlays are implemented:
> - SoM:
>    - DH 660-x00 SoM with 1xRMII PHY
>    - DH 660-x00 SoM with 2xRMII PHY
> - PDK2:
>    - DH 505-200 Display board in edge connector X12 via direct LVDS
>    - DH 531-100 SPI/I2C board in header X21
>    - DH 531-200 SPI/I2C board in header X22
>    - DH 560-200 Display board in edge connector X12
> - PDK3:
>    - DH 505-200 Display board in edge connector X36 via direct LVDS
>    - DH 531-100 SPI/I2C board in header X40
>    - DH 531-200 SPI/I2C board in header X41
>    - DH 560-300 Display board in edge connector X36
>    - EA muRata 2AE M.2 A/E-Key card in connector X20
>    - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X31
>    - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X29
> - PicoITX:
>    - DH 626-100 Display board in edge connector X2
Hello Frank,

how can we proceed with this patch ?

I hope all the feedback has been addressed ?

