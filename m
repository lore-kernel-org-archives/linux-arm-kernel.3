Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 487F8C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grmNXnY9hKOlpmWrpWjJbFEvt+bZ9t1f84bLIAjJSrM=; b=18pYD8GNrzYNWLmdZytn114NeA
	dn5hN9CPPRbZPy6EnLsUPcecFSHLtzDk7w5vX3HJcxejQMwUwRJU0qr6Qs+ZgiJEqjPdCcmHc2+0U
	c6YvH8/Ig6/4qnMMbZBnU/wF0VQGz9TzeOyG1XWCx6QrSeuYVVtmLX8GxV/4Ae5Y4w+LilqtQxwr8
	AaYpFVgPIJF7UlAIoHWuJy8fM8mflo9MKIDBv1lAGJvZkic88D/9j+Pa3YDBTg6hOEGgTwEs32cBf
	jAi6JlfSm9FcP3PLauo+a8JHQrFbq/l6IM/NCa3XG2tweBSjcqjRz7MHXc2mCvvNlacURCCUEwLha
	ek610Exw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUxAE-0000000DE5S-127y;
	Fri, 27 Jun 2025 00:41:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwMk-0000000D6Pr-0uBq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 23:50:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 615096111F;
	Thu, 26 Jun 2025 23:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38CBC4CEEB;
	Thu, 26 Jun 2025 23:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750981849;
	bh=Cux7d7o6s1reAw2y55484JgLSPWg5ReReLlow0n8JmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pfm5cde7edrH+jAJkui0gcpO/BUhE39G7FXZlqDhra38fSk9u/n+eRJ3054+20CSY
	 JVTo0cSTz5UcBEl5HvAdST8Nh51rFlDOoGyaY89AWZK/5kYfA6YRnohPkAg8veWAWG
	 TJP6SXH8M9zp7sxvf5r6bzO3ZRgiDZt3KmemtmhBBkY3Cr28gUi3lkdcAuewTXxYNh
	 d3MYdd3/vrtpzNHkfK6dXqNIZ4B/eigYLcbvyD+Mg197vItlZHGKTvEHxL6nPexz6y
	 kr89EW1wA4SL6zLps7WCR/8igpgDBZgISLgXjx1Cz66maEpVAX7kG5AUgHE2w2LU4m
	 0JbeJyJWTPmeQ==
Date: Thu, 26 Jun 2025 18:50:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, Shawn Guo <shawnguo@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: Add bindings for SolidRun
 i.MX8MP SoM and boards
Message-ID: <175098184781.1426950.6408937893785063066.robh@kernel.org>
References: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
 <20250614-imx8mp-sr-som-v1-1-3ca3269883c4@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614-imx8mp-sr-som-v1-1-3ca3269883c4@solid-run.com>
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


On Sat, 14 Jun 2025 17:20:56 +0300, Josua Mayer wrote:
> Add bindings for SolidRun i.MX8M Plus System on Module based boards:
> 
> - CuBox-M is a complete produc with enclosure including the SoM
> - HummingBoard Mate/Pro/Pulse/Ripple are evaluation boards with common
>   design but different available interfaces.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


