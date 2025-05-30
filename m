Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC19C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tkt6lqMerVtxJ85JGdrgiNvmzOncLEuXluT2uXMp+Bw=; b=U4fZWkpZ2gwmCFiG4kz3AFj2xQ
	0WiI6fwB+rW47Qx3Fk385pUy6J0nKx4baGTKanWFRi2ElCTZCGmzV9cGwmTAxgdfHIymUrXXIv4mX
	494SPX4TJ6/vT5TLJ03CeFy6M/zbL7Sy+aT/XjEhmBABRdCCUrjkXD5TEilcEY3UO2Ez6wb2J+b7M
	xcE6dKZkkKa5yAyMi7V1fZuz8syNKkelGrMUo1m0CxHiB3P0lMfYTdpm/H+U1MFCTzIBdM26AWH9+
	An9abGgOCQJZN6OVl1NjoSBjcnsYm9CpaLmK7GZEy3UCaiV+A5EzO40IYae/xJEvNAI+sLOw6fceA
	Q2vMwONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0wz-00000000vVR-0Q4v;
	Fri, 30 May 2025 14:43:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL0up-00000000vHs-3WdO;
	Fri, 30 May 2025 14:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748616057;
	bh=YuEWTcZ3+7dJ6CPGfVqw5uB5EKngIixvUdcQNCJDJUk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d4TOFwsGMh/NAP5WONQXEaz+z/IkO7TpXa9X0Z39nSgp9R8C8lBcRLZD9KwrWvQMv
	 P+oZKUNZoQelaZXC0oeC2pngBQusHVctcm2nc1Lu8Wd+ANaPnmYKxwH6GQaPNqu/ib
	 uWfKdBS/x22mVh6AIMwsXWebYoa629xwJjnwjrjHhFc+dYc1qVIi1mkaq9x0wOZHoM
	 P33WJYoGqiIi3Dg/Y5sN0+MeLjxYx+r+S42Ouu7sP06otHecvEOR/6mQqpp67bd68u
	 /MAacM+SWSTT4fpOR0h8ssgL7qNj7aXITAchZfNiAhSH+n1id+HUr40xjFsk22Jn1A
	 CzLi3CW/YF0yw==
Received: from [IPv6:2606:6d00:10:5285::5ac] (unknown [IPv6:2606:6d00:10:5285::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB37617E0C37;
	Fri, 30 May 2025 16:40:55 +0200 (CEST)
Message-ID: <7a372c544c370d64b916a7092aabac555710d7c5.camel@collabora.com>
Subject: Re: [PATCH v2 0/6] Add support for MT8196 video encoder
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Irui Wang <irui.wang@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	angelogioacchino.delregno@collabora.com, wenst@chromium.org
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Yunfei Dong <yunfei.dong@mediatek.com>,
  Longfei Wang <longfei.wang@mediatek.com>
Date: Fri, 30 May 2025 10:40:54 -0400
In-Reply-To: <20250528063633.14054-1-irui.wang@mediatek.com>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_074100_031839_B4580D4D 
X-CRM114-Status: GOOD (  17.38  )
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

Hi,

Le mercredi 28 mai 2025 à 14:36 +0800, Irui Wang a écrit :
> This patch series add support for MT8196 video encoder.
> patch 1~3: Add a new encoder driver interface for new VCP firmware.
> patch 4~6: Add MT8196 encoder driver platform data.
> 
> About adding new driver support, the v4l2-compliance report shows:
> "Total for mtk-vcodec-enc device /dev/video3: 47, Succeeded: 46, Failed: 1, Warnings: 0"
> The 1 Failed case is not caused by current patch set.

We really want to see the full report, simply reply to this cover letter with
the entire report to fix it.

Nicolas

> 
> This patch set depends on "media: mediatek: vcodec: support video decoder in mt8196"[1]
> 
> [1] https://patchwork.linuxtv.org/project/linux-media/list/?series=15232
> 
> Change in v2:
>  - Add support for VCP encode process.
>  - Add MT8196 encoder driver platform data.
>  - Rebase encoder patch onto decoder's patch set.
>  - Fix some review comments in v1.
> 
> Irui Wang (6):
>   media: mediatek: encoder: Add a new encoder driver interface
>   media: mediatek: encoder: Add support for common firmware interface
>   media: mediatek: encoder: Add support for VCP encode process
>   media: mediatek: encoder: Add a new platform data member
>   dt-bindings: media: mediatek: encoder: Add encoder dt-bindings for
>     MT8196
>   media: mediatek: encoder: Add MT8196 encoder compatible data
> 
>  .../media/mediatek,vcodec-encoder.yaml        |  12 +
>  .../mediatek/vcodec/common/mtk_vcodec_fw.c    |  19 +
>  .../mediatek/vcodec/common/mtk_vcodec_fw.h    |   2 +
>  .../vcodec/common/mtk_vcodec_fw_priv.h        |   1 +
>  .../vcodec/common/mtk_vcodec_fw_vcp.c         |   6 +
>  .../platform/mediatek/vcodec/encoder/Makefile |   1 +
>  .../mediatek/vcodec/encoder/mtk_vcodec_enc.c  |  37 +-
>  .../vcodec/encoder/mtk_vcodec_enc_drv.c       |  28 +
>  .../vcodec/encoder/mtk_vcodec_enc_drv.h       |  15 +-
>  .../vcodec/encoder/venc/venc_common_if.c      | 678 ++++++++++++++++++
>  .../vcodec/encoder/venc/venc_h264_if.c        |   8 +-
>  .../mediatek/vcodec/encoder/venc_drv_if.c     |   3 +-
>  .../mediatek/vcodec/encoder/venc_drv_if.h     |  11 +-
>  .../mediatek/vcodec/encoder/venc_ipi_msg.h    |  26 +
>  .../mediatek/vcodec/encoder/venc_vpu_if.c     |  51 +-
>  15 files changed, 843 insertions(+), 55 deletions(-)
>  create mode 100644 drivers/media/platform/mediatek/vcodec/encoder/venc/venc_common_if.c

