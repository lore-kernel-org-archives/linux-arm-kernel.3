Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E2DCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QASVcb39guPqWBVEepYuN9mgTvMydSxWLKCcERU+Jik=; b=worrjSJvOLvikst5yTY6nVC7y8
	IxsjuSyxZxuGLAAxQ260k0bpJgm9u7jxSUNVoswQ46bBIPNSZOTMDdiilTJw52wA0okNCn17v6h8f
	A1pXCWDnnPj3d1yNrRdBojCfm+XPqrYpSLwSzZQWjGCXjhgwAYQbyd458q4uijBd7aJV3ZQRC10ax
	nwDxUvL1oRLYmNAvj0olr3//8h5bbKmoLNV5xiBJIkhCU+Lyr/GrxWuPAtQKZt8y3zjRbVZSVtt46
	ixNGC7Nds95kpKxM6Pmv8l2tPjWBxvY9u2JOzvHbruyv426dE7gFK7ua9W8p33c7XptnsuyGAFO8/
	1osBVAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbx3S-00000005xbf-0N8N;
	Tue, 23 Jun 2026 09:04:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbx3Q-00000005xbQ-0vag
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 09:04:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4108400DA;
	Tue, 23 Jun 2026 09:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE5C1F000E9;
	Tue, 23 Jun 2026 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782205463;
	bh=QASVcb39guPqWBVEepYuN9mgTvMydSxWLKCcERU+Jik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mHB5Ejg+Viii+8jUkefpm1WrbDEIcfchy/MGXIvp8GfK17z+iT/MEPTkYrsWE3aR0
	 ShVdeVy6eqe1cMK34KZOul7TVGZzM3B01gh2JyhSeB71fboUmYRft/h6p3M0iDPkQZ
	 uzwe5HQXTrtBSHAOziJIXgYNOQ2WKSkLbMU4SxugFOx9KbNJPJV0UWPYw27pYOLNdX
	 Z0d6Kw1cdmCZMwgb/hPgvMkQIYvSje1VnpSokGb+xc/gA/c4TNKd+evZitIdaBQE0q
	 PwP+ra+C9rna92YzrzgkGxT9QbgZccT6NHa63kYQtDf9NB1bNtI8xk7IXYnhhqDi+b
	 sz4hcTj2V9S7Q==
Date: Tue, 23 Jun 2026 10:04:20 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Grammar s/may needed/may be needed/
Message-ID: <20260623-bizarre-optimistic-jackrabbit-dac4a0@sudeepholla>
References: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>
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

On Wed, Jun 03, 2026 at 05:17:51PM +0200, Geert Uytterhoeven wrote:
> Fix grammar in the help text for the ARM_SCMI_POWER_CONTROL symbol.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/firmware/arm_scmi/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
> index e3fb36825978ed6f..783c24a20e29190f 100644
> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -96,7 +96,7 @@ config ARM_SCMI_POWER_CONTROL
>  	  firmware.
>  
>  	  This driver can also be built as a module.  If so, the module will be
> -	  called scmi_power_control. Note this may needed early in boot to catch
> -	  early shutdown/reboot SCMI requests.
> +	  called scmi_power_control. Note this may be needed early in boot to
> +	  catch early shutdown/reboot SCMI requests.
>  
>  endmenu
> -- 
> 2.43.0
> 

I will apply this at -rc1.

-- 
Regards,
Sudeep

