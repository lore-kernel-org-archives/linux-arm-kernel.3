Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730B3C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCPQY2s7Li9KbXRAy98AdJWgLwoyUR6+yD7sEQfOnDg=; b=FqtCboLK36UzfGl1577L3lWuO6
	m7YDLzzV2EngXw+LQ7FDMtVOU0EFY5LJeMowIf8zLG2GmzcGsO3ejBaXCDLaJq953tRc2/hUd7rEE
	hNkjr+SSyD8oolYcerQ40SNi2ACkVr0fYObbD8lMzdsFmvyKH6G08Rc/3JE2trEa8KwZAljnsZYmG
	HUhQmt3/SVO/iGDirRUmaLtybHD5Wl7fH9O+HBhu1Uy24p7uwWnfxLQjygejp2bZtF9/jZirYJ4NR
	x0x2OljDDu/b7vC+vdq1OD1tlFmvht8uFHZzNovapuhoaas6OtJkncGZfWm+8VznEqfgdj8wRWtA8
	b6uVj0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qOa-0000000467r-0V5r;
	Sat, 05 Sep 2026 13:25:24 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qOY-0000000467F-1Q4c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 13:25:23 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-853e2610bb4so2100453b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1788614718; x=1789219518; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCPQY2s7Li9KbXRAy98AdJWgLwoyUR6+yD7sEQfOnDg=;
        b=nQoGuLcpBE1eszb7gXhQNtgJrnMvYuLvOQPYNl4LzObHAzREvVlkejJTv6P23ySqqe
         ybGy+aL3pjRZjzv9+ObJO9uYfV3b9+E3pYjFXu31FZuh5SUKpPrGskrzpLuNKQwJgzqP
         rh2nnCSU/l6QTkrUvozQudw5iTx2QjMRGCpwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788614718; x=1789219518;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCPQY2s7Li9KbXRAy98AdJWgLwoyUR6+yD7sEQfOnDg=;
        b=OQgmw/cQKGEE64ryN3b9kYBGPwU/8emhI6KYwGzEeMRENP9Jgoh2NVqNuTTzY26KuB
         NYLC0AM8wZbd6vlD3lJg11pHbXkKNrjro8lmRm+STsIN+z4u1wIvi8J93g5H4oy0WHMC
         lDmNS4LkMnZ/NB81mn9X2hjT2y77rqPtmopHcz/4zX7WIte+mStDiZLoIVi6GJ1PPrB7
         S/7+sl+IkCSFwCCY9HjFCT8XHc/d+R2TxwWUdW7slH8wJrAwavhBBsB2J0Kx6b7J5ePt
         NrreEj5Ak34qtJMdyKZUXRkNluhNbQIEt9bMX1Dapk4DgzdhTnWmyFEbNTnvTDm+C5Ca
         W6Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzX5oUN384yF7QCS0rFEIQaFa7wqJvxdskQTugQxjRakhh7dop93jpgANiM9nAjd7nRVky036wu814L7oZzE4CC@lists.infradead.org
X-Gm-Message-State: AFuF++kITf/DwPODkF5L5NqOXxqYpt/z15eJJmUDAPqlQkMQGTeUBFRp
	SnlDBJE3/EPepx/isGH1YYs82tU0TOtdLw/8NaQVVCoCFpf20ys5YSVKD8YAZcyIMSq2OWLC9Av
	caOJn
X-Gm-Gg: AYBFou2ESPBlXFhkXnxSvA/+dPEA09zRIqDlIesCgMlTdHQ1Lmk4xhGhH9w5bfbWACM
	BS2aX4Bo//HgllI9FuYmQh75EAHNoqkVTN6H2CGKnfdHvE4mVcXfbOrY89HA+J/6+kaBdWCEuMa
	uUox0X5GQ2zG5XdwspkrWJAZD7+cz/wDwTkST6819SPahDqw+cvHvqPiyT3T142WnxZ3fqkZ7PC
	xLQoLB8jK88I89ABEFkPmdyv0rEP0eZk4PHVS1GNsumAPO3rq7Eq/uuQwf2D97K50WjdotrgdyA
	ya11+WmWPWXcInbLBSxYvt7rQE0SjWyQSrNnftY7Xg5v8hA67Yoz0SbvLUp2BeRvq3DJgMtSqZs
	BA0Xcib8iU7cPSCntMxZxhT8H9OV294OaCCVgpIi+ckosUsFfvEkFtSc68hcJQmDXynT/XMr1c1
	rZxJL1NhwWmH2zgmnKMl5ZRTxL1HtU9vxyDxwrmZnNlCn/frR9n07aZMs6rGAF5bJP
X-Received: by 2002:a05:6a21:a395:b0:3d3:aed2:6f28 with SMTP id adf61e73a8af0-3da2168b2c9mr18634503637.28.1788614718057;
        Sat, 05 Sep 2026 06:25:18 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc465376831sm903641a12.9.2026.09.05.06.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:25:17 -0700 (PDT)
