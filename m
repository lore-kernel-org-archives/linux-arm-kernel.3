Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39CCC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 07:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiegDsAiFripKF03esxeA747O9izianQ/WOJV3TpW9s=; b=zFMd4LXJ8XFgVHKdOgFF9KFPZa
	DpqrrOjbuRo7UVn2AGZ3w64ztfny2bmd5nytD6+CP9cwSiDuiBKWysHmjqmSXVh/K1K1GflGJU14e
	DOEahRWuJTRyisM3T1+re0QDRmRWZXnYqFSyvP0HTcJ0pda30e/XUFLR+uBf706ZchbqSqPb015JO
	ptBCqondD77xY5g2SaRnkCbv7uE1LStgq5SGS4/NhbIE/OLzJIZRrpUL0iZA3cht9u8CUYv5YEWSI
	EvV6kMg7LtAVVQVJAr3sbiTwaEsRCavQeQ2Gk8V4xtJuDuN8NDdiLGHm55Uiiv6tTLqXfutl5iZwC
	atniDAZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IYh-00000005Bka-12Cb;
	Mon, 28 Apr 2025 07:05:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IUU-00000005AyX-24Ne;
	Mon, 28 Apr 2025 07:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 969FC61156;
	Mon, 28 Apr 2025 07:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59775C4CEE4;
	Mon, 28 Apr 2025 07:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745823677;
	bh=3kWcnczSy9PqVkb7D7BZRFCEGExRBTJJZ1RAYq2S0wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAVHa/PbhnSOL50m/Ox3H2JFZOnDthqZy5wgNh1d/VTRwGiahXD6IW+bSUAw4Ruc/
	 dbT39t4Ack+U5dlRr/nkk7RFAsaSMCOl8xxnCudXu2ifXTN9Ovn4pL5YrctWU8adOo
	 RmNpQZ6WEJRD2/tPNPTQkn8ivP96YbhXhIiFbS3+ugyBk7d0DJQb8QreEZe/0aobEJ
	 /1+mjIZRAoWSRP4jlLXj1RcwxzpFu9i+cW+KcUJECZUuntH5njEnma4NW97EYKDY3r
	 QTY4FDs9sUOluGOPFA2YedLJvFPHEyjDEIdxhNeU2KWQjGd9w93H6/wsKtOavHkRI/
	 S1m7HCzMoSP0A==
Date: Mon, 28 Apr 2025 09:01:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Message-ID: <20250428-inescapable-smiling-oriole-bfbe3e@kuoka>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425085328.16929-1-kyrie.wu@mediatek.com>
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

On Fri, Apr 25, 2025 at 04:53:16PM GMT, Kyrie Wu wrote:
> This series adds support for mt8196 multi-hardwares jpeg enc & dec,
> by first adding mt8196 jpegdec and jpegenc compatible to install
> kernel driver. Add smmu setting to support smmu and iommu at the
> same time.
> Secondly refactor buffer and clock setting to support multi-hw jpeg
> working.
> Lastly, fix some bugs, including resolution change handleing, stop
> streaming sw flow and others.
> 
> This series has been tested with MT8196 tast test.
> Encoding and decoding worked for this chip.
> 
> Patches 1-3 Adds jpeg encoder and decoder compatible.
> Patches 4 add jpeg smmu sid setting.
> Patches 5 fix jpeg hw count setting to support different chips.
> Patches 6 refactor jpeg buffer payload setting to handle buffer
> size bug while resolution changed.
> Patches 7 reconstruct jpeg dst buffer layout.
> Patches 8 fix multi-core stop streaming flow
> Patches 9 refactor multi-core clk suspend/resume setting
> Patches 10 fix decoding buffer number setting timing issue
> Patches 11 refactor decoding resolution change operation
> Patches 12 fix remove buffer operation
> 
> ---
> This series patches dependent on:
> [1]
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250424090824.5309-1-jianhua.lin@mediatek.com/
> 
> Changes compared with v2:
> --refactor smmu sid setting function interface
> --Some modifications for patch v2's review comments.

This is very vague. What exactly changed.

> 
> Changes compared with v1:
> --refine jpeg dt-bindings for MT8196

This tells me nothing.

Best regards,
Krzysztof


