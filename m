Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8692FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bpcK5Qjhe/tAh2DN8xdikTX3IMR0Jsw2fHaDKM8SIj4=; b=i/lNGBw7Jl3Y1e/3H0nbjCMhuO
	hc2CvP0nQLn0AvdYKHw3gjGeJQD9HEoucoGrPDUXp68NxbYjT9g0XbSUx8nJd9maByQnkp2BpoLl0
	kK8LyEBnoWK2As9IO4KAh5M8mI2wxer5nrTur9iW8g5E4drYPDzsJ05XT8ypkr8/cjkNNu031h8ZD
	vZRUdFUmR38aNY1pDa2vU05bWCloUhBJuYBZiIS9Lb0YX16xBwZe8cHi2PB4SnpUwXaJk9HWTFIar
	EeeKbrLO3w4qQaTAukLP7IEHs+gMwzVSz4NrKh4XTT3RzrYLivECzrPK0y6281ciNnNpuTIxcWxZV
	g3vunepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOr4-0000000Desc-1AH7;
	Wed, 25 Dec 2024 10:43:06 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQOmQ-0000000De8r-3Pae;
	Wed, 25 Dec 2024 10:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=bpcK5
	Qjhe/tAh2DN8xdikTX3IMR0Jsw2fHaDKM8SIj4=; b=Ygryc+bElwnp9afz2vtH+
	K/rojF15MCT8NvJP23Esa1af7s5AsNf0MpJ0rCL64g1vaRHzFV0vWKgypgIRzJKk
	VIbswHTwIz++ACYkXyRYqRu94786OMUt4CH/3sAMY2ABqXdIcXvgrWkjC3R/ghjY
	/dVf/wXX3cgWRVSDx31RM8=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnfIF24GtnkqkWCg--.3201S2;
	Wed, 25 Dec 2024 18:37:46 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: cristian.ciocaltea@collabora.com,
	krzk+dt@kernel.org,
	mripard@kernel.org,
	hjc@rock-chips.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 0/3] Add HDMI support for rk3576
Date: Wed, 25 Dec 2024 18:37:28 +0800
Message-ID: <20241225103741.364597-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgCnfIF24GtnkqkWCg--.3201S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFW3Kr4UZr1UWF4UKr13twb_yoWxKFX_Ka
	4fW345uw18u3WYyasrtw4Iga93Jay2gFWrGF4jgFnrXFWkJr48Xrn3C3yYqa4UZF1Yyrnr
	JF4FqFy8CFZxZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1ZYFtUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMw7AXmdr1DmOeAADs3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_023819_207027_E839B748 
X-CRM114-Status: UNSURE (   7.07  )
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


RK3576 HDMI TX Controller is very similar to that of RK3588, but with
some control bits for IO and interrupts status scattered across different
GRF.

PATCH 1/3 is add platform ctrl callback for IO setting and interrupts
status handing.
PATCH 2/3 ~ 3/3 are add support for rk3576


Andy Yan (3):
  drm/rockchip: dw_hdmi_qp: Add platform ctrl callback
  dt-bindings: display: rockchip: Add support for RK3576 HDMI TX
    Controller
  drm/rockchip: Add basic RK3576 HDMI output support

 .../rockchip/rockchip,rk3588-dw-hdmi-qp.yaml  |   1 +
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 224 +++++++++++++++---
 2 files changed, 196 insertions(+), 29 deletions(-)

-- 
2.34.1


