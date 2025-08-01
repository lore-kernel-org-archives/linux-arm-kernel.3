Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13385C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E+cl2IDaMY20eY/Exe5SGnYzjiyN45MuL0dq0Zp03p0=; b=UNN99ItvaGGjdT6LkTy3e5U9J/
	ZjEM+SOimKYPrUjpli23+A3UjvLWpVAOIbia9aeEqtBMb8rCLwZpajexpH3D6lsNXUmDxMJ0XGlLh
	vyxfz4anpzv+eCMxPjApf2kpNzu5+UMOsrmBbbC9DftsBtYSm+0RUOeSByChexLIp2k7B/EkT9Col
	eeIbbRscGnRiOepiChc6fbmnkninU5+NWbVRXs1KjnLcZkzGFQZPFBYdQtHfDbhPyLqaYUIX73LTR
	AZ++ZRPnekrBsqKTuaQrhdnMjMubB7qHI7H3C3SHD0eMEeScB5XpOuq4OG0xk1fm/LKCGvlEEx+Uc
	wqpv5cpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhm8N-00000005NKj-0F9J;
	Fri, 01 Aug 2025 09:33:03 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhm3S-00000005MeM-2ZPt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 09:27:59 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-455f79a2a16so20044545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 02:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754040476; x=1754645276; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E+cl2IDaMY20eY/Exe5SGnYzjiyN45MuL0dq0Zp03p0=;
        b=s2P5BZfJv5GXeJdITId5IMbZBE8BmGSJHVCUXv8BHdiPcmD/SNG4R53aSJAFXttK2H
         PI0vzQMDqq5wuBcfJL5v6mb2KnerRhAJpVyJB7AHxWvA7uNQMlZ6Cssn+kA876u/BsD8
         xcVgX0gtridmh2mM650A3/n/SEyEVtIwu5AHwIag1RIjjHFWSbqHZdKLbRZ2q5RKsurH
         zuDgqL1cIjKxBWzZFWBE8KBE060/atWtjSPouAyfTC8b1dNiX7Y6gSSFYxb15DG3SE4O
         iWa9VFdT2dc+WtRF2kM0u+N84whmPZ55GIUH6HsL7SKzkxRQtYzRJ4Q0aPb2sWg2L5Yl
         7vEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754040476; x=1754645276;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+cl2IDaMY20eY/Exe5SGnYzjiyN45MuL0dq0Zp03p0=;
        b=PevWZWh+sze0vb7Jm3THtYurfrjpWKfKblzjMZUv8kUrh6alARfVt14bUIdwKadyzS
         CFT7v1BCpaN9fKZzhwowc0/T61t/hYfYILtHCVJKe3py7bpn49X15fM+HHEMSFfuVBpZ
         uwac93eOSxkyTFChR5ZNPJYOF3V3DwvR5Tbh1F3T1wuh1qkJS3nO+0RTNG41Y1G0cntE
         zEMw3yBsxRSyzW5mS9hdbP/23oKOM6LKvEpANTuytz2H54L671esNI2oOVteDgxytAOR
         ozrTqlgJVRomImGI7ZDeRMGT7gdUCnfB0XmktTIDd4BFwMGbHZZAk3/5cL/tJb+tVLml
         cgsA==
X-Forwarded-Encrypted: i=1; AJvYcCUz6Z5VKY5tkFjxY983MCHXuZu5R6Bp+VCq+aLOcqrSDb3KXDirRuPzGFO9NyYWbG2WMIASA/9ZXo7HiwFGItTm@lists.infradead.org
X-Gm-Message-State: AOJu0YzbqgugzgiLzG6hdWwIgh6pjtC6VJj9eN0hPhIENHrILCNMiKFB
	t+lHStteWWG+tKQoi8xe1yG4APPnplDejWfxkO2Qb5PBPNFi6pXnBQA37+WewtM+8p/ckSWRlrv
	m9DxdrpskTAkg6JNHJQ==
