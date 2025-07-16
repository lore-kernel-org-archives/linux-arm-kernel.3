Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3358BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 08:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBYw5oog6yO0VQIk58vTdpBz6vwF0hjlDU5vofNWgIo=; b=uGBrz56rKvvO6tnodbV+tqbTnL
	zwPSK7WQuQfmsP+fFibQtDHzlHL1XoRoWpvV5rtNcNVSAFIWxgvogjWPETU4yOJPL/sjRM0ogqQLN
	AnkmrzIIzdyTPTl20iVKwmcscpwivmZSfwYYl0W4qyM2Nf65tl1YEYQt0/2ccxRzfjZCrq1lfocI+
	aY47HQBy7gOzl9xnBUlOvYf2qai+EjdNc1OLZvnJHsxz2uO7I2OKiNtxhZjCcuIVP1X+IPcHcXAwM
	GkJJe5hBYabgT0JvGJfVjmQJ2PfnEenoG5scbtbLhTDlvvf41Punhb05bgF7A5lcOTuNV1T/zv6RQ
	404xpk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxjJ-00000007CVS-3Xub;
	Wed, 16 Jul 2025 08:43:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubxRH-00000007AAO-17hW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 08:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 846F943FF3;
	Wed, 16 Jul 2025 08:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFDEC4CEF0;
	Wed, 16 Jul 2025 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752654270;
	bh=Sx6GtXQhUUHM3FrpmZ+GaCxjq7UxqdGBPOXm9TRFxoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iiu//ig0tvsYWLj3RYhibc9P+zvAzAbb29UT0vX3qk8p/xgxwKLdf3zW7fwGYc1Oj
	 AjEzWR0K269SObv38lNZWA5KeWYZ/Wv1szxIR7/2VkY64vkA3AXs+op48eVXtKkXCr
	 Rf5f2m7eVMdB4efgBFeU+ydDBGGB2kkZEilBlSb36zDBslg2cOU5mprxqHxhCXPSWL
	 jCOs/zzWzvSsfcyHaG7AJwtVPbQpy1VuNCV7y5zNqCOAD0y7XMJ4N6DUDGoa0eMaT6
	 N1ZW3ORoGmddFRSF1oL2BQu0Y2TrfHglL1GyLHzrmTcSLym1gc186GnN1KeSWs2wNt
	 87f12ZxVIRozQ==
Date: Wed, 16 Jul 2025 10:24:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 01/10] dt-bindings: soc: aspeed: Add ASPEED PCIe
 Config support
Message-ID: <20250716-wine-partridge-of-wonder-af10a6@krzk-bin>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-2-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715034320.2553837-2-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_012431_323017_951E1631 
X-CRM114-Status: UNSURE (   9.18  )
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

On Tue, Jul 15, 2025 at 11:43:11AM +0800, Jacky Chou wrote:
> +maintainers:
> +  - Jacky Chou <jacky_chou@aspeedtech.com>
> +
> +description: |

Drop |

> +  The ASPEED PCIe configuration syscon block provides a set of registers shared
> +  by multiple PCIe-related devices within the SoC. This node represents the
> +  common configuration space that allows these devices to coordinate and manage
> +  shared PCIe settings, including address mapping, control, and status
> +  registers. The syscon interface enables for various PCIe devices to access
> +  and modify these shared registers in a consistent and centralized manner.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - aspeed,pcie-cfg

NAK, see writing bindings. You already received comments about generic
compatible in the past.

Best regards,
Krzysztof


