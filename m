Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD00E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMo4QHXTmF084YSpKMHuK1qN2y+BCnatc571C54cRIg=; b=kEi0GgZcP9QC/f6sHK5rOeFXPd
	FUF3UkAlrjWdVUIdvLynpH+9xupREp5eiqMYrNIMX64PyIXYG8IpcMIsveM+D/T1YLi+l3waa0sB5
	a0U/c6EyoI36TXbNigotxYKcTwuyoykwFUqvxMwk30T9jMPGf7IIA7ukl9gFvRrRx+aRvyxupY9Y3
	pVJ3Cpw662tbUgET1Nxcsi+90tlsqiSfMz6fifPu91u4LZnH9DWCWgjp+u3W8xKxxOEH1vYylNXcH
	2P9fHDR+FTqQjRFp56L44gLPpjGieWmo5hCD6ppCnM3yBI2AgiyjHWV/4uFBWcHqbpUrqWC6K4E/p
	i8Hh0yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcws-0000000CSNJ-0DBd;
	Fri, 03 Jan 2025 08:22:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTcvh-0000000CSBy-0Rje
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 08:21:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26D5E5C62B7;
	Fri,  3 Jan 2025 08:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30395C4CECE;
	Fri,  3 Jan 2025 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735892472;
	bh=S7tZ1yGNv5kuSQb7DcMrraBBMRu336qd5hi85TYcCRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FCqEPRYTjGjxkEp+VA4ku2kHTehaUYdEGQ7FaPelR1MqyRyteuN/K3nvMPOhiAiGC
	 hDn/8Ie4xacKUiVhoz3y2th242Pnl2m0wPfj4i3yrTXwD7Fh1h/aQC0kffNqsxJkpr
	 WbITtBWG/KnTwYpW9P+O+yItMO6OayjCTZz9nwCVICP4f7sflhkUQ2c2av2Q/+SyBi
	 S4OJJL6MZNXN9P8TVle5LsSEkUUYPjrBuKbLz1uPjNQVmuhlo1NCoRzXo9DBzcDqgh
	 LoWIopSf5PODYQ3pKEtmVChb8/abyGh0qlnid5oNEwSVj01W7KoBByplbFXeuLy9C+
	 GSJDGrpGg3eKw==
Date: Fri, 3 Jan 2025 09:21:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sam Protsenko <semen.protsenko@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: soc: samsung: usi: add USIv1 and
 samsung,exynos8895-usi
Message-ID: <bzjuy4idp2o2cgms3zaftrxxz2rg2adhv6gneedrxjpxswgznn@wycin7xdlddz>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
 <20250102204015.222653-3-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250102204015.222653-3-ivo.ivanov.ivanov1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_002113_237332_2496C63E 
X-CRM114-Status: GOOD (  23.27  )
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

On Thu, Jan 02, 2025 at 10:40:14PM +0200, Ivaylo Ivanov wrote:
> Add constants for choosing USIv1 configuration mode in device tree.
> Those are further used in the USI driver to figure out which value to
> write into SW_CONF register. Modify the current USI IP-core
> bindings to include information about USIv1 and a compatible for
> exynos8895.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/soc/samsung/exynos-usi.yaml      | 22 ++++++++++++++-----
>  include/dt-bindings/soc/samsung,exynos-usi.h  |  8 +++++++
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> index f80fcbc31..50db63a8a 100644
> --- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> @@ -11,11 +11,21 @@ maintainers:
>    - Krzysztof Kozlowski <krzk@kernel.org>
>  
>  description: |
> -  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
> -  USI shares almost all internal circuits within each protocol, so only one
> -  protocol can be chosen at a time. USI is modeled as a node with zero or more
> -  child nodes, each representing a serial sub-node device. The mode setting
> -  selects which particular function will be used.
> +  The USI IP-core provides configurable support for serial protocols, enabling
> +  different serial communication modes depending on the version.
> +
> +  In USIv1, configurations are available to enable either one or two protocols
> +  simultaneously in select combinations - High-Speed I2C0, High-Speed
> +  I2C1, SPI, UART, High-Speed I2C0 and I2C1 or both High-Speed
> +  I2C1 and UART.
> +
> +  In USIv2, only one protocol can be active at a time, either UART, SPI, or
> +  High-Speed I2C.
> +
> +  The USI core shares internal circuits across protocols, meaning only the
> +  selected configuration is active at any given time. USI is modeled as a node
> +  with zero or more child nodes, each representing a serial sub-node device. The
> +  mode setting selects which particular function will be used.
>  
>  properties:
>    $nodename:
> @@ -31,6 +41,7 @@ properties:
>            - const: samsung,exynos850-usi
>        - enum:
>            - samsung,exynos850-usi
> +          - samsung,exynos8895-usi
>  
>    reg:
>      maxItems: 1
> @@ -106,6 +117,7 @@ if:
>        contains:
>          enum:
>            - samsung,exynos850-usi
> +          - samsung,exynos8895-usi
>  
>  then:
>    properties:
> diff --git a/include/dt-bindings/soc/samsung,exynos-usi.h b/include/dt-bindings/soc/samsung,exynos-usi.h
> index a01af169d..5fbeb426b 100644
> --- a/include/dt-bindings/soc/samsung,exynos-usi.h
> +++ b/include/dt-bindings/soc/samsung,exynos-usi.h
> @@ -9,6 +9,14 @@
>  #ifndef __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>  #define __DT_BINDINGS_SAMSUNG_EXYNOS_USI_H
>  
> +#define USI_V1_NONE		0
> +#define USI_V1_I2C0		1
> +#define USI_V1_I2C1		2
> +#define USI_V1_I2C0_1		3
> +#define USI_V1_SPI		4
> +#define USI_V1_UART		5
> +#define USI_V1_UART_I2C1	6

Conflicting values with USI_v2. This is the same property and the same
driver, so I expect the values to be unified.

Rename (copy) USI_V2_ to USI_ and then just add yours at the end.
Binding then in allOf:if:then should restrict with enum which values
make sense for which model.

Best regards,
Krzysztof


