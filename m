Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5C4E94623
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 23:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29oLPhR6h5SElipeohOoYzvnmJUNK6SBR95HZvjkT+0=; b=mBCpdpOGN/y2QrLUUStp+brvrT
	BfdlTtmasZckk6+Nn+rEzLdxz8WhW7tVKLD3a4s2KXp4uo9Pv729FheiKH2GCnFwJLZrRWfUzMcpb
	Qv1AhkpQ4DlXQpdTkr/Lwf272a4C11O42PlI+DbIrEfrwkdNoWgkElpkTaDptcZTWEqfe/G6Dzxxy
	H62ZexVhMVl3klIcSJLSk2ZU3SzodBwHvh98NSaeGxXTWaso0/J1pgJ8izuGdWP9fyN5vHlsMLesA
	v/8yZdsdmh/qiyQNmxdyh1KygW6VQU1Lv4YMW2PgQooECzjjU6juej2FcxyWukwoHr0ON7A9gp9Br
	e5U0d5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpagu-0000000GBd7-3fBz;
	Mon, 09 Feb 2026 23:29:16 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpags-0000000GBcX-0hy7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 23:29:15 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 43A6412D6;
	Tue, 10 Feb 2026 00:28:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770679706;
	bh=6YRF/RM4C2vdyZRqt+2HD9H6qbE4nstaOyDBzNqk508=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka86n62T5SDAhL/BulAPwZhsX429N/uzQ2oifRabGtI3C+jI78Y0LkXdVP68t2gYW
	 Cq6FTWb/LrF38MnxYdfHS47PS4QDYFbt+r6L2+mbFzZY7XXRbbD/Jymh2NTRSiNJBT
	 iG3gGkiv+P2ZI7EaVSI4RMv1usG3CBmqwBTgyMnQ=
Date: Tue, 10 Feb 2026 01:29:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 08/11] media: uapi: Add NXP NEOISP user interface header
 file
Message-ID: <20260209232910.GH2405149@killaraus.ideasonboard.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-9-antoine.bouyer@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123080938.3367348-9-antoine.bouyer@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_152914_349871_67ED356F 
X-CRM114-Status: GOOD (  17.64  )
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

On Fri, Jan 23, 2026 at 09:09:35AM +0100, Antoine Bouyer wrote:
> Add user space api header file for meta data structures definitions.
> 
> This header describes `parameters` buffer for the ISP blocks control by
> userspace, and `statistics` buffer for userspace and IPA handling.
> 
> These 2 buffers both support legacy and extensible modes. Legacy mode is
> a static fixed buffer structure, while extensible mode uses the
> v4l2-isp generic definitions to support various amount of ISP blocks.
> 
> Parameters buffer uses v4l2-isp generic definitions, so as other ISP
> devices (rkisp1, mali-c55). Statistics buffer uses the newly introduced
> generic `v4l2_isp_stats_buffer`, which behaves the same as the generic
> `v4l2_isp_params_buffer`.
> 
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
>  include/uapi/linux/media/nxp/nxp_neoisp.h | 1968 +++++++++++++++++++++
>  1 file changed, 1968 insertions(+)
>  create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
> 
> diff --git a/include/uapi/linux/media/nxp/nxp_neoisp.h b/include/uapi/linux/media/nxp/nxp_neoisp.h
> new file mode 100644
> index 000000000000..186973a1a6b2
> --- /dev/null
> +++ b/include/uapi/linux/media/nxp/nxp_neoisp.h
> @@ -0,0 +1,1968 @@
> +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR MIT) */
> +/*
> + * NXP NEOISP userspace API
> + *
> + * Copyright 2023-2026 NXP
> + */
> +
> +#ifndef __UAPI_NXP_NEOISP_H
> +#define __UAPI_NXP_NEOISP_H
> +
> +#include <linux/media/v4l2-isp.h>
> +#include <linux/types.h>
> +#include <linux/v4l2-controls.h>
> +
> +/*
> + * Check Documentation/admin-guide/media/nxp-neoisp.rst for control details.
> + */
> +#define V4L2_CID_NEOISP_SUPPORTED_PARAMS_BLOCKS (V4L2_CID_USER_NEOISP_BASE + 1)

I wonder if we should turn this into a standard control, given that all
ISPs will need it.

Would a control to report the supported statistics block be useful too ?

[snip]

-- 
Regards,

Laurent Pinchart

