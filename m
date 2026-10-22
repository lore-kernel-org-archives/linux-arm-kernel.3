Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D7D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 11:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NHn927s0;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=BrVIN98L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nLtJggHjwKr/mPClxH5B2q+y4l0tBKI1aAwBEPu1z4Q=; b=NHn927s0xDYY9+QeM1Q/CUPjg9
	DF+9kvXLwlR0lZ0s3JCT6pflXK9aS77hAw/ccFc+uwNPZ/awMgj1GU0WM/O207CgeEtsMeGqxUQcF
	8cCDiFmjoE2OQsTV1wJrKin5+ZgNk8JUyeSU6FLc/coV2Ky2saLokjBMnAfFJJSmjPuuwPixo0Nbe
	VkMhMKiGKTIQXhoEnv586THwZU+Srb8Atoibwqw2jUCCiDGgPO+Cft3lSSPLXhjJ8X2TAl8v1LkRd
	D0eBExg9PFjlWClqP8ywnWgMZlj/ijT1UNh7RDc+c1vPijC8UD1ushrYuZPLvUy54lYH0o7TDzoub
	y5Kuex2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqdH-0000000Dz7h-47yI;
	Thu, 22 Oct 2026 11:06:51 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqdE-0000000Dz5q-2WsZ;
	Thu, 22 Oct 2026 11:06:50 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5ca5:d100:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3E4AE200F60;
	Thu, 22 Oct 2026 13:06:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nLtJggHjwKr/mPClxH5B2q+y4l0tBKI1aAwBEPu1z4Q=;
	b=BrVIN98LiKLkF0BmJenoImtpSHA8ZDBX1R1vuxHS9RlWlTZeRdzfv+loO1REZCk9egcka8
	8yMajaZOZOIoAjAwB/A5Jq6wREJ4k7jt0lXs5aBVgcTgTkuwO6o07QqCh6YN4yUsP+UnA1
	h91Mg2/0UtkDF5xB/9M4numN3IpWp0gN1OJy+6o+NtO+/BDv5+uzCjXtexmLk5S/hMkzb6
	xxgvlqFWBXlK1yjQRCQ7kBWnh6b8tNNbRCfGm7fH6vpiMtsWvfBXtBETWrNOt/gcjCfkvC
	+QiMxNNVp6utj0G/1bzd08ZTNxHKFz6NXj8G8cJw3qE6eHXWFFBSYs6j1p5ZhQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792667206; a=rsa-sha256;
	cv=none;
	b=WLnCIskXntgt7MM3Fu+DfljQkLOkePp0q/zGTepAbiLpTqIAg2gUJJltxc3bZe5iH1bSQb
	WeLQlRGhd/NFYRRPYUUcdIS4p7U4cqLE8sOa3+IIuM/OR1SDAm60yluT+tC+T+Abs30kID
	QaRkIboXDpd/qV5zQBIGGAcnyEEB0MwZoJEuimjo7FgQqv29FsatD6LZ2EwcvdI7WnNM4K
	Uolbyp8FQUiXA+0BbM6uI8rzo3umcHjeTYv+LfipcTqHgcY5ujm8EVv9ReEq+9DqHUSZ2N
	93Fq8vRs6yfLz2r6UERmj+nYtmEx6yrcSYwWMEFxrH3BdsVBlIiXczoBvOjlEw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792667206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nLtJggHjwKr/mPClxH5B2q+y4l0tBKI1aAwBEPu1z4Q=;
	b=QvanH7X790skkqgIDTfHNAnUJQ3bz8j3oqpqSCC6o41/twvKij194rCO8rh65hAbr970Jr
	GJSsiKuGuoexE3CwHEOvmlCmN6IbuZZ4Tb4VQZUqTfLiOfG10qc9nJ/JjjB+yDipLj/w0o
	IkJgQmqfK1DFvmRnR1szMy9gKUifeC+2t7IcRi4eovahppfFLiVZtj+DVm24PI3gt1qUyc
	Jvxhbybll6MtyP1xUekdPeRwdMbBokh1YDMX/P9C8WGvY6Y5NX5RqhjwJYiQRHCa1RN2fP
	fa/X1tMSr+doZBoNKSiQVhBDQ9fy/sJPPSNBtV35JwDlrIshY0RSW1f96VeHQQ==
