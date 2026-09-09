Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2881BC79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ps4txA8yulxz+H1CKcCcyIHdAlFgi+8pO1Fx1PzdrZ4=; b=DJGhEntDDCRG1drhPIYwJu3R9X
	MOf3qv1VvpieiZ29xLEEMs9IYGcvPC6r9Y052B/2DVJVquNfMFFfILeEs0Bq2w72rSSe0Fi9mnkcO
	rUR2wVNEY+4EbhimoMUmq7voiK5TAzksSdOVqcTSq59Q4d2qGtF9OngWwMcuSnmOwizdAQKNU69Mh
	ISI+8Vpla5uBZ3zwLuGFMIYUPAP1sRVtAZybOcFRECelQuxqrVcHLUJn4znNQeZhTu4wtOcvMaHOd
	3xjePaRabl+vsBnXI1sPhHkAoBmeTV6PlAGfDZdwYVIqKEwZ+N1peh0vd6nHrjsz80e+CUtnoCATK
	d2h2gl4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JwO-0000000C631-0ZaM;
	Wed, 09 Sep 2026 15:10:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JwN-0000000C62h-1dRm;
	Wed, 09 Sep 2026 15:10:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA01240495;
	Wed,  9 Sep 2026 15:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182901F00A3A;
	Wed,  9 Sep 2026 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966622;
	bh=Ps4txA8yulxz+H1CKcCcyIHdAlFgi+8pO1Fx1PzdrZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E0eUjy9U1WelmB5b8fbXhgJZ7f4PHeAMYS1RMPk1Djb2tBXQxprgaRbBJC/JE4BEG
	 MLuXVb1TDVAHoN9VloKqWH1KXnFM9384urAMajSDTJsSx/LLzCI+D9ZY5cf7JYzHa8
	 6GuqgNOPOKNSdEZK58ST5n9oof8BJWYxwaAR3SdWyzaiFtM/0qh2vg/cZ/3mky7f0E
	 fExYtiqcbzxkqa5+S2buBB/Y3QvRKOz/8NZHHNbzKmQalyjVPn1J+rEIXHhshXK6Xg
	 wP5zkz+M8NKvvwPO35n5d9xE8Gk9FQHX6aQ1iy1SFCXYJcFBdzsyquebQCc86O+YkG
	 HjFjG5VDpe0rg==
Date: Wed, 9 Sep 2026 17:10:12 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for MT8189
 SoC
Message-ID: <h3b5r5wm5pey65jauir32ciw3lskbrlbcuyqa2xwaxqx2q3kz5@nxqjientp4dq>
References: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
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

On Wed, Jul 01, 2026 at 05:36:49PM +0200, Louis-Alexis Eyraud wrote:
> Add a compatible string for the MediaTek MT8189 SoC, that integrates a
> MediaTek generic T-PHY version 3.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

