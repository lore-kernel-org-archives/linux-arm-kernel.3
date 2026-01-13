Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FE3D30CC5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 21:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WfgD4hK1A8Fj9bCzDMbU/DIgZ0EcW+APU609mEZFq0=; b=NoC8PYm7ak0Y00k3cM3xnH3GZ4
	ZccOUqpzNOYN+wCkHXLX+HrxSpqAbFNdeuzPEf2wbtlxRpUDUNf9WIf9APKLm0bOBR4iBGnf3jQ0m
	l2QvPEhNM6N1WNIg8BDuR5C+1WDXMXsDpC/g71nQmg31cko5PLlZELuG3XsxzLaN3koGoZtAuiUBj
	ql8pUOn+uMZ/zrW3djcIUmuYyMjzDop8NCmcf115y0BxgeiZd1dZTL9nUk9oeL7V1hRV/rRG0Rphq
	W17kZJoavNUrJNPBvXYCNg4qCCGiKJ/2N3jhwNIkdmvrK466wd0NKGuNbcKX+F9DtoFs6KMuEQLEC
	f/96Z8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfle7-00000007j5Q-3tF7;
	Tue, 13 Jan 2026 21:09:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfle1-00000007j2n-3bMB;
	Tue, 13 Jan 2026 21:09:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6B834449F;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9749AC16AAE;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768338580;
	bh=bpnT3O6925fCbIO7LEjBQ5v1KRFPSfTpegVEiakCJD0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UmUcjW3/+aoQk8xqzuvq+iLy02YrfHgvwKxY9GHiJQO+mb8PDheUKzOjxPm7qxRpZ
	 ECcM1kIqyePnmrJDcvPBhd6ba6IdHr8CrWrgHF6HTkm+RWM97ScThqsuQiKOfFn8Iq
	 QhTqvssEmo433VDVA8Sx6qfrTaW6wP95TJh9lgmEfK9QFcr7wzK6q10556qSTapZjz
	 s56gee+lTe690VwNrpj+7xZMlw3yt1n16Ux0K/InwcDYgOYIgRtPcDvMwMpbAVYn23
	 B3U2bGg/ejldjPVCz0GmLueI54xwRZpG8nYEFY+ppL1od9arDWHyvf0v79TLyPMSlU
	 YAOdd0KlPmrXA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D717D30CC1;
	Tue, 13 Jan 2026 21:09:40 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 13 Jan 2026 22:09:29 +0100
Subject: [PATCH v3 3/3] arm64: defconfig: enable rockchip mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v3-3-16e83aa7f395@collabora.com>
References: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v3-0-16e83aa7f395@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768338578; l=776;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=QSksDylUKmnutOcH6VkgoctKLG7QY5SZKJQtcx8+btA=;
 b=TZP5/JN7UEeBHmB36Zx8QMl5/8DRGEMRJp+5QRGD/cBjjG6u0SUkGsglKuhvpcjX8wgV5nZny
 Cyz2tFJFSdHDxZjLtTOoVOKvIQan69VeNs+Tvu2DthbgVqIEzWSwkw9
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_130941_931979_32C97FBC 
X-CRM114-Status: UNSURE (   9.65  )
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

The Rockchip MIPI CSI-2 Receiver is integrated into recent Rockchip
SoCs, such as the RK3568 and the RK3588.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..898e90b79332 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -896,6 +896,7 @@ CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_ROCKCHIP_CIF=m
+CONFIG_VIDEO_ROCKCHIP_CSI=m
 CONFIG_VIDEO_ROCKCHIP_RGA=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m

-- 
2.39.5



