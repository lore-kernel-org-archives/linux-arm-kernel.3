Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCC4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 03:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FKRHF1m9vSxG53fGyhmajJ13PLGzPs6jS768SI2ZSR8=; b=qM5+TzkerQBpkOY9Gk90/P1RsQ
	hGCV5xb1cd20Md32tYMXDMzDJ60EEpmqza6wg4QoP2Z//odcKff+mnfJZyJdwcovCPAY/UyKXOCIp
	6/yXfkW/5F3SAB12993fJmOAXdxP4kBwXTowUVR5ixqKbnSxeN6Ik9BfJzILv27f15G3bOH5wx9XC
	foMDsRd6wabVyaCB/MALzkYsAM1W2JKYfmcKPZ9CwUga8GmZiXQ+ptQSzWb00gjTDh9jtp2fXzCLr
	egfPxt9CkP5cAZF6bRIx2wowCPvlF0UUCrYtcn17QqeEgsdJSfTaltDJSuhjXAsdMpdp0iUsabIAc
	CTsHoobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsD8-000000056R0-3cXE;
	Thu, 06 Feb 2025 03:05:50 +0000
Received: from mail-m49207.qiye.163.com ([45.254.49.207])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsBj-000000056Dv-1b2s;
	Thu, 06 Feb 2025 03:04:25 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id a47c7aa7;
	Thu, 6 Feb 2025 11:04:16 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 0/2] Fix label name of hdptxphy for RK3588
Date: Thu,  6 Feb 2025 11:03:28 +0800
Message-Id: <20250206030330.680424-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pPT1ZPSx1LGE1CTxkaSkxWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a94d937235a03a3kunma47c7aa7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OSo6Qhw5TTIJFgkhFS80FS4s
	OhUwFDJVSlVKTEhDQ0pKS05DSExCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS05KNwY+
DKIM-Signature: a=rsa-sha256;
	b=hmxGW/ujnIBUnqOd2kHaYMDkwiyHlXllkRrXoVAfcVaTt2di6w368VAv/rbgQYgiStTbse0vwbnsCirj2+ys8xbVE2KvoLxnz6tRcDmjKBxphES/Vy7oYP8jvlIdEkxLn2PONn/3iqP0ZqLRQ4yqjTKj71s+Duo1Y13l4++fAFg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=FKRHF1m9vSxG53fGyhmajJ13PLGzPs6jS768SI2ZSR8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_190423_950348_ACDE4186 
X-CRM114-Status: UNSURE (   6.07  )
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

Picked from:
https://patchwork.kernel.org/project/linux-rockchip/list/?series=927102

The hdptxphy is a combo transmit-PHY for HDMI2.1 TMDS Link, FRL Link, DP
and eDP Link. Therefore, it is better to name it hdptxphy0 other than
hdptxphy_hdmi0, which will be referenced by both hdmi0 and edp0 nodes.

Damon Ding (2):
  dt-bindings: display: rockchip: Fix label name of hdptxphy for RK3588
    HDMI TX Controller
  arm64: dts: rockchip: Fix label name of hdptxphy for RK3588

 .../bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi                 | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts              | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts     | 2 +-
 .../boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts           | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts                | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts       | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts               | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi           | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts            | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi          | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts              | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts              | 2 +-
 21 files changed, 22 insertions(+), 22 deletions(-)

-- 
2.34.1


