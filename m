Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5162ECC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gJEy8R3fVBH6Cq++PWhCCjionGdbV/hp10N5/23EDw=; b=iZJ4ef5iqYUtYOPuF5laHwBRfL
	GsXgVlh2yqhXwpZjDwAgK2HOPaE4Zrz0dc++LxPJVyXbYNLFYFaWfqPMEf1w+2Upqk4mEqcGLhQsB
	SjBdMlbhDIVyYjX2xTOQcKOKNpkh67noXUc5cM7isJ0hWURU1dtJM8O7v0py+LnCWR8FEEEi9pHOH
	IKCTMwJ/odisjY3SCGREuj5DjsWfmbUDnzUSDj5cKvROKZoIqFJOuzNCyzss6sxeUAbY9nTCR+bcu
	huX5iQZLDD0z9STPmofLk9HRkhZ0VsKJpce4hf6E+2kx2dXMOxl7nEL/B9O+WSKYV2YiLc1mSRq6X
	2/WqYQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkSI-00000003OJl-3Qqx;
	Fri, 16 Oct 2026 16:06:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHkSI-00000003OIR-06O4;
	Fri, 16 Oct 2026 16:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9gJEy8R3fVBH6Cq++PWhCCjionGdbV/hp10N5/23EDw=; b=gJGQf2Mq9Rr88cDn6Xu9TIyoak
	srSqYkSqOJc6++zOlVa6L8BwbwoZTZ56bd9tgO8g2WoRpAeGv4/LvFQJ9NJp+2mnuLCZKFJBClFt7
	gw4kqLdbl5tKTSUdAogL2Nrcn/2Fyt9tBmdKGxJJl5rrC2VP+lslm7denk7EA0hyRuv2iLLWtIPUb
	P4eBxTLlBsYTpZHj+fswIW2ZL4XcYvD0bie1XtObMFfYmrQh0BauPyxtTU6jtX3uE1Q8VqtrM5FdP
	19L4gvYiw8g9jrOWXVbyiPU7jRfdHMXA8lcFRd1y3DXLdeYowYOXdXGTpJ36gyqm0AwljIal0/tdl
	pPvzzubA==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHkSF-00000001i9K-1WZs;
	Fri, 16 Oct 2026 16:06:49 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xHkS7-0000000086N-2vvQ;
	Fri, 16 Oct 2026 16:06:39 +0000
Date: Fri, 16 Oct 2026 17:06:36 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, michael.riesch@collabora.com,
	stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com,
	xuhf@rock-chips.com, zyc@rock-chips.com, dalong.deng@rock-chips.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] media: rkisp2: Add statistics capture video node
Message-ID: <atJLjCV3Z8V7DsqY@makrotopia.org>
References: <20260827-rkisp2-v3-0-e91ff0a604d6@ideasonboard.com>
 <20260827-rkisp2-v3-3-e91ff0a604d6@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-rkisp2-v3-3-e91ff0a604d6@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_170647_544646_2A2A22E5 
X-CRM114-Status: GOOD (  24.51  )
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

On Thu, Aug 27, 2026 at 07:48:32PM +0900, Paul Elder wrote:
> Implement support for getting statistics out of the ISP by dequeueing
> statistics buffers from rkisp2.
[...]

Hi Paul,

Comments from running the statistics on the RV1126; the RK3588
statements are by code inspection.

[...]
> +++ b/Documentation/userspace-api/media/v4l/metafmt-rkisp2.rst
[...]
> +:ref:`rkisp2_stats <rkisp2_stats>` metadata capture video node, using

Undefined label, as rkisp2_params in patch 2.

[...]
> +                const struct v4l2_isp_stats_block_header *block =
> +                        (void*)(stats->data + block_offset);
[...]
> +                                printf("ae_lite.exp_mean_r[%u] = 0x%08x\n",
> +                                        i, ae_lite.exp_mean_r[%i]);

