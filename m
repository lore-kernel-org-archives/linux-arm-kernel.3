Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EDEFF5106
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dU+Do44yz0TIhjMzxEB+m3FIC55S78YfYxFAve6i/V8=; b=seQsQe2YBTB1UYSleJ9WnGXbIQ
	lylff1gwaIGfk2FnExeyUJI9vDF2GZpkBH46ntJf1XZT4LahmAnOqIYzRLpS39wAAveG54y86zjH+
	SeEq+d4ZXrp2KG3C/xzVpS+C6FO4zhYV5/HmllnqWHHbdjKkIO1BRLRujt8QU1dGbVXmKw8UbULuj
	lJuWzsZ9TPr8E+Wc6W+uFc89ALU4TiGCzU4aKf5vqAEvnvRgv34BLd/NAMPWJ7P46cYkg/LvBlIzJ
	ZChwmrf9F5/ICbQ9shiBramVj/47asYUFp5qzZnsSWfo/TCM4syFvyMDei5MEz2o67wvLGWr7f0qk
	gFo65w8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8KO-00000006hKN-04HZ;
	Tue, 07 Apr 2026 15:26:56 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8KK-00000006hJu-3LS6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:26:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 880FC10E334;
	Tue,  7 Apr 2026 17:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775575608;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dU+Do44yz0TIhjMzxEB+m3FIC55S78YfYxFAve6i/V8=;
	b=dskD0HjT2yjD5SVz9KueEeydV9WOAkhnuwUCHbXkQhY0tivDOX65200j+rnWwwFvO/+0nr
	FpETLL7rrumCu4VM+5Eco73mD0bedt8pgfn4LCi0Ed5HRv1hiSQU3PvCbb/nB9/joHwGSA
	fgxCU/TkTBvOKL82MAYhmC0k9yddbPRFSUTXhFNTN4eQpnufWc4ayeJFPOnvyg9uZXBoHf
	ExQZEiTa59u1GMQNuOfDFD1s75Sr9RcJfNOzZQwRkFQOzR1dCxP+0b7MSYQ8t6GMIBoEfR
	OtuXK35zZgP5sVrlgWtitZcIV5N0svb6ebVCQ9lp77GSDkhqFxJd7hmm4efc1g==
Message-ID: <5c0f6900-bb37-4c9f-8052-5d17e21180ec@nabladev.com>
Date: Tue, 7 Apr 2026 17:26:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M Plus
 DHCOM SoM and boards
To: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_082652_980722_8AAE62B0 
X-CRM114-Status: UNSURE (   7.42  )
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

I know I was sending quite a few DTOs recently. Is this set still on 
your review list, or was this one missed ?

Thank you for reviewing the DTOs so actively, it really helps a lot !

