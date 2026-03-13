Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0421D106FD9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To0Aa/Q9Mri1earvz+KnhWMs71p1rLM1a4RhOLf2RBw=; b=YQcegeKlZbR4eyuiCqUwQOQHSn
	nnk6o6dr6QSA2/KzI+LSXAXNsgq63+Oq9dsA3TyTEIje2VOpE0Bvt0d63vFhqADbFcOlhoNvFzfKw
	/LlDhZ+z7e7LdaJhVnD95EHPnY7W9qXCXVhMR8vOA3HlmLinI3qOY6qr0X9S5WJGMoalrJPqeuQ/9
	taQB8Yye43KB3Amtg8RC464XebI5Zd6cXvlNSJufZeRA7ym6vvZ/G1Fq9QcJKjkZZMpsqOURSuhlS
	r2hSHuZK1c9H8QgxqEEAgdtBt7zxsJzOg42FKbv1AzUvujWNvBZTFh65rrmwwJf1ak2TCKAFp0Lkp
	q6jFphqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0x8G-0000000H59M-21Y9;
	Fri, 13 Mar 2026 07:40:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0x8D-0000000H58h-2C5l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DD7143AD5;
	Fri, 13 Mar 2026 07:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7E5C19421;
	Fri, 13 Mar 2026 07:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773387624;
	bh=To0Aa/Q9Mri1earvz+KnhWMs71p1rLM1a4RhOLf2RBw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0eql0lwQAKeD/tBsH/SGOpmf09FF63JARMNesREgpfx6NQU6r8Yxd3i/EiG7Iw6X
	 JoaqYi3tY2oRzEegOdG31lTvSf9djWI2fAdz0SNZA0Ke8eeh3mFSQjl1J53seSkJyZ
	 +zqdSqVT/BWWWp0h6SlbUPfabPc47Kr5UrkY8vv33qxvZQgzsTJB6mnUTQkhZNDt8/
	 QzUaEYhAXWsI63rt7iVaIokDCTZTrWhy4A6h0lNF43YKcGN9Ida+gF0vqrsE9zjVPG
	 m+pQPtB+KvOQc8EUQPWrD0DEu5AS0gKSw87EVt7DNmg/O3Y6ygD6DjqMnW0vPL6QpG
	 KY71ae5RDjvfQ==
Date: Fri, 13 Mar 2026 08:40:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: PCI: imx6q-pcie: Change maxItems of
 clocks and clock-names to 6
Message-ID: <20260313-tough-graceful-muskrat-f7e3a1@quoll>
References: <20260313051718.1931375-1-hongxing.zhu@nxp.com>
 <20260313051718.1931375-2-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260313051718.1931375-2-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_004025_577636_90383877 
X-CRM114-Status: UNSURE (   5.65  )
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

On Fri, Mar 13, 2026 at 01:17:14PM +0800, Richard Zhu wrote:
> Previous commit 1352f58d7c8d ("dt-bindings: PCI: pci-imx6: Add external reference clock input")
> was incomplete.

Nothing improved.

NAK, read previous comments from v4.

Best regards,
Krzysztof


