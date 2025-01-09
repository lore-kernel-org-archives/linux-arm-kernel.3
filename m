Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA38AE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SB3qaBzXqynfSTEAgUhSUjfhEvdMywrstC0y0qrIOkc=; b=SnEAdtOpyjnVulfDjIbHDJOQXK
	2KA/MOEk6ZbrVHyLEhvPzRCKiXaMAXsDXCT2HQIFMk5UbNiI+cbpTEaISFuECpOyvuCEQ0v+BFASJ
	4hIyUtJKVjyFR4NF+dtZtNfm0WwwGbdk/T9p52KTYyAaa+633FxwOQyTlsgtoT/SR515ftVeNtKDz
	xCpdni87eRg3QRzvWg7ezhOk0xU6FVT8nVn/3bmG2cFadPSIJwwgHlIWTTpCMiuHiCsZc57OOjZHD
	33wtYFNNhHfpK2zjqATPw3upmBSzPIGVK1jJVyTSD7maXuPWK+l6/U+dCDPLQ4VAQpGhR+5J4P8Xy
	GOjbY8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqBy-0000000Bbjc-42wA;
	Thu, 09 Jan 2025 10:55:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqAm-0000000BbZW-0607
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B1A0A41828;
	Thu,  9 Jan 2025 10:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C01E4C4CED2;
	Thu,  9 Jan 2025 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736420034;
	bh=yZ8khXsdp4izGzc3z+rv7+yCpy/7TPea6D+6pe6L/r0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GAOUFN8rsr0/E4Yy75nT+aHFmqW0uFlIDwpb+MbJ6U5gzmb8TcJvCqS4mk1yYP9lc
	 XPdd1+9350xu+kcbx8BWtPRNpPefIuUAsMoOJjvsI+dm+bWuHBTo26TO309JhVP7+B
	 mP8N1TUpSKjq/z6LIW8E3sgeiPIrWS0f2/IYV2Pf3yhRHyRQF0cDBnxtonGL1uBz4F
	 9O5kATwRaqWf5EoZ3MZJZ9PCHufmLUcj3AglajNNDJTtBuT+yEVaILNnDpfpQnFbiV
	 cbaGim07I8mgHjNs+BOPgg9jve9oX+n0YJiv59ClQ3QEADKbjJEpDLSMFaAvd5RZ3E
	 upPQTW7VyPzkw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Charan Pedumuru <charan.pedumuru@microchip.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20241219-gpbr-v1-1-e19a562ebf81@microchip.com>
References: <20241219-gpbr-v1-1-e19a562ebf81@microchip.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: atmel: Convert to json
 schema
Message-Id: <173642003250.2586091.8120905496358792824.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 10:53:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_025356_146729_2F824138 
X-CRM114-Status: UNSURE (   7.23  )
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

On Thu, 19 Dec 2024 11:12:50 +0530, Charan Pedumuru wrote:
> Convert old text based binding to json schema.
> Changes during conversion:
> The text binding is misleading, add a fallback `atmel,at91sam9260-gpbr`
> for both `microchip,sam9x60-gpbr` and `microchip,sam9x7-gpbr` which is
> missing in old binding and `microchip,sam9x60-gpbr` is not a fallback
> for `microchip,sam9x7-gpbr`.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: atmel: Convert to json schema
      commit: b55689c0a9b14ba873de662408b0ee298c307a35

--
Lee Jones [李琼斯]


