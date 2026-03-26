Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5309910A62FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 14:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHwkdYII8F/vroJPH6/SLswhD90taY/WQMp0FFNx/ko=; b=fNIASt8V6jKGX+GS0+krNow9/9
	PnVOuwkz3Q0IJu6HhOuy5loXkPrtfHH7UkyH5klw1chFUKAzFr8tOmYEma9ElZguYS8e0NHUr51JA
	5xQrgjiaWjoOW6O6F8ZJ7hwP6DwzRMtJY+f7WiWwQFAGmiC8GKbgHKlS338xe//JPuhHmNsTqCcW8
	mU//PiuC00EuqhHCgX04GOx975VWzj/0pj9ksKWqt6epJhG5/Vu9K596GLxyinOx3Y9tS0dN+WOS5
	1gOWq3ZH9D/y8/KnE1hl8z4sDPRGvzzoB+K4+EQRpS4hi8fstEFQvpnXOpiXWr+u4xKVqx/9Dh0Wl
	xMjZj6ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lvk-00000005g8t-1IzW;
	Thu, 26 Mar 2026 14:43:28 +0000
Received: from mail-4317.protonmail.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5lva-00000005g7k-1TvD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 14:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail; t=1774536196; x=1774795396;
	bh=yHwkdYII8F/vroJPH6/SLswhD90taY/WQMp0FFNx/ko=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DAOHIfugkP7QYTmEzTq3YTRK/6di7hNJUIoogv4b3qtRTaSdmeqYrYMwXR0EXcz39
	 OyAq+8pLK/qct9WAw4RASfHZmgOWIqikQ6TsdUED3Y1rW8uYjCKC/D87O/QDCwGpR/
	 kAUzeXJ9Ue6BmPAahdbEGEn+raCheLYzOuy2GyF5kG8RkwD6hvOF+SL3Enm6N5wlD6
	 dhtyg3m7tYZ4fnzr7bP84D6yy7+E+wtixUTNrW/kLdxao9yhqIPL4SBLJ9pfbYQQGR
	 yVFC7hJth1cxRE3aiOPUf3feh3ygjt6u13ZZ6flc4M/7jwbATJxGfmZDAYzDhXOaCN
	 4ZMIIrLuJ3IQw==
Date: Thu, 26 Mar 2026 14:43:10 +0000
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
From: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v9 05/11] drm/fourcc: Add DRM_FORMAT_X403
Message-ID: <jCbIrZ5-fvx73de8DmjQ7xpuEw63kTCQ5p88cdF7yRcUk7uNbE9y0YU7uZbPXNotQAB9y6c0u5n3TrnXckvQ8Oje_J3QGxEwBSr_liQVDK0=@emersion.fr>
In-Reply-To: <20260325-xilinx-formats-v9-5-d03b7e3752e4@ideasonboard.com>
References: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com> <20260325-xilinx-formats-v9-5-d03b7e3752e4@ideasonboard.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: df6e2ce0b384cee0a0208f6f7f66c7730d42147e
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_074318_538683_ED2D9298 
X-CRM114-Status: UNSURE (   6.72  )
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

On Wednesday, March 25th, 2026 at 15:02, Tomi Valkeinen <tomi.valkeinen@ide=
asonboard.com> wrote:

> +/*
> + * 3 plane non-subsampled (444) YCbCr
> + * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
> + * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
> + * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
> + * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
> + */
> +#define DRM_FORMAT_X403=09=09fourcc_code('X', '4', '0', '3')

So, this one is different from the Q family, because Q has padding in
LSB rather than MSB. Speaking of, maybe we should add "LSB aligned" to
the doc comment to make that clear?

Re-reading the sibling thread about DRM_FORMAT_XV20, sounds like the
first digit matches my expectations for sub-sampling. How did you pick
the last two digits? I think I would've expected "30" here rather than
"03", since the last two planes are Cb Cr rather than Cr Cb.

Has the first "X" letter been picked arbitrarily? It's already used to
denote padding in other formats so I wonder if we should pick that
instead of, say, "T".

Simon

