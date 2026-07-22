Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FCDC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWDWsM9TBRItqToA/efliUD8bssiJSLzstCW4+0QWoE=; b=NGYhVQa7rRWBgdzNoooHDzhkm2
	SibzXAWjQgKWFhbTJhI3F8wt6wVvsLUb2gl+kKQnjrMK1sNGkuTNWu1KBXS8QO8XJSf9QeSlA3YUb
	hEd9MlCqS4dD9/uL2cwsbztYCK1CJ5QUh1GuZ11LSNVPUJ5ZPViG+VzT4rBwAJMBy60c3SLo+LUPW
	sG9lWUOiOexKOxh/xRynjjRRNDK3CdHBUJf5VHqTDFYiGdCsie7fW5Ew854VpZ6TlH3AoGrf3u5o2
	L/RGzA3p4kiu8FEX4fExbhmNPs2worvbNCmhFjagPKaLbXT4u7lEvfjIjc907hKHczgOUWcFIvyCE
	j44vf2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTkc-0000000BTxJ-31nz;
	Wed, 22 Jul 2026 10:00:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTkY-0000000BTwG-2017;
	Wed, 22 Jul 2026 10:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=sWDWsM9TBRItqToA/efliUD8bssiJSLzstCW4+0QWoE=; b=AwgZpszx5epBC4Iy5r0MfWV7nm
	NqsefgU0PQJF7xw8wCPw9mDwW1avyoqiCPDSl6Byd4DUNYl7/auQYEpedEmoTNniJ4vIcqfbzfW29
	Lzc0U9RmTHeJMvLoxb8mwDTiPo/rB0aTGIJNYUn6rENStzqvpNln1B2NHIkaWZ2ahkiZWlxIKv8FQ
	cuoa2tlp+gFkdkBakUUi83prtZEI5g6vFAKypdM4XkE4/urMmDKIGrZ9RcG+cU+Ri78pFlzb7znC7
	Mu5ZiDTPI9jepe3KCqBwVSIPvuZhee94BeM2P9byVXTXOd5HJPMmJcqDAFL/5qMMo+zq24XI+OAsE
	ah9a+nPQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.dufresne@collabora.com,
 Jiaxing Hu <gahing@gahingwoo.com>
Cc: ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiaxing Hu <gahing@gahingwoo.com>
Subject: Re: [RFC PATCH 2/3] media: rockchip: add VEPU510 H.264 encoder driver for
 RK3576
Date: Wed, 22 Jul 2026 12:00:16 +0200
Message-ID: <3096814.BaHzMo0RvP@diego>
In-Reply-To: <20260722073417.2064667-3-gahing@gahingwoo.com>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
 <20260722073417.2064667-3-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_030026_571984_B1005006 
X-CRM114-Status: GOOD (  20.57  )
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

Am Mittwoch, 22. Juli 2026, 09:34:16 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Jiaxing Hu:
> Add a from-scratch stateful V4L2 mem2mem driver for the Rockchip RK3576
> VEPU510 H.264 hardware video encoder (raw NV12 in, H.264 Annex-B out),
> modelled on the verisilicon/hantro device_run()/codec_ops split rather
> than the downstream MPP-service/task-queue model.
>=20
> The two encoder cores (rkvenc0/rkvenc1) are exposed as two independent
> V4L2 M2M device nodes, each driving one physical core standalone; the
> downstream vendor CCU cross-core load-balancing is not implemented.
>=20
> Register field semantics were worked out by trial-and-error against
> Rockchip's own open-source userspace codec library (rockchip-linux/mpp)
> and cross-checked against a real register-write trace of the downstream
> vendor stack running the same encode.
>=20
> Intra (I-frame) encoding is confirmed working on real hardware (Radxa
> ROCK 4D): it produces valid H.264 that the reference decoders accept.
> Inter (P-frame) encoding still hits a hardware-watchdog stall in the
> reference-read datapath -- this is the main open question for this RFC;
> see the cover letter for the full symptom analysis.
>=20
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

[...]

> diff --git a/drivers/media/platform/rockchip/rkvenc/rkvenc.c b/drivers/me=
dia/platform/rockchip/rkvenc/rkvenc.c
> new file mode 100644
> index 000000000..d70bcc5fb
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvenc/rkvenc.c
> @@ -0,0 +1,892 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip VEPU510 (RK3576) hardware video encoder driver.
> + *
> + * Copyright (C) 2026 Jiaxing Hu <gahing@gahingwoo.com>
> + *
> + * Architecture notes (see also rkvenc-regs.h):
> + *
> + *  - This is a *stateful* V4L2 mem2mem encoder (raw NV12 in on OUTPUT,
> + *    H.264 Annex-B out on CAPTURE) modelled on
> + *    drivers/media/platform/verisilicon's hantro_drv.c device_run()/
> + *    codec_ops{run,done} split, NOT on rkvdec's stateless request-API
> + *    decoder pattern =E2=80=94 an encoder has no per-frame bitstream to=
 parse,
> + *    so there is nothing analogous to rkvdec_run_preamble/postamble her=
e.
> + *
> + *  - The vendor downstream driver (rockchip-linux/kernel,
> + *    drivers/video/rockchip/mpp/mpp_rkvenc2.c) groups rkvenc0/rkvenc1
> + *    under a "CCU" (rockchip,rkv-encoder-rk3576-ccu) that does pure
> + *    software task-queue load balancing across both cores, plus an
> + *    optional DCHS (dual-core-handshake) register protocol used only
> + *    when *deliberately* splitting one frame's rows across both cores.
> + *    There is no hardware descriptor/link-list engine behind it (unlike
> + *    the decoder's CCU). v1 of this driver does not implement either:
> + *    rkvenc0 and rkvenc1 are exposed as two independent V4L2 M2M device
> + *    nodes, each driving one physical core standalone =E2=80=94 the same
> + *    simplification rkvdec itself makes for multi-core VDPU hardware
> + *    (see rkvdec_disable_multicore()).

At least the comment and from a casual look also the code get this
backwards. The idea is to explicitly _not_ expose multiple video devices.

See
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/media/platform/rockchip/rkvdec/rkvdec.c#n1613

Any (future) scheduling should happen inside the driver, and not get
offloaded onto _every_ userspace application individually.


Heiko



