Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C10D232ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qhxsnG7oHQhHQY/RtF0hhxwdrp2042d1OP3qas3MQFs=; b=NgjiJdY5sAs6r2+2WK05cJ2+0G
	EzxVj9xLarJC8iCJn2ds1FufwZUEnEM6sLvyO9dCKVzoo8mo+VBVvweNkY8foOpLbwXHY0AP+obwI
	6wvXry6sGgE7kMF722m0uinVKsKQ3EeqQ0Kp1P9kizOA4/f6Y2vFxQPNLIlDVVuMUmxt8FT+dMEaJ
	g8jvuAeCcFcBrFPL3NhkPtJncyGxLQgWzAyqa+zV0TdWSBQOF6RNzpzw3rMRRdjOGaHXkV+NlYn1h
	ghIeb3uIuStPe/kCDokDwENHqliVWvXtfIRfm9ctHJkMP3tZbxLw6GcIvHIA+fBuz6069diTmPe17
	tb9Y6jPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7RR-00000001oYm-178u;
	Fri, 09 Jan 2026 08:01:53 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7R7-00000001oNC-3wNN;
	Fri, 09 Jan 2026 08:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qh
	xsnG7oHQhHQY/RtF0hhxwdrp2042d1OP3qas3MQFs=; b=gocwaOuHbVwslHW7cO
	PmHP4h4jSvsNX8ANIEzJ4jpgM6y1YQK4YlCmk0+1k2GzpaOfAkG0TY3s3UJxzZXJ
	igeNEfz3oXY59JZFwuNEvE33S3CNlFSwd4+447xzPOsrJYw8g7BpedkALupUYVCz
	khvlW5wGPMRbjoX8Xl6VvwlTo=
Received: from ProDesk-480.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnzlW4tWBpx1iBFA--.64397S2;
	Fri, 09 Jan 2026 16:01:00 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	dmitry.baryshkov@oss.qualcomm.com
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	hjc@rock-chips.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/5] Add DisplayPort support for rk3576
Date: Fri,  9 Jan 2026 16:00:43 +0800
Message-ID: <20260109080054.228671-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnzlW4tWBpx1iBFA--.64397S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw4rWw1xXw4UCr17Zw4Dtwb_yoWkXFgEka
	4fZryDXa18uasIyFyxJw4fW3sxJw4qgr4kKF15tr1qqFy8A3W8ta4kAa4UJ3W5AF47Zr1f
	CryUXF1kCw13WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnVWlDUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRwPbWlgtby92gAA3c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_000134_556879_7BC7839E 
X-CRM114-Status: UNSURE (   8.59  )
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

From: Andy Yan <andy.yan@rock-chips.com>


The DisplayPort found on RK3576 is very similar to that of RK3588,
but work in qual pixel mode and support for MST.

This patch series aims to add basic display output, not include audio
and MST, which will be the work for the next stage.

Only test with 2 lane standard DP port output now.



Andy Yan (5):
  dt-bindings: display: rockchip: Add rk3576 DisplayPort
  drm/bridge: synopsys: dw-dp: Set pixel mode by platform data
  drm/bridge: synopsys: dw-dp: Make i2s/spdif clk optional
  drm/rockchip: dw_dp: Add DisplayPort support for rk3576
  arm64: dts: rockchip: Add DisplayPort dt node for rk3576

 .../display/rockchip/rockchip,dw-dp.yaml      | 29 +++++++++++++++++--
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 28 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-dp.c       | 12 ++------
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c     | 27 ++++++++++++++---
 include/drm/bridge/dw_dp.h                    |  7 +++++
 5 files changed, 87 insertions(+), 16 deletions(-)

-- 
2.43.0

base-commit: ad939ed1f8108513e84e93da90ad7ea31b56ef87
branch: rk3576-dp-upstream


