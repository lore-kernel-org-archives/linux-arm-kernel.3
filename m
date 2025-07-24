Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEC2C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 08:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcK8EQ5jSkSiQo7JEF4TFVnhp8XGL+W/Tmlg+cdUQs4=; b=AgPQzNkfMEWndxkBj6wm6uodV0
	KZA8j2uzXhR7iQZ9D0dIX+Q8F6qfwMlDmp8g7GXm2GJ8fbQZpFpQ4fu9beMvaVNEYESONU/4VmGis
	RzQ9sAr762nwCl/5XKHlC9IDZVF8wNXdCE2V8BFU6HaI7rr4sFLW7OTtSC2lJBYKzzx2ADafyLGNh
	wI/JgHdNF02SmXQNF8t+sPKSGpE00zHQ+2yzQOE5+jrbZl0PFfwGvF+/lyz0aITGUqR59XA+FN8tu
	5im4iKrAtGHIvXm/3iWrcFda1FvPtxf1qZZoTUR3dONBUj33GwGYAiaMSJIOmv4/2TZodGtj+eFpV
	bX8jRLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uer0z-00000006o6w-1wub;
	Thu, 24 Jul 2025 08:09:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqmM-00000006lAE-0EaX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38D916111F;
	Thu, 24 Jul 2025 07:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59CD5C4CEED;
	Thu, 24 Jul 2025 07:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753343652;
	bh=fedaKSVKoXWJCia4hWOYvIVKJSIrOlYT8OjCgkSiOmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVQbuariQMeGlvpf5+/GWEx713YyM9MPKM5KQ601HdQVS5vhpB7/mKfwKY9waABvc
	 lzeAJ1a0wBQp4pTGKr8KwYrOnQTeuhl9ljDXfw0lR2Pxlh95HcFNqp5xw1T+85fonQ
	 Ws6dM8jr82IALG7HD+9jqaZDVQGpiFvDdI3tCrzQsudEpLWWFL76MBQDKdoKh3oN4m
	 wIIm8GY6DEcPdii55F3mTnj5Gl2cNmMB5Y9hUK3fAqUdOiFhYp0tnkFxI5uonCfEQP
	 CEXOpMkaUb1kKbyE/V1g/dppXzYaws8KcRDiSDciHZzGefQkMYs46ntPJF2rQ2g5k4
	 sF/nDAWvXTKeQ==
Date: Thu, 24 Jul 2025 09:54:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v7 0/2] Adding device tree and binding for NVIDIA
 GB200-UT3.0b
Message-ID: <20250724-affable-gorgeous-dragon-130ac6@kuoka>
References: <20250723222350.200094-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723222350.200094-1-donalds@nvidia.com>
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

On Wed, Jul 23, 2025 at 03:23:48PM -0700, Donald Shannon wrote:
> Patch 1 adds the binding for the NVIDIA GB200-UT3.0b platform.
> Patch 2 adds the device tree for the NVIDIA GB200-UT3.0b platform.
> 
> This is an Aspeed AST2600 based unit testing platform for GB200.
> UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
> differences, additional gpio expanders, and voltage regulator gating
> some devices.
> 
> Reference to Ast2600 SOC [1].
> Reference to Blackwell GB200NVL Platform [2].
> 
> Link: https://www.aspeedtech.com/server_ast2600/ [1]
> Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
> Signed-off-by: Donald Shannon <donalds@nvidia.com>
> ---
> Changes v1 -> v2:
>   - Changed phy-mode to rgmii-id [Lunn]
>   - Removed redundant max-speed for mac0 [Lunn]
>   - Fixed typo from gb200nvl to gb200 in Makefile
> Changes v2 -> v3:
>  - Fixed whitespace issues [Krzysztof]
>  - Fixed schema validation issues from my end ( there are still issues
>  with the aspeed dtsi file that are not related to this new dts)
>  [Herring]
>  - Reordered to follow style guide [Krzysztof]
>  - Removed redundant status okays
>  - Changed vcc to vdd for the power gating on the gpio expanders
> Changes v3 -> v4:
>   - Added changelog [Krzysztof]
>   - Added nvidia,gb200-ut30b board binding [Krzysztof]
>   - Removed unused imports
>   - Reordered a couple other style guide violations
>   - Added back in a couple needed "status okay"s
> Changes v4 -> v5:
>  - Resumed my patch after a pause
>  - Don't plan to make this include of nvidia-gb200nvl-bmc due to some
>  platform differences
>  - Fixed io expanders that weren't gated by the 3.3V standby regulator
>  - Fixed incorrect interrupt pin for one IO expander
>  - Removed some IO expanders and I2C busses
> Changes v5 -> v6:
>  - Fixed subject line
>  - Added missing gpio-key compatible type to buttons
> Changes v6 -> v7:
>   - Removed Acked-by Krzysztof

Why? You did not even give me chance to respond to your reply.

Best regards,
Krzysztof


