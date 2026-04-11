Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F67F3ED51
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrlItr88lDvVlKtHl/heaqwCU32lbmWey7lFNsY1wwY=; b=xaaKXGIVHbcULWvBI58HsnL6s8
	uww84Ow9iVShUuOFB58RnGzOi7Dk6bKrYfLO4jhGg5JoBTDge2RlLAvHnADepVRvla96vRC1tVZRs
	y2gk5F/wQWob9OwYVQbgzPtL/5uPJ7tysIF2dvBW+UovOeKBNtWWr9dz24ZugYSIVFGP0q8F4VMaB
	pp2DWIuHigI6i3nlaPGMZFtiV1yaWcVko5Qthy7H9S1RhqHFPeql5tsdtOFRnlsCmQp6c127+ZcRO
	i9fSKK/Wj7lfwvnsxRR41NiQVTZaykjV/OZ/FTfINGBXRp70iemFbQgPt0ERqcZIb7XrgsipexRsU
	WNpddD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYso-0000000DUEN-45YF;
	Sat, 11 Apr 2026 14:00:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBYsm-0000000DUEA-3v4a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:00:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A92360145;
	Sat, 11 Apr 2026 14:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4003EC4CEF7;
	Sat, 11 Apr 2026 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775916019;
	bh=eqFeAHxrEYN3OzWoPOqqSDvpIsKjCesHynxNPsz0T1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHbCmAR0mSzuOuplVT3pe0uLj4gp/ucoiZJBSWBkwRvajoSeRS7ASF6z8QKhid820
	 oRGZ/K+j+PNibwdt9eNpO820S8PxNPLqPhXrzWE8BL08Op2VK8q524hHyBUUuAEd4i
	 puvjdvvVkdDuGVMDaOp3bDc8K6sR0NnjfPVPO9/2v1RAY+zNRhSQduQA0TWRabdBDj
	 zsMFF+MovczVfM5GkwfzJniipZ3hZg6p834Dy0hAqMFd8j9hmX2fx+hHzu9oF/C2rr
	 oCcVnSoViSbszisjWykFxRnBP49TPIDkeWuffznAoFFcDiQE2bqvDJPADxDxtovTtE
	 uH8FhIuk6wSLQ==
Date: Sat, 11 Apr 2026 16:00:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski@oss.qualcomm.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12
 board DTS
Message-ID: <20260411-condor-of-algebraic-realization-b2e0be@quoll>
References: <20260410171611.2547255-1-nick.hawkins@hpe.com>
 <20260410171611.2547255-4-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410171611.2547255-4-nick.hawkins@hpe.com>
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

On Fri, Apr 10, 2026 at 05:16:10PM +0000, nick.hawkins@hpe.com wrote:
> +		uarte: serial@c00003e0 {
> +			compatible = "ns16550a";
> +			reg = <0xc00003e0 0x8>;
> +			clock-frequency = <1846153>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <0>;
> +		};
> +
> +		gic: gic@ce000000 {

Nodename should be interrupt-controller@

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


