Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FD3C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRuTicQnfgFZNJjYhMjtqfMhCoDpvGgDyeuyPwNTp40=; b=IWv9vGRRzCbm881byhBqa90m7D
	hASB16hBrsIcJvVIBfB6uso/tCbHW1i5du4koBsVghBA1jB4kIqua+nkVgRknrJf5Cad7Tu73iJtB
	GtclMd0tzoTIoaeweXws46zDm8zZ1wUvks6Qk/1CIozia7nbLwIn0hr25xuMJN04Vq05DCCve3BX+
	8LmYGrSeqKtGS/0SJ+Vape3VAVs+dh50hzntk2a/dfOc5tMvr+PrcWLmn1x99Oogw4CwALWqZk/UX
	M69Ox0v9WRmeBOmRzdCEmkTgL79B/WKaSCVLLtXPZs2sZg8acTyzn41XrLp405fnmfqmPTNFabbHa
	Bi/kpBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to7rN-0000000CjXe-2Tnd;
	Fri, 28 Feb 2025 21:25:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to7oh-0000000CjAC-1isb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 21:22:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF01E5C69B1;
	Fri, 28 Feb 2025 21:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FFAC4CED6;
	Fri, 28 Feb 2025 21:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740777762;
	bh=19svqh1siOCkpzBHLc+Dj5fHj6/weZnlblQyDcyz5qI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mRb0gCr+Eznf0X3ZXRJ5QbKwz7m0tRL6HRxtTf3Dicqf3cikxki3ayi7ca9rTDMAE
	 MnIe0JdjYHOizADibd7yMSDwXjMKdqvKRSxL/1J4+EzEn8hLKXaVXxd5udN/Az4kwP
	 H2X28qW5i+tCHEFWqFmaps7acTnNVlfa2RICUpee1Scp7WEZVaunX4zO5E5zmmEhsX
	 C+kMoSgGvgbhppJ+RNpnUETnFb7mazSlk0Rk1kbTXu7lnWb/9d0nM+0diR7smO96D+
	 r+SzGZVH6DaNMQBSXR1aj4IsDrDDswSZQdkojhDg7QTk3vYGPam7knXVUge6iIfIhx
	 3+4ZVSNbsQHhQ==
Date: Fri, 28 Feb 2025 15:22:35 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH v3 06/21] dt-bindings: rtc: at91rm9200: add
 microchip,sama7d65-rtc
Message-ID: <174077775442.3739270.14568148277019446646.robh@kernel.org>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
 <27c5b177a41b89c5c983e7e292eb4b321a258991.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27c5b177a41b89c5c983e7e292eb4b321a258991.1740671156.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_132243_511375_8A552861 
X-CRM114-Status: UNSURE (   8.72  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, lee@kernel.org, sre@kernel.org, claudiu.beznea@tuxon.dev, p.zabel@pengutronix.de, linux@armlinux.org.uk, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Thu, 27 Feb 2025 08:51:53 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add SAMA7D65 RTC compatible to DT bindings documentation.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


