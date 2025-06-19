Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F0CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jyQ70llV3X3ULPNZzN3WHGx1F/qkZGGFNfW76nhDfFM=; b=zIwcHRodDB19D0jfpU4J32h9TX
	xMwFgAYJBpEXGTu9DJsqYxT6h+uf73H0oV2w5dj20JtdvC8AY3pINv4/k2ORuafa/1uA+puknUmRV
	ruiRg/qwHEbgC46pQGMumUu5EPyWZbPftCOS7hMHcQ+DruZo/DE9aif/GJW1iO72Yw13K2ICJsAiz
	urIgQbb4vLszHhJJUDNCwimf5rrLY/U0na+vyuw6SgFsAl063u3+DCH5j0fBA8DLD1wwnVjhsj1HN
	uKwkQ1n6Xa+jIaYXF4hFfQAbaJzcXGswskrmzh2p/VmOpGIRY1FDaOi8lsCAFqa/s7Hu7dfivuW/4
	Vl+ADRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIgt-0000000DhpY-0Ob2;
	Thu, 19 Jun 2025 17:04:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSH03-0000000DNxP-0dv0;
	Thu, 19 Jun 2025 15:16:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750346180;
	bh=XqbG1XOiL6qsyT/mbeOSE4rpnh2l2DOkWH/Yqj+Cv9o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=kelXxDEN/QdNHQKOrU58SnIzr+lEWmj8NR0M3TjYD6c4pwh5GIDWFI6zPOOZq6hYe
	 w0olGxtPwgdjA2DGyxuRYVsrbZea59M+zKjKQ9X68Iwwp7UUE90klv8B8zWX4Uaq0f
	 YWPngXinkEPdoYEw5W0qp+lpTYMIE1P4beue8AMetujUtz74DwMlVzV7A7WRKDBZyw
	 NB+ZWX/7jK2YuH4+hIDKk8uDDFLgl/HrabTZeSbqPRwAu/7HbSI8CSQWcpmbsA5YVb
	 Ln1wJXr5BuZlzx+PjI38u8eaO87Ub10ebGV5WC3CdovpObP+75yuTB8+J/GtACu/BP
	 KGwyjN9daMBqg==
Received: from [IPv6:2606:6d00:17:b699::5ac] (unknown [IPv6:2606:6d00:17:b699::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D137217E09F0;
	Thu, 19 Jun 2025 17:16:16 +0200 (CEST)
Message-ID: <a66e3d27ee427710ed3de8ce89fa3aca40dced03.camel@collabora.com>
Subject: Re: [PATCH v4 4/6] media: rockchip: Introduce the rkvdec2 driver
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	20250325213303.826925-5-detlev.casanova@collabora.com
Cc: alchark@gmail.com, andrzej.p@collabora.com, cassel@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmitry.perchanov@intel.com, 	dsimic@manjaro.org,
 ezequiel@vanguardiasur.com.ar, gregkh@linuxfoundation.org, 
	heiko@sntech.de, hverkuil@xs4all.nl, jacopo.mondi@ideasonboard.com, 
	jeanmichel.hautbois@ideasonboard.com, jonas@kwiboo.se,
 kernel@collabora.com, 	kieran.bingham@ideasonboard.com, krzk+dt@kernel.org,
 	laurent.pinchart@ideasonboard.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, Jianfeng
 Liu	 <liujianfeng1994@gmail.com>, mchehab@kernel.org,
 naush@raspberrypi.com, 	robh@kernel.org, sakari.ailus@linux.intel.com,
 sebastian.reichel@collabora.com, 	tomi.valkeinen@ideasonboard.com,
 umang.jain@ideasonboard.com
Date: Thu, 19 Jun 2025 11:16:15 -0400
In-Reply-To: <5900973.DvuYhMxLoT@trenzalore>
References: <9f098eab-7b98-4827-8538-3cab0e8d7c63@gmail.com>
	 <5900973.DvuYhMxLoT@trenzalore>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_081623_348839_EF73B3CD 
X-CRM114-Status: GOOD (  20.63  )
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

Le jeudi 19 juin 2025 à 10:39 -0400, Detlev Casanova a écrit :
> Hi Jianfeng,
> 
> This patch set is now a  bit outdated. I will soon send a new version that you 
> can find at [1].
> That being said, you may be right. without an iommu, it would panic here 
> (although the iommu should really be used).

Let's make sure to test it in the next series. One should be able to comment out
the mmu node in the DT, and then it should work with CMA transparently.

thanks,
Nicolas

> 
> [1]: https://gitlab.collabora.com/detlev/linux/-/tree/add-vdpu381-and-383-to-rkvdec
> 
> Regards,
> Detlev
> 
> On Thursday, 19 June 2025 05:19:32 EDT Jianfeng Liu wrote:
> > Hi Detlev,
> > 
> > On Tue, 25 Mar 2025 17:22:20 -0400, Detlev Casanova wrote:
> >  >+        case RKVDEC2_ALLOC_SRAM:
> >  >+            virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
> >  >+
> >  >+            iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size)
> > 
> > I'm testing your patch with ffmpeg patched with v4l2-request patches[1],
> > and I usually
> > 
> > get kernel panic here. After checking rkvdec->iommu_domain before
> > running iommu_unmap,
> > 
> > I can pass fluster ffmpeg v4l2-request test. Here is my patch based on
> > your commit:
> > 
> > 
> > diff --git a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> > b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> > index 75768561399..122bcdcebd4 100644
> > --- a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> > +++ b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> > @@ -681,8 +681,8 @@ static void rkvdec2_free_rcb(struct rkvdec2_ctx *ctx)
> >                  switch (ctx->rcb_bufs[i].type) {
> >                  case RKVDEC2_ALLOC_SRAM:
> >                          virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
> > -
> > -                       iommu_unmap(rkvdec->iommu_domain, virt_addr,
> > rcb_size);
> > +                       if (rkvdec->iommu_domain)
> > + iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size);
> >                          gen_pool_free(ctx->dev->sram_pool, virt_addr,
> > rcb_size);
> >                          break;
> >                  case RKVDEC2_ALLOC_DMA:
> > 
> > 
> > [1] https://github.com/amazingfate/FFmpeg/commits/n6.1.1-new-patches/
> > 
> > 
> > Best regards,
> > 
> > Jianfeng
> 
> 
> 

