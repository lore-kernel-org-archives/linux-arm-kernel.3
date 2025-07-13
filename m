Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5116BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 09:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGPNcbP+DL4HQgeuDbpB+HXk17fr3suuqqFj9iC4WDU=; b=IVu9h/ObccixuH3KltpTtm4TBU
	Q19CESIMuvtQqtEj2dAO5i4uqZiiP3539VSvrj/wS+ekgFVbUmWY1lAT5wDHHq9ibE1Jl+lYpVI2a
	g6BIuuAeSxkCt8P5YSBv82yheslfvmQ8bqqMDg8jyajec89N4dkZPOIdwTnz8UVVUTTt7a+LQj1Ws
	VwwTX/6bHDEaBQ5+37m/Ds3Xlf+TPgvGIy7sBhADyTjcR+8HIjBTXrg7OaiJ57BFRxyQvJ4IV01aj
	pmraYFCIKCKYcyBsJ+n1YinUvbgZjonP7zobeHE2eosccmW7eC8eC35TMlY7Z1RM4jdp23Hz1FNqV
	s3VXIMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaspd-000000000Aj-3V0v;
	Sun, 13 Jul 2025 09:17:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasFk-0000000HXUy-1dVG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:40:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 263C84613E;
	Sun, 13 Jul 2025 08:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 665EFC4CEF5;
	Sun, 13 Jul 2025 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752396008;
	bh=csqe1O+tkd6nKMHUq6yiCp8apa3jwJYHrPEnFz22I4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ko5CdZTXIbv+CsbnsoUh31B8n8F/q2qNT+hJpHAaFfITYqM2ahTchoIhU2/xYtZB6
	 xz/okQpWWId41TYHyNe+ubd/9iRBMjZEj7a3tIW+MVTSpD//a8dMlVsotvVG4BsEPT
	 5B4JbwSP/8N+BNyZpL26fhWnDw+pSTRtP4npDkhuFQWvbC4sKS5Ogdo47epQC6jp1z
	 cJLxQMqAAgTeqCXn1sgPsvkS7mwpA9gVlckajOkmaL590GKd2fJIp2F0jzwvlrUcfE
	 h9anCEThsNqRcVcgi7JrSFmWYrUQf9lpZJHK9OLpZq6B5/55zYP0e/iwL45TUuXD7d
	 Vb9rK+6YaVdXQ==
Message-ID: <3bec28b9-5ac6-4d93-887d-481495d6cf95@kernel.org>
Date: Sun, 13 Jul 2025 10:40:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: mmc: add brcmstb share register and
 hwlocks reference
To: Kamal Dasu <kamal.dasu@broadcom.com>, andersson@kernel.org,
 baolin.wang@linux.alibaba.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, florian.fainelli@broadcom.com, ulf.hansson@linaro.org,
 adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Kamal Dasu <kdasu@broadcom.com>
References: <20250711154221.928164-1-kamal.dasu@broadcom.com>
 <20250711154221.928164-5-kamal.dasu@broadcom.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250711154221.928164-5-kamal.dasu@broadcom.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_014008_489417_B1ADA10D 
X-CRM114-Status: GOOD (  16.12  )
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

On 11/07/2025 17:42, Kamal Dasu wrote:
> From: Kamal Dasu <kdasu@broadcom.com>
> 
> Adding optional controller share registers and hwspinlock reference fields
> to be used by sdhci-brcmstb driver.
> 
> Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> ---
>  .../bindings/mmc/brcm,sdhci-brcmstb.yaml      | 29 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
> index eee6be7a7867..fe9be7a7eca5 100644
> --- a/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
> +++ b/Documentation/devicetree/bindings/mmc/brcm,sdhci-brcmstb.yaml
> @@ -27,15 +27,20 @@ properties:
>            - const: brcm,sdhci-brcmstb
>  
>    reg:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 4
>  
>    reg-names:
> +    minItems: 2
>      items:
>        - const: host
>        - const: cfg
> +      - const: share       # Optional reg
> +      - const: flshr_ipis0 # Optional reg

Drop comments. Schema says these are optional, so no need to point obvious.

>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

You need to list items with minItem: 1.

Why all devices now got new reg and interrupts? What changed in EXISTING
hardware? All this has to be explained in the commit msg. If not all
devices got it, then you miss constraints.

>  
>    clocks:
>      minItems: 1
> @@ -60,6 +65,9 @@ properties:
>      type: boolean
>      description: Specifies that controller should use auto CMD12
>  
> +  hwlocks:
> +    maxItems: 1
> +
>  allOf:
>    - $ref: mmc-controller.yaml#
>    - if:
> @@ -115,3 +123,20 @@ examples:
>        clocks = <&scmi_clk 245>;
>        clock-names = "sw_sdio";
>      };
> +  - |
> +    mmc@84b1000 {
> +      mmc-ddr-1_8v;
> +      mmc-hs200-1_8v;
> +      mmc-hs400-1_8v;
> +      no-sd;
> +      no-sdio;
> +      non-removable;
> +      bus-width = <0x8>;
> +      compatible = "brcm,bcm74165b0-sdhci", "brcm,sdhci-brcmstb";
> +      reg = <0x84b1000 0x260>, <0x84b1300 0x200>,  <0x84b1600 0x10>, <0x84a5404 0x4>;
> +      reg-names = "host", "cfg", "share", "flshr_ipis0";
> +      hwlocks = <&hw_lock 0x0>;
> +      interrupts = <0x1 0x0 0x1f 0x4 0x1b 0x11>;

Undecipherable.

> +      clocks = <&scmi_clk 245>;
> +      clock-names = "sw_sdio";

Totally random order of properties. Please align it closely with DTS
coding style.

> +    };


Best regards,
Krzysztof

