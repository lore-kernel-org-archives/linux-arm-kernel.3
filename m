Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B26CCA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cY0MImdsbwwry+0M5+lusqvStPfpoJWB8RTDFB0Iwvw=; b=ljoK714CEnEYEvZPjGEdHOv5Vr
	hZQsXuYpzCyB2gWZGZ/Oic+Gdj2gjMPSy1Sl+HlouMFVF0ApTx9ttjv5tMDhEobAjW3+W3iTm8QLC
	sUyWCv9Q9o/igMwTocQsPxbTWaY9BWZsUu9a+jsgrgI6FqJCqXjPSektrumShF4Yy/4bMhQIkRRz7
	rZdd5G79kzIIcMavFucY+43+NHO30Rthmczi+zmvb/obnGyOQ1sqfVEyAI+Z9uAzwOOLdtJ/muVgd
	5v7zREr0Vgs6n661w+hSEjrkjh80uX/5YU3Z+66IktdI9NZcBfFdgJZX/oUDG4uL+W7yJfvlyVSVa
	abDkHTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkq6-0000000GmDw-3cWG;
	Mon, 05 Oct 2026 15:42:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkq6-0000000GmDm-0neG;
	Mon, 05 Oct 2026 15:42:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A051643F99;
	Mon,  5 Oct 2026 15:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969B41F00893;
	Mon,  5 Oct 2026 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791214973;
	bh=cY0MImdsbwwry+0M5+lusqvStPfpoJWB8RTDFB0Iwvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xpu2ucEKC7J4WZKgWocc13bV56BFfjA/o2ZhUHlgzrny4VLzVrJiRfsC3jOs2HyLj
	 RiSwkpSx5JlAby7QZsMWgt2JfkNgaYdvs7YWKsISRQmYrx7FXjAHWBKcLhDypt316f
	 gTdlfX6We6cVQE8Xn/w1QJ5AD7ytHwwLmuhhJQ/rybdQUXX7lTZKlKqYJd/Hzv0fv0
	 dVedNvHP46QUVGgcybrORTcb7dRRO3djLGlmHL+r5abYGbM6gXbBGc/yjnQyQnyHrQ
	 J6HA4MXCfJiLCLj2vkBBkPmGlmyMu/mmpr5SKRfR1Oz2MxRgu/jDtYjv4HJmqVDxZk
	 sCrFNl+J16DbA==
From: Vinod Koul <vkoul@kernel.org>
To: Sean Wang <sean.wang@mediatek.com>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Long Cheng <long.cheng@mediatek.com>, Roman Vivchar <rva333@protonmail.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
References: <20260914-6572-dt-uartdma-v1-1-b26b429ab68c@protonmail.com>
Subject: Re: [PATCH] dt-bindings: dma: mediatek,uart-dma: add mt6572
Message-Id: <179121497025.358863.4128356307100144833.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:42:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 14 Sep 2026 15:10:52 +0300, Roman Vivchar wrote:
> Add a compatible string for the mt6572 APDMA, that is compatible with
> mt6577 IP.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: mediatek,uart-dma: add mt6572
      commit: 6c0a5a1fb1668b5fa9f9c9c302f5235d131f2ed5

Best regards,
-- 
~Vinod