X-Google-Smtp-Source: AGHT+IF1iql6p9ZiBFX2YHY0VuHnMfPg0tt54Mz6D7ndvI/Hg7HtnMzULqTKeUWs76Q9xfAXEqpzcIP6cwznc6Q=
X-Received: from wmbei11.prod.google.com ([2002:a05:600c:3f0b:b0:456:217f:2625])
 (user=verhaegen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8812:b0:456:2397:817 with SMTP id 5b1f17b1804b1-458930ecbccmr68523175e9.13.1754040476070;
 Fri, 01 Aug 2025 02:27:56 -0700 (PDT)
Date: Fri,  1 Aug 2025 10:27:13 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250801092720.1845282-1-verhaegen@google.com>
Subject: [PATCH v4 0/3] ALSA: compress_offload: Add 64-bit safe timestamp API
From: Joris Verhaegen <verhaegen@google.com>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Joris Verhaegen <verhaegen@google.com>, kernel-team@android.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_022758_651909_AB79DA04 
X-CRM114-Status: GOOD (  15.53  )
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

The current compress offload timestamping API relies on struct
snd_compr_tstamp, whose cumulative counters like copied_total are
defined as __u32. On long-running high-resolution audio streams, these
32-bit counters can overflow, causing incorrect availability
calculations.

This patch series transitions to a 64-bit safe API to solve the problem
while maintaining perfect backward compatibility with the existing UAPI.
The pointer operation is reworked to use a new timestamp struct with
64-bit fields for the cumulative counters, named snd_compr_tstamp64.
ASoC drivers are updated to use the 64-bit structures. Corresponding
ioctls are added to expose them to user-space.

The series is structured as follows:

Patch 1: Updates the pointer op, refactors the core logic and ASoC
drivers to use it, and defines the new UAPI structs.

Patch 2: Exposes the SNDRV_COMPRESS_TSTAMP64 ioctl.

Patch 3: Exposes the corresponding SNDRV_COMPRESS_AVAIL64 ioctl.

This series has been tested on a Pixel 9 device. All compress offload
use cases, including long-running playback, were verified to work
correctly with the new 64-bit API.

Thanks,
Joris (George) Verhaegen

Signed-off-by: Joris Verhaegen <verhaegen@google.com>

---
Changes in v2:
  - Corrected author and Signed-off-by to be consistent (Mark Brown).
Changes in v3:
  - Rework pointer op to return 64-bit timestamp, rather than adding a
    parallel pointer64 op (Charles Keepax, Takashi Iwai, Vinod Koul)
  - Bump the protocol version for ABI change (Takashi Iwai)
  -Fix linker error on Intel Atom (lkp@intel.com)
  -Rebase on latest for-next sound tree (Takashi Iwai)
  -Avoid changing return error code for ioctl (internal)
  -ASoC: Replace u64 % u32 by do_div(u64, u32) (internal)
  -ASoC: sprd: change current_data_offset to u64 (internal)
Changes in v4:
  -Fix compiler error on Intel AVS (lkp@intel.com)

Joris Verhaegen (3):
  ALSA: compress_offload: Add 64-bit safe timestamp infrastructure
  ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64 ioctl
  ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl

 include/sound/compress_driver.h               |   2 +-
 include/sound/soc-component.h                 |   4 +-
 include/sound/soc-dai.h                       |   7 +-
 include/uapi/sound/compress_offload.h         |  35 +++++-
 sound/core/compress_offload.c                 | 100 ++++++++++++------
 sound/soc/codecs/wm_adsp.c                    |   4 +-
 sound/soc/codecs/wm_adsp.h                    |   2 +-
 .../intel/atom/sst-mfld-platform-compress.c   |  12 ++-
 sound/soc/intel/atom/sst-mfld-platform.h      |   2 +-
 sound/soc/intel/atom/sst/sst_drv_interface.c  |   9 +-
 sound/soc/intel/avs/probes.c                  |   2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c              |  26 +++--
 sound/soc/qcom/qdsp6/q6asm-dai.c              |  26 +++--
 sound/soc/soc-component.c                     |   2 +-
 sound/soc/soc-compress.c                      |   2 +-
 sound/soc/soc-dai.c                           |   2 +-
 sound/soc/sof/amd/acp-probes.c                |   2 +-
 sound/soc/sof/compress.c                      |   2 +-
 sound/soc/sof/intel/hda-probes.c              |   2 +-
 sound/soc/sof/sof-client-probes.c             |   2 +-
 sound/soc/sof/sof-client-probes.h             |   4 +-
 sound/soc/sprd/sprd-pcm-compress.c            |   6 +-
 sound/soc/sprd/sprd-pcm-dma.h                 |   4 +-
 sound/soc/uniphier/aio-compress.c             |   2 +-
 24 files changed, 173 insertions(+), 88 deletions(-)

-- 
2.50.1.565.gc32cd1483b-goog


