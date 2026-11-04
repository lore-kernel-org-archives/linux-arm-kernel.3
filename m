Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584B5606D804
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hnDZ9H+h;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XjkuVR+j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=b+y4IkZXYphyR8+FcqEg70ydvc5HKxWDbnCN06U52Lo=; b=hnDZ9H+hcJZaL1EGFBc89kIgru
	6y5nDd3vfhZnsjX/DodW6OYDYXqzJumZ/VY6vzMx1omTMxAnMDOJxLI23wNnKDPWR4J4Wy37Z63SH
	+lJjmcmb7FgXIj5PRWy1r0TLGSgqOssOt82Z30q1pTvyn9gqj8uVdC0n39OV+GM9diA1U/sdmIej1
	49euJmGLlB4RWBEhwlXspcnVKw9xiwcYSQcHq9u9QL79YZdCKUeyF9qfW/f81mreby/ToA9nVndK+
	9ll4C5GNR1MJKNCYpmITWSCJq9LwbWYlGxdw+m8/z7r3LiYNwRNA41Php1pIJv47/DBY3PF2ICveI
	+4k4iUhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ98-000000059Rz-0QaV;
	Wed, 04 Nov 2026 11:27:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ96-000000059Re-12Rg;
	Wed, 04 Nov 2026 11:27:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4595560F24;
	Wed,  4 Nov 2026 11:27:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793791631;
	b=m4OCFbiOwDjIsTeKhcnTITQoqoDe94mHmyisxH7qJJtzYR+CAHxprni7QabynEF9ZV1q
	 fwWwmJwlBHeqgM1+4U45Zveb8vbxmoXFponTu/nC2EqQO+vnoFcACawddosDbn83cclC+
	 h6Q15gSJYbWnqEBac3wVrWLd0888liWGOZyW6QADpK+IAd3C6JE9FCiLgG3E7D4VbknQW
	 sYAr/V6RaJB5zauKCPHvp805PjTUwcbZNNPf95Mm41k4mkOngIXOuJ7qMw2cQ+lE7h7sO
	 thhkLlrpMprL8RX1N+VpYNz53jqCI0GMFfHZt91Ol0MVXWkkZ1WaC43b2PtOm1AuwTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793791631;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=b+y4IkZXYphyR8+FcqEg70ydvc5HKxWDbnCN06U52Lo=;
	b=Sa86C4jm+6zaqw6jceiQfeTg88M1Phpn6vabj1DJmwGSCIGa1Tr+I64XUc05NkXbcDY9
	 4w+esLE9dJuE7zHrLl2rVLHtMMQpWR2ARwXpa1Ncv/N0Yym1HBsvfjrSPPhY2e7ndtSse
	 gVAtpZacmQtxkYGnJT/pDVaKdR0nVV7BjV9a2nKoJp5su1jzhoytrS7pWfpJeUb0ESOtN
	 57yr5tpHeM+PvUNPXMMGUheLAEAqEA21dCYwVX3AKxYNTZq1/Cr2RnAE0AwCXqyPWthAB
	 /Xz5nSeMC6/Ubv5v5OHB1cG3Bnuy9LrWFEOTaqB2zpgXQDvKDih33JfHFfr46EIqyMQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77CE51F000C1;
	Wed,  4 Nov 2026 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793791630;
	bh=b+y4IkZXYphyR8+FcqEg70ydvc5HKxWDbnCN06U52Lo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XjkuVR+jLud123a4yrwSosXs1CNpQ0DbUIUT7A2/vJJ0NDuz9h7tvxCnSWj5MVdqr
	 wiY2DfEGi89iqHVD0td/YFyaTIYvs13eQgn5NW3ToAhhZYYuQDa9snI0Ba+7mlE5ra
	 RbYstGtwpVV9LVwqK/wAtQhDit9Mb0yD7ydL4x91UwAXANln+sKrkAb2qglPbY+m25
	 PR5sY8oJcNUv4bozzuOhHTXfHeHRQXt4Z6wJvmYHRMQxmZ5k8cBZ2yCehyfowD4MdM
	 hz3UvBp0fn4jGD0DmnsDZ5gPWYzKJstf/5fovLTyZAityVnqG4PVCUTeeg/2oyb87E
	 HaWnRv2nie3fw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E7BE146DE2;
	Wed,  4 Nov 2026 11:27:09 +0000 (UTC)
