Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nvTdNkgZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LyeBP+gC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZqpZuSTieI35n54JABBHGpmhrcnhM+09HvPoDw0y7t8=; b=nvTdNkgZX+G90qTVCGuhyP1Vi+
	3xBmS63F4dYWcagkZ2zaPmPRmhRXqP0LU+K/Q1b/KJ5WJmBj2i6qw3ptYR1cblDc3pR6r1+gKno4k
	/ydjoe5He23kyopb6qcc3Lb975MeocK9W6MjmnTzfIn0vRxaMugrhAxbrQvamECV6DC2iN6AeV8hY
	7mvvcAk1LxM6n1T+uArpFk99+r+zur81SfdwWbUu/U3vD6ciUd7qoXNfzYFCvROhe+nVlzVqRd85G
	jTXd7dMPBlsMX5IYX0HBoTSP4RVJPUH0VO9u55Z1qDJSM2zwvNSg4uX56Mdz6rYnQQ+RpIZ/Vzn7v
	3cclrOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKv7-0000000CeuY-23t4;
	Fri, 06 Nov 2026 14:27:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKv5-0000000Cety-3zLP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:27:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B2BFD42E78;
	Fri,  6 Nov 2026 14:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDFE1F0089F;
	Fri,  6 Nov 2026 14:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793975275;
	bh=ZqpZuSTieI35n54JABBHGpmhrcnhM+09HvPoDw0y7t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LyeBP+gC9i8mU+0eXC4H9Rt439e63hUaNqg0tEAnqsPicgyROanmOXLMZrwDKavOq
	 c7TFg3tZXalZSMbkDDsc9HWYn40Eok0aWhsJCCFEJe5f9l3N8QtrfUp6/YiaDR3k+p
	 Cwl2+pAi4AhxWqg6pH9EYie4OIW2beNFFIhpim8ssKbQFxEo5U1tJ1kz8aAXNIFVYs
	 s3ANGPtCJMQL3byYiqAQQkSRHkrBX9EGpRRxlE7e9Ma1kq5ntiY4LYv+rnACV3kiCV
	 C6SqZqi3gZ7nGjhF5v8w5lYTypIw5nKAwizr7Leyhnshc0f501BKeVqFEtkxcD2bag
	 4fc4dYB+m71OQ==
Date: Fri, 6 Nov 2026 08:27:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Harini Katakam <harini.katakam@amd.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org, git@amd.com,
	Abin Joseph <abin.joseph@amd.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net
 compatible
Message-ID: <179397527077.3110134.7259234155472672168.robh@kernel.org>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-2-f9990669362f@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-2-f9990669362f@amd.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 06 Nov 2026 15:40:24 +0530, Golla Nagendra wrote:
> Add support for the amd,versal-net-dma-1.0 compatible with
> xlnx,zynqmp-dma-1.0 as its fallback compatible.
> 
> Include the Versal Net compatible in the reset requirements,
> making the per-channel resets property mandatory for Versal Net
> devices.
> 
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
>  .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml           | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