From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v7 0/4] media: rockchip: Add JPEG decoder driver
Date: Thu, 22 Oct 2026 13:06:38 +0200
Message-Id: <20261022-rockchip-jpegdec-v7-0-3fd7dd55f408@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD7u2WoC/23PTWrDMBAF4KsErasykqzRuKveo2Qh68dWC7aRU
 5MQfPfKgbaGaPkG5ps3d7aEnMLC3k53lsOaljSNJZiXE3ODHfvAky+ZSZAIJAXPk/tyQ5r55xx
 6HxwHj0TgImp0rKzNOcR0fZAf55KHtFymfHtcWMU+/cWaZ2wVHDiBECRlFzXA+xzG/vuSpzFdX
 31gu7jKo6IritwVtJF0a5VErCrqX2lFrYsqitKknDLowcuq0hwVqihNUcD71vjYGNt1VUUflOp
 Heu8CqImUch1SVcE/RQDUFCyK1FGgD1Zga56Ubdt+ANU8s/sTAgAA
X-Change-ID: 20260821-rockchip-jpegdec-0d6880cf656c
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792667206; l=7833;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=L91hPT583OPz6DWQPKsX8MejItDBU7qiDAjLvJWNM94=;
 b=Q06PmETufGH9AdxvXPEXuZrzkGTwJSu2oy6OiL4eP1L0a/Ll2xmqls4awvNXVkeZ3zdYhmifj
 mQVqMlmoea9CPnb5ukZQLmAhyw+f9hGzOAMaTjzi5/Et6BZ0InHxk3r
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_040649_290205_2ACCBF3B 
X-CRM114-Status: GOOD (  27.90  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the Rockchip JPEG decoder hardware. The JPEG decoder
is an in-house IP which is integrated into various Rockchip SoCs. The driver is
tested on a RK3588 board but reportedly works on RK3568 as well.

An earlier version of this driver was posted as part of the Hantro
driver [1]. That turned out to be the wrong abstraction, so it was split
up into a series with the Hantro fixes [2] and this series with a
standalone driver, which started over at v1.

[1] https://lore.kernel.org/r/20260819-rk3588-jpegdec-v1-0-33d74cdf369c@pengutronix.de
[2] https://lore.kernel.org/r/20260824-rk3588-jpegdec-v1-0-180a30a2852d@pengutronix.de

An LLM (Claude) was used throughout the development of this series:
for parts of the driver code, for reviewing it and working through
review comments, and for debugging on the hardware and with
GStreamer.  I have reviewed and tested all of it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
Changes in v7:
- Don't set a capture payload larger than the buffer when a job fails
  because the buffer is too small (sashiko)
- Drop the Assisted-by tags, upstream removed them in favour of a
  note in the cover letter
- Drop the review questions and answers from the driver patch
- Link to v6: https://lore.kernel.org/r/20261005-rockchip-jpegdec-v6-0-25f16dea1697@pengutronix.de

Changes in v6:
- Rework dynamic resolution change: a changed frame is marked when it
  is queued, the decoder stops in front of it, and only the ioctls that
  resume change the capture format, so fmt_lock is gone
- Keep a drain going across the capture restart of a resolution change
- Decode grayscale frames to GREY instead of filling the NV12 chroma
  plane from the CPU, and allocate capture buffers without a kernel
  mapping
- Leave cache maintenance of coded buffers to videobuf2, drop the
  dma-buf CPU access calls
- Drop the EOI scan, a truncated frame fails through BUF_EMPTY, and log
  all hardware errors
- Drop the runtime PM check in the interrupt handler
- Drop the interrupt masking around the watchdog reset
- Drop the hard reset fallback
- Drop the media device
- Drop the EOS event on STREAMOFF(OUTPUT)
- Allow up to 65535 pixels per side, limited by the size of the decoded
  frame instead of 16384 per side
- Report sRGB colorimetry on the capture queue, keep what is set on the
  coded queue and default it to V4L2_COLORSPACE_JPEG
- Return a failed frame with its full payload, GStreamer takes an empty
  capture buffer for the end of the stream
- Return errors from the header parse instead of setting a flag
- Use guard() and __free(), drop NULL checks the core rules out
- Name the VDPU720 in the Kconfig help
- Use Assisted-by: LLM
- Link to v5: https://lore.kernel.org/r/20260925-rockchip-jpegdec-v5-0-30658833cb68@pengutronix.de

Changes in v5:
- Keep the device until both the binding and the last file handle are
  gone, devres freed it under an open file
- Let a job still running in rkjpegd_remove() finish and start no more,
  close() waited forever
- Reset the block after a job that ended in error
- Reset the block after a frame that left SOFT_RST_RDY clear
- Skip trailing padding of any length when looking for the EOI, 63 bytes
  of padding hid the marker, and search only the entropy coded data
- Annotate the DMA side buffer as little-endian
- Return -EINVAL from enum_framesizes() for an unsupported format
- Drop most of the in-function comments
- Drop the review note on rkjpegd_remove(), the code is fixed instead
- Bound the Huffman value copy by the table length parsed at queue time
- Fall back to the standard Huffman tables for frames without a DHT
- Resume decoding on V4L2_DEC_CMD_START after a drain or resolution change
- Do not re-arm a drain that already completed
- Report no resolution change for a corrupt frame past the first one
- Send no EOS event for the LAST buffer of a resolution change
- Correct the IRQ clear and Huffman table set comments
- Keep a resolution change out of the mem2mem drain state, a STOP sent
  before the capture queue was restarted ended the stream at once
- Look for a mid-stream resolution change only in device_run(), buf_queue()
  raced the interrupt handler for the capture buffer
- Set the field on every capture buffer and the sequence on every LAST
  buffer the driver returns itself
- Report the first resolution after CREATE_BUFS on the OUTPUT queue too
- Report the capture colorimetry from the OUTPUT format rather than echoing
  what userspace passed, and stop S_FMT(CAPTURE) changing the OUTPUT format
- Refuse RGB coded frames, Adobe APP14 transform 0, instead of decoding them
  as YCbCr
- Drop the 4:4:0 mode, the JPEG parser never lets such a frame through
- Depend on V4L_MEM2MEM_DRIVERS
- Correct the downstream clock rate in the rk356x DT commit message
- Serialise V4L2_DEC_CMD_STOP/START with the job completion, a drain
  racing the last job's interrupt never finished
- Forget a drain that STREAMOFF(CAPTURE) aborted, a later resolution
  change re-armed it
- Bracket CPU reads of imported coded buffers with
  dma_buf_begin_cpu_access()
- Wait for a running job when probe fails after registering the video
  device
- Add an SPDX line to the Makefile
- Link to v4: https://lore.kernel.org/r/20260918-rockchip-jpegdec-v4-0-0dd97df47abb@pengutronix.de

Changes in v4:
- Set and read the source change flags under fmt_lock
- Check the runtime PM state in the interrupt handler
- Use dma-buf CPU access around the grayscale chroma fill
- Update the review notes in the driver patch
- Link to v3: https://lore.kernel.org/r/20260914-rockchip-jpegdec-v3-0-3583c376d0d2@pengutronix.de

Changes in v3:
- Rename binding to rockchip,rk3568-jpegd.yaml to match the compatible
- Link the earlier Hantro based series in the cover letter
- Enable clocks from the runtime PM callbacks, use pm_ptr()
- Protect capture format and crop with a mutex
- Clear bytesused on capture buffers returned without a picture
- Revert padding the capture buffer to the MCU width, it broke 4:1:1
- Add notes on review questions to the driver patch
- Link to v2: https://lore.kernel.org/r/20260825-rockchip-jpegdec-v2-0-86af859a3266@pengutronix.de

Changes in v2:
- rename clocks from aclk/hclk to axi/ahb
- Add missing Signed-off-by
- Fix suspend/resume path
- Pad the capture buffer to the mode's MCU width, not to a macroblock
- Reject a frame header picture size outside the supported range
- Set the capture payload at decode time, not at queue time
- Trim comments in the driver
- Link to v1: https://lore.kernel.org/r/20260824-rockchip-jpegdec-v1-0-8011822bf500@pengutronix.de

---
Sascha Hauer (4):
      media: dt-bindings: Add Rockchip JPEG decoder
      media: rockchip: Add JPEG decoder driver
      arm64: dts: rockchip: rk3588: Add JPEG decoder node
      arm64: dts: rockchip: rk356x: Add JPEG decoder node

 .../bindings/media/rockchip,rk3568-jpegd.yaml      |   92 +
 MAINTAINERS                                        |    9 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   22 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   24 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkjpegd/Kconfig    |   16 +
 drivers/media/platform/rockchip/rkjpegd/Makefile   |    4 +
 .../rockchip/rkjpegd/rkjpegd-vdpu720-regs.h        |  235 +++
 drivers/media/platform/rockchip/rkjpegd/rkjpegd.c  | 2222 ++++++++++++++++++++
 10 files changed, 2626 insertions(+)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260821-rockchip-jpegdec-0d6880cf656c

Best regards,
-- 
Sascha Hauer <s.hauer@pengutronix.de>


