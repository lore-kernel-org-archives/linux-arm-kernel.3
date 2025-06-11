Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C326BC71135
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QVVizWx/FBPlg2noXvRtNpkaZ/0sF6/DIjCsLDJuRmE=; b=DUv0SkJm+LG3Z1
	QHaIWyNM3IjesDCfy4jl0yxe8TIzLijUwdnV5nQ3Xy+FSjc+5lOillUqi0jk8rp+1ZvJOCeKicWFc
	QJUTuTK72cSNDPjqul3gUUfOPr7sNwvJcu/R4GNYc9SJV0tjw/jlvZx3eTRSUwWges8P8A743HzI8
	pGSruzOiEtID+A2lCiovOSKlAob8ciEjjyr/aWmdnzXNv1WwbSd2rqdOIqMRpgdrCVwSfRPjAUqxV
	iwIFJcu40gNqW76DecuUUFGte2f/cXyUM/ipbPjs3X8+DYIn85U6zQ8qBL9hqIkHmEjXZP1GLXh9o
	HeAGnRE2aqIi8a4TWrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPUOe-0000000Bamn-0Y40;
	Wed, 11 Jun 2025 22:58:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTIw-0000000BOLY-1ErA;
	Wed, 11 Jun 2025 21:48:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749678495;
	bh=XihviUvmfcFQm07eUKUNvugeka6fyRlZ1FLIMhqZAbg=;
	h=From:Subject:Date:To:Cc:From;
	b=CoUP9bxbwIrsYYV8XpPTayPg46oAQOhYgeuguZ/ZtGVms0GRmBL/iLyp7KuilDde7
	 4HfJL+F9TDG4yDzlWguz0QIUNESYA48TLa+4WeClgC07DkejVxpvvZfnDvlMASjzY1
	 y5X7SiO3PTB8/wHPbTXmk182McDOp37uTQSxqAl2hb1VgYld3eQppSVXfgnKbkhLdq
	 O1RKpo4fIyXsAKVpex6u3QVaV9d015BRTkzOhL9ApuQgBj5OADU91FR25fvsrCxdqu
	 hmwrWssy9IWAoHj2t4nKLITJpEuSW6NcGszcHXoXp4puXOb8qJisw6KZlxDzDBhmb3
	 P94iu4FiRPY0A==
Received: from localhost (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6E74F17E105E;
	Wed, 11 Jun 2025 23:48:15 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/3] arm64: dts: rockchip: Fix HDMI output on RK3576
Date: Thu, 12 Jun 2025 00:47:46 +0300
Message-Id: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIL5SWgC/x2MQQqAIBAAvxJ7bmEtUugr0aFyzSWy0Igg/HvSc
 QZmXkgchRP01QuRb0lyhAKqrmDxU1gZxRaGhpqOtFIYt7YzGr3d5XrQyYNMLbnZzmSVgdKdkYv
 +n8OY8wekTPnQYwAAAA==
X-Change-ID: 20250611-rk3576-hdmitx-fix-e030fbdb0d17
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_144818_509904_1E303575 
X-CRM114-Status: UNSURE (   8.81  )
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

Since commit c871a311edf0 ("phy: rockchip: samsung-hdptx: Setup TMDS
char rate via phy_configure_opts_hdmi"), the workaround of passing the
PHY rate from DW HDMI QP bridge driver via phy_set_bus_width() became
partially broken, unless the rate adjustment is done as with RK3588,
i.e. by CCF from VOP2.

Attempting to fix this up at PHY level would not only introduce
additional hacks, but it would also fail to adequately resolve the
display issues that are a consequence of the system CRU limitations.

Therefore, let's proceed with the solution already implemented for
RK3588, that is to make use of the HDMI PHY PLL as a more accurate DCLK
source in VOP2.

It's worth noting a follow-up patch is going to drop the hack from the
bridge driver altogether, while switching to HDMI PHY configuration API
for setting up the TMDS character rate.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (3):
      dt-bindings: display: vop2: Add optional PLL clock property for rk3576
      arm64: dts: rockchip: Enable HDMI PHY clk provider on rk3576
      arm64: dts: rockchip: Add HDMI PHY PLL clock source to VOP2 on rk3576

 .../bindings/display/rockchip/rockchip-vop2.yaml   | 56 +++++++++++++++++-----
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  7 ++-
 2 files changed, 49 insertions(+), 14 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-rk3576-hdmitx-fix-e030fbdb0d17


