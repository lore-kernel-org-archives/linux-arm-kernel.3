Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93445C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VvOExVl3Tr69tRAOSxprX7BpVmHj1+4kDLUSoIYNAM=; b=Kw4LkpkDc2mL4x5GLDveTfbSnw
	iH4aXwDIyEb0bTj3WBmVcjg9xnmiO4PnYydp/twzXlUlqa68lNZo7/6qjAiGoyJy5/WkIQw+MAnSv
	fbHToVKFYJdUgV2gHMZPTrxF2Sp/UeFDTRCs4ONRjXCgf3e94U6FPSlCAW9zaRaEXpr1HhWd/8Fwe
	JERS7fQUwpySlhH4Bme3K+VOlETSPqAqacnsXMUPOgIjnj6Ts7Ae3m1VFTnEv8rg/HqR0t8wO/Nlx
	61/QAK2mvHzTVR7/liKqUQ4QRHEKmj27HQ3h7Yi7t2IYQ10rDwV97LY0VSXRBs/vuSLCAuyHA392c
	KGxtYS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRqR-0000000Aruz-3xCC;
	Fri, 25 Jul 2025 23:28:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRmx-0000000ArMi-2ZXR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 23:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ECDEA442D1;
	Fri, 25 Jul 2025 23:25:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A37C4CEE7;
	Fri, 25 Jul 2025 23:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485918;
	bh=30Lu0lu5cTdskwZvddFTxEhvmB6dDSde5G6CiimxE18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhH2V1yHUI/4eJQ6O6SG1WTvCOkt3dRljpQMyc6AJJvfc9Ge6R4yFP34FihWPc4AU
	 sCHjWECuBb9JWB5DHvvXko61NyKC4mpUdZUBDorYydB9bN4zn+wWJXl9dRjjTi5oNm
	 69IZ10ziTsotIvFjLvZ5zVRy0Aw8VaWi36Zm01diusnQXnPMP/Er4YWcGxQ/lIZD03
	 JQewW2m6ut/0cqUi+V2EZFgFNUuRVVyZlHJl/PRCu3xi28NZFElIJzIx9EKtLDIFJ7
	 E4curYdmx/NhdLREspoJMKHpBsLMP0OxYHetdO3gTNCl53Mvd6oA2GnJE7/UAegz/B
	 yCq9g/Ji9+iCQ==
Date: Fri, 25 Jul 2025 18:25:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>
Cc: alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
	davem@davemloft.net, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, edumazet@google.com, pabeni@redhat.com,
	linux-kernel@vger.kernel.org, dinguyen@kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org, andrew+netdev@lunn.ch, kuba@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: altr,socfpga-stmmac: Add
 compatible string for Agilex5
Message-ID: <175348591737.2024488.4815901624908424031.robh@kernel.org>
References: <20250724154052.205706-1-matthew.gerlach@altera.com>
 <20250724154052.205706-2-matthew.gerlach@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724154052.205706-2-matthew.gerlach@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_162519_669229_22B330D2 
X-CRM114-Status: GOOD (  10.22  )
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


On Thu, 24 Jul 2025 08:40:48 -0700, Matthew Gerlach wrote:
> Add compatible string for the Altera Agilex5 variant of the Synopsys DWC
> XGMAC IP version 2.10.
> 
> Signed-off-by: Matthew Gerlach <matthew.gerlach@altera.com>
> ---
> v2:
>  - Remove generic compatible string for Agilex5.
> ---
>  .../devicetree/bindings/net/altr,socfpga-stmmac.yaml      | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


