Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97A2D26D9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 19:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVsS978MuYe/97FwEFagAMAlrGhfyNbMmq19/rwIGqQ=; b=tibyVTImXQbnBbRfag3AsdPVjw
	gywcCcx50uqDdMINy87RBHh4CTKQm3ZLUEVcdi1Me3J1X92+CbUy5vwBZPhvfwOLdzgSo7tdzotZz
	ynSiY/sXLeAdb8+E2XYhYZQ4C7HWlN2fM6LVo0DvABoUK8LzBA7mwFpRrtFXy67WEXQecioJlOkD+
	c1fT6anrTEFh0xCTFX++oO7bCJlNXlNJ4n901pkJ4TT6WejjDGc/slvhO7Kbc1TU1VOCykbLeTsyk
	Oh1dbAAHEXLy/j3z10kOUynjvJfw7oQb1/J4t6D48cZXRVXjaOEic2oSVuT7Fgwx4pQqIMAESlJoK
	XGzEUC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWn-00000002xEJ-0qKB;
	Fri, 09 Jan 2026 19:52:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veIWk-00000002xCY-3tpU;
	Fri, 09 Jan 2026 19:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kVsS978MuYe/97FwEFagAMAlrGhfyNbMmq19/rwIGqQ=; b=ecpse9czyHSYvNKEGhmazsT4sf
	81whKJtPJcNAhbxf2B1+Tqsk2uPZuRW4ZH0BbQLjQiQc7mWwI9PbOPdQ0fTyWber9Hj5t/PzSu9o5
	hEiaWMpgs4tTKXqbimYnf03FGLlEFilPENLHVqbJBh+PPFMl8mYQTroe9sOfiPYC6H+Olx1OB5Kcx
	LBZopAOKI1SjYlXYlWtXOZ4kkp3uXWf9Vmu5xWXMPGhnJ4VgvVJEZQQAv7KP6odoC8sjEeV+v1VQP
	nieX0bsDFU2r+orQG2JnqpD9dRM4gIz+XFUbETEaGm9OH7ArNBndEa8o9oEj3GfbjCGvAksTKSoxF
	mvKBy69g==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1veIWh-001fth-VI; Fri, 09 Jan 2026 20:52:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 0/2] arm64: dts: rockchip: Add device tree for the Orange Pi CM5 Base board
Date: Fri,  9 Jan 2026 20:51:52 +0100
Message-ID: <176798831384.3446147.5257388297577204372.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251027215637.20715-1-laurent.pinchart@ideasonboard.com>
References: <20251027215637.20715-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_115206_968682_A6B61847 
X-CRM114-Status: GOOD (  14.44  )
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


On Mon, 27 Oct 2025 23:56:34 +0200, Laurent Pinchart wrote:
> This patch series adds a device tree for the Orange Pi CM5 Base board
> from Xunlong. This is a combination of a compute module and a carrier
> board, so the device tree is split in two files.
> 
> The work is based on a combination of upstream device trees for other
> RK3588-based Orange Pi boards and the downstream device tree, all
> checked against the available schematics for the carrier board. The
> compute module schematics is unfortunately not available.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add Orange Pi CM5 Base
      commit: 5d719a4703566267492129d13516d87066f288f8
[2/2] arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base device tree
      commit: 3cdaec4d5e8c24ce3298c93bac80c31820b91aff

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

