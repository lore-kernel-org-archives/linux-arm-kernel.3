Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0796CA5FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 02:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZA10SLKG1bxLcqqknXHfPrOAkGw9dRwvCvAY2fh5Kg=; b=XEPKSd94wFaKPQr/sWijN3QTKr
	pebqK9AC7SvutUjzR6O2bPZQ9amvob8M8o7gaZcQ+EVkn88jBgXhRJDgF3gq9Pe0TwynsCmjSWP3K
	pbYVaUasR/v4DtOyrT7xPfB+sLyCfXSZUcMje6BW8bIz55Z2D6qkq7Bm/abtOKPvqIxHyI/cz5cFg
	LsUQnYf0fnMF2TVv206Pcn54qNWTRyvuyTEZHYo2tK6OnF838dEitJcQKdFUopnDLUux7hzRlwIuN
	ni8j0zD40lOZfcun0fF/6u4Yk8ngXC5xpEliXEse0xS6UhFSY3JADxnCCLYZBMWEZxkgstt/OgHzA
	HPpXlFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhIGw-0000000GTCB-0Swc;
	Sun, 18 Jan 2026 02:12:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhIGu-0000000GTBx-2FKX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 02:12:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B57686000A;
	Sun, 18 Jan 2026 02:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B0ABC4CEF7;
	Sun, 18 Jan 2026 02:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768702325;
	bh=M0zEiZONb5Cqp7BvBz5QafxzPpNTVAMF+5FojoxCvUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wn/9aonW34wkqORoUULndtMn1sU65BOVXkG+yXpMdGOLcnkaqlGG3rxCjZJ8ElJ4U
	 i9f7n2hjLeiHG7F12FuGaKh9sCZ7wgN75zQ9mlEhTi+fz723w/fFiQ3acrt5Uq3k8/
	 N7/4EHqAjXdoeuoUQnTzG1l8RHXyjZbulpnslZvHwwZEVjNisT5eMolYwxCgchbtx7
	 0a/PMwls2U+DSCuFGxkytvMgoxVCEYavU44SIS3JN2t//O1O+7oEZgz62n7906xbEG
	 QHOOU1iSlJGEaiHwbVxPsN8f8f/144FQKGOUsXcPymgwdJrhshPbCchXiYTvJ19uRi
	 45giCk1t7v+IA==
Date: Sun, 18 Jan 2026 10:11:58 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Josua Mayer <josua.mayer@jm0.eu>
Subject: Re: [PATCH 0/3] ARM: dts: imx: wire up the TPS65185 for various
 ereaders
Message-ID: <aWxBbnO028gYWvlm@dragon>
References: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-tps65185-dt-v1-0-66d376ba5f65@kemnade.info>
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

On Tue, Jan 13, 2026 at 04:31:33PM +0100, Andreas Kemnade wrote:
> As the driver is now upstream, wire it up for various ebook readers
> containing imx6sl/6sll/50 SoCs.
> 
> The driver for the EPD itself (not included) still needs polishing
> which would be the consumer for these regulators.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Andreas Kemnade (2):
>       ARM: dts: imx: tolino-shine2: add tps65185
>       ARM: dts: imx: e60k02: add tps65185
> 
> Josua Mayer (1):
>       ARM: dts: imx50-kobo-aura: add epd pmic description

Applied all, thanks!

