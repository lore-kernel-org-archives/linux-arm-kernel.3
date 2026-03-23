Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E1BF4613D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rxq0Nf9DeU0SsluPr0WcRw1qCIonFk8R082hsT1zH2E=; b=Gh1XxMX1zU97e3VYe0EpxoE5pW
	re53gaRSSpAFa5vMtGJLulEM7RWXqZYJmU8oOfMk9d+rRDrCPEE2Yj0TlmXRtrQ/SJ2wL68JIKXqP
	fQGR2iSt4/Rnclb2/g/Xwwf/BAeXYIppgMk4IlcVXHTfpkKJXvUiU1GjGOlnuWkc/DsED31M4Hwoh
	Z5bhjvtM3gzEEusiK0Yhm5RV3Ex1xlVrm2INw+1PSE+csUJfEyYUI1zzf+/ity9aztsRVoLbCJ0da
	AE5KOJZ/9HezItnrASAq5MwKk3ObPjdaQ6UPga4e9/6eOBJXdSWGnR+9Mieih3omYmWf8UMy/WKVG
	7zocjyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hkC-0000000H5PV-1ZxZ;
	Mon, 23 Mar 2026 16:03:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hk9-0000000H5Or-3qQ4;
	Mon, 23 Mar 2026 16:03:07 +0000
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 993D719DF;
	Mon, 23 Mar 2026 17:01:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774281706;
	bh=xEt1T+5IaD2kByZSscV0lMn0HH53U/nhFkZ0bQ/2eZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHj+jVhdypJ3PdOJJ+vxoW4Mrt6GXypueUbe6MFnf3SYcKN2qAgR5D0p2h8OorLcC
	 8A+TznZMrbjxQQQkKxYzSnw6mgVOqb0bEFY3lzbwKaAfwl2JN+RW7P69Zu7lktQEOH
	 5T+yrqd9OUBjl6ZkEtx4Q6IxRwLbevYt/CayLbrI=
Date: Mon, 23 Mar 2026 17:03:00 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tfiga@chromium.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Allow non-coherent video capture buffers on
 Rockchip ISP V1
Message-ID: <acFkAPreOFBvoHid@zed>
References: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250303-b4-rkisp-noncoherent-v4-0-e32e843fb6ef@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_090306_115659_C5B2CFCC 
X-CRM114-Status: GOOD (  18.35  )
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

Hello

On Mon, Mar 03, 2025 at 02:40:08PM +0300, Mikhail Rudenko wrote:
> This small series adds support for non-coherent video capture buffers
> on Rockchip ISP V1. Patch 1 fixes cache management for dmabuf's
> allocated by dma-contig allocator. Patch 2 allows non-coherent
> allocations on the rkisp1 capture queue. Some timing measurements are
> provided in the commit message of patch 2.
>
> Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>

I regularly get back to this series everytime I have to reason about
the caching policies in vb2..

Is there any reason why it didn't get in ?

> ---
> Changes in v4:
> - rebase to media/next
> - use `direction` instead of `buf->dma_dir` in dma_sync_sgtable_*
> - Link to v3: https://lore.kernel.org/r/20250128-b4-rkisp-noncoherent-v3-0-baf39c997d2a@gmail.com
>
> Changes in v3:
> - ignore skip_cache_sync_* flags in vb2_dc_dmabuf_ops_{begin,end}_cpu_access
> - invalidate/flush kernel mappings as appropriate if they exist
> - use dma_sync_sgtable_* instead of dma_sync_sg_*
> - Link to v2: https://lore.kernel.org/r/20250115-b4-rkisp-noncoherent-v2-0-0853e1a24012@gmail.com
>
> Changes in v2:
> - Fix vb2_dc_dmabuf_ops_{begin,end}_cpu_access() for non-coherent buffers.
> - Add cache management timing information to patch 2 commit message.
> - Link to v1: https://lore.kernel.org/r/20250102-b4-rkisp-noncoherent-v1-1-bba164f7132c@gmail.com
>
> ---
> Mikhail Rudenko (2):
>       media: videobuf2: Fix dmabuf cache sync/flush in dma-contig
>       media: rkisp1: Allow non-coherent video capture buffers
>
>  .../media/common/videobuf2/videobuf2-dma-contig.c  | 22 ++++++++++++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-capture.c      |  1 +
>  2 files changed, 23 insertions(+)
> ---
> base-commit: b2c4bf0c102084e77ed1b12090d77a76469a6814
> change-id: 20241231-b4-rkisp-noncoherent-ad6e7c7a68ba
>
> Best regards,
> --
> Mikhail Rudenko <mike.rudenko@gmail.com>
>
>

