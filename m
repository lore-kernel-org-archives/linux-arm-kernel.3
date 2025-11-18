Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFF0CEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibPe4riXg9tAu5B/aoe6KMHQkKrDT+ArV3QiVtSJ0Ik=; b=ZTTE8BYvy0rI9rO/d2g6Rd4os2
	Ymo1qRUmbTIORJl28oOUNi3GbLMqHL828f3uVANhwX9PxOAXFHttmfGhlMBMU2Q2UhhVgipYU73FI
	vNmlCt8HNdsXXPHLFW4ErFDrykSgG3Bmpzu7PBSokNOo0Ll4b+MI3JaOGjikW6NWjFQYgbVcfUqva
	tPz9KSAeYgRl09sM4idSwGiCV376UdeTPJzJ8W9iK/Zyxf9F5NF/r02d1DEwmgFvl215rEymFT1e3
	G11xrm9sNJXjfnxcJWG0TLl6kNiArxdvrcI2/OVslmGA60owfXej1YKcqa6Jse+gpPXo7Khvz/vAB
	fpmIAQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHEw-0000000048s-1h3u;
	Tue, 18 Nov 2025 08:39:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHEs-0000000048C-29uC;
	Tue, 18 Nov 2025 08:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763455142; x=1794991142;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G8N7InRiz/r2N49MxkgSLlhI3kbCLucI3vlcM9g4e1w=;
  b=M/dvTWnwQcoWCwUZNt6InqFX8SoJe9kYMfEfzoUAnHQ+/MO9IPPOqXxp
   ZxGAJ574JdOctLwWdEQaGVeMcT/x2Ahi9dq9W8kQFo+rDjv3uvRugcHdH
   p8gK7XClgtgSWuH2NvBEVUC5qsDtXYFwb2RmaI3yg6X7VhK96W2xSOL5p
   vyO3YDQ9GKCfS6TaT1l6+m4gwAtW2JFHNvhHdJB9t3EcT/I9zjKM3xcha
   jWYyQrvTi8zz2YQqr9qIeSiub1SESrFrU6Tll+HtBjNXWJQ4sgBRh8Szf
   ItzkmhndMg/hfo0OmqsBI12e35Khms6nZfTFMxtge0e18pXhFXEJi51+t
   w==;
X-CSE-ConnectionGUID: 7r7bw6jDSkez8ippLPCIow==
X-CSE-MsgGUID: x4o0IzLVSO6HQox2+ulUiA==
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="48657120"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2025 01:38:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 18 Nov 2025 01:38:19 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Tue, 18 Nov 2025 01:38:16 -0700
Message-ID: <e7f645da-0d77-4d7f-bcc6-c81e96589144@microchip.com>
Date: Tue, 18 Nov 2025 09:38:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: mfd: document syscons falling back to
 atmel,sama5d2-sfrbu
To: Conor Dooley <conor@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
References: <20251117-aeration-smock-5e7ac06e2942@spud>
 <20251117-marlin-mustang-5ffda4d211c7@spud>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251117-marlin-mustang-5ffda4d211c7@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_003902_647139_F53A2E1B 
X-CRM114-Status: GOOD (  13.87  )
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

On 17/11/2025 at 17:29, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The sfrbu on both sama7g5 and sama6d65 both fall back to sama5d2 in
> devicetrees, but the former two compatibles were undocumented. Now that
> syscon.yaml has easy support for multiple soc-specific compatibles, add
> both of these undocumented devices.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Nicolas Ferre <nicolas.ferre@microchip.com>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks Conor for having added these compatibles!
Best regards,
   Nicolas

> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> CC: Lee Jones <lee@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Conor Dooley <conor+dt@kernel.org>
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-mediatek@lists.infradead.org
>   Documentation/devicetree/bindings/mfd/syscon.yaml | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index 50f0012f4ebe..64829ecbb0b0 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -239,6 +239,12 @@ properties:
>                 - ti,j784s4-pcie-ctrl
>                 - ti,keystone-pllctrl
>             - const: syscon
> +      - items:
> +          - enum:
> +              - microchip,sama7g5-sfrbu
> +              - microchip,sama7d65-sfrbu
> +          - const: atmel,sama5d2-sfrbu
> +          - const: syscon
>         - items:
>             - const: microchip,pic64gx-control-scb
>             - const: microchip,mpfs-control-scb
> --
> 2.51.0
> 


