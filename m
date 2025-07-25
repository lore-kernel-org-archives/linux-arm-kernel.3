Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1BBC87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IL4k9lr5ymW8k6HPReFxSXkSHaWWIeN0cVaRGWIrO5w=; b=sQGPkcjqEBaMmz7YeEyEO8uiq/
	TgOB2fakLie51N7fTF2omGUATvzzifCgi84N0S57d1EdDN7dqMrOFLKl2xaR/7dCj4RWbRoXBwPWi
	1ZB3JxBBbXrGqtDWrNOD3TaIZ0UIMh6Qo7pwwTeaVi0bl9mHVygez0lS0w8ID1g48oOPl/7CHoxRz
	zOIRe3+20MaVyD/HPWQjyu85UVuPYjJ14k3BhOQV/aK1H8hN0zs17fJHqFjlQ6Wia16TA04dKTpN9
	mk0kSnOSEZbl8JUGWUNWktz84Z8IdNtA+3deSGztp+fLQXCN5K/WYEbQr5f4OSXqAEBOza4cDw+Vf
	3QKoFffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufD2r-00000009HEw-3r0o;
	Fri, 25 Jul 2025 07:40:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCoA-00000009FrW-3ny8;
	Fri, 25 Jul 2025 07:25:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A5A6439AB;
	Fri, 25 Jul 2025 07:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31F6C4CEE7;
	Fri, 25 Jul 2025 07:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753428334;
	bh=IL4k9lr5ymW8k6HPReFxSXkSHaWWIeN0cVaRGWIrO5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2X567FRYew7yuyLM5tpJUYu6A/LkeoSQoMcXNE2a+TzV8HzG2ytg4bZ8GbeJX32t
	 JKsfYdfAHOEMGQj14P4sv0DePfT2w6QCo6Kh33Y8TGPhFmMZmVDl1aYpNqtG5P/iku
	 uIYDZ8m83y2d0MjNET5ySyjCSysQ1uEmYRzqRjfpYjJP8RX+2k3mLuwvBI2zswDIyL
	 wFJOowj+jBUIw8xtv1Yr6hwcKPpEL7zbKlWCafgADWfo77fIvGSQm4o5nc/WTABOGH
	 LtvnZUx+4j1kRpbmoR2+jGOPXKOwjGNiNN1eqozMKEe+BLm4FjGMtQWHD3hz2hcI6T
	 vLhcjEn+DCDBA==
Date: Fri, 25 Jul 2025 09:25:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erik Beck <xunil@tahomasoft.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: rockchip: add
 LinkStar-H68k-1432v1
Message-ID: <20250725-nocturnal-messy-cicada-dbcc10@kuoka>
References: <20250724-linkstar-h68k-patchv3-v3-0-b9f87b7306e5@tahomasoft.com>
 <20250724-linkstar-h68k-patchv3-v3-1-b9f87b7306e5@tahomasoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250724-linkstar-h68k-patchv3-v3-1-b9f87b7306e5@tahomasoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_002534_965559_1F37A2A2 
X-CRM114-Status: GOOD (  13.84  )
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

On Thu, Jul 24, 2025 at 05:37:58PM -0400, Erik Beck wrote:
> This patch adds a section for the LinkStar-H68K-1432v1 board to
> dt-bindings.

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Instead say for what hardware you are adding bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof


