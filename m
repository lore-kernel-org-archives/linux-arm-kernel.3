Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C480C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVpRsmWEm6VHRcvKSyjFF3aB5sQLjqRBeWRP7or5xJs=; b=muXwOZc/DnGFbLD1hFaN2SIT3f
	uZmM4nHCCjJlk0SQAtC6dA6f1F3TKbbayp5foMQ3JXFVo6+05Ow4ti2il9cURPAz7O79L4Kx5PFHz
	pK2c2i8RiuMHoI4d60s3Uu/4bF5m5o9/WN+y6oMSdx9ULbAjDSRI+Am2p5WBgMzPxm18jY1SfgDC5
	pQcPsX0j6LmTA1OyUd5v+Uf4KtDJ6d+q3eruEwY6s8IQ4s8ylbA7xYvk0mZ9DEfQyHIqjaG2w+gFX
	C/hpskR6MuJGkRnv02/xBtdE46S1d7wAoTF5SUSrK0UZLurrxWXGigWpcgrnEfsKt+g7TuTn/rLUz
	/scHujAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty52A-0000000Cuez-0xXn;
	Fri, 28 Mar 2025 08:25:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty50Q-0000000CuN6-3xjw;
	Fri, 28 Mar 2025 08:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E288DA41318;
	Fri, 28 Mar 2025 08:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA09DC4CEE4;
	Fri, 28 Mar 2025 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743150237;
	bh=EChM5lZ02vQW3NFPu4SvlJhSoekdEWsTAF8Ta+yEhxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfdEU50tAlrImVBnCDiKUb91BGet1mqQjVmlmN0LJxzj3fb6Zx+gnBwOkbROkkaAy
	 VkPuX5MSz7e8ApRUdk12TUrQp1q/IEPIEKPQ+Mq6/J8H75jsOr79xrFQOzv8VT8bRn
	 GnAiYg3pgDS/lt6qLw/HsNRhTcVnlk/9VKDUywnGyqQBsT5B2AG/jX8IkAdKPfiOQC
	 VYGVP89JlLmIG78fyih0GYUoqKKz2xf1T99Bw0FT+pHDQR0bSXWlF8at/5KhtiZHkS
	 O0nh+26hROskyWX6ySHBkfPokPVHjPhT/aemHaTCLeaGA1o1yZIVgd5o2gCWVTLqCw
	 DWoOV+bRBxhjg==
Date: Fri, 28 Mar 2025 09:23:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: justin.chen@broadcom.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, rafal@milecki.pl, alcooperx@gmail.com, 
	bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, kishon@kernel.org, vkoul@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: phy: brcmstb-usb-phy: Add support for
 bcm74110
Message-ID: <20250328-acrid-pygmy-dogfish-babce2@krzk-bin>
References: <20250327185623.3047893-1-justin.chen@broadcom.com>
 <20250327185623.3047893-3-justin.chen@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327185623.3047893-3-justin.chen@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_012359_047381_206B6FE2 
X-CRM114-Status: GOOD (  11.62  )
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

On Thu, Mar 27, 2025 at 11:56:23AM -0700, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> bcm74110 brcmstb usb phy adds further power savings during suspend
> states.
> 
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Please order the patches as stated in DT submitting patches.

> ---
>  Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
> index 580fbe37b37f..2e668935b454 100644
> --- a/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/brcm,brcmstb-usb-phy.yaml
> @@ -15,6 +15,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - brcm,bcm74110-usb-phy
>        - brcm,bcm4908-usb-phy
>        - brcm,bcm7211-usb-phy
>        - brcm,bcm7216-usb-phy

That's incomplete. Where are the updates for constraints? Look at entire
file, not just top 10 lines.

Best regards,
Krzysztof