struct v4l2_isp_stats_block_header does not exist, the header is
struct v4l2_isp_block_header; and ae_lite is a pointer and %i is not
an index (ae_lite->exp_mean_r[i]).

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
[...]
> +static void rkisp2_params_hist_big(struct rkisp2_params *params,
[...]
> +	default:
> +		WARN_ONCE(1, "invalid big histogram base %x\n", reg_base);
> +		return;

reg_base is uninitialised in the default branch (clang warns);
block.header->type is what you want to print.

[...]
> +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-stats.c
[...]
> +static const struct v4l2_isp_stats_block_type_info
> +rkisp2_stats_blocks_info[] = {
> +	RKISP2_STATS_BLOCK_INFO(AE_LITE, ae_lite),
> +	RKISP2_STATS_BLOCK_INFO(HIST_LITE, hist),
> +	RKISP2_STATS_BLOCK_INFO(HIST_BIG0, hist),
> +	RKISP2_STATS_BLOCK_INFO(HIST_BIG1, hist),
> +	RKISP2_STATS_BLOCK_INFO(HIST_BIG1, hist),
> +	RKISP2_STATS_BLOCK_INFO(AWB, awb),
> +};

HIST_BIG1 twice, and HIST_BIG2 is left with size 0.
v4l2_isp_stats_init_block() then writes a zero-sized header for
HIST_BIG2 without advancing data_size, the 256 bins are written after
it and the AWB block overwrites both, so user space never sees a
HIST_BIG2 block. With the entry fixed the block shows up on the RV1126.

[...]
> +static void rkisp2_stats_get_rawae_lite(struct rkisp2_stats *stats,
[...]
> +	block = rkisp2_init_stats_block(rkisp2, pbuf,
> +					RKISP2_STATS_BLOCK_AE_LITE);
> +	if (IS_ERR(block))
> +		return;
> +
> +	ae_lite = &block->ae_lite;
> +
> +	/* TODO figure out what the other channels are for */
> +	if (!(status & ISP2X_3A_RAWAE_CH0))
> +		return;

The block is reserved and its header written before the status check,
and v4l2_isp_stats_init_block() does not clear the payload, so when
the bit is not set the block goes out with whatever the buffer held
from its previous use, done flag included (every frame after AE lite
was disabled through the params node, for instance). Reserve the block
after the check, or clear done and the means when the measurement is
missing. rkisp2_stats_get_rawawb() has the same pattern.

[...]
> +irqreturn_t rkisp2_stats_isr_eof(struct rkisp2_stats *stats)
> +{
> +	struct rkisp2_device *rkisp2 = stats->rkisp2;
> +	u32 status = rkisp2_read(rkisp2, ISP_ISP3A_MIS);

Is the 3A interrupt on its own line on the RK3588? On the RV1126 it
shares the ISP line: the measurements complete early in the frame, the
ISP handler returns IRQ_NONE for the rest of the frame as ISP_MIS is
clear, and the line stays asserted until this clears it, about 1400
unhandled interrupts per frame until the kernel disables the line.
Leaving ISP3A_IMSC clear (the params handlers set it) and reading
ISP3A_RIS here instead works on both.

[...]
> +	rkisp2_stats_init_vb2_queue(vdev->queue, stats);

The return value is ignored.

[...]
> +++ b/include/uapi/linux/media/rockchip/rkisp2-config.h
[...]
> +/**
> + * Same as struct rkisp2_params_hist_lite but for big channel
> + *
> + * RkISP2 parameters histogram configuration block.
> + * Identified by :c:type:`RKISP2_PARAMS_BLOCK_HIST_BIG{0,1,2}`.
> + *
> + * @window_num: 0 or 1 for 5x5, 2 or 3 for 15x15
> + */
> +struct rkisp2_params_hist_big {

scripts/kernel-doc warns that this is not a kernel-doc comment; it
needs the "struct rkisp2_params_hist_big - ..." title and the other
members, since the header is pulled into the documentation.

Best regards,
Daniel

