Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7868FCA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Rj3kSTb4zIdcHkHMpf8h9/vsq54KZFXyOO6zfxNk7s=; b=pC7WMw9iYFn6iBaTKhtOinIgVJ
	1wf2zF8A/xnuZY7XkkrJ67mDcdYROEF1qn1xkOcvDbEKpKSDjFwVoV0p8G5lb2g5vEuYOnDykbdGr
	zilWq9QIWc6yW1evT6ZqqX/8ZW/ZjOQgJcQdTJc+uBOOGCAA9QRU5XtYpKoO5diy1qmFVtlB/HbTQ
	4OtBHgdpiTzhNeiIqVds7idQ4IYmLPkPvjN/PJ3iLXu7iKc+/orCJkhCnfWWyfP+9NiDTB6vcvSVB
	vBxPF2cI1LKnb6jqDxYC5U6KHxL2/iaPH/dAdgmFu8VAVGjL9IAsXd0aJ/ZWYB49WdNRPJaXb9XX6
	nDjvgwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkdv-00000004SIv-2u5D;
	Sat, 23 Aug 2025 09:34:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRsV-00000002dXX-0Q5M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:32:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755869543; x=1787405543;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZYQ4ILV3RrkPQFj3nv+P9KHAr3nKxw/zqHI0NlcxtTc=;
  b=h8S/G+uH4RUqFSJMVCZF3wHaFnwPFpbt4iI6FJ2+667Gffr9SVlqNrxN
   SaRy7a0u5RALrdzdobd3FLysj/kZTqZ+dd6SlFh/BRGyE/Ike7jmu/KhM
   MFMvSvVMZ4uoR51JCcscd9HqpcYGXxk7uyAciTAQV2vfJH9JXSqZxKziS
   cUfcOr/u0z3OaHi3o+TxSzVLxUtBKoKyrh6DUw4jXQOBx1lXj57+IpgS0
   eGX6rltlU8LiCMKcIrNZ377Dl+EdQYvM5t18/lP/oXPEZXT1JHiwWdeiL
   LbFu4R6yeKnbO6cRfDpi4rVxfMRfFt8ujOe7VTSPAxPlustupAh01uP3M
   g==;
X-CSE-ConnectionGUID: s1Ub95wTSSmucjb9LrXB/Q==
X-CSE-MsgGUID: 34LNloV2SSqIchEPAj2ZVQ==
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="45530459"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Aug 2025 06:32:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 22 Aug 2025 06:32:03 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 22 Aug 2025 06:31:59 -0700
Message-ID: <d05d7de0-bfc8-4184-bd18-b3ffb50fbb76@microchip.com>
Date: Fri, 22 Aug 2025 15:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/9] arm64: lan969x: Add support for Microchip LAN969x
 SoC
To: Robert Marko <robert.marko@sartura.hr>, <linux@armlinux.org.uk>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<andi.shyti@kernel.org>, <lee@kernel.org>, <broonie@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<o.rempel@pengutronix.de>, <daniel.machon@microchip.com>
CC: <luka.perkov@sartura.hr>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-4-robert.marko@sartura.hr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20250813174720.540015-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_063223_152927_5B11DAD9 
X-CRM114-Status: GOOD (  14.82  )
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

On 13/08/2025 at 19:44, Robert Marko wrote:
> This adds support for the Microchip LAN969x ARMv8-based SoC switch family.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
> Changes in v9:
> * Select ARCH_MICROCHIP when ARCH_LAN969X is selected as its now hidden
> 
> Changes in v8:
> * Place LAN969x under ARCH_MICROCHIP as suggested by Arnd and drop review
> tags due to this
> 
>   arch/arm64/Kconfig.platforms | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index bfea380100a6..31bddd1a17de 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -177,6 +177,21 @@ menu "Microchip SoC support"
>   config ARCH_MICROCHIP
>          bool
> 
> +config ARCH_LAN969X
> +       bool "Microchip LAN969X SoC family"
> +       select PINCTRL
> +       select DW_APB_TIMER_OF
> +       select ARCH_MICROCHIP
> +       help
> +         This enables support for the Microchip LAN969X ARMv8-based
> +         SoC family of TSN-capable gigabit switches.
> +
> +         The LAN969X Ethernet switch family provides a rich set of
> +         switching features such as advanced TCAM-based VLAN and QoS
> +         processing enabling delivery of differentiated services, and
> +         security through TCAM-based frame processing using versatile
> +         content aware processor (VCAP).
> +
>   config ARCH_SPARX5
>          bool "Microchip Sparx5 SoC family"
>          select PINCTRL
> --
> 2.50.1
> 


