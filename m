Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E8CE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 12:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pg0UfV4prOtW7FOVVRBO2lYE1N8dbmghRAassomDga4=; b=hNkeF8JHbhaFXmBMHNoPMK+SiO
	meqk9unkIDxSv/K9ASd7aorOv0vTPUUeqx4QP8ZlL9kkNn9333YjB1idmAGM3LmnbG/L5cYGREBmj
	V6kqlCzxPx6oqXiQ9lgyJv2mCK6kPUPMrjJ+ySigndaHDS2y4u340FPhvJYxg6xDvsuVkZce/a4yX
	m0TU8zOKDHtcA7yBjKAA3QDGqBQ0+zjFBlpIZ8xoLLttj9Zb9RHrd8s9VKyBRM7gqIlSvpxltZOWV
	MQsGiLeGO9nwN7QHrTZzOa/nSw3b7LKNr5XpStVbyfNAubufCQet0X3E5qvex2m5Knn5JB2GWA5Td
	O5wVMSrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVsH-00000001rC4-2tAG;
	Sat, 28 Dec 2024 12:24:57 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRVpu-00000001qW7-0AIx;
	Sat, 28 Dec 2024 12:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=pg0Uf
	V4prOtW7FOVVRBO2lYE1N8dbmghRAassomDga4=; b=qexrkZEusg4KCK0enN78K
	lKGA/JWbFrg2ilT+tJURad/pplmnwho3fjtHix1oL37TuqTn8j2vaJ0OYdG78hnU
	Xd0RTFUwJ/YSLowBq5j8T2jwhqhK241PfwdVOCb4mXR0gQ/bxdnIXP0glidgIIkg
	rsgUvNnGkCsPffIp6I62Gs=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3t0tl7W9nUxdCCQ--.1009S5;
	Sat, 28 Dec 2024 20:22:05 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	krzk+dt@kernel.org,
	joro@8bytes.org
Cc: cl@rock-chips.com,
	robh@kernel.org,
	hjc@rock-chips.com,
	vkoul@kernel.org,
	devicetree@vger.kernel.org,
	detlev.casanova@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 3/8] dt-bindings: display: rockchip: Add rk3576 hdmi controller
Date: Sat, 28 Dec 2024 20:21:46 +0800
Message-ID: <20241228122155.646957-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241228122155.646957-1-andyshrk@163.com>
References: <20241228122155.646957-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3t0tl7W9nUxdCCQ--.1009S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW3Kr4UZr1UWF4UKF1ftFb_yoWDXrbEqa
	4xZ3Z8ZFs5Zr1Y9w1DJ397Wws8Ja17KF4kGa1UAF4DJa4kKrZYqr95G343KFykAF17uFyx
	CFn5XrWUG3ZxJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUndb1UUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRPDXmdv5wS0uAACsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_042230_477377_EFD6A4CD 
X-CRM114-Status: UNSURE (   6.27  )
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

RK3576 HDMI TX Controller is very similar to that of RK3588, but
with some control bits for IO and interrupts status scattered across
different GRF.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 .../bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
index d8e761865f27..b838b5ec2dca 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
@@ -29,6 +29,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - rockchip,rk3576-dw-hdmi-qp
       - rockchip,rk3588-dw-hdmi-qp
 
   reg:
-- 
2.34.1


