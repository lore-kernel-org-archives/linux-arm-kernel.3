Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D513D75E58
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 14:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol/8URh2FBPj8F5l8LvLrhCsPIrfEw/h/Cx/SKJh1iY=; b=pKCgNShqwtYo8GfTp73/IxOcxa
	AKjI5dcZw1QQqodS3nov3S++eudmUOuM1MiiVGmXuiKYgO5XEtm5kyhPDhJC0THVxnBVgtUZ82Y0r
	PQZ6VtjInYHJla5+41UkL5j2xbm1R3JFxo18u7iYnO/C3qqDHjl/s/bkMStljo8RTpLMHZm0lOr+X
	c+P819nmck9/HEVElYEv/pxe+cIvGyvLstGfYhAlafjXJjEqJUZeHl/RqL9/G3fqaooya2+USqY7/
	BXCmrOpUDLB++iwcAgVTWh1QJkucZqi64jGe+9cCDcJwQWjpSkU2Jc2xRECoBxdmHpdgCGTHjONP/
	qSVUccsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUce-00000002bmL-2YYs;
	Fri, 22 Nov 2024 14:27:00 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEUbh-00000002bkL-2Bze
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 14:26:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A82F1483473;
	Fri, 22 Nov 2024 15:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1732285556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ol/8URh2FBPj8F5l8LvLrhCsPIrfEw/h/Cx/SKJh1iY=;
	b=EOA1thI+YywyhD5Gc55IqLdgcCKKbxGqZZj+jb0dI9j/OcuZiq3mB15Y6w7pUOyr/1FNlT
	RQ1iCXHuqzYZoiZW6TSoJnZ+Igdj78Gl/5H2hQegRM4SEeGJ2tqJaxbTsfJpS4XXrp5jHT
	AD9/e/GTTn9npk/iCtHCnIpbcOILTH4eqDb9a8+afFZCzEesWZdPw+VmweixTH2IpgXA6n
	jw363d4z1sm7z91MARmC1W4Vo+GQylJzS1XR99KHidV3Kp2M1E9+qCiubbqAW8IZtzjMgS
	DbHNs9xo8Ek9zqAbn2hdugLPdhV6TihSbADEaLuK/ReRUd17mYWwSiL9HHj/wQ==
Date: Fri, 22 Nov 2024 15:25:47 +0100
From: Alexander Dahl <ada@thorsis.com>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Subject: Re: [PATCH] spi: atmel-quadspi: Fix register name in verbose logging
 function
Message-ID: <20241122-zips-module-d0e6c6a1e69b@thorsis.com>
Mail-Followup-To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
References: <20241122141302.2599636-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241122141302.2599636-1-csokas.bence@prolan.hu>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_062602_016972_48F23577 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

Am Fri, Nov 22, 2024 at 03:13:02PM +0100 schrieb Csókás, Bence:
> `atmel_qspi_reg_name()` is used for pretty-printing register offsets
> for verbose logging of register accesses. However, due to a typo
> (likely a copy-paste error), QSPI_RD's offset prnts as "MR", the
> name of the previous register. Fix this typo.
> 
> Fixes: c528ecfbef04 ("spi: atmel-quadspi: Add verbose debug facilities to monitor register accesses")
> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
> ---
>  drivers/spi/atmel-quadspi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index 91108ddfaef2..316bce577081 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -183,7 +183,7 @@ static const char *atmel_qspi_reg_name(u32 offset, char *tmp, size_t sz)
>  	case QSPI_MR:
>  		return "MR";
>  	case QSPI_RD:
> -		return "MR";
> +		return "RD";
>  	case QSPI_TD:
>  		return "TD";
>  	case QSPI_SR:

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex


