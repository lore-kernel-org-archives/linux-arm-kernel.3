Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A6CC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjXIOQIGKfgN7Cq0+qSXLSaC1VAj/643E3fuc4Nuwtw=; b=m9RbntR4SP6R2ZNUhI2sc+QHIn
	7K5rbMurOUT5vJzMmzfd9AlvrJT/iaPzdyT/vDSOegZaFv6HkyqmHal9a3mGsaghzJfvUF3pCZPKp
	eDuxasegwd42AHhMpTc03BavWXpjp1Z2s3Ovc5Ad0/2mB7RitYEHLVOMMmQGtFI4FIZG/f5M16/yb
	P7zVscUvBYUFbnuIUpIFvVlCQDq2vExh6IzlRYK3icFW/CX+AdqFGPxxgAHAsDzsFKTvr2HMT1fN+
	5qynbSxcDYW7pqKeGX5zrskowQA9/VbGcQnT/v5sL0GTcP7+4bbZ6PBmWBebFbe2di/YPuFNq+xQh
	uEw1jHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7pr-0000000CjN2-3xHG;
	Fri, 28 Feb 2025 21:23:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to7oK-0000000Cj5n-04Nk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 21:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EB6E5C6A20;
	Fri, 28 Feb 2025 21:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DC8C4CED6;
	Fri, 28 Feb 2025 21:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740777739;
	bh=70t/oj00452ALapCWhpb/eHsdBwPEI85u4GX6Y1AcQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mjrkcmpqky945mPdhuTZQytsXu8HJGALBLiuuU7MUlu/MV8L16JHuxcsFmT6hMGA7
	 2ESYG77gQzgGSypqcLdanLuDRxpHiQiIwGLeeLejkG+Huq+okjhoSpMB4i0RQouiFY
	 8tbyNN7TT90m+bFJDBU7tW3knESkd9jNWche33i8CGebdATFq+JF4bgi/QFT2AKEsH
	 Ry7WGYYLKsmbYVfyNyBE1A5WX4eVRk3ySeJlBK88kPS42GgQommsI5p/jDnknjyzI8
	 h73V6NDwB3BrHRmjVhpDoe0Sggj4kxD9++Mtd3Nr/oZKJtzHZT7pDr0xnXY32kSVtj
	 OEWJLEHzhlx4A==
Date: Fri, 28 Feb 2025 15:22:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v3 02/21] dt-bindings: mfd: syscon: add
 microchip,sama7d65-sfrbu
Message-ID: <174077773610.3738820.3700947387806799800.robh@kernel.org>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <92543fcff4ab35e770b01d4c15d45cc5d55833f4.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92543fcff4ab35e770b01d4c15d45cc5d55833f4.1740671156.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_132220_107823_0DFC38D9 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux@armlinux.org.uk, sre@kernel.org, p.zabel@pengutronix.de, claudiu.beznea@tuxon.dev, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Thu, 27 Feb 2025 08:51:49 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 SFRBU compatible string to DT bindings documentation
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


