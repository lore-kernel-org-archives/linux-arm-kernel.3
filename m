Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C599CCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 06:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IQsMXVKdHFLQzLX2hMHB6QNRMK9W7yPN3A6edT5RAM=; b=vrRQvHMecX32pOt7JTh7LD0qSE
	U3Ap9Kq6R8oRDyr6eO0twtESbWX5jHpARqH59cu2wN/o9iY9yu8DELAYknt5N/uHsKo5CeUU+7UhG
	FGA5cas6KK2YmFKlch5Jh/9hmzEOLUel2oWy5uFiFtquXDNvCuTVMC5XpbcONRatBv4xtqLDHcQvR
	04r8IO/64EWvtlOiSzY9x47VvLgVIGUPjFLRL269kL/nZGRm6XLN24ijQupKXs/h1M64v5YJgsIZQ
	nojuyFfKxU+OHB+4X6WVfYP/WUciPrNXuDNoc+qebZ95MB7PU0mwLx/srof28S2s0u4a8u/DbLcu8
	fZjIHeRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYJa-00000004UQg-0ndB;
	Mon, 22 Jun 2026 06:39:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYJY-00000004UQa-0EDI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 06:39:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7796B441CF;
	Mon, 22 Jun 2026 06:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39181F000E9;
	Mon, 22 Jun 2026 06:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782110362;
	bh=0IQsMXVKdHFLQzLX2hMHB6QNRMK9W7yPN3A6edT5RAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QllCbuzrtjkiZ+xKVC91g1eC6iGVKJOjyS23Pix9iVDg238l2oOVsSvoGVlHDah8e
	 LvQ6J3wK0dI8J/jWqZGG5tU4ZlvpzZQPMTeKFErkBA9vJl0j86di9/uZ4Z093Vt6CA
	 QS5QZlz4uscAB/pA2AnddkvQVF5wr2ndlXv+8yBJR2AYbaBLyZ+Pe9ySAA1nrtcxC4
	 pIR0rSJjFoJtEPh8rmwfB2zDXOC9VMoGpBoG7ONCJ9Ubui5twu0TIG3P2XwPIQxXDY
	 sHzTcrIgf6IlX8Wcdk1rupvE//Fi9Bb1o2SyhZvf5XAwYWTF/cMFn+fOjSrBvxQzRp
	 YX6SVc1VirDRg==
Date: Mon, 22 Jun 2026 08:39:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v10 1/4] dt-bindings: clock: imx95-blk-ctl: Use single
 quotes consistently
Message-ID: <20260622-naughty-uncovered-parrot-fe6e04@quoll>
References: <20260618-csi_formatter-v10-0-f23830312ba5@oss.nxp.com>
 <20260618-csi_formatter-v10-1-f23830312ba5@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-csi_formatter-v10-1-f23830312ba5@oss.nxp.com>
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

On Thu, Jun 18, 2026 at 05:41:35PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Change "clocks" to 'clocks' in the description to match the quote style
> used for property names like '#clock-cells' throughout the file.
> 
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v10:
> - New patch to fix inconsistent quote usage (Krzysztof Kozlowski)

I think this is not necessary. I comment to have consistent style for a
new code, but changing this in existing one is just too much of work for
no real benefits.

Best regards,
Krzysztof


