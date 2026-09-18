Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72B0C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8W8XO/Ae5cM2yDYef7QCLLw8szG6m9g5X/FwN3K83rI=; b=S+akdi3Rftr16ER3cFVzOL2+OK
	i4CImkK3Kj4oFKJV1fXUm92mb6oHzY+IfTBeIvatHLEwmm7qWr5CXZZSTxiym4xyEDShnigqNTOFI
	/sa/4Xa+Tv+DcakKY/vcPVvhJeiHQjIs5xqo2RLkNdhnjfZ8/69K8zje+j5xC1oYx+GuVwFPLwcsU
	s31LYt7VSfHuTB4v1JUZWHInFTUcj9HxrqxNbE2wh7R2QmZgiqS4plXVLHIW3UBupBSJ/FPtzHlB3
	9W1SQb3ebZM7/Ou/uYHUlRGEGec3WPuErnoisUh6bpFmmH/s3ccpMFxfleKil6kQkivjrYRpArZ0o
	tKeoKTwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gVx-0000000FaPx-2eAz;
	Fri, 18 Sep 2026 21:53:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7gVv-0000000FaPn-3JIs;
	Fri, 18 Sep 2026 21:52:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 429EC43660;
	Fri, 18 Sep 2026 21:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD681F000FF;
	Fri, 18 Sep 2026 21:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789768379;
	bh=8W8XO/Ae5cM2yDYef7QCLLw8szG6m9g5X/FwN3K83rI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=N4e2esu+nbbszP6tLi19HQcyp3UTfm/8Ra6HgTLuOQ+lNSqq8wN+HG+5h6voAyqvw
	 JBkuq0O+9qHVnNQbBgRtykiL9pO3Vt6BwH2Sj8pF/dmFnLgHgRR7aDvmMyMcioECsa
	 G+aklz+r4vk8Zf6tskvGHkWPFLLypq9CoO1qx+wVAOYydQqrmMy3HKK6igwX3IHg5M
	 sLlhMMa99E+cjHdfktxpavspkszmjIeW8oThUebLcBwp6ttL7d/w/VRXtIXH6Xkzw9
	 4QKPO2HHZrpt/1GgREjb06tQk9uZU3M+lxyfNiL7jZ1dCpQEMKqJ0qcVPg0k4lI7VI
	 ypWSSAtI1vISw==
Message-ID: <abbbc648-6284-49b0-b362-5d41e34b3e42@kernel.org>
Date: Fri, 18 Sep 2026 22:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] nvmem: mtk-efuse: mt6572 support
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260909-6572-nvmem-v3-0-c0c441656431@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 9/9/26 11:48 AM, Roman Vivchar via B4 Relay wrote:
> This patch series adds MediaTek mt6572 efuse support. Unlike newer SoCs,
> its efuse controller doesn't work properly with 8-bit reads, leading to
> invalid data with current mtk-efuse driver implementation.
> 
> This behavior can be observed with devmem (0x10009174 and 0x10009178 are
> thermal calibration cells):
> ~ # devmem 0x10009174 32
> 0x00CDD4CD
> ~ # devmem 0x10009178 32
> 0x0F76865D
> ~ # devmem 0x10009174 8
> 0xCD
> ~ # devmem 0x10009175 8
> 0x00
> ~ # devmem 0x10009176 8
> 0x00
> ~ # devmem 0x10009177 8
> 0x00
> ~ # devmem 0x10009178 8
> 0x5D
> ~ # devmem 0x10009179 8
> 0x00
> ~ # devmem 0x1000917a 8
> 0x00
> ~ # devmem 0x1000917b 8
> 0x00
> 
> Patch 1 adds dt-bindings compatible for the mt6572,
> Patch 2 adds platform data option to use aligned 32-bit reads instead
> of plain readb().
> Patch 3 adds platform data for mt6572 SoC.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
> Changes in v3:
> - Pick up Rob's r-b tag for dt-bindings
> - Patch 2 and 3 unchanged, for some reason cover letter and patch 1 were
> missing on the web mirror...
> - Link to v2: https://patch.msgid.link/20260724-6572-nvmem-v2-0-e58d16a29621@protonmail.com
> 
> Changes in v2:
> - dt-bindings: make mediatek,mt6572-efuse standalone compatible
> - Driver: add 'mtk_reg_read_aligned' helper instead of modifying 'mtk_reg_read'
> - Link to v1: https://patch.msgid.link/20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com
> 
> ---
> Roman Vivchar (3):
>       dt-bindings: nvmem: mediatek: efuse: add mt6572
>       nvmem: mtk-efuse: add support for 32-bit aligned reads
>       nvmem: mtk-efuse: add mt6572 support
> 

Doesn't apply cleanly pl resend.

--srini
>  .../devicetree/bindings/nvmem/mediatek,efuse.yaml  |  5 ++-
>  drivers/nvmem/mtk-efuse.c                          | 41 +++++++++++++++++++++-
>  2 files changed, 44 insertions(+), 2 deletions(-)
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260710-6572-nvmem-eb98c7a73351
> 
> Best regards,
> --  
> Roman Vivchar <rva333@protonmail.com>
> 
> 


