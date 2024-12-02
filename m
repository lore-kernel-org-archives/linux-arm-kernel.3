Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AF4D10DB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 07:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGoKjG4VIzUStQldxyOLMtM/spCbr1e+Uwqx9vunOuw=; b=ZWhqHtpGx/ukyE/k2KMdkTSw5d
	wrPhdtpmTDpsyehPtPrlG8ueaaKKZH277zaEgb+aFz8SrzwwKrTLfKEU69KJg517o+ExN3OsUv6Rr
	JSQVnkJo65uF7Ipvs1824RyhhL0Xxuh2muOARnKeDKEp7M0hx53KMIpSdPY1WNQ84O004wC6iDxFy
	gpblAtgpuK/p0QMqcUMtD5QcCOHeE+NNjPCn87QDQCDpMbG8ZAVwT1YWfaWZKJx/7VByEDRqLxOYN
	vhxbk7ht4vcEcATj4cz7i1uHAdzWGkE/C3IZUdyxIF2K66lF0KXpdUATsSiCFM+MQAAWwtNbTWkec
	OIxk5uFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI15H-00000005KIP-3rgt;
	Mon, 02 Dec 2024 07:43:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0wD-00000005IsU-2xQK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 07:33:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C93B5C65FF;
	Mon,  2 Dec 2024 07:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714B3C4CED2;
	Mon,  2 Dec 2024 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733124824;
	bh=XOBsyR5DiRbgmlAcXrezcofMfsl0yDzLXPs9uCednS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H18LKsD9QsEdL61655SufKEXHNOnhYGkHw+Zz/lTG1RcTEWROKUAQjH8YBOj1+sbV
	 PEB0L3AHmV/gvZ1ymar+Snmxud1Kl3ZPh3csSEWgt61V5m2MrFLLXhTkDpbRudooZx
	 w7cLUE9k5EXcjeMT5gNjyKPSYQASvMRHdduFFQsI68kl7VKOMgobO33G0QDa2GtMC5
	 O6Tgu/tMDshqYGXQdCXECxzHQpxoA/nbeM2sKDMzr/gI7Rgxtri03b5ElcxJk6nUYB
	 lsDuf/xFiPMMAh+2SCsM8krN8EXlGGGN0vJe6uJOrZhrb9rSGvNkgLzTYvntPOTtnr
	 LTOwzorOjdnlQ==
Date: Mon, 2 Dec 2024 08:33:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 08/18] dt-bindings: clock: imx8mm: add binding
 definitions for anatop
Message-ID: <2t7eok4xmjxywt4dzjviz4brvohk2y7gceu2srioocgpekpu23@grgdf24djo4o>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
 <20241201174639.742000-9-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241201174639.742000-9-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_233345_786441_1F505C79 
X-CRM114-Status: GOOD (  10.06  )
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

On Sun, Dec 01, 2024 at 06:46:08PM +0100, Dario Binacchi wrote:
> Add the bindings definitions for the anatop node. The patch is
> preparatory for future developments.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
>  - Added in v4
> 
> ---
> 
> (no changes since v1)

My comments apply everywhere, I'll mark everything as changes requested.

Best regards,
Krzysztof


