Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB6EE8537A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmQMfcyzuZjDFanSQa7aOlIRVuJztiYHN0qs0CQZmxc=; b=3vrPjs6nt6efXAkahHkvdH9Lzo
	iQwG8loyc7K3W9S3g/FSFv7do8mNkYAllca9rZiOSvC+aJjAu+eOTUALuVoO7+/YI4PspYzUYRpQv
	sgn2/UCw5BLAnVRG6AeEXkA/XXT7YrVhbDUX2AAI+/fGvvMS0ElK01MkFG6z0ijd3ycCOJpTTQpA8
	s3DV3tgUjqsjPNEKjtjJPHk1zQo8/FZRWlEd8OzJDZOnwFM5pZ2oZNRSs9Ab2B1pnqVH4MDIDbmO2
	YrLl4vPI1HD12iHWMtfKtgjG5epuHIYoq8ZX9AcDuJvd1OmlNHTchx3Ifl2hAFZgVsPerNbQj4IRS
	LA1S8zZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hPQ-00000002KEf-1uFt;
	Fri, 03 Apr 2026 16:30:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hPL-00000002KDu-3oLk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 16:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775233807; x=1806769807;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vAu5xDULmUDVRflPCz8uMYqeqlNDlanNU9eapaLwCXM=;
  b=fI7Jr0U+A6i3Mb+f5YB0KHABN9horeGFYIfKqJslxrza+0qAqXPThyMU
   /uWGr0ikMY4jaWoNmfBW3lIJlt/U20uRJJClLpw6rIfAA5P5bre2ZVnge
   YPMVIDOCD5BHf5AvN4TsGMJ1IJlmo+dGMGHjcrBJaGUMPickz6iW1TOZg
   iBQO92YtCnRG+CvObRB5u+xnPG1bPTxDH2y4fTZVcxO2r5vgRCfTjpexT
   cyf6IQNeON6cBpT8OPmv0a6cPTJVUvRUVz+EWt3nkLBlg4+VmIsnKjRhG
   41nD0vYylFVNRzzfhwAtjg3qSxMYB701IchyJb9S8cTz0NcFIESxGlcf7
   w==;
X-CSE-ConnectionGUID: E/PdIr15RDaZGqnfevhQgw==
X-CSE-MsgGUID: DgoYrBvXTna9L4fcG6YzCQ==
X-IronPort-AV: E=Sophos;i="6.23,158,1770620400"; 
   d="scan'208";a="222904266"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 09:30:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 3 Apr 2026 09:29:32 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 3 Apr 2026 09:29:30 -0700
Message-ID: <0fdf436d-af96-4798-8099-31469217ac86@microchip.com>
Date: Fri, 3 Apr 2026 18:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] crypto: atmel-ecc - add Thorsten Blum as maintainer
To: Thorsten Blum <thorsten.blum@linux.dev>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-crypto@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260403112135.903162-5-thorsten.blum@linux.dev>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20260403112135.903162-5-thorsten.blum@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_093008_302200_48D6A6EC 
X-CRM114-Status: GOOD (  12.86  )
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

On 03/04/2026 at 13:21, Thorsten Blum wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add Thorsten Blum as maintainer of the atmel-ecc driver.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

> ---
>   MAINTAINERS | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3fe46d7c4bc..c23110384b91 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17216,9 +17216,10 @@ F:     Documentation/devicetree/bindings/media/microchip,csi2dc.yaml
>   F:     drivers/media/platform/microchip/microchip-csi2dc.c
> 
>   MICROCHIP ECC DRIVER
> +M:     Thorsten Blum <thorsten.blum@linux.dev>
>   L:     linux-crypto@vger.kernel.org
> -S:     Orphan
> -F:     drivers/crypto/atmel-ecc.*
> +S:     Maintained
> +F:     drivers/crypto/atmel-ecc.c
> 
>   MICROCHIP EIC DRIVER
>   M:     Claudiu Beznea <claudiu.beznea@tuxon.dev>


