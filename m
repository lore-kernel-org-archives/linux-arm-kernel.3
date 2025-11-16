Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F84CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=03eKKn8Z6d+buJQ5PNiCzHmTpIadEDWV3E1AziXTX/o=; b=GltrPNDGLV6LX5Er8Ae4UKDm1H
	c9dmG2VkBYwxvEl2aOyiunv+sX3FQvLEta3bJnnm3FP9lDffhCAT5sWsaEPFCpzp6QFTM/dtTT3YK
	sHFM3dgN2uUaZk8t4Ol5uvtgvZWmaPST0Z6BCVBjmoksAc617rQePD3/K1EAuVpSQxJMgnk2Gf9m7
	Tr72Be8vJ+uHlSt+fzD0moXmy8J5+TblK/XN4p/DBj7RPvnfWx09JhpuRVeAUJtYj/hhf4TrkZ665
	lT+AHFC47tc4Ptv4+nLwKz8Diau1TDF2kQAyzeGzZayk+wZmEajn8RUoBDLWalk7VqVv8gP0OUar5
	sFAJ3pFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKb0X-0000000EZza-1wqm;
	Sun, 16 Nov 2025 11:33:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKb0V-0000000EZyp-08NM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 11:33:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EFD844158;
	Sun, 16 Nov 2025 11:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80B7C4CEF1;
	Sun, 16 Nov 2025 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763292802;
	bh=aTVKcWg8+7e+j27IM4wyG63oyRGSBSps9hXBl5rry+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9lwb9MtrAwaMgWxarcIBMhbs88fyByN1BXLpUCIMMB9VGpbHAI70G8h6pfD8VPMh
	 elnjiiZFkkuJlAohkMpH3CJr9VOmJ3ZtZfrB+HAy0/p+kXeaQcXjHpa5JC0bqeyFJA
	 2YGALecHiW3KJV4NejWLA4Oq6BSoTDsOp69+AuqEb3a+DASnPHhQH5vbFCoJsIcFSA
	 mIY66abzLRKzkOeIs36AzO9AvLG9h1xpzpJcCGWkcK3xYlfgaiWpLfYksTYv9zOsOx
	 JT+pdLB0NdaAwU+awik54ZLMs2lh3XHJi6wH/k/4bZGlQPOzmEs0e1jGY6QzfT6Fr0
	 PwW+fxwZuD+HA==
Date: Sun, 16 Nov 2025 12:33:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33
 binding
Message-ID: <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-7-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251115141347.13087-7-jernej.skrabec@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_033323_111379_DAE7E7B0 
X-CRM114-Status: GOOD (  13.26  )
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

On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> As it turns out, current H616 DE33 binding was written based on
> incomplete understanding of DE33 design. Namely, planes are shared
> resource and not tied to specific mixer, which was the case for previous
> generations of Display Engine (DE3 and earlier).
> 
> This means that current DE33 binding doesn't properly reflect HW and
> using it would mean that second mixer (used for second display output)
> can't be supported.
> 
> Update DE33 mixer binding so instead of referencing planes register
> space, it contains phandle to newly introduced DE33 planes node.
> 
> There is no user of this binding yet, so changes can be made safely,
> without breaking any backward compatibility.

And why would you configure statically - per soc - always the same plane
as per mixer? If you do that, it means it is really fixed and internal
to display engine thus should not be exposed in DT.

Describing each IP block resource in DT is way too granular.

Best regards,
Krzysztof


