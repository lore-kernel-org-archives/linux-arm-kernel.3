Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B918EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/YU9h2/+V7xdUoN4efaSbAo6cmdtLPlIo0ezNZnzgc=; b=z5LwrZjUYRg8Xf1hCQjWqmiAOC
	zE9U1GooY3WfiHZJmtdsYlW1/I7XV+d4QU5k5v1Xwr5xMC4VbLhlh4LS1CMohzF8f283PBfcjsA9N
	3BJD4dOm3QT85uYaN3lDLomMQoAdSWftIKnkSjcik31YSoD0p9IgpvFMGvT72m+R8PNRPYz7Wg2Pb
	dhPEd8UE9214nzSq5u2xM+zPxHm3ZSozl2EvuXhrPoC/SX1MDIlmDdFveW2G6rgOx7UHkHCoDWH6v
	GtR407olGqBuvalU35OH57DV0WxX5NuRdWS0tZrfcm1OvnzRe23IuGHi+gBzDrpJzcHoxms+c2q3R
	6oJ2Bxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCkE-00000003rLk-1i0B;
	Thu, 02 Jul 2026 08:26:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCkD-00000003rLX-0TJd;
	Thu, 02 Jul 2026 08:26:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6875540B0E;
	Thu,  2 Jul 2026 08:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FB731F000E9;
	Thu,  2 Jul 2026 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782980760;
	bh=g/YU9h2/+V7xdUoN4efaSbAo6cmdtLPlIo0ezNZnzgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hSO+EeXaBKdlQzKWkECM/IwvEKdEPNtcQR+uj2ry4hmveWdo4e8F35hw85K0rbtvW
	 tXBX2vI9f0zXgpuRBI2LP9eEsu0I6a3TCzVa95GPMwGtzTYe+dV2qKD2d5wM0dmzM5
	 N9A4+n61wB4w2V4zHEzJNyXUXAyPqcsroOKLphCgdFhI5yjAx7Y3TaQTqQ+eiNK1nu
	 8HhH3IVQ6X3Q3fUP8MlHzRUFUfZTtRGySLuljFAR5PqHEU4I6jXGOBGeq8rq9gXOP2
	 r48vuy5CzjHmiwsk1exQ6Igz9CCBVOlyL0CuaLxmVUnfRrg+tl1j4/Nc49WfDiI7bm
	 eHlx5OMd4YKkg==
Date: Thu, 2 Jul 2026 10:25:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jianjun Wang <jianjun.wang@mediatek.com>, kernel@collabora.com, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Add support for MT8189
 SoC
Message-ID: <20260702-evasive-golden-toad-d3437f@quoll>
References: <20260701-mt8189-dt-bindings-pcie-v1-1-7c7a65087654@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-mt8189-dt-bindings-pcie-v1-1-7c7a65087654@collabora.com>
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

On Wed, Jul 01, 2026 at 05:27:36PM +0200, Louis-Alexis Eyraud wrote:
> Add compatible for MT8189 PCIe Gen3 controller, that is compatible with
> the one found MT8192.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


