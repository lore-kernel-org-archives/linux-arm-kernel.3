Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFC4D58D4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUNV3/fYeb/hafSJIYoUxiE7rpSHnx8aQ494hbvi/KM=; b=qDM5fTb1fuAKe8PSsQc+BmenfH
	QLqVEljIrYxQipE/O/kJMBkf2wAILSwapbGmcLiFI2xzqX/ec0Z7xlTfWVIRebOdS5UF78dH4Qnnt
	Q4+0OOydWE7Vl3M1aNOfZGv3FxGi0ayKb2nYU8pN1Myjfmrb6D/x94m4WmN+G3A7vV0WzmLiPRU36
	ebI/J4WFqR5wOuTxTbRFc1fa46qkWAmWY7/jPUlz9uaGaZcDNorVqVYMCLcjpuwhieBKZwAJq+MUi
	wPbiT4Q65VtNBLytOZXrUH8uJrRsirXPgFJ9mJdarzcITy0uCNTmMbJyQiKtlbg1DdB6AeBx+GX+Q
	27l8ZwNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZyy-00000008HKq-1wtc;
	Mon, 25 Nov 2024 14:22:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZxU-00000008H3O-2r7m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 14:21:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00083A416D8;
	Mon, 25 Nov 2024 14:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81285C4CECE;
	Mon, 25 Nov 2024 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732544459;
	bh=BJFiZKZUiXJdE7BCJYHoYsMcMtEgwgFeoIpU0YaHwZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lXonjeSbIogq7Uq/RghIOWPdWN8cjsFRN2ihUVNV8/bk/P143kThC1A9GVr6KeWcf
	 KqZChTETZ1o0zy6DffOnTQPmN7qtnfOeeOgwghrp83BgP8XUYAgkyo1sf7CyISsMVm
	 zito8LvVZfMXFPol4R6tqGwviWexBKIdmzShqSKTCexDZGP0944/MdvJ7BUbsxlsq0
	 EtufmCYr5lgilXi3ITkGqHiYz7oleh70Y2+woevEEP+wogwSNgbZfFE7h7HFtmLBu1
	 k00RiqAphCsVBBJ2jsZ/R1c4w7vPLZLsWOwqf0YIY5BCqJPsoWjJ+6k/z6ttt04JSr
	 tH6a6lJZH5wfg==
Date: Mon, 25 Nov 2024 08:20:57 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Cc: linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-sunxi@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v6 2/5] dt-bindings: sound: Add Allwinner suniv F1C100s
 Audio Codec
Message-ID: <173254426800.1714666.14026732187475007449.robh@kernel.org>
References: <20241123123900.2656837-1-csokas.bence@prolan.hu>
 <20241123123900.2656837-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241123123900.2656837-3-csokas.bence@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_062100_778104_7A023123 
X-CRM114-Status: GOOD (  11.52  )
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


On Sat, 23 Nov 2024 13:39:00 +0100, Csókás, Bence wrote:
> Add compatible string for Allwinner suniv F1C100s audio codec.
> 
> [ csokas.bence: Reimplement Mesih Kilinc's binding in YAML ]
> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>




