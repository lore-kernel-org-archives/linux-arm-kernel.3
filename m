Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 17:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hqTksmkM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D13NO4In
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=; b=hqTksmkMK9f2BRhuH0AD5S8g1n
	VK2NwUacLEr6zSltE3VnQX5SZr9vme7KCIUZDTS1i8oHGxJ0w1RPX1Bs/VpKFsH0J1OsltGLqGoZQ
	mboT6y6JjYRdTohQFD+LcUWUjlN7Fb3zz3wqpaI1ODBa5qUTKALHn7j43SrEpe3ORpSfqwOozEvDg
	MStyRRc+Pa03RLpnD2hVfpfj//UChYZuGmSEwN5cmDfQW0TB47OZH7JLEHoK05UKzuOIYOrTJxcGa
	kksRXx7U1JLeO8E1Qkvf8tQ9Y1uI6gMncojwuj0VfIeXLPgrL1be3JG9/HPo8SHu6xcyy+g0MTtpE
	BEUA+O3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKfnm-00000000PLF-430b;
	Sat, 24 Oct 2026 17:45:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKfnj-00000000PKP-418T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 17:45:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1554862f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 10:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792863901; x=1793468701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=D13NO4In1izssgStRb8vq1p5ZI/qOCnsUFBbeRh0fg/ZZDoajTfRIB+2fEGb8E8+Ho
         F+mcwAaOsged7tdPh4n2OrobbteIPcQDFp1pHXpATP+en4uisbabAXk6D9OCOalAeliu
         FWfjg9Axc1ISbUNFnfUx7PSxf3YJ/3vLN3M3jYZkMjloxw1tVfsaVipDraZ8iy19aU5+
         /r49y42D5fAjdw7Tqpw4iBCXR0oo78oAHyoI4CMxdzk1Yzv5x/GmyEzgVovvUxm+weyN
         CLqmP0NdQwpTjhq37nVVkdfgbYyUp93ecJMz8Ljk/l5TLtGqufbuJ/JAhOoKYRzWucao
         NsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792863901; x=1793468701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nn33RrLK2jP6yegXcMbyk7CADovV75ox65AHlodMd48=;
        b=a6WJecFO8lIQ65Qp9IlKEm4/IXKrdIZRhxGJuoIo43th80RDtK/RbmlPX5CBmZ18zm
         Rti//8XsWW+PxU/G/OYjdz172GQMhW0VeMOd9g8zAVoDZPrWpvOgrI0BWtapE9a3CK5Q
         cH5ki3MsGou28POu2dqkJHC6WikNv33ukECzZ4gsGZlGUxCuLIzJR/sSG7Rq9LFoKMSb
         VrSOv2qm1csaMuWZC8noTzGkIGQY9CKbV/zPVt3buNGh/a7JFYJdsNx9zUmRni/VsvMg
         qTYu9vyWQOwdmDlzF+eOzh3e+svAd70APKP36q4qOdwxur22oRyquKl/u4VCmMWAnB2B
         kICw==
X-Forwarded-Encrypted: i=1; AKwUvBxKQOsX1QDDI9+mzRYrimGJ9bhJyADfP7orF8v2LUIEVwB7BgJkiupPmkyqMysYGgh7iPNmY9ts/2rlYd47/N3H@lists.infradead.org
X-Gm-Message-State: AFq9FYLKgh5a3a8TSLA6VlkAf16G4Wj2zMpUIuHMd9xN0n+3XjDnqW3X
	GzTNXXTTF/TVwbdRi8WKfE/KVOEWJOJINb2IrB1ZTpHOCZZj5b4XS2T8
X-Gm-Gg: AYBFou08jtP5wtbyjeLbCvsbXaPF5Gi8+Psjk5h5CHz4lSp6wiaFEJ85Zn+/EJvW68M
	lGFiJngjDVBWOmHnnHHNAftq5vAZxNguWm0VLIq4R7mX6iWKxCnzTPiTb6A91eEYlH6vCGULael
	Dv+DwCm5wuobq4wyZSotIkCuW7EguPmPNbicyGxGond6RLFFTv+d4pygxbMIpYBkP6lka18R/FM
	f/GNdf962HuOML+eaFSr2UCbHJr27vpJE75ARfsuYrt/g+DI7gewPkNujijAZFwNDYV2DiPEUfx
	S0rwNK4bWP/YNkBGMG9jI0/k5socwrnF2ARNRwfkyJuH6g/h5CVj1N0gxv+/HTB0EVVDD8pbXD/
	15fx+261kgy1/FwWaisbn1n3P3j0hHidvJd7ySeAJbweLCga3Z6p+4Za8C67gIp8obpbCTG7T3g
	QMOk7k1I8keS84gw9mg5IQGb3++koNnWcBqsUiW7cIGvLWdy1QIWa2/IN+RwbF58pgTMzlfJdFc
	U6WumpaX7sVsm9WJcABdrHL9CtG6jHcsHMQG4VhIF2+ZM8MYAobJoxiNxB/jQx/khKojNSeETnB
	6OddHEYnY0TuKLnRNhmRJN5b830=
