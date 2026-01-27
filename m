Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59D1CA6CAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 08:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jTEm6+o3ZBF+dtEEJ4njmId5nlsE3K088ZGt13ks5LI=; b=JcMojjNoCxdltg
	wrTbUrGG9CBekMVf2YJgtadT0fONafC7s+Va4eLAkcNjTHUBQXv+XYlpyc4iXs/DYPdfqxSqs6oQa
	L8ozau+WEpH5lJ40EVK1GBeym65+CaY+CrS8FUZJBjWmBawYBGFIFACISo/MH1Jbo5dQUpHG9kM5F
	647sfxNQcw8KtdSEmUowQ3HIYQP7ZC6GaWquWOPt4GXrehZp2qeDEGAaUagLiVfLMa3tZBmX5tKOS
	V7tg1yuBpRO4j2sdS6V3DBYXzoeXEjQnNlQtfeVckCzA20f/Il1gDPj5JvfPNDIUs8oXBpviPuAzD
	mSvtw/O7gdGiVyRRzecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeht-0000000DrE4-2eQw;
	Tue, 27 Jan 2026 08:45:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkehm-0000000Dr9i-1Uey;
	Tue, 27 Jan 2026 08:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769503542;
	bh=Sm+4IO6rfNW6wX0bfm0/pCANgh/VUYXmG9+RzW4wfkM=;
	h=From:Subject:Date:To:Cc:From;
	b=Dmddm2x+jQmiTOsL6VtA5tC4tAn3qIj7JDrS2J7KxEZLA6n/pz4C9Lgtpi4oyaJmm
	 WNmVk/RRokkn5xBM8HyS3uNvuvzg6cirbFmJRRjbZmqHdzAD5CqBWvtH8pCZa/L+7x
	 Zpeh1qGa35GZIX/A1POtcHw3scufRZh9aPNZOLC9ObcSflZLeHNLwnDieukpmfN/1d
	 PoQQnKSXJNXuYeKUS7oaF3/YqC4l57PMUZxmGdK4pQl30aCTeyT4Di40XtWkAvID6X
	 Aiga66duZ4PIi/kwWkxB4FgaY5urcfUNmRym6gu3EmH3xp+DoxjCLkbgl6LiAZ7Ybb
	 6G7Gk7l5GSdIg==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B22217E12E5;
	Tue, 27 Jan 2026 09:45:42 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v5 0/4] Introduce BACKGROUND_COLOR DRM CRTC property
Date: Tue, 27 Jan 2026 10:45:32 +0200
Message-Id: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Q3WoDIRAF4FcJXtfgjCtqr/oepRfjrCaSH4Nbp
 CXsu9dNIYFsLs+B+TjMVUyx5jiJ981V1NjylMu5B/O2Ebyn8y7KPPYsUKFRDr2sB22ck2HH5Vi
 qZCAbPBllA4t+dKkx5Z8b+PnV8z5P36X+3vwGS/tPeYXPVAOpZBq9HZOH0fn00fsjhVJpy+UkF
 q7hnQAFekVgJ9AwawcqkONXhH4QAG5F6E4QMnvlB3SRXhHDg0BY/aQNy4qUANBGssY+E/M8/wE
 DAOo6eQEAAA==
X-Change-ID: 20250829-rk3588-bgcolor-c1a7b9a507bc
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_004546_558063_7BB73918 
X-CRM114-Status: GOOD (  17.99  )
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

Some display controllers can be hardware-configured to present non-black
colors for pixels which are not covered by any plane (or are exposed
through transparent regions of higher planes).

The 1st patch of the series provides DIV_ROUND_CLOSEST() to uapi, as a
prerequisite to the 2nd patch introducing the BACKGROUND_COLOR DRM
property that can be attached to a CRTC via a dedicated helper function.
A 64-bit ARGB color value format is also defined and can be manipulated
with the help of a few utility macros.

Note this is a reworked version of the patch [1] submitted (many) years
ago by Matt Roper.  The main changes are:

