Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B30606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DxdY7x2Q;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=TDNlPvDd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sdEbF/CdcFTeewgIOfs6NnkfjTHWigrh08gtk/yhio4=; b=DxdY7x2Qp43e1W
	WNk0cB3eH8WmBVM1PHr8GcPQpQ4RFxR+UdrpKMa+cLd3u0M+Tdw4ZIj34sJlxDlbx7HOH2kuDR2fz
	zH0pKOqWphA26TAci9pD/U4eCI60vyvAaepFMHBdrtZc/D51Gw9+yd2h7BsuDQhtlhioDLdW/itlI
	sCB3pAGz+XAr+dlzy20psbUFVBJ8k6Ve8FB01L6BMz+32wHTyV+aLs1ejpRmK+Dd2y7Vl88qs4tSR
	1C1wF3D09N/W/7dsXPwT2NIb7N3LSMG4LJPosxjvAwhWFN8wSe8uaXq602KuGuQGHgF3yP25asqIj
	unC9FrblyvNF4e23BayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOECB-00000002Sfn-3rAm;
	Tue, 03 Nov 2026 13:05:00 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEC8-00000002Sf9-1wt9;
	Tue, 03 Nov 2026 13:04:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793711082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cH64I3HYKwXkyDHsGMQ08l/OCv9IcVronFRoMHJmLjsCUMLPgeR0slE5LZPuBOGW27/prbUmS9JPhyftHq8Kh1g/toGrkpdwyi/gApWtuenRWMT4GbS2rsTZ7o/mliy4ToZJf/GGPymSEfdOFeFTtcvEMWut3Wxa1CX/m542krw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793711082; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=sdEbF/CdcFTeewgIOfs6NnkfjTHWigrh08gtk/yhio4=; 
	b=URt9ABoH8lXbOV+Dr5/eiBlcYncKy1wGqRMwEjMEhAlL2b9enS3vcSs0fkW3FsOJ1zUVAVJus7Yyd89F5P70OqpgXtD53B16cuiPLuCJLpf56M5cmWON2DwnDwimn2NSmrfemzsO+QjHJrfM8ch3ogoteObSJzzQSkxRhoNebhU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=TDNlPvDdR52Uynh5TxQXKHhjrfjeJn5CX+S6g8Jyg4tPpnIjEuGOxOtA2kzpcysfvE/P8x3TLbV6a1nsJKMrc3/QTO00V6dXopO7/eO67fy1YNSXl0lVT25i1u0lvUdSj3n1+M5s33Ed7TCZdUd5d9/lv2b8rtPKo94z0HZxDYQ=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=sdEbF/CdcFTeewgIOfs6NnkfjTHWigrh08gtk/yhio4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793711079043560.9418675221888;
	Tue, 3 Nov 2026 05:04:39 -0800 (PST)
Message-ID: <2e3ca852-03c1-4825-87ea-0a3decad8d6c@collabora.com>
Date: Tue, 3 Nov 2026 14:04:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] media: rockchip: rkcif: mask MIPI interrupts when
 powered
To: Daniel Golle <daniel@makrotopia.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1793702189.git.daniel@makrotopia.org>
 <24332831989fde000959b3d3037333f511b95ece.1793702189.git.daniel@makrotopia.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <24332831989fde000959b3d3037333f511b95ece.1793702189.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_050456_570331_971761DF 
X-CRM114-Status: GOOD (  23.81  )
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Daniel,

Thanks for the patch.

On 11/3/26 11:45, Daniel Golle wrote:
> The MIPI interrupt enable register comes out of every reset with all
> 27 sources enabled. Of those only the frame end bits are handled, so

That seems highly unusual. How did you analyze this behavior? Feel free
to throw any patch over the fence that reproduces/displays it.

> the line stays asserted at about a thousand interrupts per second
> while the block is powered. The kernel then reports the interrupt as
> unhandled and disables it, after which frame completion only happens
> from the spurious interrupt poll. The poll can also call the handler
> while the block is clock gated.
> 
> Clear the enable register and the status bits after the block has been
> reset and clocked, and after the reset in runtime suspend. Treat any
> status bit that the handler has read and cleared as handled.

Can we configure the interrupt in rkcif_mipi_start_streaming instead?
This feels a bit more natural IMHO.

Best regards,
Michael


> 
> Assisted-by: LLM
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../rockchip/rkcif/rkcif-capture-mipi.c       | 19 +++++++++++++++++++
>  .../rockchip/rkcif/rkcif-capture-mipi.h       |  2 ++
>  .../media/platform/rockchip/rkcif/rkcif-dev.c |  3 +++
>  3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> index bc9518f8db507..686b995525b9b 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
> @@ -810,6 +810,23 @@ static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
>  	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, val);
>  }
>  
> +void rkcif_mipi_irq_mask(struct rkcif_device *rkcif)
> +{
> +	if (!rkcif->match_data->mipi)
> +		return;
> +
> +	for (unsigned int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
> +		struct rkcif_interface *interface =
> +			&rkcif->interfaces[RKCIF_MIPI_BASE + i];
> +
> +		if (!interface->rkcif)
> +			continue;
> +
> +		rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, 0);
> +		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, ~0);
> +	}
> +}
> +
>  irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
>  {
>  	struct device *dev = ctx;
> @@ -823,6 +840,8 @@ irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
>  
>  		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
>  		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
> +		if (intstat)
> +			ret = IRQ_HANDLED;
>  
>  		for (unsigned int j = 0; j < interface->streams_num; j++) {
>  			struct rkcif_stream *stream = &interface->streams[j];
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> index 7edaca44f653c..167b43756929b 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
> @@ -21,4 +21,6 @@ void rkcif_mipi_unregister(struct rkcif_device *rkcif);
>  
>  irqreturn_t rkcif_mipi_isr(int irq, void *ctx);
>  
> +void rkcif_mipi_irq_mask(struct rkcif_device *rkcif);
> +
>  #endif
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> index be3a174b9aab0..fbc8ed78d99ea 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -281,6 +281,7 @@ static int rkcif_runtime_suspend(struct device *dev)
>  	reset_control_assert(rkcif->reset);
>  	udelay(5);
>  	reset_control_deassert(rkcif->reset);
> +	rkcif_mipi_irq_mask(rkcif);
>  
>  	clk_bulk_disable_unprepare(rkcif->clks_num, rkcif->clks);
>  
> @@ -298,6 +299,8 @@ static int rkcif_runtime_resume(struct device *dev)
>  		return ret;
>  	}
>  
> +	rkcif_mipi_irq_mask(rkcif);
> +
>  	return 0;
>  }
>  


