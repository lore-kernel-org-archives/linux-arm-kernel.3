Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126E9C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C8lPyp1bEijzK7iT320e9XZGAhLFEPTQgrUvk5jBPAI=; b=ulbdrTzNqs0bIzB51ejVdxK7g3
	AZmkaGNRQ5jV2erSB34Fw4PQIQVCoTkssGcPcjb1QgKkT7v8+BzcOUq5lpgaIsWdWhIRST8xOfXFj
	PuOOlCbrWTr+P8DMX5mvhCfUBo0Kz+uBvynygi9A68dnvUJhRO6ESh3L8PmOW5QPvXty6s7X15iaF
	02bHxQ3S+BVF7W9OhlA01OlfgPXVXfe+YE94KVFtRF7893kVDWkC7Yyfj//AMd+/1nEc8kazlAkb9
	wpIQ9Tm3IWa7dI0IXmmHV3Tsq5is9WiwteQ2oZV7R3AOfu4jo0nx5DuhQOwlI7D9YYSfaguA9Njnd
	/QBR2bew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thccc-00000001jaO-1Emp;
	Mon, 10 Feb 2025 22:51:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKg-00000001fOm-1RSG;
	Mon, 10 Feb 2025 22:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=C8lPyp1bEijzK7iT320e9XZGAhLFEPTQgrUvk5jBPAI=; b=B34PleApPp/eAdlUoeGhn0KRYW
	FGXQPmoA0+5G+Poo1XzC7DAZKy/+fO9m07jAsoNZEGjMKkqkcf51YO6OwozQ2h5+/UmdoBZocLr4T
	DTncu0PmBXraUi9BSLbPdi/dtvRynn+vo+xtFxODMjtMMMu2T0tvf5ja/11cCRplfQll7WkcXE+VM
	IGVjD1nnXAsGP0o1gFhrmbSmpVz5NHVCRDMNSi9bDF97tWDU4Wwj3VBRC35YRK8OD+6HIMA8fZGP5
	QJSx6d3ily/RZQIrRMAInsxzf9ZTfEr3XswXPO3/ec4EuL2xGPpYpvXERkMJ+mnapRGGK1iSf1AxS
	wO2ogbeQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcKa-00000000K5i-2GIN;
	Mon, 10 Feb 2025 22:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=C8lPyp1bEijzK7iT320e9XZGAhLFEPTQgrUvk5jBPAI=; b=XrtwWuMN8Z4GIiO8gWleFph/yS
	X0hzAGiFktxhcaEJt+715qRAKJgVlmjTxczfJhIkNBNCc+bBkkE23r2zvgQAKItF8Ux/O81KFa6bS
	t3hATFSJqaRmD7vb9ysVTT4mzlBCkk+x8qYyA0a8ezxf1h4BXryu3JF3CwcoqHWHlos1PUOPL7G//
	Ycu4ysmvKpEBwWw1CNWHEBAwv2vgiBHaopa+BNSF7Oy9qUzh0l3Rimkek+Vuh3LAY1u6UAhkD4l+v
	xDLvp0Y/aTarSqipIT8wjo4We1WZ7sYwNz+icQgV73J9S/pHknDdfE4yoyBCUQgCMmxRcIP5SMirG
	AV77aziQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKX-0008Cw-Op; Mon, 10 Feb 2025 23:32:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH v2 0/6] RK3576 OTP support
Date: Mon, 10 Feb 2025 23:32:06 +0100
Message-ID: <20250210223219.1193346-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_223245_147848_A35D8B63 
X-CRM114-Status: GOOD (  12.31  )
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

This enables OTP support in the nvmem driver for rk3576.

I expect to pick the clock patch (patch1) and the arm64-dts patch (patch6)
myself, after the nvmem-driver and -binding patches have been applied
(patches 2-5).

But kept them together for people wanting to try this series.

changes in v2:
- fix register constant in clock definition (Diederik)
- add patch to set limits on variant-specific clock-names
- use correct limits for clocks + resets on rk3576 binding

Heiko Stuebner (6):
  clk: rockchip: rk3576: define clk_otp_phy_g
  nvmem: rockchip-otp: Move read-offset into variant-data
  dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
  dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
  nvmem: rockchip-otp: add rk3576 variant data
  arm64: dts: rockchip: add rk3576 otp node

 .../bindings/nvmem/rockchip,otp.yaml          | 25 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 39 +++++++++++++++++++
 drivers/clk/rockchip/clk-rk3576.c             |  2 +
 drivers/nvmem/rockchip-otp.c                  | 17 +++++++-
 4 files changed, 81 insertions(+), 2 deletions(-)

-- 
2.47.2


