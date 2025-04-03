Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0467C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2B6OIwla7raUmTVqkAOBhJzO3h76Clx+8aU7P7edG3I=; b=wiT7r9o/G8sfTDHjFZRPDH8cbp
	vDzijr6p+opA8+MfNIjdobk9WmVD/9jJEoi3ObZQPlmTr3NMFwYa0HBq3DywJESetzyx5rihcmmc/
	XW5/vscM96s6W/XC0lRXE9HRyRgqSw9up5NCNPGkiSTOb0MuwDg7StJ0IrsI4NHMlZoxiIdqx5J6D
	uLSuWAcCV/8/+fRBFzmpEmPYUGkK4+XPkNf0cGGQP4DJhjPwzXVQZzb+uBgRsqqOpnDx9e3gkTrkl
	ghzsGUGTp8QDJZnhzY8ZYrJV7dMKBTJMKDsGkQQU0SYo7tDoUC5ubSrJG1VwMvil1N0IJraqbET4q
	UsfINXTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QrI-00000009tc5-153K;
	Thu, 03 Apr 2025 20:08:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Qcn-00000009q2B-14bE;
	Thu, 03 Apr 2025 19:53:18 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CCC9A6D5;
	Thu,  3 Apr 2025 21:51:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743709879;
	bh=SUI00eySafeyd6YAdaNfDWXQziyjQoigDH+2+g1acA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUnYnC4/T7y59yd7JqupnWgY/lfEQmBWcuoJjXqyH85TohAEaGA0FFOCxpzLCFQpk
	 SUOFxXNM2imOOXTaKxEH9wLHmZJdm2wrMN2qnQvFEd1ns/MILZNCF+73MOD57uF4Y8
	 dQD16bRmfllhOplVvgbCcI+wmXdpO4acq/abUVpE=
Date: Thu, 3 Apr 2025 22:52:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "bo.kong" <bo.kong@mediatek.com>
Cc: Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, zhaoyuan.chen@mediatek.com,
	Teddy.Chen@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 0/4] Add AIE driver support for mt8188
Message-ID: <20250403195247.GA12280@pendragon.ideasonboard.com>
References: <20250403074005.21472-1-bo.kong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403074005.21472-1-bo.kong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_125317_614066_AFFA1871 
X-CRM114-Status: GOOD (  11.65  )
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

Hi Bo,

Thank you for the patches.

On Thu, Apr 03, 2025 at 03:38:32PM +0800, bo.kong wrote:
> From: Bo Kong <Bo.Kong@mediatek.com>
> 
> AIE(AI Engine) is one of the units in mt8188 ISP which provides hardware accelerated face detection function, it can detect different sizes of faces in a raw image.

This series is missing:

- The v4l2-compliance report
- Documentation of the UAPI
- A pointer to an open-source userspace implementation using the device,
  in a project relevant to the field of use

> Bo Kong (4):
>   media: dt-bindings: add MT8188 AIE
>   arm64: dts: mt8188: add aie node
>   uapi: linux: add MT8188 AIE
>   media: mediatek: add MT8188 AIE driver
> 
>  .../bindings/media/mediatek,mt8188-aie.yaml   |   78 +
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi      |   33 +
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    1 +
>  drivers/media/platform/mediatek/aie/Kconfig   |   12 +
>  drivers/media/platform/mediatek/aie/Makefile  |    5 +
>  drivers/media/platform/mediatek/aie/mtk_aie.h |  870 ++++++
>  .../media/platform/mediatek/aie/mtk_aie_drv.c | 2398 +++++++++++++++++
>  .../platform/mediatek/aie/mtk_aie_v4l2.c      | 1295 +++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |    3 +
>  include/uapi/linux/mtk_aie_v4l2_controls.h    |  308 +++
>  include/uapi/linux/videodev2.h                |    6 +
>  12 files changed, 5010 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8188-aie.yaml
>  create mode 100644 drivers/media/platform/mediatek/aie/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/aie/Makefile
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie.h
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_drv.c
>  create mode 100644 drivers/media/platform/mediatek/aie/mtk_aie_v4l2.c
>  create mode 100644 include/uapi/linux/mtk_aie_v4l2_controls.h

-- 
Regards,

Laurent Pinchart

