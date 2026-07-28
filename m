Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F752C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 06:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwbTck+tlWpY0kvq7ToJYGEkkVRqTe4Jou3Obf4YuVg=; b=PaiQbRGtJ0hpTST0Z6Ll1XLY76
	NIk837M5ndVjn3KVJ1sTialbJFtqB3mrPNQd7iFogHeyMgHANzluhAQaRTfeTESCjitxbCp5l1JDg
	UrlvWjetUiZdP96Y/voSO+7nRdoS++cQ8C1J3cHXda/i5xrV55ftQe5aGHkyLQPSgClwM4EWiKZ0Q
	qjZ9CT0fGRsxV1oFqTorb/owwqQltMkS4upzgyCxTlYUjeY+rpcWdgq4ohxyhwcmGkMfFo5x+sOXa
	6vAXNnyHuOEN7NXR325viCoXLpfTFKrk+9x9YBqSoxGGKsm9N3GJ3/JJuXeHvSsfg2fFGDDfOHM6U
	+nqCfgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobQp-00000004YC9-1dn0;
	Tue, 28 Jul 2026 06:36:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wobQn-00000004YC3-3dPF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 06:36:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7514A41A99;
	Tue, 28 Jul 2026 06:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A871F000E9;
	Tue, 28 Jul 2026 06:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785220608;
	bh=dwbTck+tlWpY0kvq7ToJYGEkkVRqTe4Jou3Obf4YuVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gYw6ZHMKITiEvpaT0zLuH4FFtlAws7/hDelr87YxLfc0p9GBI4zwdrJPyLr/SXKHm
	 QRiaWNvRSkVExMDoQuc5K1C3xBBoTideC/67DxuuNTrQZMDoVUcye+tziSEwInMj/S
	 8wIxiNVbnxE7XTxKZaxXdoB7GmKdpsvUb9IP+BB72kWCYL6YnBzs5dDaAfYvuz9jIf
	 OuInptCHzAUJYqEX1c68LWeeRWKmO4fuKELxVpTv2sSoFIyRF5phWdga9UX2y4aDOs
	 WQ+75VwkBFaUce/okzbN/qzmbejUg+5TFQw5QXNXTNkIHnkvbFgW18NRW8GmHSQpYV
	 A0YhLQFJA22QA==
Date: Tue, 28 Jul 2026 08:36:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, cwweng@nuvoton.com
Subject: Re: [PATCH v4 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add
 Nuvoton MA35D1 QSPI
Message-ID: <20260728-boisterous-accelerated-oxpecker-149bc5@quoll>
References: <20260727091833.750051-1-cwweng.linux@gmail.com>
 <20260727091833.750051-2-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260727091833.750051-2-cwweng.linux@gmail.com>
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

On Mon, Jul 27, 2026 at 05:18:32PM +0800, Chi-Wen Weng wrote:
> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add a devicetree binding for the Quad SPI controller found in
> Nuvoton MA35D1 SoCs.
> 
> The controller supports SPI memory devices such as SPI NOR and SPI NAND
> flashes. It has one register range, one clock input and one reset line,
> and supports up to two chip selects.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
> ---
>  .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


