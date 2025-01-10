Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17747E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 05:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wmmMWwtp2+Osg5ceMmvZRk6l8KAetPbZ3DFekPGP1Ok=; b=rWJoHe3KC8u3vLPzzUhkD5KBGT
	l/G6NEKY/HxkfN+8yhXpkAZ++HdZzokjn0XHevM84bsMwGEyTVK9bkihwo4n4zTUBehrgxBGErEtg
	IeAn4CGcT1r5AA9ntiKQt4jDpnmN2nrF6rtLqltYkCLeSkypXP6N50AkFZRs5jtZ1M2YhIsc696gD
	YQCMuwR4/Caxe2xkZEeyIXIAEv4mhSAEKlx1v2eeaulSc+O8QPseAGjakhPcLVYqQLh7cVKCmUPYH
	/X5gjPn/N49Rpqq/AcI4DeJjX3nhX8WEiEoiQxHjWjiwbineCjV0uZAJVCS4tDKtcCxv3cT3ch2Yb
	pjBB7fXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7mu-0000000E43z-49ny;
	Fri, 10 Jan 2025 05:42:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW7kT-0000000E3H4-1dUT;
	Fri, 10 Jan 2025 05:39:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6903DA40482;
	Fri, 10 Jan 2025 05:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 895C1C4CED6;
	Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736487595;
	bh=VKVoKeBszJaQBYp+1nP1v5nM4InY/X3cRLrD0IhuQow=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uf3xfszFagXNyWvFS501Rb8G4Fx4zi7/UQcb/+rZOHyCdEV0Bmt/UMMLf2qM1V5YA
	 SqQYB6fROb56BQxC2Enn15QzQ2R3TwfLdu5lsqcAY5YU57x+sIdF+0ZWmd6IebmoCQ
	 G8L6jAWx2Fil1+qRZKd7a/3yJVqCNvJ/0eqfpYFUr7Mku5K5Gx0rR8XB+CWjrUrkvP
	 mJrfH9DnI+6EKruSrxWvqi0D+rkX9+Efypjl1f0bk6RTJuDMq7maKem2TZJsG+axZU
	 iDu0QU6XGhfcGVIyifvEblSCpnhky9y1DjiOAPgegfpKOr+E1NdhkXO2MaTQw3lO6I
	 TI48F+5uyp1eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750AEE77188;
	Fri, 10 Jan 2025 05:39:55 +0000 (UTC)
From: Ao Xu via B4 Relay <devnull+ao.xu.amlogic.com@kernel.org>
Subject: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
Date: Fri, 10 Jan 2025 13:39:50 +0800
Message-Id: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKaygGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0MD3ZSiXN1iE91kS7NkC4ukVFOjVBMloOKCotS0zAqwQdGxtbUAfIW
 dnlgAAAA=
X-Change-ID: 20250110-drm-s4-c96c88be52e4
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ao Xu <ao.xu@amlogic.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736487593; l=2879;
 i=ao.xu@amlogic.com; s=20250103; h=from:subject:message-id;
 bh=VKVoKeBszJaQBYp+1nP1v5nM4InY/X3cRLrD0IhuQow=;
 b=F3Mz88aVHJb35MqlLV7mcSGlYoAXJTxGxcX3PBI2E5jRY346NpbBCGN3qyXahNHofIwyZU18U
 dAo+IgFzxxrA0N4OsXeTdBgstJaxB7XTuHVW16NAqF25UNM4ttlpbOs
X-Developer-Key: i=ao.xu@amlogic.com; a=ed25519;
 pk=c0TSXrwQuL4EhPVf3lJ676U27ax2yfFTqmRoseP/fA8=
X-Endpoint-Received: by B4 Relay for ao.xu@amlogic.com/20250103 with
 auth_id=308
X-Original-From: Ao Xu <ao.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_213957_573651_4B0ACC26 
X-CRM114-Status: GOOD (  12.24  )
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
Reply-To: ao.xu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series adds DRM support for the Amlogic S4-series SoCs.
Compared to the Amlogic G12-series, the S4-series introduces the following changes:

1 The S4-series splits the HIU into three separate components: `sys_ctrl`, `pwr_ctrl`, and `clk_ctrl`.
  As a result, VENC and VCLK drivers are updated with S4-specific compatible strings to accommodate these changes.
2 The S4-series secures access to HDMITX DWC and TOP registers,
  requiring modifications to the driver to handle this new access method.
3 The register addresses for the video1 and video2 planes have been updated in the S4 hardware,
  and the DRM driver has been adapted accordingly.
4 The OSD, VIU, and VPP components remain unchanged and are consistent with the G12-series.

Signed-off-by: Ao Xu <ao.xu@amlogic.com>
---
Ao Xu (11):
      dt-bindings: display: meson-dw-hdmi: Add compatible for S4 HDMI controller
      dt-bindings: display: meson-vpu: Add compatible for S4 display controller
      drm: meson: add S4 compatible for DRM driver
      drm: meson: add primary and overlay plane support for S4
      drm: meson: update VIU and VPP support for S4
      drm: meson: add meson_dw_hdmi support for S4
      drm: meson: change api call parameter
      drm: meson: add hdmitx vmode timing support for S4
      drm: meson: add vpu clk setting for S4
      drm: meson: add CVBS support for S4
      arm64: dts: amlogic: s4: add DRM support [1/1]

 .../bindings/display/amlogic,meson-dw-hdmi.yaml    |    1 +
 .../bindings/display/amlogic,meson-vpu.yaml        |   48 +-
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |   39 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  121 +++
 drivers/gpu/drm/meson/meson_crtc.c                 |   90 +-
 drivers/gpu/drm/meson/meson_drv.c                  |  127 ++-
 drivers/gpu/drm/meson/meson_drv.h                  |    6 +
 drivers/gpu/drm/meson/meson_dw_hdmi.c              |  244 ++++-
 drivers/gpu/drm/meson/meson_dw_hdmi.h              |  126 +++
 drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   10 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   19 +-
 drivers/gpu/drm/meson/meson_overlay.c              |    7 +-
 drivers/gpu/drm/meson/meson_plane.c                |   24 +-
 drivers/gpu/drm/meson/meson_registers.h            |   17 +
 drivers/gpu/drm/meson/meson_vclk.c                 | 1018 ++++++++++++++------
 drivers/gpu/drm/meson/meson_venc.c                 |  346 ++++++-
 drivers/gpu/drm/meson/meson_venc.h                 |    4 +-
 drivers/gpu/drm/meson/meson_viu.c                  |    9 +-
 drivers/gpu/drm/meson/meson_vpp.c                  |   12 +-
 19 files changed, 1865 insertions(+), 403 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250110-drm-s4-c96c88be52e4

Best regards,
-- 
Ao Xu <ao.xu@amlogic.com>



