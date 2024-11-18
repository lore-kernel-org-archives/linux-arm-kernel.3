Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3B7D49205
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47iFh3tfkgECfVJKt/+cxY/OBjKv360lFRzQds+gTIs=; b=KLcOmzAJD9sbutzCpiyLUMsHP4
	GmWFfcXEykGvN6jcDzyRw5OXOdqaOCr8AHVnJivijFRJHxb8ziyeSajzQ5JrYe22F8BxF9nT8i9Yn
	nxiZj7X75AWHBDOINRbz0oRvKX4oYrQY8Zno+4aJQOzbf/jM34iY6OETcysz9oqchWiftecvFikit
	vh2+O0mmNo6EDO8mUG47ez1WWJGpVoR0sejUDxrDsAr7ljmv8M3CryZtMwjC9W0IAL1ziicos4XHy
	oYzyB3srzQhE82MBMyw80byi/P6Gy/uR6CtnRdBH1BLRDrps5YIg10w4+bLGkfuuKmkq8Ch2cZqJy
	IJyrYTcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyZr-00000008zg1-2huj;
	Mon, 18 Nov 2024 10:01:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyYs-00000008zVT-0HQV;
	Mon, 18 Nov 2024 10:00:54 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C333B5B3;
	Mon, 18 Nov 2024 11:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731924032;
	bh=jkPR4Kt9JiPbGFeygxRhst2pg8qwoxgS332CjCC2qS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMqNyWbzBKi1a1biVT1taieKIO9CoVgiOXzX2QqeM3IoMu0YU8dTopXPfgmwORWQA
	 rvfDbWCSgD91xxwU4AQeNtK0O063Ko8+LJMshfd94zJa70hg/JzZmY7iiM+nXD+RtR
	 O/Z+oAAExLkYDV4JbQvjq9/RWOligt6bHfjeouIk=
Date: Mon, 18 Nov 2024 12:00:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian Konig <christian.koenig@amd.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	yaya.chang@mediatek.com, teddy.chen@mediatek.com,
	hidenorik@chromium.org, yunkec@chromium.org,
	shun-yi.wang@mediatek.com
Subject: Re: [PATCH v1 00/10] Add MediaTek ISP7 camera system driver
Message-ID: <20241118100039.GB30268@pendragon.ideasonboard.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_020050_244284_B40486A6 
X-CRM114-Status: GOOD (  19.15  )
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

Hi Shu-hsiang,

On Wed, Oct 09, 2024 at 07:15:41PM +0800, Shu-hsiang Yang wrote:
> Based on linux-next/master, tag: next-20241008
> 
> The patch set adds the MediaTek ISP7.x camera system hardware driver.
> 
> This driver sets up ISP hardware, handles interrupts, and initializes
> V4L2 device nodes and functions. Moreover, implement V4L2 standard
> video driver that utilizes media framework APIs. It also connects
> the sensors and ISP, bridging with the seninf interface. Communicate
> with SCP co-processor to compose ISP registers in the firmware.
> 
> These patches include CSI received data from sensors, sensor interface
> bridge, raw/YUV image pre-processing, ISP utility and ISP control parts.
> 
> Thank you for reviewing these patches.

Could you please include the v4l2-compliance report for the driver in
the cover letter of the next version ? This is required for all new
drivers. Please use the very latest version of v4l2-compliance, compiled
from the master branch of v4l-utils.

