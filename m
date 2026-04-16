Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEF0F8A145
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DamR8A+C4zUJBLajvIKOyz7PR05n3QFmEoIY/5V6QUU=; b=RVEpQhDXCqylTnTgGtc8KoXPRr
	zvbCN2fxvXUHINVAw4+sGh1yu4rVOLEoPyuvJcAySgRVVvOKLvIvnIL1jeHyxSJSlMCMGlKDdFgXp
	VCZZQKV/T0LWzxleZuG2RUevh7mU0PppM+VxCr34qufdhE4tZZ011ZnlY5dd8WDByvwD/T9bM+mZx
	BsgyyoH1Dug4aSqhzSnMeLqu3KHDWMxqX23cFfeq092FTaacnN87oB2DPoSqlEkK+CjfQ1Y+AbK30
	DZdf8tGYW5t0sMvDtTEacxsb+Z1ncFdl4pm9hg12YIfjr4wQhrF4H2hS1K6GpsWikbVXLjlARtc7y
	tU1pItWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIY6-00000002Cyo-0TEH;
	Thu, 16 Apr 2026 08:58:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIY2-00000002CyE-3fUJ;
	Thu, 16 Apr 2026 08:58:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 862D542D76;
	Thu, 16 Apr 2026 08:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5761C2BCAF;
	Thu, 16 Apr 2026 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776329886;
	bh=wIVmSPEWi58JQM7nvjRlxWGWBS3n11NN6UIk/ySZXFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2pui/sNYh+IOj8b2MtTogNe0yeCNU6qS1lupk0CscO+IXwOqSHNplQYjwwvcw72E
	 JBaEDta9t4o0wjgh3osrO7pM0PzANOcgyUy66x1n/t32MEjiWsxqneBk4o73GGFMQY
	 Z6HYMognzwkUavvDvBf4RGc6Jj7+XtfmwlhW0fI+dGMRPvckg6+Q+NSksxo72SZqqz
	 lWjvAwQNH+QTJEAx7DpHHHDi8QdOIKnyG+MoNmrLi7aSWcXKX3RmC5aHQfTbSAS7fB
	 WMpEo7zx0utCqlB3U6OLd/hnL9XfXswNr192UqREFWshgIhPoOYArakTsMS7ogtJgh
	 RgezysU48045Q==
Date: Thu, 16 Apr 2026 10:58:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu <vince-wl.liu@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 6/6] dt-bindings: soc: mediatek: devapc: Add bindings
 for MT8196
Message-ID: <20260416-gabby-porcupine-of-snow-bc10c0@quoll>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
 <20260416031231.2932493-7-xiaoshun.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416031231.2932493-7-xiaoshun.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_015806_933145_169378BF 
X-CRM114-Status: UNSURE (   8.50  )
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

On Thu, Apr 16, 2026 at 11:12:09AM +0800, Xiaoshun Xu wrote:
> Extend the devapc device tree bindings to support the MediaTek MT8196
> SoC. This includes:
> 
> - Adding "mediatek,mt8196-devapc" to the list of compatible strings.
> 
> These changes enable proper configuration and integration of devapc on
> MT8196 platforms, ensuring accurate device matching and resource
> allocation in the device tree.

Same comments. It's really poor commit msg.

Also, subject wrong. Drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


