Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1280F10F3DCE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYIfUrsQfPCCLqevbtlRKHIiJqFyJoQh3h+ZkLL5arI=; b=b4tCVJOQONqSP0vb4xQj1N0LjG
	LakpQnLtNZh6FfOkpv4bZxswmxahy/9Pdi+S1Rb7M8V0aguLrmejX7ZWDXWLWKfCubEILIwPxs+ox
	vJHTKISq3XLQXM7AQA0QHRRWQ9Z4UBnxN/S8dp2xRSn3ih84JKFwCOS7q7OM+79k1OGmD/fpR2zZ4
	TQCdLQ8QpZVE/X1sXwR0F7LGZe+lGyOfYxc4w5Vs4b59CZRRTg0IkzikDcvZWyqFwKfEp5IM1j73Q
	RSQ26WXG5B9B0e8GXKQMzKWUlq48Rpi0fawFY9kEcHQzGWuyhDF8eUH8X6cvoV2voUu85paXIAook
	RDxOQusw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6UDe-000000090Da-32g2;
	Sat, 28 Mar 2026 14:00:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6UDd-000000090DN-2zLm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 14:00:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C764260018;
	Sat, 28 Mar 2026 14:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B0C4CEF7;
	Sat, 28 Mar 2026 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774706452;
	bh=Zobnm8Gsre+7Kuc0iSNYsM0HgWB1z4kDfKWLknn5fLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HddS3TNe9Jas0l8WxwWwGbr47IPEkYAMtc9BAKgQVjfR4Gp1qjsJEcZNeLnixauzX
	 22gb8Zx49DDGpHAnVF5AW9MqzyrTuBuWgrA0dP9gNEdgmdFqnA++q/GdA6vWq3zdSG
	 B8eR9o6b1Tumk3ZB/hmeQeqA7lX2ny/cJ4copmQTOoc/64UyBBg0OUTwepnAcJIygF
	 j0BbdE8Ox2iMFJpeL8RCgrFS1KaDFv8z7gGG70SMrYqVyJCD2m1bTITLGNygNzRSFq
	 KZYxGHR7w4vPRYpinDDzoktkbsG4Vxd/Ik27CXBA6+4pfxUqnhKSsY66220iG1cKNK
	 sF/3unpoLkDvw==
Date: Sat, 28 Mar 2026 15:00:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Kconfig: Add ARCH_HPE platform
Message-ID: <20260328-resolute-tan-waxbill-3e10c4@quoll>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
 <20260327174445.3275835-3-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327174445.3275835-3-nick.hawkins@hpe.com>
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

On Fri, Mar 27, 2026 at 12:44:44PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add the ARCH_HPE config for HPE ARM64 BMC SoCs to Kconfig.platforms.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm64/Kconfig.platforms | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


