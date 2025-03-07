Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3494DC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 22:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5YH1gMXjYvHWKof3eUCQYsGSuXQkfMfI4FEeXllrZs=; b=u4mYNOPPEoUSq4/TE8FuCISkpy
	OIDPVakTQe1UkZmoVCO8/H3oblbto87I9xD5yK4fQZca35JsuK5tVFAst4GvEO8aPENQdlcFVBNC7
	V0bGYkkfHbaZ62KZMm4AZJCAhTx4nEcPfKAehHhXdHPm9tuldR5H1vk1GX+pWyU4PYFPmoI3UtuVg
	z5vlrlhyLyNiPSPVgWxHIcNv8XUrrKGZzZ0cJDOb7t1W8cfkpFSiM8t0tEp/Hl+c2P7qc577RJDsk
	K3ImB6fJOy/MmbGs+dJmOvY52neQB40EWQrp+Pvt2QOe2XRrtW8ULbE53bVKeK1Zj/1mBnkenZgph
	YAh25WCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfkl-0000000Fdmq-3P71;
	Fri, 07 Mar 2025 22:01:11 +0000
Received: from out-170.mta0.migadu.com ([91.218.175.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfj8-0000000Fdbk-0n61
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 21:59:32 +0000
Date: Fri, 7 Mar 2025 16:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741384765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I5YH1gMXjYvHWKof3eUCQYsGSuXQkfMfI4FEeXllrZs=;
	b=KPih+DMa0rkvqdL/53iYFfAXRlPP3ItVPk238X6R113xcXTBtFvuhJeXL0caJYp6j3y722
	EV6aorD+Zdis5a3Xg+2Pco6SBX/ZP4j7PGLeuxdvBQWyUZpOon5yJlP4wZfQ9vx1JlbMGD
	Rey469cEKsDoPQ/KdeicoSDMkA/RvI/TqL9X9D1B1v1sW24l+hXsSszK/JoZRMnV1CMkD2
	mOXsUA4DEeG/CLBUAuEnB317THdXtQGEsgXiYZo7pYXeNM2kO10+3nnD45PuhzOCJZDVV7
	s3h0HQHBpYpsKM2z6fnoj6lAW+aqiNwWWWzRy7YxJnDM3/UzmRE6CLtTlgTeFQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Jean-Francois Bortolotti <jeff@borto.fr>
Subject: Re: [PATCH v2 2/3] spmi: add a spmi driver for Apple SoC
Message-ID: <Z8tsOKbxVOXmOicF@blossom>
References: <20250307-spmi-v2-0-eccdb06afb99@gmail.com>
 <20250307-spmi-v2-2-eccdb06afb99@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307-spmi-v2-2-eccdb06afb99@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_135930_843136_490F07E3 
X-CRM114-Status: UNSURE (   8.11  )
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

> +static inline u32 read_reg(struct apple_spmi *spmi, int offset)
> +{
> +	return readl(spmi->regs + offset);
> +}
> +
> +static inline void write_reg(u32 value, struct apple_spmi *spmi, int offset)
> +{
> +	writel(value, spmi->regs + offset);
> +}

At this point I don't think these are gaining us anything. Can we inline
them?