From: Sergei Khomenkov via B4 Relay <devnull+shomenkow.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 14:27:00 +0300
Subject: [PATCH] media: verisilicon: postproc: fix the G1 input height
 extension
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-b4-hantro-pp-v1-1-1d75e9b225f8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7bqEtkeor0SFrq72oaEQg/j3pO
 AMzGRJH4QSTyhD5kSTeVaBGwXat7mSUvTJ0bWeIWo1WY/V39BgC0sZkzTCSNj3UJEQ+5P1381L
 KB/YdnS5eAAAA
X-Change-ID: 20261104-b4-hantro-pp-1ce1b6891463
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sergei Khomenkov <shomenkow@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793791629; l=2696;
 i=shomenkow@gmail.com; s=20261104; h=from:subject:message-id;
 bh=6KMLDE6dsLI68WIn7HDBXCi9zZIMm6q13VtI26jCIEQ=;
 b=GW+Um0KlDUSjAUHiJBO3u19Fpg5eM42bH6xinnVwJ65mnTUtQeE34SUyzblxmnVX92v/MDvJv
 BdzIUwJKlk3CrSB3jJg0tsT7D0ZdZJCL/g6cBPYs7j7XbbeP0rkvNZF
X-Developer-Key: i=shomenkow@gmail.com; a=ed25519;
 pk=FwuHDVe7aiISDMLmQEcMC+RflEIJ6kEp/ekwznWXmI8=
X-Endpoint-Received: by B4 Relay for shomenkow@gmail.com/20261104 with
 auth_id=1409
X-Original-From: Sergei Khomenkov <shomenkow@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shomenkow@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sergei Khomenkov <shomenkow@gmail.com>

The G1 post-processor takes its input size in macroblocks: the low
bits in swreg72, the high bits in swreg92 (bits 28:26 for bits 11:9
of the width, bits 31:29 for bits 10:8 of the height). This is the
VDPU1 layout in Rockchip's MPP library, whose JPEG decoder writes the
height extension as ((height / 16) & 0x700) >> 8.

hantro_postproc_g1_enable() computes the width extension that way but
writes the height extension as MB_HEIGHT(height >> 8), shifting lines
instead of macroblocks. Every input of 256 to 4080 lines gets an
extension of 1 instead of 0, so the post-processor is told it has 256
more macroblock rows than it has: 286 instead of 30 for 480 lines,
301 instead of 45 for 720 and 324 instead of 68 for 1080. Inputs
below 256 lines are not affected.

Shift the macroblock count, as is done for the width.

The problem was found with an LLM coding assistant while porting
mainline Linux to a Rockchip RK3026 board; the assistant also drafted
this change. Tested on that board (G1, ID 0x6731), decoding H.264
(640x480, 854x480, 1280x720) and VP8 (640x480, 1280x720) to YUYV
through the post-processor, 241 frames, against a software conversion
of the decoder's NV12 output. Without this change only the 4 VP8 key
frames match: a few pixels at the bottom left of the last macroblock
row differ from run to run, and VP8 inter frames propagate them. With
it all 241 frames match. 320x240 is correct either way.

Fixes: 3f6702e1be8a ("media: verisilicon: postproc: 4K support")
Cc: stable@vger.kernel.org
Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index e94d1ba5ef10..ecc6b3137eb0 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -106,7 +106,7 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 	HANTRO_PP_REG_WRITE(vpu, orig_width, MB_WIDTH(ctx->dst_fmt.width));
 	HANTRO_PP_REG_WRITE(vpu, display_width, ctx->dst_fmt.width);
 	HANTRO_PP_REG_WRITE(vpu, input_width_ext, MB_WIDTH(ctx->dst_fmt.width) >> 9);
-	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.height >> 8));
+	HANTRO_PP_REG_WRITE(vpu, input_height_ext, MB_HEIGHT(ctx->dst_fmt.height) >> 8);
 }
 
 static int down_scale_factor(struct hantro_ctx *ctx)

---
base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
change-id: 20261104-b4-hantro-pp-1ce1b6891463

Best regards,
-- 
Sergei Khomenkov <shomenkow@gmail.com>