Date: Sat, 5 Sep 2026 22:25:02 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiaxing Hu <gahing@gahingwoo.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] accel/rocket: search every core slot when a core is
 removed
Message-ID: <apwUewaRnoTNXHCt@rock-5b-plus>
References: <20260904125936.26234-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904125936.26234-1-royalnet026@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_062522_440645_CAD92F5B 
X-CRM114-Status: GOOD (  36.97  )
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

On Fri, Sep 04, 2026 at 02:59:36PM +0200, Igor Paunovic wrote:
> rocket_remove() decrements rdev->num_cores for each core it removes,
> while find_core_for_dev() searches slots 0 to num_cores - 1. Unbinding
> the cores in the order they were bound therefore loses the last one: by
> the time it is removed the search range has already shrunk past its
> slot, so find_core_for_dev() returns -1 and rocket_remove() gives up
> without doing anything.
> 
> num_cores never reaches zero, rocket_device_fini() never runs, and the
> file-scoped rdev keeps pointing at a device that is going away. Binding
> the cores again starts from that stale count, because rocket_probe()
> takes rdev->num_cores as the slot to fill. On an RK3588, which describes
> three cores, the second round lands on slots 1, 2 and 3 while rdev->cores
> was allocated with room for three:
> 
>   rocket fdab0000.npu: Rockchip NPU core 1 version: 1179210309
>   rocket fdac0000.npu: Rockchip NPU core 2 version: 1179210309
>   rocket fdad0000.npu: Rockchip NPU core 3 version: 1179210309
> 
> The write to rdev->cores[3] is past the end of the array.
> 
> Nothing in tree reads the core array often enough to notice, so the
> overrun is silent today. It turned up while testing a devfreq series on
> top of this, where a worker walks every core a few times a second, and
> UBSAN caught the first bool it read out of the overrun entry:
> 
>   UBSAN: invalid-load in drivers/accel/rocket/rocket_devfreq.c:47:10
>   load of value 5 is not a valid value for type '_Bool'
>   Workqueue: devfreq_wq devfreq_monitor
> 
> Record how many slots were allocated and search all of them. Every core
> is then found on removal, num_cores reaches zero, the device is torn down
> and a later bind starts from a clean rdev.
> 
> This does not make unbinding a single core out of several work. probe
> still takes num_cores as the slot to fill, so rebinding one core while
> its siblings stay bound would write over a slot that is already in use,
> and rocket_open() still reaches for cores[0] whether or not anything is
> there. Both of those want more thought than a fix should carry.
> 
> Found by unbinding and rebinding all three cores on an Orange Pi 5 Plus.
> With this applied, 25 unbind/rebind rounds and 5 module unload/reload
> rounds run clean there: the cores land in slots 0, 1 and 2 every time,
> whichever order they are bound in, and the shared supply goes back to a
> single user after each round.
> 
> Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> Assisted-by: LLM sparse checkpatch
> ---
>  drivers/accel/rocket/rocket_device.c | 2 ++
>  drivers/accel/rocket/rocket_device.h | 1 +
>  drivers/accel/rocket/rocket_drv.c    | 2 +-
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> index 46e6ee1e72c5f..efd004194c1af 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -31,6 +31,8 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
>  		if (of_device_is_available(core_node))
>  			num_cores++;
>  
> +	rdev->max_cores = num_cores;
> +
>  	rdev->cores = devm_kcalloc(dev, num_cores, sizeof(*rdev->cores), GFP_KERNEL);
>  	if (!rdev->cores)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/accel/rocket/rocket_device.h b/drivers/accel/rocket/rocket_device.h
> index ce662abc01d3d..c62d567010696 100644
> --- a/drivers/accel/rocket/rocket_device.h
> +++ b/drivers/accel/rocket/rocket_device.h
> @@ -19,6 +19,7 @@ struct rocket_device {
>  
>  	struct rocket_core *cores;
>  	unsigned int num_cores;
> +	unsigned int max_cores;

Hi Igor,

I've tested this patch in Radxa Rock 5 B+ and it works. The test is that unbinding all
cores in sequence 0,1,2 and rebind all. It seems that there is other issue about num_core.
For example, sched_to_core() finds core for sched with num_core and it could make same
error like find_core_for_dev().

Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, 3 cores

Thanks,
Sidong

>  };
>  
>  struct rocket_device *rocket_device_init(struct platform_device *pdev,
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> index 8bbbce594883e..2bcfe4ab3c68f 100644
> --- a/drivers/accel/rocket/rocket_drv.c
> +++ b/drivers/accel/rocket/rocket_drv.c
> @@ -223,7 +223,7 @@ static int find_core_for_dev(struct device *dev)
>  {
>  	struct rocket_device *rdev = dev_get_drvdata(dev);
>  
> -	for (unsigned int core = 0; core < rdev->num_cores; core++) {
> +	for (unsigned int core = 0; core < rdev->max_cores; core++) {
>  		if (dev == rdev->cores[core].dev)
>  			return core;
>  	}
> -- 
> 2.43.0
> 

