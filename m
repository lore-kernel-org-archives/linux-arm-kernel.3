Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB68606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QH8k8DvS;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=BeH9E2k2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EdY6+wYeDdnUje+R1g1j4XuTn73oQtfDUp6Dbz0NBGs=; b=QH8k8DvSuiHBh4VRuef8Lb7zj5
	D1yeNUxouiQFKT9N3mBqAalU6/HSVMEN6TScOtv+Tm7le2BImkU11tjP7oZcdaXZFnhcmp3WVuH5Y
	ZW7DeI1C+EfgmiIVguksTRaorybDIT/h4y3hQ769xL8fWoUxDG/GJn3ioY1O4UbuZGlSfw8A1cOaZ
	HS7+GGykrBtFirhHOPZpAono2Sel6LbA5V4bG/KCMXrLiO4KInUse6eHe0BQzZ2aiwxt0IOnqIBD0
	9oYDIRNpC2XWTPO4b95p4tG0BCpqPxQvieWUNpahHPxZbIAignMrPvXfwUtNTnMTtkt5guuTgXE6n
	uxhY9O2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOd6X-00000005p1b-3IRb;
	Wed, 04 Nov 2026 15:40:49 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOd6W-00000005p0c-08kn;
	Wed, 04 Nov 2026 15:40:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793806829; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YMXVYCuqLzu4aT6Q4FGm8rJbw2jKzK89E3q5kVShQtyZTSNe5+G6REZ7wEYxNxDeu3qRieuHJMG3eKgJnsma+9eXm1VZS02TPsefsRsc4QMymtI+JM8R2iSX99sTD9/J5Nieax4FD9IGId2QIlb29BIuXSp20yHFyRfndU2Sjv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793806829; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EdY6+wYeDdnUje+R1g1j4XuTn73oQtfDUp6Dbz0NBGs=; 
	b=P6571hJjiCz2rF9NiKNaLZxX6UbgXjs8Y8+zvsOFZ2qFp6tJs4WWqP0XPv1Cd+HIinERR0RVcJV7WLGz9G22YeFs1Wv5IGExWAGKW5k5Mt3VEXYVNFCxVr78SrYl4E3XgvvRy19ZmtMMADpguerB1GlEnGn92B7xNLMosC3BuNs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: a=rsa-sha256; b=BeH9E2k2x+eEgsHkO6RWJZv7dKaXBN0tcBxgf180tMZ5gVqdmlm+B0nRE3acHBZUnctHpHhnKx4k9EM3kfFPvGhqsWJU4eP8A5ePwQyceg1zDtm3MmG7TctMfGUT36lfLzILPkbtCfnEbylEIpBVQlxDpgpItBCThEEQWktjfbs=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=EdY6+wYeDdnUje+R1g1j4XuTn73oQtfDUp6Dbz0NBGs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793806827127529.3656251564183;
	Wed, 4 Nov 2026 07:40:27 -0800 (PST)
Date: Wed, 4 Nov 2026 15:40:22 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: iav@iav.lv
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Heiko Stuebner <heiko@sntech.de>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/panfrost: Gate the RK3399 GPU clock in runtime
 suspend
Message-ID: <autNWETrwrHbD2H9@sobremesa>
References: <20261030-panfrost-rk3399-pm-rt-v1-1-e94437159a9d@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030-panfrost-rk3399-pm-rt-v1-1-e94437159a9d@iav.lv>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/293.791.62
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_074048_133174_34CF3660 
X-CRM114-Status: GOOD (  25.05  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Igor,

On 30.10.2026 06:43, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The RK3399 Mali-T860 matches arm,mali-t860 and gets default_data, so
> panfrost enables aclk_gpu at probe and keeps it enabled until unbind;
> runtime suspend powers the GPU off but leaves the clock on.
> 
> On ROCK Pi 4A restore from hibernation hangs in genpd_restore_noirq()
> of the GPU while panfrost is bound. With the clock gated in runtime
> suspend, as on the Allwinner H616 and the Renesas parts, it restores.

I find the wording in the preceding paragraph a bit confusing . Would
you mind clarifying what 'parts' means here? I guess you refer to
specific SoCs.

Also, I wonder why not disabling the clocks would forestall coming back
from a power suspension state. Have you raised this matter to the
maintainers of the RK3399 SoC subsystem?

Would you also mind describing what you did to reproduce this
resume-from-suspend issue? Lately we've been getting some fixes for
similar SoC issues and I wonder whether mine also has it.

> Match rockchip,rk3399-mali to default_pm_rt_data.
> 
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on ROCK Pi 4A, drm-misc-next 33ed26235db9 with the rkvdec fix [1]
> applied: hibernation with HDMI active restores 6 of 6 with this patch
> (once right after glmark2-es2-drm), and hangs 2 of 2 without it.
> [1] fixes the same kind of hang in rkvdec, which otherwise hits first.

If this patch depends on another fix being merged first, I think it's
best you delay sending a v2 until it's been committed to its relevant
subsystem tree and changes pulled into drm-misc-next.

> [1] https://lore.kernel.org/r/20261030-rkvdec-runtime-pm-clocks-v1-1-fb2c5b629e79@iav.lv

I'm not entirely sure about what patch submission guidelines say about
testing information, but normally commit trailers must come about
last. Would you mind then moving this to right before the S-o-b?

---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7c348a0bf1ee..21a9a12abefc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -983,6 +983,7 @@ static const struct of_device_id dt_match[] = {
>  	  .data = &amlogic_data, },
>  	{ .compatible = "renesas,r9a08g046-mali", .data = &default_pm_rt_data },
>  	{ .compatible = "renesas,r9a09g047-mali", .data = &default_pm_rt_data },
> +	{ .compatible = "rockchip,rk3399-mali", .data = &default_pm_rt_data },

You're effectively adding support to a whole new SoC. This made me
wonder, are we sure suspension resumption not working is only because of
GPU_PM_RT? Shouldn't we know first about its supplies and power domains,
and any potential GPU quirks? I think this goes beyond my knowledge, so
maybe Steven Price can pitch in.

>  	{ .compatible = "arm,mali-t604", .data = &default_data, },
>  	{ .compatible = "arm,mali-t624", .data = &default_data, },
>  	{ .compatible = "arm,mali-t628", .data = &default_data, },
> 
> ---
> base-commit: 33ed26235db93162935d1719bc6f538c384a2fd8
> change-id: 20261030-panfrost-rk3399-pm-rt-cea3fc1790d9
> 
> Best regards,
> -- 
> Igor Velkov <iav@iav.lv>

Adrian Larumbe

