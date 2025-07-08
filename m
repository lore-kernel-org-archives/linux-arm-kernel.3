Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9BBC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkY3t8giFU1e1/x1YmttPq1d6FozC9lKfOF4nvZN1mg=; b=YwQyZvQenbHtXJ/4PODtccoj2O
	8m9R2fvxGd1HM77BtZyUvbjy8UhmWvMbexV9/f7mNGF8J79qsXZI2qxj20L5O6EwmhU+sowQr6Gab
	8GEaLivmtFtWKnp5acY80WdPI5/5Pj6B097+kT6EOeg/ApNchfaPeDz1AzgNvJvX6iNozGjr+5kZ/
	ybTOyFVlWtWUvQGHEnACb1wl8xML9zS/Pra6lNOcLo1K9GIPSjO8091SxFUdRJKFp0PeySaht4qL5
	TuPvM6XEFj5Q7d37mecFX0ZS5PpRDKmsp330lKwr5wmeQoRMyxaK4HU6fN8vC0Ltcp5oNnM66I2xB
	ysL291SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFOt-00000006aMz-40xc;
	Tue, 08 Jul 2025 20:58:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEoL-00000006Uo3-2XZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 20:21:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 07B415C642C;
	Tue,  8 Jul 2025 20:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68255C4CEF1;
	Tue,  8 Jul 2025 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752006064;
	bh=zqx/74K4jJO3iS9rVGq5D5oA2ZIFzpVGZMwbjqdUJ7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhDrxV/r0/d4Qt/l6j2cg6nVvYTW6x4u7+WFjvoVRbsnKdk8pTk89x2OxovWcD7Pr
	 VsLTLprp9+kXpOAlSvcFFy+CkcKSBYu/N9TFEBwG+Zj4ULvhLA6HqM4pvRR/ne2dSC
	 Hz00yz+oSX2tFJNq6pQ9CP9vezQ2bUUfTeUQqrlRZjdeDrQiqnI0GkA9mk4ywXZ51P
	 1cBQiGDGxlIyqqNGZZIsDwqIiuWFbuM8FOrAXwbvEFq1Pnp2thEBb1cnNNd62DVVXc
	 7F/cgE83diZNvyoY9CVTNhPqF1XzoPBq4V+mfnA2P6GvxuskPJs1MsahbdcUC8T6FH
	 6eKhGEGJETL2A==
Date: Tue, 8 Jul 2025 15:21:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: Add Tegra264 clock and reset
 definitions
Message-ID: <175200606285.904555.15042694527619353999.robh@kernel.org>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
 <20250708082814.1491230-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708082814.1491230-3-thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_132105_681867_D64C5277 
X-CRM114-Status: GOOD (  12.73  )
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


On Tue, 08 Jul 2025 10:28:11 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The BPMP firmware on Tegra264 defines a set of IDs for clock and reset
> resources. These are not enumerations but provided by hardware, and 0 is
> a reserved value, hence the numbering starts at 1.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - drop -reset and -clock suffixes since they are redundant
> - include all known clock and reset definitions
> - drop U suffix for integer literals
> - add vendor prefix to filename
> 
>  include/dt-bindings/clock/nvidia,tegra264.h | 466 ++++++++++++++++++++
>  include/dt-bindings/reset/nvidia,tegra264.h |  92 ++++
>  2 files changed, 558 insertions(+)
>  create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
>  create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


