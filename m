Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37998E9DE5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWhZiT6ZVrKSGBgIdxievknKh0u0rumlgFTvUrEEKek=; b=EuWLD74XpFpmQ+OIsc+ZVzjRAw
	WSGZEdJ48WPoJ3gsL0DyzkYJEWtS6Wku37gG7w0DO3Z8eRWaj4I4mODXGTAfkL0Rl/k3VQ6Dz36xC
	I43s2r5Y3UrEiqnmjhS1jfDfyAYzyA1QVmFfm94GL+hHY2LSWficENX4RHQrtDKpcfRrWFV2p0zJY
	TmMOU2kxYc/Dc2RyGkYQdmukImoFXXYYTG7rGbS+PuVIb6Ek6iIB1DtZ1b9+KILMymbsoTqYct04k
	ZSy7UAOi3DpQcmA9zigaWr+s2HvdjeiHtkUmcZwFEfHVQxJG4mmUE3cUaetgaCKQpCsHJdTNftnG7
	mUbRipyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAk3T-00000009s28-0tY8;
	Thu, 09 Apr 2026 07:43:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAk3R-00000009s1a-0quf;
	Thu, 09 Apr 2026 07:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9F114049D;
	Thu,  9 Apr 2026 07:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C1EC4CEF7;
	Thu,  9 Apr 2026 07:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775720636;
	bh=uq/R6PmosWxaig3fB+at0I2ppDM6xQzhVCUmWXfCLIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVllBZVKxqZDb6GWFRf6NCvRGFukJ+3EsnP2wGG9WlFBKXTj1m8EIxNieXFokKcNC
	 DY8z5BewLaM0clOfV8z+g1lmeigkmas2Ef6llkBYUOLKsmHrhs6frICytJD1gAsrKP
	 ILgqkdcyErgC7vKK10MJFyN83omrsJUU66Wg5JXSURzCIb3ir1Ij3WrhC0G+47k5+2
	 fOyhhnUVmELllc1kcdTZyR18jQlxhVRpMa5u74L1GuCocHwkhIB/mey17qCMktLJqH
	 ipAjY8yoPibjVwitnUb53lOicQ19oNEt78twPkuxZBkzykgu0tVCNo/b3LtrTDEbtB
	 v2GJLeLdgZMLA==
Date: Thu, 9 Apr 2026 09:43:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, brgl@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, afaerber@suse.com, tychang@realtek.com, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, cy.huang@realtek.com, 
	stanley_chang@realtek.com, james.tai@realtek.com
Subject: Re: [PATCH v2 2/4] dt-bindings: gpio: realtek: Add
 realtek,rtd1625-gpio
Message-ID: <20260409-heavy-colorful-monkey-e09d42@quoll>
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-3-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408025243.1155482-3-eleanor.lin@realtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_004357_258797_8282194E 
X-CRM114-Status: UNSURE (   9.08  )
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

On Wed, Apr 08, 2026 at 10:52:41AM +0800, Yu-Chun Lin wrote:
> +maintainers:
> +  - Tzuyi Chang <tychang@realtek.com>
> +
> +description: |
> +  GPIO controller for the Realtek RTD1625 SoC, featuring a per-pin register
> +  architecture that differs significantly from earlier RTD series controllers.
> +  Each GPIO has dedicated registers for configuration (direction, input/output
> +  values, debounce), and interrupt control supporting edge and level detection
> +  modes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtd1625-iso-gpio
> +      - realtek,rtd1625-isom-gpio
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      Memory region containing both interrupt control and GPIO
> +      configuration registers in a contiguous address space.
> +
> +      For realtek,rtd1625-iso-gpio:
> +        - Base + 0x0 ~ 0xff: Interrupt control registers
> +        - Base + 0x100 ~ 0x397: GPIO configuration registers
> +
> +      For realtek,rtd1625-isom-gpio:
> +        - Base + 0x0 ~ 0x1f: Interrupt control registers
> +        - Base + 0x20 ~ 0x2f: GPIO configuration registers

Drop description, you are duplicating here DTS. Bindings do not need to
serve as reference manual for the device.

However when you state them like this and give them names, I have the
same concerns as last time - please consult your datasheet whether this
is really one address space.

With description dropped:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


