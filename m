Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB02CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33a7FuM1XA/yleJJfc/HZhNZxuDla2AYpsl5P+iHXX4=; b=q/6Sar5zkUESMef8hTHLiGxC7l
	7htUYgryYDdfHX/7ujumGuDoEZ6pAT3cj7q9P3xD+42SFUpLqYKPMLb+HJy9g24a2DOmJIjZwkYNP
	KdH5yeiszr5LPAagozMTHz3D9De7Bjbi9NHzoicdxLPEjf1fJN2TwIuVbRIwLLsxdfs/gxt01Rfll
	QkNAh/LDsXzKZtIyw0KZsKBozwx+a3hwLNd0E17wJfp/gyHLTdLQtWmgpn1dhoImA34OOVd+WJY44
	zzMnuigRH9cgecvgfda1UYSegbWl+I1FIQJfblVDPsB0PK3ioDIeTdQl1dI3k7Pd8RiN8JmWvyQbI
	W7w8Z2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYJJ-000000038Os-2Uso;
	Wed, 07 Oct 2026 20:32:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYJH-000000038Of-1LxR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 20:32:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 813E460A81;
	Wed,  7 Oct 2026 20:32:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DF41F000FF;
	Wed,  7 Oct 2026 20:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405138;
	bh=33a7FuM1XA/yleJJfc/HZhNZxuDla2AYpsl5P+iHXX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JKNO7A2MR765pe+grZ2PwDrYvBxrTJNTe5/eXVMrPtt9NBTr1PswA3JFdtZsj2D9+
	 AcrQ0Mo4Rb+lTAyg5vIZWYa1j0spxHRdQn2DWKOWiBbduBrWCc5nEOOX7JIPB65oRZ
	 DzZXq4MJT6nce19y0xnahJMvuXmqxgMCK6rxTH1Uds53hwHTC3Qr4LrBXNDCc/qjM+
	 KBz1q03dLWGKSC2c1y+YiQ5vZWLCob48IFz+61808vcMjA5QcdZp1AmqaYqHHDBsWm
	 QLRhGcOsB9iSoH8TxRkod83e4Q0g8ZSnSqGyaykAlICm4MNk3UoKoRm03AR/C5Q22N
	 dnbolY3aXt9Tw==
Date: Wed, 7 Oct 2026 15:32:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@suse.de>,
	Joel Stanley <joel@jms.id.au>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stefan Schaeckeler <sschaeck@cisco.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-edac@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 9/9] MAINTAINERS: Step down as Aspeed AST2500 EDAC
 driver maintainer
Message-ID: <179140513668.197997.15808651432801165459.robh@kernel.org>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
 <20261007-edac-v5-9-5c31fc5df4cf@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-edac-v5-9-5c31fc5df4cf@aspeedtech.com>
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


On Wed, 07 Oct 2026 14:13:26 +0800, Ryan Chen wrote:
> From: Stefan M Schaeckeler <sschaeck@cisco.com>
> 
> I am stepping down as a maintainer for drivers/edac/aspeed_edac.c and
> Documentation/devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml
> 
> Move my entry from the MAINTAINERS file to CREDITS to reflect my past
> contributions.
> 
> [ ryan: keep the EDAC-AST2500 entry and list myself as its reviewer
>   rather than removing it, and take over the binding's maintainers
>   field ]
> 
> Signed-off-by: Stefan M Schaeckeler <sschaeck@cisco.com>
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> Link: https://lore.kernel.org/r/20260920225846.4039017-1-sschaeck@cisco.com
> 
> ---
> Changes in v5:
> - Also hand over the maintainers field inside the binding, which
>   get_maintainer.pl reads directly for .yaml files.
> 
> Changes in v4:
> - Merge Stefan's step-down patch into this one, keeping the MAINTAINERS
>   entry alive with a reviewer instead of removing it.
> 
> Changes in v3:
> - New patch.
> ---
>  CREDITS                                                           | 8 ++++++++
>  .../devicetree/bindings/edac/aspeed,ast2400-sdram-edac.yaml       | 2 +-
>  MAINTAINERS                                                       | 2 +-
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


