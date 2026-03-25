Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4525FEA803
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0NtwZR/IjN4ftYAYuKA7aIhJDP6u8Cdv7Qgj31a5Cs=; b=i+UCvg6pfbuPmSLn4RmQZrLPVD
	SvWVpyTaiXsGrZoIe0dthCqWe9kVUVJ8qT8Y+q4eBpPxRv56AGefDf2RlQUb1QRkZz/qIfau156VF
	1St3P3XRNqtgNNK4sryA4Z82Xk92QLEBsc/EMyWbIcyDnyL5iotu0fnWi+MwKnfQfvEFnShgHMlke
	YJ2KLUWU3OoEbXon8+L4XQBvmOcwr2cN2TuGFlcjuq876zZiiRE8PupeLEMWWMvs6em3AtUQrb71B
	lCnZEvAvVGuR4Ro4Ash+m5dbKkcwkOVGBVCoHJ8Dw0BoLRmINxHSafYDBYzzUkB47+zoaq+HX6dnR
	FkyUOX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RjT-00000003xse-2Z5O;
	Wed, 25 Mar 2026 17:09:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5RjR-00000003xs9-0VjX;
	Wed, 25 Mar 2026 17:09:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5076043C03;
	Wed, 25 Mar 2026 17:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3420C4CEF7;
	Wed, 25 Mar 2026 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774458564;
	bh=JRXYE/U8JS2O1cvWaeN5bQL5zUw+3JhAHGNHnw+1HNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAMXUhuNT66mvS0iWK53vTyXWWeQZT7xKEsQ/XK3vAjbzkwr9WbLA6P6x/N3I0EaG
	 skOFZtbj62dBviBdA7KGsK0nW6Gr5c55tGh6L/Q8AWxoAkyxZfZDriY7+2nt51ZMUd
	 HobEbQSyQ/k2jAoMZT60WQEcCZMB08HZbt8YxKPj8pzSsSiFimuLDPpuWS/+R1Eg7c
	 AKWwpggTDn5i6NIqddsyY/L3khFaMYvki0+HIMCyZm4+foHa6IBbwKsUOOqEZILTqo
	 aC99G0vWquyOnPHf/MJlwEtPsYlotnVoC2DtNg4zTECuE0wYG77oVeRJSC+hK3sXio
	 riWqfCxaKPoLw==
Date: Wed, 25 Mar 2026 12:09:22 -0500
From: Rob Herring <robh@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	van Spriel <arend@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 8/9] dt-bindings: net: wireless: brcm: Add compatible
 for bcm43752
Message-ID: <20260325170922.GA3822305-robh@kernel.org>
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-8-44c7b4a5e459@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-add-emmc-t7-vim4-v4-8-44c7b4a5e459@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_100925_201671_7CA9EDF6 
X-CRM114-Status: GOOD (  13.00  )
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

On Wed, Mar 25, 2026 at 10:15:26AM +0100, Ronald Claveau wrote:
> Add bcm43752 compatible with its bcm4329 compatible fallback.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Missing Conor's ack.

> ---
>  Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> index 3be7576787644..81fd3e37452a6 100644
> --- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> @@ -42,6 +42,7 @@ properties:
>                - brcm,bcm4356-fmac
>                - brcm,bcm4359-fmac
>                - brcm,bcm4366-fmac
> +              - brcm,bcm43752-fmac
>                - cypress,cyw4373-fmac
>                - cypress,cyw43012-fmac
>                - infineon,cyw43439-fmac
> 
> -- 
> 2.49.0
> 

