Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E216D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkWsnkKCVjMZzH2VkxNPLyQ7JTR/8jtQIzW13xUUaKo=; b=f1PrLr1MuXJGlgLDg8qxOEk9tt
	MpPOwhfpxkMyEBBti4WtaIzQnx5PVLtNpmHy4VAHsq0V7cvDvaJW2kZ7Qahd+3TxGo/J/VA1e9t1t
	x229iUAq+dexVbfCPloa/qkvC0lxcW54bRcSPa/B2xtep/DRX6v6Cg6nPbgRkwEQ0i/VoW1jd/pFF
	tnSYON6Gzg7HJLezOwGHluj2pccAG1yFDEbH0z0jeJSSNqZGLVi/kkM2CZXakXdaRyvIwVOg+PWqI
	CLo2lhBLlp76gsJpCQYI4pgI0zQddQUpXnlsnqe9vJzWeDJwtj80tMPYsSwwFjIV2Rj0wwbK2orRN
	AnDEKKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAku-00000003p6F-0u9F;
	Tue, 20 Jan 2026 12:22:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAko-00000003p0v-1hZR;
	Tue, 20 Jan 2026 12:22:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=nkWsnkKCVjMZzH2VkxNPLyQ7JTR/8jtQIzW13xUUaKo=; b=BFdT+2xeMx5J/Ci4HqMBzYJJ/o
	s33Fc6QbYsJusTXYbzyyDRXareM/nQjZONxkhWNikfRUjYc7B6E10kuKlw6CSHXBu5X8hc9Scmc8K
	6gOeWseYS7zhYysBskD0gz0s0a4EVS22hpQc4yoLgo+1zj4nHZZ2fS9oJdZPlnd+2IcMAwdulhg/C
	zDTzTIkMh9K10BSypVAP4TQ0I5qUI31XPIlwtmh6eWol3jb/XhJuRjfaIj1GxA3edLHdvUosnrVpf
	u2jDvkc62h0Rb3Qeu9QgbyXNLQLe/QhiVHe45nt5B0e9cLXX56bCW8Yn0FArlJLl3K2ocERwo29bY
	AqRWpPTA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAkl-0000000E0fW-0BaS;
	Tue, 20 Jan 2026 12:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F023F443A3;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1ECFC2BCB5;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911751;
	bh=SBMojAQMLBEsq97VBBgUN3ogr+3rX2KzJ0Dl48KhAsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WrapHvxu9wzC6dPh+d2Diu33um8C+StFfh5MJrVUMKJHx0sZtchoh7hfLoDgGjpa1
	 8mHz2LgITw35uFF7Ajq6uP27pqoxElgAAHpZyiHmP5GZ8u74C5U3+C5GjPgBeH+JmN
	 k7SXgBg5+1M5NZ9dJd8P459Z+A1MXkdTMNJNCB2+8VsHd6/sOgqn+79rOt68u5Yg0B
	 RNUjI1vhFCtXtDAhuRl8s/ri2VknucbJ7q+2tOAunD2MF2N3iLtEzMRpCG6NiXVxF7
	 xz/o776+HawJM+cXWt12eAExfMmwB0lJbJDMxWLgsq4R/0xuplyQ7VOkY8gl4BjOuf
	 Lpu/CqdwuH3NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB0AD2ED15;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 20 Jan 2026 13:22:29 +0100
Subject: [PATCH v8 3/3] arm64: defconfig: enable designware mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v8-3-bd1cf5cb9588@collabora.com>
References: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768911749; l=786;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=4/e4J7LessS5jdywMTVpeb4iDs9BMTFRupZRi4shvqg=;
 b=vM+9GvcUuupfbEtXCVYeCqoIhDdyKGXeBgK5EHF4Y7GG0wfQPK5IhDW3ee+Q8DGNb9+HqRDbd
 cXR5vbU9VxTCsLddpvbjSWg4A95nbSX+dQKQNM2sHkwQtLb5lkuN4Pw
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_122235_399160_3BF347E2 
X-CRM114-Status: UNSURE (   9.67  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
recent Rockchip SoCs, such as the RK3568 and the RK3588.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..58bda738819a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -873,6 +873,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.39.5



