Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65143D262AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 01:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KckbhI7mq9h6//r/odChGanLv1MTdgC+smUjkQDg3aM=; b=Km4RDe65qqvwmhu5skx3gAbW66
	SqCwYvbXxJVTDk6ewNQwiYOgec9PaacyQaOsdT6NvvF0swHC+9a/3QPVdGWwlZoZkn9hwS8uP2QhO
	AqVV4+gQkY8cWeyctul2TLp7xSYuFN5O/uhiLlS8OPYQcaXzRzOP9bD0Fq3XB4nDCZ5nYujXZxPXo
	pmwb0LDxALmUznbhM53UzWPxYsMa2rw0nUgyGSygg7VSm1uAEZW6pEYA1AW0Fmg4uPqfMBWbjUz9M
	TssD60m2sL9A8bS2uFKavw+UCjJX2fDtf4SnwLRcifbKTA58HlI6X1MNVgYAwvJzU6/HhsmJPNKG7
	r2xMpDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNRa-00000004k2l-2ufB;
	Wed, 21 Jan 2026 01:55:38 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viNRY-00000004k1u-39TN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 01:55:38 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A06F92D7;
	Wed, 21 Jan 2026 02:55:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768960503;
	bh=PGWeRET9x9NwQjTr/PzV33RX/LFZSGDTwZRC8RPzxY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EliUVP7QuKOFHt1hDvbv68y3XnK9uzkCVa7VjpfqBSqRGRCnrUv3NadKN2YJsSgYw
	 q0PClgEr1lu4d9bdfMIQizKY9eO4M9KC5ncbxiv5aux1JLjybLzuOEOB0WkK76Gavk
	 lN1BG4qYkYMARtB+i91EyxPhKxHfIJ71uYNAmoWw=
Date: Wed, 21 Jan 2026 03:55:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v4 0/4] media: platform: nxp: Trivial cleanup pathces
Message-ID: <20260121015533.GD403250@killaraus>
References: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116-cam_cleanup-v4-0-29ce01640443@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_175536_944014_43888B62 
X-CRM114-Status: GOOD (  13.08  )
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

Hi Frank,

On Fri, Jan 16, 2026 at 11:29:18AM -0500, Frank Li wrote:
> Some trivial patch to reduce goto at probe functions.

I've applied patches 1/4 to 3/4 to my tree. 4/4 needs a few small fixes.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v4:
> - collect alex's review tag
> - fix grammer in error message
> - Link to v3: https://lore.kernel.org/r/20251215-cam_cleanup-v3-0-a61995068f38@nxp.com
> 
> Changes in v3:
> - rebase to v6.19-rc1
> - avoid use __free() == NULL according to cleanup.h
> - Link to v2: https://lore.kernel.org/r/20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com
> 
> Changes in v2:
> - add new patch media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
> - detail change see each patch's change log.
> - Link to v1: https://lore.kernel.org/r/20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com
> 
> ---
> Frank Li (4):
>       media: nxp: use dev_err_probe() to simplify code
>       media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
>       media: nxp: use cleanup  __free(fwnode_handle) simplify code
>       media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
> 
>  drivers/media/platform/nxp/imx-mipi-csis.c         | 54 +++++++--------
>  drivers/media/platform/nxp/imx7-media-csi.c        | 14 ++--
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 16 ++---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 77 ++++++++++------------
>  4 files changed, 71 insertions(+), 90 deletions(-)
> ---
> base-commit: 49cc7b5d0dee386c44b51a90eb49037b2a1f5b2e
> change-id: 20250807-cam_cleanup-b6d90ba9dac3

-- 
Regards,

Laurent Pinchart

