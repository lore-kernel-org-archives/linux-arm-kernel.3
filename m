Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24822C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LdRXpOvpY8MU9GMUpEh8fPVPCUtndoEd5nrLrISpGFs=; b=eQEW8LaGW2dz7rAz+qCQxB9H2C
	V7rTbEvU1KVzkjJibZ/UIEc8DdUA0rr4m7dwV6ww4Ggb8Y7hritkv0crc9suH85F3XY2szq/0IyfL
	NNjVG/j1wgo+KktzeJN4lbvwcR9N/z2FH3h0p0vpxhDNnvYjV3UI3acuX7A2gUopOiALzw2CgIcQ5
	UkF1lhcelMLFnojRJhoJqrCpgo9f7LqfqGgGGAF35QL6HdN/ZRSgfSDWWR3uq/n3iO8TQI0HWCW7k
	OTWJzd8D7mQ4QB9uw1HA1nwH06XJ97Qh3Osw9YZylcz+vleJibBBTJECmMVyR0Df2YntMmgdF0qwf
	QULOz7WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWCT-00000003ib1-3PU3;
	Thu, 27 Aug 2026 09:15:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWCR-00000003iao-2HTK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 09:15:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2259642DF0;
	Thu, 27 Aug 2026 09:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7306C1F000E9;
	Thu, 27 Aug 2026 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787822106;
	bh=LdRXpOvpY8MU9GMUpEh8fPVPCUtndoEd5nrLrISpGFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ix+B0AWXNJJWen1w78P2vTxR1ovIcsbPrDM3oBaZYsZ4Yz8UODavHLF+fd+FrxlDr
	 69z/8n1uDLFKPcqThIe5Iu5S71zbYi1h/pJgVMcSDTTFkNlsKDw/cJ8opO0GLNl5T1
	 yjtEvDmUWBi5wfgVsrGmCxmx1gSSpuzQKjz5IGDMecu9z4W68jHDm3FxFvg+NIHA29
	 w+cbIdrpKCwBd1Z8XyAhWPA8fiORQjalN8SYdigZ+DI8D3ohOA6IZTKVcjMCDiaq+o
	 MdHb8OFuC6c3HfN2NzgpBUUeFDFeRfCH7yje8CF7v4kX3aCkbSRZYjKeN9gyC2EQOw
	 7KfuTHRDBTpPA==
Date: Thu, 27 Aug 2026 11:15:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Message-ID: <20260827-curvy-competent-bee-fcd81d@quoll>
References: <20260818-t603x-spmi-v7-0-dafebe6e7739@chaosmail.tech>
 <20260818-t603x-spmi-v7-1-dafebe6e7739@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260818-t603x-spmi-v7-1-dafebe6e7739@chaosmail.tech>
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

On Tue, Aug 18, 2026 at 08:32:40PM +0200, Sasha Finkelstein wrote:
> Add t603x and t8122 compatibles, interrupt support, and support for
> SPMI controllers that are not always-on.
> 
> Reviewed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 37 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> index 3e5b14bc8c31..1d14025b44c5 100644
> --- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> +++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
> @@ -20,8 +20,11 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-spmi
> +              - apple,t6030-spmi
> +              - apple,t6031-spmi
>                - apple,t8012-spmi
>                - apple,t8015-spmi
> +              - apple,t8122-spmi
>            - const: apple,t8103-spmi
>        - items:
>            - enum:
> @@ -34,9 +37,37 @@ properties:
>    reg:
>      maxItems: 1
>  
> -required:
> -  - compatible
> -  - reg

This stays. Which device does not need reg or compatible? I think none.

Best regards,
Krzysztof


