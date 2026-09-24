Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7E5C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFANcOsUXnOwOKerI0IWQ7eNygTiSWZuhv94iFHKoGQ=; b=LbL5RhxgJAKy9pVdKgPr6+u7UX
	tWaRbscUZ9EAUc5qiAE8X3n10mvKgrI8SVBv3QqHvJzcoFX/+6zuEabiHYKJ48kHxIfAfTPM0iHjX
	twfx5D12/MkMCwOoatriV1Hjm8ylfzIP5oL3lvcQo1xng5mpAflc1/BFJ7w7tDR+Z63ZYSg963UkQ
	z2sv95XAxywjvg+4EMbfc7qFVLv4S9x+Fz6VUlRfCmONZ/V//rDixnoOo9eNLMxN/gAJvYpviY1h7
	QbQXVhz6boGtV3+XyRPsJkN099mzptTwz3ZC2DneJMhErQKa4EmlXUj89axaxfQz2nJMu9MLUaMgG
	VtRxGcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hlh-0000000AtFZ-01xy;
	Thu, 24 Sep 2026 11:37:37 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hle-0000000AtEx-1e4p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:37:35 +0000
Received: from 8bytes.org (p200300f6af404a00e4ccc4fdbbd66590.dip0.t-ipconnect.de [IPv6:2003:f6:af40:4a00:e4cc:c4fd:bbd6:6590])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D53671C7465;
	Thu, 24 Sep 2026 13:37:32 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:37:31 +0200
From: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v3 0/2] iommu: apple-dart: device specific DMA aperture
 support
Message-ID: <arULHr3O14OerdLR@8bytes.org>
References: <20260902-iommu-apple-dart-aperture-v3-0-252ce55b7001@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902-iommu-apple-dart-aperture-v3-0-252ce55b7001@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_043734_576104_55F5B856 
X-CRM114-Status: UNSURE (   7.88  )
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

On Wed, Sep 02, 2026 at 09:18:53PM +0200, Janne Grunau wrote:
> Janne Grunau (2):
>       dt-bindings: iommu: dart: Support specifying the DMA aperture
>       iommu: apple-dart: Support specifying the DMA aperture in the DT

Missed that there is a v3, applied this instead.