* Renamed DRM_ARGB_<COMP>() to DRM_ARGB64_GET<C>_BPC() while providing
  convenience wrappers to extract all 16 bits of a specific color via
  DRM_ARGB64_GET<C>()
* Replaced drm_argb() function with DRM_ARGB64_PREP_BPC() macro, to
  improve uAPI consistency and readability; additionally fixed a bug in
  case of using bpc < 16: the unused least-significant bits of a given
  component in the output value would contain the unused
  most-significant bits of the following component in the input value,
  instead of being set to 0
* Replaced GENMASK_ULL(63, 0) with U64_MAX when calling
  drm_property_create_range() to create the BACKGROUND_COLOR property
* Moved crtc_state->bgcolor initialization from
  __drm_atomic_helper_crtc_reset() to
  __drm_atomic_helper_crtc_state_reset()
* Replaced '*bgcolor*' occurrences to '*background_color*' for
  consistency with the actual property name in both storage field and
  helper functions names

The subsequent patches add background color support to VKMS and the VOP2
display controller used in the RK3568, RK3576, and RK3588 Rockchip SoC
families.

The validation has been done using a dedicated IGT test [2] - see the
reported results below.

On the userland side, a Weston merge request [3] is available, providing
support for the BACKGROUND_COLOR CRTC property to the DRM backend.  It
relies on the already existing background-color setting in weston.ini:

  [shell]
  background-color=0xAARRGGBB

[1] https://lore.kernel.org/all/20190930224707.14904-2-matthew.d.roper@intel.com/
[2] https://lore.kernel.org/all/20251219-crtc-bgcolor-v3-1-31b589911588@collabora.com/
[3] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1845

IGT kms_crtc_background_color test results
==========================================

* VKMS

virtme-ng$ IGT_FORCE_DRIVER=vkms build/tests/kms_crtc_background_color

IGT-Version: 2.3-g6b07138e8 (x86_64) (Linux: 6.19.0-rc1-virtme x86_64)
Using IGT_SRANDOM=1766149634 for randomisation
Opened device: /dev/dri/card0
Starting subtest: background-color-red
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.071s)
Subtest background-color-red: SUCCESS (0.073s)
Starting subtest: background-color-green
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.074s)
Subtest background-color-green: SUCCESS (0.074s)
Starting subtest: background-color-blue
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.074s)
Subtest background-color-blue: SUCCESS (0.074s)
Starting subtest: background-color-yellow
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-yellow: SUCCESS (0.073s)
Starting subtest: background-color-purple
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-purple: SUCCESS (0.074s)
Starting subtest: background-color-cyan
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.074s)
Subtest background-color-cyan: SUCCESS (0.074s)
Starting subtest: background-color-black
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.072s)
Subtest background-color-black: SUCCESS (0.072s)
Starting subtest: background-color-white
Starting dynamic subtest: pipe-A-Virtual-1
Dynamic subtest pipe-A-Virtual-1: SUCCESS (0.073s)
Subtest background-color-white: SUCCESS (0.074s)

* Radxa ROCK 5B (RK3588)

rock5b$ build/tests/kms_crtc_background_color --device drm:/dev/dri/card1