> Shu-hsiang Yang (10):
>   dt-bindings: media: mediatek: add camsys device
>   media: platform: mediatek: add seninf controller
>   media: platform: mediatek: add isp_7x seninf unit
>   media: platform: mediatek: add isp_7x cam-raw unit
>   media: platform: mediatek: add isp_7x camsys unit
>   media: platform: mediatek: add isp_7x utility
>   media: platform: mediatek: add isp_7x video ops
>   media: platform: mediatek: add isp_7x state ctrl
>   media: platform: mediatek: add isp_7x build config
>   uapi: linux: add mediatek isp_7x camsys user api
> 
>  .../media/mediatek/mediatek,cam-raw.yaml      |  169 +
>  .../media/mediatek/mediatek,cam-yuv.yaml      |  148 +
>  .../media/mediatek/mediatek,camisp.yaml       |   71 +
>  .../media/mediatek/mediatek,seninf-core.yaml  |  106 +
>  .../media/mediatek/mediatek,seninf.yaml       |   88 +
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    2 +
>  drivers/media/platform/mediatek/isp/Kconfig   |   21 +
>  .../platform/mediatek/isp/isp_7x/Makefile     |    7 +
>  .../mediatek/isp/isp_7x/camsys/Makefile       |   16 +
>  .../isp_7x/camsys/kd_imgsensor_define_v4l2.h  |   87 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c | 1797 ++++++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h |  140 +
>  .../isp/isp_7x/camsys/mtk_cam-debug.c         | 1271 ++++
>  .../isp/isp_7x/camsys/mtk_cam-debug.h         |  273 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-defs.h |  168 +
>  .../isp/isp_7x/camsys/mtk_cam-dmadbg.h        |  721 +++
>  .../isp/isp_7x/camsys/mtk_cam-feature.c       |   40 +
>  .../isp/isp_7x/camsys/mtk_cam-feature.h       |   26 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h  |   87 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h  |  233 +
>  .../isp/isp_7x/camsys/mtk_cam-meta-mt8188.h   | 2436 ++++++++
>  .../isp/isp_7x/camsys/mtk_cam-plat-util.c     |  207 +
>  .../isp/isp_7x/camsys/mtk_cam-plat-util.h     |   16 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.c |  393 ++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.h |   28 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.c  | 5359 +++++++++++++++++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.h  |  325 +
>  .../isp/isp_7x/camsys/mtk_cam-raw_debug.c     |  403 ++
>  .../isp/isp_7x/camsys/mtk_cam-raw_debug.h     |   39 +
>  .../isp/isp_7x/camsys/mtk_cam-regs-mt8188.h   |  382 ++
>  .../isp/isp_7x/camsys/mtk_cam-seninf-def.h    |  193 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-drv.c    | 1741 ++++++
>  .../isp/isp_7x/camsys/mtk_cam-seninf-drv.h    |   16 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-hw.h     |  120 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-if.h     |   28 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-regs.h   |   40 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-route.c  |  356 ++
>  .../isp/isp_7x/camsys/mtk_cam-seninf-route.h  |   23 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf.h        |  170 +
>  .../isp/isp_7x/camsys/mtk_cam-timesync.c      |  125 +
>  .../isp/isp_7x/camsys/mtk_cam-timesync.h      |   12 +
>  .../isp/isp_7x/camsys/mtk_cam-ufbc-def.h      |   59 +
>  .../isp/isp_7x/camsys/mtk_cam-video.c         | 1817 ++++++
>  .../isp/isp_7x/camsys/mtk_cam-video.h         |  224 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam.c      | 4168 +++++++++++++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam.h      |  733 +++
>  .../isp_7x/camsys/mtk_camera-v4l2-controls.h  |   65 +
>  .../isp_7x/camsys/mtk_csi_phy_2_0/Makefile    |    5 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h   |  911 +++
>  .../mtk_cam-seninf-csi0-cphy.h                |   69 +
>  .../mtk_cam-seninf-csi0-dphy.h                |  139 +
>  .../mtk_cam-seninf-hw_phy_2_0.c               | 2879 +++++++++
>  .../mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h  |  257 +
>  .../mtk_cam-seninf-seninf1-csi2.h             |  415 ++
>  .../mtk_cam-seninf-seninf1-mux.h              |  147 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h  |   47 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h      |   49 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h |   99 +
>  include/uapi/linux/mtkisp_camsys.h            |  227 +
>  60 files changed, 30194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml
>  create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-defs.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-dmadbg.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-feature.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-feature.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-meta-mt8188.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-regs-mt8188.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ufbc-def.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
>  create mode 100644 include/uapi/linux/mtkisp_camsys.h

-- 
Regards,

Laurent Pinchart

