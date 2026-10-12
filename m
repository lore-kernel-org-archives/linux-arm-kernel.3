Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA05CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCBaLoV31wqphlVvEaFSt1x8hpc/UDTsLJLp1gfaYF4=; b=Kg07bOZ5UUgsqEMthi0yGVp0Fc
	FjoO9XjxhiuEo4xdHt3IoiYhbO1Wv6xh2lpaBCtlkYJFW48tbC3vXTlQsC5QDN9XINTTMNx5UBEdR
	KhMxU248ltVg3WRT0AYpCvm6wCc7ewpRsZDqSfxE7JS/Y+qFMvxbIBzgN3MIm7ID8afMQ7tb+cIzC
	lMFMLDq/zf7CmvHfXgEwyLovxmsx30csCK4ZM+QbkYtafC+R9l7u9sVROiy/vkDcuKMWvN0pbeZWf
	hh6CFZqPw7s19Y/FV7xtORDebgnXGIJ3DM1Ujire43zGL0h8qp/Eq0PbhVVjfP00JBSqX9aHc67/A
	61+crBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCPN-0000000A4XF-14H2;
	Mon, 12 Oct 2026 09:33:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCPL-0000000A4X2-2FZ4;
	Mon, 12 Oct 2026 09:33:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E25484328E;
	Mon, 12 Oct 2026 09:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDC71F0089C;
	Mon, 12 Oct 2026 09:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797602;
	bh=NCBaLoV31wqphlVvEaFSt1x8hpc/UDTsLJLp1gfaYF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B/8tSBD7dqH40URDKUKpPoZIengaDGRGdRz1+xBS2LOL9azOI1kKmuVSOvwWU5KGG
	 Xs+2RnmVkSWCii6D+GiRhZfrEc/hx/giDzmIjfDMvl7cQlMSmKNyMjQMSAmYAdgTub
	 GF1j7Fd/0Wr03jOGywP7OZoQTaQ0HAjlW7AdtT6H5HA6W5xw2xJvpNySrafXA1CPRx
	 EPZWLx/UlYCeS8GT3/BvZ7OZ8hJ+yRYQYvVHUHw6pw/mRfmuVXvuncIW5u4XK5OvXv
	 lswcFccpowIfqEAYHBfedmARXtfFsJP3dPUVHcU4JDHDw6bzxXJjFIm9uQAe2T950W
	 xktXnnFJClkqg==
Date: Mon, 12 Oct 2026 11:33:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil <hverkuil@kernel.org>, 
	irui wang <irui.wang@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v18 09/13] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Message-ID: <20261012-original-visionary-gharial-ee41cc@quoll>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
 <016a61397c01b8745622ff54f1e27b5209b3f34d.1791614327.git.kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <016a61397c01b8745622ff54f1e27b5209b3f34d.1791614327.git.kyrie.wu@mediatek.com>
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

On Sat, Oct 10, 2026 at 04:07:13PM +0800, Kyrie Wu wrote:
> Compared to the previous generation IC, the MT8196 uses SMMU
> instead of IOMMU and supports features such as dynamic voltage
> and frequency scaling. Therefore, add "mediatek,mt8196-jpgdec"
> compatible to the binding document.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

So this has subject "media: dt-bindings:" but a new patch you added here
has completely different subject prefix. Including the re-introduced
nit, I am sure I already asked you.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

This is random way of coding, not even checking your git history before
sending to lists.

Best regards,
Krzysztof


