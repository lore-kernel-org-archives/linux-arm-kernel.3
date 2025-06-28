Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FC2C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 01:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWIyjWNSWpNlWfpLukm4eSpkeQ66iNY95mwRdW4gk+A=; b=vOl4b+CQ5ez7wA2Y8g1mczGlOB
	Nw0r3Zr/llAmDTPUw84SMozhCXDx0lh39nlxxiHn9b4YJVLYZ8LH1mErxVmqxlSPQ3mUsk1g3uSOl
	0AzwKFOx/AWlf3SGTpkOxRp+rkDHR70J4JzWWPsvYBH9dhkrpKtcAFYUK2toyUbAMA4HX4qs3IWeh
	g8SdNjZXp8Lic6MQupVku3XqXRKecQufeWcYrF8xg4sRderSmPQv7saEVjA8mk1E2o1xZLNelIlCB
	Ym/RwG7v29HWA+GCSUBYe6X9ZiDe0t2AWYczF0YRf+a0eFIlqCGctBrwWTp72RakSTNJTai/1FvSg
	2W4bUWIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVK02-0000000G7NG-03WN;
	Sat, 28 Jun 2025 01:04:58 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJwG-0000000G77S-0OZr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 01:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072462; bh=gcBkyhi3zYGXarPBn7yBaq1CjaIcyEkwlZd3FoDqsn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lwMs/H8YH9a4VltY5rQ/Etn2tDX9d1srdnIGAwoM90Jh6LXhXLgkTchBb8J5xyG86
	 Tdp8ja1zq6xLNIohp+JO1ZVztnVH8CxYvtnS/6QR6BZXULYmw6V7/cNeRYlxqnZs8p
	 CdBRsKTUMloY5beHui1ARoRpt2GmeZh4znnIbIupTzGQOYW77XEzqdAFJzq0rN1L3u
	 BWc4R8a+5RokDjkJRy9Jchtg1pr2TWiA2uDw3rV2wbK6EQCYMLTNZbewBlLEGY4TkV
	 qrExMdTcLz4C2xVtq8Hc5JCr0lwVtBMuBwB0cLtvuUy5l+7WdTxloo11duOPXigC/N
	 qo83zI9cXl57g==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id DC09F3C4FE4;
	Sat, 28 Jun 2025 01:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072462; bh=gcBkyhi3zYGXarPBn7yBaq1CjaIcyEkwlZd3FoDqsn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lwMs/H8YH9a4VltY5rQ/Etn2tDX9d1srdnIGAwoM90Jh6LXhXLgkTchBb8J5xyG86
	 Tdp8ja1zq6xLNIohp+JO1ZVztnVH8CxYvtnS/6QR6BZXULYmw6V7/cNeRYlxqnZs8p
	 CdBRsKTUMloY5beHui1ARoRpt2GmeZh4znnIbIupTzGQOYW77XEzqdAFJzq0rN1L3u
	 BWc4R8a+5RokDjkJRy9Jchtg1pr2TWiA2uDw3rV2wbK6EQCYMLTNZbewBlLEGY4TkV
	 qrExMdTcLz4C2xVtq8Hc5JCr0lwVtBMuBwB0cLtvuUy5l+7WdTxloo11duOPXigC/N
	 qo83zI9cXl57g==
Message-ID: <01f8dcff-c614-4da9-8546-e3bb0e4cef61@mleia.com>
Date: Sat, 28 Jun 2025 04:01:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 lpc32xx-tsc.txt to yaml format
To: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250625163431.2543597-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250625163431.2543597-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250628_010102_919351_A3DD3FC9 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message. 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_010102_919351_A3DD3FC9 
X-CRM114-Status: UNSURE (   8.23  )
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

On 6/25/25 19:34, Frank Li wrote:
> Convert lpc32xx-tsc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lpc32xx.dtsi.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

<snip>

> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/lpc32xx-clock.h>
> +
> +    touchscreen@40048000 {
> +        compatible = "nxp,lpc3220-tsc";
> +        reg = <0x40048000 0x1000>;
> +        interrupt-parent = <&mic>;
> +        interrupts = <39 0>;

interrupt-parent = <&sic1>;
interrupts = <7 4>;

> +        clocks = <&clk LPC32XX_CLK_ADC>;
> +    };

With this minor asked correction, feel free to add my

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

