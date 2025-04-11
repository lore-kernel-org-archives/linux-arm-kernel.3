Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610D8C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maMpR2yKg4UX8cMT1gH2rykRcqDvyHWnhhIvhxKcdZA=; b=mhHHrNWcnTCa67hp0k9CSdKFpJ
	9tGnXUhO1wDJizvkGec1M6GUzGAiMHCJXPfCBahPfxSQCxg67o4b3g1rolcpJUC62Ca1vKCmJ0ozo
	4vpZgxpk7LmfgOcaOES2BW6od4OHqvtYdhykUObpvZTulOnV0XLGez4ol9+GBw25kbydcOWZpFBhc
	FwpogqMc6plT/H3QCXn8UPgUaNtWOCtIuXsBj93meKZGrV02WSPeqewQDkrHp7hWKa2thjH5lPPnv
	ofLq9VmLrUy5Pvwmgn45QcQM5Kv4xy09spp805NRF303NJeuH1BPgEdJ3lqeYlrkKawMBmYSFvh6e
	OEdIrrYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Huo-0000000ETdA-2Cgp;
	Fri, 11 Apr 2025 17:11:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Hsy-0000000ETNu-2MXz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 17:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C44043BB9;
	Fri, 11 Apr 2025 17:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8125C4CEE2;
	Fri, 11 Apr 2025 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744391387;
	bh=CYf2lwADdkdY+jMx3e4q4vSSDlVFa9/AluyS7+Ilp+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHD9ESS+Wwm07AxSNelkTJuvoioLtFD/zyYbdBJegPnHeWQW4ILRIfX810X/SF2Th
	 mqBsyyHWBxewvFX8KzEphYORGbHG8XRsaZAQMKrSBUEEN/5EgNVLezQpNsIafBYo5Q
	 M+96DadKU1NiZGtkOJLqQb7P8yyJ5CRFKnn70nzMl1NgXaOA0gJVydU9O0TEHelxbo
	 OMBMgc/Oi7LMLXoNouhMUfIT614+1KptJAbBPCHzdRoZzlldf6xdYdZefJoYZ0a6bh
	 ZAHfjBt/oj67vxnb22tW/XP1245yi7vOlGDIfSQ1M2nWeXkcyRg0iRJLbNyMY2u6cr
	 mYLK13XvZDIJA==
Date: Fri, 11 Apr 2025 12:09:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	christophe.kerello@foss.st.com, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Will Deacon <will@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: memory-controllers: Add STM32 Octo
 Memory Manager controller
Message-ID: <174439138531.3430719.4031301893879549125.robh@kernel.org>
References: <20250410-upstream_ospi_v6-v9-0-cf119508848a@foss.st.com>
 <20250410-upstream_ospi_v6-v9-1-cf119508848a@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-upstream_ospi_v6-v9-1-cf119508848a@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_100948_620347_12B40897 
X-CRM114-Status: GOOD (  12.05  )
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


On Thu, 10 Apr 2025 11:27:42 +0200, Patrice Chotard wrote:
> Add bindings for STM32 Octo Memory Manager (OMM) controller.
> 
> OMM manages:
>   - the muxing between 2 OSPI busses and 2 output ports.
>     There are 4 possible muxing configurations:
>       - direct mode (no multiplexing): OSPI1 output is on port 1 and OSPI2
>         output is on port 2
>       - OSPI1 and OSPI2 are multiplexed over the same output port 1
>       - swapped mode (no multiplexing), OSPI1 output is on port 2,
>         OSPI2 output is on port 1
>       - OSPI1 and OSPI2 are multiplexed over the same output port 2
>   - the split of the memory area shared between the 2 OSPI instances.
>   - chip select selection override.
>   - the time between 2 transactions in multiplexed mode.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../memory-controllers/st,stm32mp25-omm.yaml       | 226 +++++++++++++++++++++
>  1 file changed, 226 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


