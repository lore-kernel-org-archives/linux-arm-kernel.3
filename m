Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2060C71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5YI9dzwE6ynlsh4YLOdxU8H636oM7expVr1RVzQWRw=; b=sv21REtCpF0iuj55WZ/lxF6KG2
	UopURFiHfYi/9s2t26SioYOOwmdDRdeygzUViTnLXvqMF11MH70EIjhNDkBlQXHKGeNxpFdOPvT1s
	8PIsiO6+o4G4ZtHAvMAWJdiMTB0eORaPOXCFealeSw1H82Exnf7tb4+B3OLcsezEW5vjHiR1wGfRI
	eUmUgQgNWVio8aLJud9OkWcWNmIhH4K2mAO2zjV57YQjO47vWIUO34U3jqPUytH2jXdrAHKwxLtBx
	Jb3pjRpN8BJZZ9wWYPZJhVkjC593sFGBJqIQ8nK3KrclFR1PYdWBlprisbwN7ohgc9iisLtUstPuJ
	qbc80CGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTsv-0000000BTM0-2BIY;
	Wed, 11 Jun 2025 22:25:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSCP-0000000BBJW-3Umd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 20:37:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2D442A51A44;
	Wed, 11 Jun 2025 20:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E01DC4CEE3;
	Wed, 11 Jun 2025 20:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749674248;
	bh=JicRijqsQSelYJCMdx9jWgmyxhDRO7yg+9UnsTRxx/I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZzGc2Kfn2GwpPs0lXdQ7CIhXCJulE25vCgtXbcSU7wuQddPgf+bDw+u1/cd599KBN
	 A1UJ0qm0SmEpXd7cU/lLK8tffOsEToPVFxVGH3cIUhmt3+qHeMJFp2jdWjs88BqehH
	 YfJXTgpV5tmowpLk3JxjDt9cIjWjvC039qRkX+veoBqwRJbVXBVmQ3ExwdF6HhreR3
	 TzuK77b8kiLb95FjfvY4wgS26ZCxgzz0XVziqqImGLjfIPA1maX/J1DpCm9+/Qe+oA
	 sfevfGh98aONsSJPnJsqtlw5lGy/vH8MQ39DnV6Fkfhu57gny0hWuMZQSbzMprFGbh
	 SJAupB2Ljcz7g==
Message-ID: <bf7cf6a5-e93b-4611-91a5-fa5a084a2c55@kernel.org>
Date: Wed, 11 Jun 2025 22:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
To: j@jannau.net
Cc: asahi@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>
References: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250611-arm64_dts_apple_wifi-v1-1-fb959d8e1eb4@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_133729_941890_073408BE 
X-CRM114-Status: UNSURE (   6.68  )
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

On 11.06.25 22:30, Janne Grunau via B4 Relay wrote:
> From: Janne Grunau <j@jannau.net>
> 
> Fix the following `make dtbs_check` warnings for all t8103 based devices:
> 
> arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: $nodename:0: 'network@0,0' does not match '^wifi(@.*)?$'
>          from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
> arch/arm64/boot/dts/apple/t8103-j274.dtb: network@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
>          from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
> 
> Fixes: bf2c05b619ff ("arm64: dts: apple: t8103: Expose PCI node for the WiFi MAC address")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>




