Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE1D5C0C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12VThzmwGLW7tUqHzq7E0tiSg3ZmQ7Nry9RYTgmq1QQ=; b=d55EP2gQmPthfvU9L2hEjvkule
	YSV6SVNv40IJY2KKxdGTEHC4wbGi3hjA7sX/DxILbtRx0FrctxN/9QOMv+lbVgpChyPpc8XSU+y7b
	4O6ks5W2a2FKe5wKzBzQemSWb/W4Kxh8UDa99+ZY8LUZAR9A64F9WnTCVSRFJeA2/6EkiUp8gDfMb
	js7M3fpD1doKnsXnWv1otxKINjZPwGnPIeU7O3cwsO+PpJJ0IoccS0Ng2epU4yvzQ2SzPHvdmLXY4
	hxjVxM4qk6PZrVGIMbSAenRupETrglYB2sub+ThflG8d55L3LcgeylTrk++90zQAA4qR5d++e3LqS
	BHc8UI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9P1D-0000000Afwf-300o;
	Fri, 08 Nov 2024 13:27:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9OzO-0000000AfRH-0J8F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731072326; x=1762608326;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5hvLEyTFPQx5H7v3dFuZN0FjYzVD+U3f2NNRdnnKXSw=;
  b=iaq/vF9DurgBTYVVzVvrP0seZmNDJIzeBXqSlMdwqju45y+/5ncEw4MB
   tD7j4LgSFL4tEYMusC4CZJW4bdl6ZB5Y/o625FvVFPgZXw0QZ63mDllMW
   VBVIkcbXeLuxjBa2Tu+j1RXv25Mj64hPbOT8PLqfkNSKgCUY2milXSKHU
   RC9EH1VCiLjyUnpzfautXzJ7EL6PWMZ1DtmlOnWTiDQ6X4drdFUPHU8Gj
   8eF9puFwLOLD34I5NlTYrjCAUNbxRyogkj9I2YcdthOZ3QFBEVZtKErpX
   SwfQVwYXdlG/6sgxzIDTHsbc7VQE5kHjAsf1RFDM64EtRFPuvGGOta1GK
   Q==;
X-CSE-ConnectionGUID: iH+GyLWgRPSUWZyqd7expw==
X-CSE-MsgGUID: a1xqAW10RbmjJ1w3OUmEkg==
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="34573173"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Nov 2024 06:25:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Nov 2024 06:25:23 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Nov 2024 06:25:21 -0700
Message-ID: <609ef9c4-18cd-4a80-9821-5df27727772e@microchip.com>
Date: Fri, 8 Nov 2024 14:25:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tty: serial: atmel: make it selectable for
 ARCH_LAN969X
Content-Language: en-US, fr-FR
To: Robert Marko <robert.marko@sartura.hr>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <lee@kernel.org>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <luka.perkov@sartura.hr>
References: <20241108112355.20251-1-robert.marko@sartura.hr>
 <20241108112355.20251-3-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20241108112355.20251-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_052526_211763_4B3B9BF3 
X-CRM114-Status: GOOD (  13.86  )
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

On 08/11/2024 at 12:22, Robert Marko wrote:

A little commit message would be better.

> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>   drivers/tty/serial/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> index 45f0f779fbf9..e6cf20b845f1 100644
> --- a/drivers/tty/serial/Kconfig
> +++ b/drivers/tty/serial/Kconfig
> @@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
>   config SERIAL_ATMEL
>          bool "AT91 on-chip serial port support"
>          depends on COMMON_CLK
> -       depends on ARCH_AT91 || COMPILE_TEST
> +       depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST

Checkpatch.pl reports some "DOS line endings", you might need to fix this.

>          select SERIAL_CORE
>          select SERIAL_MCTRL_GPIO if GPIOLIB
>          select MFD_AT91_USART
> --
> 2.47.0


Once fixed, you can add my:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
   Nicolas