IGT-Version: 2.2-g3e4ec308e (aarch64) (Linux: 6.18.0-rc1 aarch64)
Using IGT_SRANDOM=1762774806 for randomisation
Opened device: /dev/dri/card1
Starting subtest: background-color-red
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.491s)
Subtest background-color-red: SUCCESS (0.493s)
Starting subtest: background-color-green
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.533s)
Subtest background-color-green: SUCCESS (0.535s)
Starting subtest: background-color-blue
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.541s)
Subtest background-color-blue: SUCCESS (0.544s)
Starting subtest: background-color-yellow
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.535s)
Subtest background-color-yellow: SUCCESS (0.537s)
Starting subtest: background-color-purple
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.536s)
Subtest background-color-purple: SUCCESS (0.538s)
Starting subtest: background-color-cyan
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.539s)
Subtest background-color-cyan: SUCCESS (0.541s)
Starting subtest: background-color-black
Starting dynamic subtest: pipe-C-DP-1
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Warning on condition all_zero in function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Warning on condition all_zero in function crc_sanity_checks, file ../lib/igt_pipe_crc.c:475
(kms_crtc_background_color:744) igt_pipe_crc-WARNING: Suspicious CRC: All values are 0.
Dynamic subtest pipe-C-DP-1: SUCCESS (0.535s)
Subtest background-color-black: SUCCESS (0.537s)
Starting subtest: background-color-white
Starting dynamic subtest: pipe-C-DP-1
Dynamic subtest pipe-C-DP-1: SUCCESS (0.540s)
Subtest background-color-white: SUCCESS (0.542s)

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v5:
- Collected Reviewed-by & Tested-by tags from Nícolas & Diederik
- Dumped background_color prop value in drm_atomic_crtc_print_state()
  and updated comment in drm_crtc_state (Nícolas)
- Documented the reasons of not using the DRM_ARGB64_GET*_BPC() helpers
  in vop2 related patch (Nícolas)
- Rebased series onto latest drm-misc-next
- Link to v4: https://lore.kernel.org/r/20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com

Changes in v4:
- Switched to simple bit-shifting approach when performing the bpc
  conversion in the vop2 driver, to avoid the expensive division since
  we shouldn't be concerned anymore about the precision (Chaoyi)
- Rebased series onto latest drm-misc-next
- Link to v3: https://lore.kernel.org/r/20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com

Changes in v3:
- Added new patches:
  * uapi: Provide DIV_ROUND_CLOSEST()
  * drm/vkms: Support setting custom background color
- Improved DRM_ARGB64_{PREP|GET}*() helpers by using a conversion ratio
  for better color approximation when dealing with less than 16 bits of
  precision
- Mentioned the IGT test in the cover letter while documenting the
  validation results; also dropped references to the now useless
  modetest wrapper script and its generated report
- Rebased series onto latest drm-misc-next
- Link to v2: https://lore.kernel.org/r/20251013-rk3588-bgcolor-v2-0-25cc3810ba8c@collabora.com

Changes in v2:
- Improved uAPI consistency and readability by introducing
  DRM_ARGB64_PREP*() and DRM_ARGB64_GET*() helper macros
- Updated several code comment sections
- Referenced the counterpart Weston support in the cover letter
- Rebased series onto v6.18-rc1
- Link to v1: https://lore.kernel.org/r/20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com

---
Cristian Ciocaltea (4):
      uapi: Provide DIV_ROUND_CLOSEST()
      drm: Add CRTC background color property
      drm/vkms: Support setting custom background color
      drm/rockchip: vop2: Support setting custom background color

 drivers/gpu/drm/drm_atomic.c                 |  1 +
 drivers/gpu/drm/drm_atomic_state_helper.c    |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c            |  4 ++
 drivers/gpu/drm/drm_blend.c                  | 39 ++++++++++++++--
 drivers/gpu/drm/drm_mode_config.c            |  6 +++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 17 ++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++
 drivers/gpu/drm/vkms/vkms_composer.c         | 10 ++++-
 drivers/gpu/drm/vkms/vkms_crtc.c             |  3 ++
 include/drm/drm_blend.h                      |  4 +-
 include/drm/drm_crtc.h                       | 12 +++++
 include/drm/drm_mode_config.h                |  5 +++
 include/linux/math.h                         | 18 +-------
 include/uapi/drm/drm_mode.h                  | 67 ++++++++++++++++++++++++++++
 include/uapi/linux/const.h                   | 17 +++++++
 15 files changed, 183 insertions(+), 25 deletions(-)
---
base-commit: 68e28facbc8ab3e701e1814323d397a75b400865
change-id: 20250829-rk3588-bgcolor-c1a7b9a507bc


