Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5597510A62C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07w09B9lldogJJeipd5e3UdUeW8r1JXecyxsagizMUI=; b=3bfTHJ/kGu0kk38w8VXtKWeVUc
	10dtJd1zFxmv1o6rMF4ewvf4hVEsj5Pe59renwwMrA8IYdlyuL8A4mYdvJRzjOgynGsrIEpg3mYWQ
	sLj6TDwPDwpdBCyVZlYxuzuK4j11g/257tev0JRImpDba3BxoHjL3VAGQFdb7+JSnBpjBh4jvrxp3
	JIZhO4f74naDhTRN5RvAvlLS/U3vODh2GVW0Ri1v6C0Aej5mznt2+efj9N3Lz5ii4mMuXIhAPWZHZ
	uVq+gAwZPP5J7yPGE0N+Luw9k3uBczWnnPYi6of54iQSn0RFL+9gclRn7bo39tyGKVCGY05o5E3K4
	cHS64p+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kf3-00000005Xn8-2osC;
	Thu, 26 Mar 2026 13:22:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5kf3-00000005Xmz-097s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 13:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29AA8600C4;
	Thu, 26 Mar 2026 13:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2527C116C6;
	Thu, 26 Mar 2026 13:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774531327;
	bh=FqviOofHcupaR0PJdYP1xhrpYp3IqlmmCCw7Mja4j6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTJWV+BH76Iv2CnFB2JvggheKH4Xz8DIDxtX+r1t+NaDmOQEp8pdCWVyzjrkjQgDz
	 gqmWL962pMBGyzd9aOon6+zH9Qu/wGfg006ldueWdYhJdQvm2LgTci2ErkRfqIiwOD
	 nCCvXQLOCVskFFFE7LveT3cq1VZeKStCFYemyyh3GC6qVyEN3PREYKVQCCcRTvwrk8
	 hhr5xu+IBKo9SIuAGvjGogR4wlQX9eoPbthxENq8K1DTVS+sC0lyE8KWBkxHqYdaLX
	 LvvMNvi/4fG012KPdbgkMgzJw5vH8OmYFCR0ADtF/G+3sNTV+57hArlB+Yb/hTEFVA
	 pLBXjWyQ100lA==
Date: Thu, 26 Mar 2026 08:22:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	devicetree@vger.kernel.org, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH V2 4/5] dt-bindings: dma: xlnx,axi-dma: Add
 "xlnx,include-stscntrl-strm" property
Message-ID: <177453132469.2249522.18301971752512802709.robh@kernel.org>
References: <20260313062533.421249-1-srinivas.neeli@amd.com>
 <20260313062533.421249-5-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313062533.421249-5-srinivas.neeli@amd.com>
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


On Fri, 13 Mar 2026 11:55:32 +0530, Srinivas Neeli wrote:
> Add an optional boolean DT property "xlnx,include-stscntrl-strm" to
> indicate that the AXI DMA IP is configured with the AXI4-Stream status
> and control interface. This enables the use of APP fields in DMA
> descriptors for metadata reporting.
> 
> This property is distinct from "xlnx,axistream-connected" and serves a
> different purpose:
> 
> - "xlnx,include-stscntrl-strm": Indicates whether APP fields are present
>   in DMA descriptors. When enabled, the driver can access status/control
>   metadata through these descriptor fields.
> 
> - "xlnx,axistream-connected": Indicates whether a streaming IP (client)
>   is connected to the DMA IP.
> 
> These two configurations are independent of each other. For example, in
> TSN (Time-Sensitive Networking) designs, a streaming client may be
> connected to the DMA IP, but the status/control stream interface is not
> enabled. In such cases, "xlnx,axistream-connected" would be present while
> "xlnx,include-stscntrl-strm" would be absent.
> 
> Adding this property allows the driver to correctly determine descriptor
> layout and access APP fields only when the hardware supports them.
> 
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
> ---
>  .../devicetree/bindings/dma/xilinx/xlnx,axi-dma.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