X-Received: by 2002:a05:6000:178d:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e3eb262f0mr3872646f8f.7.1792863900975;
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
Received: from john-desktop.station ([93.107.83.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb8d5sm5748244f8f.28.2026.10.24.10.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 10:45:00 -0700 (PDT)
From: John O'Callaghan <johnocallaghan@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: meson: vdec: reset the VLD before H.264 decoding
Date: Sat, 24 Oct 2026 18:44:36 +0100
Message-ID: <20261024174436.1835068-1-johnocallaghan@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_104504_018772_FA18A158 
X-CRM114-Status: GOOD (  17.70  )
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
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The H.264 decoder outputs wrong luma until the second IDR picture of a
stream. Chroma is correct. The top-left macroblocks of the first IDR
picture hold garbage that is different on each run. Intra prediction
spreads the error over the picture, and inter prediction carries it to
the following pictures.

vdec_1_start() resets the VDEC1 blocks with DOS_SW_RESET0 before it
powers on the VDEC memories with DOS_MEM_PD_VDEC. The VLD then starts
in an undefined state. The vendor driver resets the VLD, IQIDCT and MC
again in vh264_prot_init(), after the memories are on. This driver
does not.

Reset the VLD (DOS_SW_RESET0 bit 4) in codec_h264_start(). The VLD
reset alone fixes the corruption. The other resets that the vendor
driver does (IQIDCT, MC, DBLK, PIC_DC) make no difference.

On G12A, every decode session is affected. On GXBB, only the first
session after power-on is affected.

Fixes: d7647e7c90f5 ("media: meson: vdec: add H.264 decoding support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: John O'Callaghan <johnocallaghan@gmail.com>
---
How this patch was made: the bug was found and the fix written with an
LLM coding assistant (Claude Code). I reviewed the fix and ran every
test below on my boards. checkpatch is clean; W=1 and sparse give no
new warnings.

Users see this bug in normal playback. On G12A, every H.264 video plays
with the wrong brightness until the second IDR picture: the first
8 seconds of my test clip, with a band 72 levels too bright on the left.

Tested with H.264 High profile clips (1080p and 720p, 600 frames, IDR
every 250 frames), GStreamer 1.26 (v4l2h264dec) and FFmpeg 7.1
(h264_v4l2m2m). Every decoded frame was compared by MD5 with the FFmpeg
software decoder.

Radxa Zero (S905Y2, G12A), Armbian kernels 6.18.45 and 7.3, staging
vdec with Armbian's patches:
- before: frames 0-249 wrong in every run (10 of 10)
- after:  all 600 frames bit-exact (32 of 32 runs)

Odroid C2 (S905, GXBB), Armbian kernel 6.18.44:
- before: frames 0-249 wrong in the first decode after power-on,
  later decodes bit-exact
- after:  bit-exact, including the first decode after power-on

Odroid C2, plain v7.3 (no out-of-tree vdec patches), GStreamer:
- before: frames 0-249 wrong in the first decode after power-on
- after:  bit-exact. Two GStreamer starts failed first with the known
  poll() start race, so the decoder had already run before this decode.
(v7.3 also drops the second-to-last frame at the end of the stream.
That is a separate bug and is not addressed here.)

The DOS_SW_RESET0 bits were tested one at a time: only bit 4 (VLD)
changes the result.

Not tested: GXL, GXLX, GXM, SM1, interlaced streams, 4K. On G12A the
tests ran on Armbian kernels; their vdec patches do not touch
codec_h264_start().

The same fix is in Armbian:
https://github.com/armbian/build/pull/11098

 drivers/staging/media/meson/vdec/codec_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index a6074de15..497fbada6 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -182,6 +182,14 @@ static int codec_h264_start(struct amvdec_session *sess)
 	if (!h264->sei_vaddr)
 		return -ENOMEM;
 
+	/*
+	 * vdec_1_start() resets the VLD before the VDEC memories are powered
+	 * on. Reset it again, or the luma of the first pictures is corrupt.
+	 */
+	amvdec_write_dos(core, DOS_SW_RESET0, BIT(4));
+	amvdec_write_dos(core, DOS_SW_RESET0, 0);
+	amvdec_read_dos(core, DOS_SW_RESET0);
+
 	amvdec_write_dos_bits(core, POWER_CTL_VLD, BIT(9) | BIT(6));
 
 	workspace_offset = h264->workspace_paddr - WORKSPACE_BUF_OFFSET;
-- 
2.50.1


