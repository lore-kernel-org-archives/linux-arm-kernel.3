Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5791C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzR32DbReKxN1gNABAGBHX05QxXHRYwxaULYt2Tll9Q=; b=PC3EO4iJVCa6IS/gUDfr913MRa
	r6BSbGmxrettalzaF875MKYwqJpTWdlEo6ZZObPgkG9nBHhOJVpZP8RPEwRTomJaZ2nbJjGjPuQMi
	B85yU88mwajUNBfIxAUcK1pemM/jJksTxpm9ezfodRt+ghWZ//KPiujUuvlVCaYC8fnrsyauLJqxY
	zPze5DEc8M/uVtfeX5MPRSHpI1MJ/k5isaqXNDiXeHpXzJAeLYmsVm1QxZSUntSy3HAedzSoTS28l
	p8bZOgEKWKPviAbsV8kMBQQvCUHapHG3qynQHzCid28yJbU3mo74X+MAYFGiphSilO+hat/ZjIGSw
	HuYI3v3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26XY-00000003k5G-2Y1t;
	Tue, 08 Apr 2025 10:50:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25u2-00000003aSG-0JIq;
	Tue, 08 Apr 2025 10:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744106995;
	bh=zKoPiYcz99Nz4xf/JHPeWfzhs+Akk0ORk8KQJztJIxQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QbKB7Hnuj7ZBKkSBv3cR7rUneJAWMFXGUNA2RlvgRAAa1CE/eyVhw+cTMS9R2St27
	 SY+aAKK7+tpi2H2knNvVcHXpaHtcmrs6uAShV4d/FuBat2tnGJN6tWO85BPStSNJ7j
	 JteOu1GtkRGekbkzFGq5oBg5/E6qzWLhfdos8uTCNTti9FheqrOxphMDfwhhTI4Ceq
	 DF2CsyyTHpEerv9N7B1HfZr0pjHcRtHhFXY4op4H9xERbyo3Q36zT7BIG04l7UsScx
	 6qiqVNloHKIJGsn/jxOyaPjHMNGR5YBeX0kQ67wcH75tMHgVfELm/JF9aJdocanaOX
	 lUjWERyst7HVw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 147C517E0F9E;
	Tue,  8 Apr 2025 12:09:55 +0200 (CEST)
Message-ID: <ae6b9a80-c8b6-48dc-9229-da4e8c102551@collabora.com>
Date: Tue, 8 Apr 2025 12:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Chengci . Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20250408092303.3563231-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250408092303.3563231-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_030958_266893_D7F6C926 
X-CRM114-Status: GOOD (  12.94  )
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

Il 08/04/25 11:23, Chen-Yu Tsai ha scritto:
> Based on the comments in the MT8188 IOMMU binding header, the rdma0
> device specifies the wrong IOMMU device for the IOMMU port it is
> tied to:
> 
>      This SoC have two MM IOMMU HWs, this is the connected information:
>      iommu-vdo: larb0/2/5/9/10/11A/11C/13/16B/17B/19/21
>      iommu-vpp: larb1/3/4/6/7/11B/12/14/15/16A/17A/23/27
> 
> rdma0's endpoint is M4U_PORT_L1_DISP_RDMA0 (on larb1), which should use
> iommu-vpp, but it is currently tied to iommu-vdo.
> 
> Somehow this went undetected until recently in Linux v6.15-rc1 with some
> IOMMU subsystem framework changes that caused the IOMMU to no longer
> work. The IOMMU would fail to probe if any devices associated with it
> could not be successfully attached. Prior to these changes, only the
> end device would be left without an IOMMU attached.
> 
> Fixes: 7075b21d1a8e ("arm64: dts: mediatek: mt8188: Add display nodes for vdosys0")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




