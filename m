Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FC7C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 09:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meUwEYrMdweubvTIm5FwW/U0eowupvfI3Lql8NwUJtM=; b=1elNrKOPK06rgj8b54QX2OftpN
	bpOVQULg7mEF+mqBR05FhZPeGR/KhzS+JWzGCwJB3DpCyvUwJnsLpHclgeE8yHLZASM9Dkk2FP9y/
	XNbIDdBOLqK73AZPlKKD6hWUY/+gKabiTQew2AnVkZ3rgAKiO361NO6Ohn8va2gT3RHh0wj+KA4kn
	LZlKimHwkqutAtC+Kk/il+KcwSZ4E+tOwf/5OW8Z8r4jgqzaORfZjwhdYBQroxrkBKjrZoLDmynqg
	3+NeWvAVyitkoShWLxgI+ROWA2pF9fawXke9ulKbctxoHfSSFB7PZ6R5I5g8S/uBvjkf7gZl3oKpQ
	UFV0Kgqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPHU-0000000HEiM-08u5;
	Sun, 18 Jan 2026 09:41:12 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhPHQ-0000000HEhR-2tfj;
	Sun, 18 Jan 2026 09:41:10 +0000
Received: from 8bytes.org (p200300f6af1d960047d77347aeef488f.dip0.t-ipconnect.de [IPv6:2003:f6:af1d:9600:47d7:7347:aeef:488f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 3781A5FABE;
	Sun, 18 Jan 2026 10:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1768729263;
	bh=meUwEYrMdweubvTIm5FwW/U0eowupvfI3Lql8NwUJtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1oHg8FZw2wv7vH7qbbyBuDnThAsavGNrks5gc3Jq2wMNdke5i1Q5X8PMji2guRWGE
	 tISEaDxmMcUZo0WZMg8LHkcxlA9ZTht/1K+ceKUNl3/sSMC6EHZtv7YBtB+RqDjpA4
	 Szz4quSLI8HQ18qzVX6o6IpZb1AS5OWjc7ahvV2RpkSYoK/wdI9T/EpxfA4QMngOoj
	 k7luaysT03vqWQIqtBWe8Xh0ZdCw6GyGgV2NQu8+BD1Qr2xxfxqhVz/a60NaIag9ZI
	 Tq2fFY7KNW/hXIYXvo5W+0hnDbTA7rhJpwyu9TlRVdmPBxZNLwm6XHCXJzG5hhEmDn
	 emj3VYKPzjczw==
Date: Sun, 18 Jan 2026 10:41:02 +0100
From: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
To: Will Deacon <will@kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	heiko@sntech.de, nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, 
	mchehab@kernel.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v11 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <eqv7yfdagt2axkj5xbtmrtkaakhq63ywf2q5tjo33exumhfrc5@7ghelrz6yt2d>
References: <20260107101005.84039-1-benjamin.gaignard@collabora.com>
 <20260107101005.84039-4-benjamin.gaignard@collabora.com>
 <aWZui-rn5RDPwpEO@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWZui-rn5RDPwpEO@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_014108_951141_8EFC0DB3 
X-CRM114-Status: GOOD (  12.55  )
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

Benjamin,

On Tue, Jan 13, 2026 at 04:10:51PM +0000, Will Deacon wrote:
> I took another look at this to see whether it had changed significantly
> from v6 when compared to the rockchip driver. Sadly, they still look
> very similar to me and I continue to suspect that the hardware is a
> derivative. I really don't understand why having a shared implementation
> of the default domain ops is difficult or controversial. Have you tried
> to write it?

When updating for v12, can you please put an explanatory comment at the top of
the file explaining the relationship of the IP this driver is for to the
RockChip IOMMU and the rationale for having it as a separate driver? I want
this part of the discussion documented in the code in case it comes up again.


-Joerg

