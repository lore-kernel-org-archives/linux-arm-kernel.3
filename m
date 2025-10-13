Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDEECCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4tvKC2lRqaQnSIyDBlEgy5XbrHJYeJqzly8tl5wOsM=; b=Md0HIQPTy0KoIYIoMI6Qgi9rA4
	5H7YH8s+tOl0oBDEIrtRXPHlgRd73YGgIiNep+6PxBVheD6przm2MQCYAThBpBH/GuTfmXiU8Wj4q
	Q1t3Ae+BR2yle+3uw2gNp0OwJKcfAAbbqKZgzkE99uMRBhuVHuzu0y5Smx8flinfQ4GcB159WO8xm
	VsZ6imYi41VbG872rNmwVJgF+Y98a7cSTITZ7dpqcTqPmS25Ls2NOKmLKj1KJhe33KdLvWDubC+zw
	qXtXZt/LT3FsWS8qiUnbEHX3KjcUMDIfQUT8j7GCheywi01M0Pr/PtGVzEr1ikPZ+ybxwkAHwHUP1
	1bhc1WbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ExY-0000000Cks5-1FZP;
	Mon, 13 Oct 2025 09:35:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ExV-0000000Ckqr-0KFb;
	Mon, 13 Oct 2025 09:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760348110;
	bh=/uX2/dDKPfRSFG3Yo/E2dlJAxS2biKzxOGx2S692NdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VGuG/2vtpqzkbIxgSnRfIJED9bpAg/YFGpui5UCzIH0INIQZtIu+GM4xSrKDrECPW
	 1oxFBFtgmnCr7e8XOWlyfh7Bf/x5SvEaOlMnJmXeG0TxdnKMZ2PbNHRNXzUcsNqoPq
	 cpEuFXG/49nzKz2IXnutJuR3t/ow80qlaEImSe6gP/HosmLQ0vd1qaEE063lCSrXJC
	 DNb4/J0N+IFBvzuCa6sX8iBQTYtGR5Ep2zbQEJUZB9veNq7dsf1P8sD1ALZXaOhAJJ
	 RfAZy2tbouWqD1NSwC6AjVEseqm6ewKhPptdi1iOH6mj13a4W5cV0o+e+VMtWoA8V2
	 JZXDcCPVNa+mQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4669C17E048E;
	Mon, 13 Oct 2025 11:35:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
 MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250918121751.229554-1-macpaul.lin@mediatek.com>
References: <20250918121751.229554-1-macpaul.lin@mediatek.com>
Subject: Re: (subset) [PATCH v4 1/4] dt-bindings: arm64: mediatek: add
 mt8395-evk-ufs board
Message-Id: <176034811022.21265.14554901190334591981.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:35:10 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_023513_281262_A17142E9 
X-CRM114-Status: UNSURE (   7.11  )
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

On Thu, 18 Sep 2025 20:17:47 +0800, Macpaul Lin wrote:
> Add a compatible string for the MediaTek mt8395-evk-ufs board.
> This board is the origin Genio 1200 EVK already mounted two main storages,
> one is eMMC, and the other is UFS. The system automatically prioritizes
> between eMMC and UFS via BROM detection, so user could not use both storage
> types simultaneously. As a result, mt8395-evk-ufs must be treated as a
> separate board.
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[1/4] dt-bindings: arm64: mediatek: add mt8395-evk-ufs board
      commit: 3d37117ab43ff57577b922c53ef12260956a9330
[2/4] arm64: dts: mediatek: mt8395-genio-1200-evk: Move common parts to dtsi
      commit: 6af8936fd74f1e4f8fd0087443111bb0348ef931
[3/4] arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
      commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3

Cheers,
Angelo



