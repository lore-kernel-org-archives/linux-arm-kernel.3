Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41E2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 21:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bqq2D9oh24/cog0XboUDebD2vX3gpQHI09loE7OAAzo=; b=zTkTn3peDrcTysaXLJjjUbP6oK
	2mRyYFkvB6RDL8/ewPE2hcW5JnelYXsUI6rX88CTPfXpmCszzWmYOWiA+9G6Q8gPZW5zPNQ0zNNSV
	DF+WrBCHneSd6BR6TvQ/iOklDjF3ac8Vp/8oCgKEYI7J2AeHwdZqeDW/llxJtzzpc5u6BbNFwemtd
	uA91Qx5VM1i1bhUXOWLTrkFPju2+EkUglJscdM+911EpoHUsdDA0gwEAwVPhruSD/3RPDKmHg+XT+
	OhY6UxY5noqQv4eSd58McHP4rU97oOyHUCZ40OJjbhUrQGYP+4cx+yR66Hby/QyN9urI1oZT5X4SR
	N9ZtZ+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trkMF-00000003xxH-2wIo;
	Mon, 10 Mar 2025 21:08:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trkKc-00000003xct-0tAG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 21:06:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C0F595C6319;
	Mon, 10 Mar 2025 21:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B576AC4CEE5;
	Mon, 10 Mar 2025 21:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741640797;
	bh=bUcsyhE7tuvhIYvy3w+bcLNnK9zcOWwVrHqC/kyU+0I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=guBF3SdL5g8fUUUD+VdEGB5/Gu+QziZWmvqGJEMFZAFxWr+fvivvifywfRMx82JmI
	 uy6D9xivPLth0EvxXPF4RqtT1FYHsvUiYS2G4IfTGMZsY15ov4tX6KhpQofrrz/iQw
	 jCD9ya0uZOye9gTTP1iJrmn4mwGiZeeSj7k4CF7vfghNZ9mtO7jsY7xZKrD1kBL19f
	 myGrl4gcDIuGsi007C7Nxc7l9YjqAifQNUMU/31tWFnAQLIngSWwzKqx8bpwJgBwj8
	 s6xaTUhSmFim9iQrIe7WbBWLzIM7xcNnqlNjwCgLF61m/9WziZI+QLuH0SiOFT+ZsR
	 q4hu2e0wQXfYg==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20250307215100.3257649-1-Frank.Li@nxp.com>
References: <20250307215100.3257649-1-Frank.Li@nxp.com>
Subject: Re: [PATCH] dt-bindings: dma: fsl-mxs-dma: Add compatible string
 for i.MX8 chips
Message-Id: <174164079235.489187.5863262843040562459.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 02:36:32 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_140638_306908_3355CC6A 
X-CRM114-Status: UNSURE (   5.83  )
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


On Fri, 07 Mar 2025 16:50:59 -0500, Frank Li wrote:
> Add compatible string for all i.MX8 chips, which is backward compatible
> with i.MX28. Set it to fall back to "fsl,imx28-dma-apbh".
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: fsl-mxs-dma: Add compatible string for i.MX8 chips
      commit: 964c032d1d5d1d896746b361416b84cef078dba5

Best regards,
-- 
~Vinod



