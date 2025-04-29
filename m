Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0182C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 09:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLcmBIsCACJDjUqAJtkO3HjgZL+AZDeLLjzKL5Mpp1Q=; b=q1nFlKW4EZJOnGJGMoGJRxbXaM
	tRLR09t7qtlMg1/RCGvWt9Cxy+uwcYO6uijDlnJ2ZBaF+j2C4YxOFSHNucgQIxm1HD9XAiKd6NZNg
	OpiIsJE0D/2cpqjZgXlfXRVDtyJvYcSxjm1FaJbrVm9B3SON751Qj4/3i4sX2pUp98Kvj+JlOh01b
	jeWLyTGx9o2c8cgY274w19NqdQi78TaddQvjRAsZ2fJrIFIpoR/QzqJJJmr1+o5QLK/ebzwiLGZ9F
	pWbRvr0Ay/+vLGzPpozhSaAwMNM++194fNw/URvkE1dpIztg+jbTKgwIg/qogkKaXer91AMjmLWWc
	6BTggZ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hVA-00000009BRA-1Afm;
	Tue, 29 Apr 2025 09:43:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hS3-00000009B02-2qEQ;
	Tue, 29 Apr 2025 09:40:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hLcmBIsCACJDjUqAJtkO3HjgZL+AZDeLLjzKL5Mpp1Q=; b=hAxLNYMpFQAQiWXMAuvh4Hp+4s
	/n+yIEvRWdRV4iazthpj8FDjGrRexfXp8rA3n+RQ1n9HoA5fSEPfCA4Rhg4Tky+zLQeJolOXi+prq
	0PeM9D3QQXmrhHn0mV0y2RsAo40yAZaK3yBSckstoYuRWoRbjre3cdrQtAGhZtFaT3hXAaGqCvy+V
	dZu+GBbjz/Hnspd2SIzih5fX7emlg+AUZhEF2tvm6xaHpiPIK+c7FN+9IkYzwjo5370q3Jar0rD7W
	04aaMzymk0FCkG6boE/mS0U7vaMqDGIsUaFolYIwFyD/fM98SuxOVvn9Y1F8YL/az1UpsAmxBUxCe
	GEUeKOLg==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9hRz-0000000DFtu-3nc9;
	Tue, 29 Apr 2025 09:40:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745919602; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CrRxVW/rjrrTpEX877OQp09PyFktoNq4tLm8pehDoxuZm9tRiQej5iH1DAx5qDT9Lc4NOb6SmFIJhPQWWjj3NXtAVhj7dwEyFkZR+qD6SRCsZSDTo3irFeJnHxGrejqVL7as981LljIPT+GW/s6CBivRwxQj3gYeaX4+BVwzJ7M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745919602; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hLcmBIsCACJDjUqAJtkO3HjgZL+AZDeLLjzKL5Mpp1Q=; 
	b=GPZeeF9NHa0+ftrpZl4aZ8Mop5XFx2Ruj4qp5aB37/XaCRaadIfTDNlR2t4LuGXZAcebXlk8pR5Mhj+rsWbtSPnWUbHIcrnEvSnlGG2jGoEyw4XjVKvqCCHrL4bNDIQsz5OoEM6oSBdpbndb2kqeSi87n6aaTXIWYRJOD5iRSck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745919602;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=hLcmBIsCACJDjUqAJtkO3HjgZL+AZDeLLjzKL5Mpp1Q=;
	b=FUWvce3l0LAyC3oL+PJY12QkqhLVXz42z07AN6mnx/ARAY67DZuYjHPP+ne+jW8q
	gI8fLDMp8XW+4rLBKWxRzGoc90GHy3t3UK0r6m9ZX4b/ekFufCgRHaBKLUpepFbtKtL
	LPD2Ge/TYfWhDsirdN40DB7REFsV5aAKJ3Ago1+Q=
Received: by mx.zohomail.com with SMTPS id 1745919600383113.998544462219;
	Tue, 29 Apr 2025 02:40:00 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: Re: [PATCH v2 4/7] accel/rocket: Add a new driver for Rockchip's NPU
Date: Tue, 29 Apr 2025 11:39:52 +0200
Message-ID: <12654406.O9o76ZdvQC@workhorse>
In-Reply-To: <20250225-6-10-rocket-v2-4-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
 <20250225-6-10-rocket-v2-4-d4dbcfafc141@tomeuvizoso.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_104028_612352_4AE13FBD 
X-CRM114-Status: GOOD (  37.96  )
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

On Tuesday, 25 February 2025 08:55:50 Central European Summer Time Tomeu Vizoso wrote:
> This initial version supports the NPU as shipped in the RK3588 SoC and
> described in the first part of its TRM, in Chapter 36.
> 
> This NPU contains 3 independent cores that the driver can submit jobs
> to.
> 
> This commit adds just hardware initialization and power management.
> 
> v2:
> - Split cores and IOMMUs as independent devices (Sebastian Reichel)
> - Add some documentation (Jeffrey Hugo)
> - Be more explicit in the Kconfig documentation (Jeffrey Hugo)
> - Remove resets, as these haven't been found useful so far (Zenghui Yu)
> - Repack structs (Jeffrey Hugo)
> - Use DEFINE_DRM_ACCEL_FOPS (Jeffrey Hugo)
> - Use devm_drm_dev_alloc (Jeffrey Hugo)
> - Use probe log helper (Jeffrey Hugo)
> - Introduce UABI header in a later patch (Jeffrey Hugo)
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>  Documentation/accel/index.rst           |    1 +
>  Documentation/accel/rocket/index.rst    |   19 +
>  MAINTAINERS                             |    8 +
>  drivers/accel/Kconfig                   |    1 +
>  drivers/accel/Makefile                  |    1 +
>  drivers/accel/rocket/Kconfig            |   25 +
>  drivers/accel/rocket/Makefile           |    8 +
>  drivers/accel/rocket/rocket_core.c      |   71 +
>  drivers/accel/rocket/rocket_core.h      |   29 +
>  drivers/accel/rocket/rocket_device.c    |   29 +
>  drivers/accel/rocket/rocket_device.h    |   29 +
>  drivers/accel/rocket/rocket_drv.c       |  273 ++
>  drivers/accel/rocket/rocket_drv.h       |   13 +
>  drivers/accel/rocket/rocket_registers.h | 4425 +++++++++++++++++++++++++++++++
>  14 files changed, 4932 insertions(+)

Hi Tomeu,

I've got some more comments on the driver, this time specific to some power
management stuff I've noticed.

> +++ b/drivers/accel/rocket/rocket_core.c
>
> [...]
>
> +int rocket_core_init(struct rocket_core *core)
> +{
> +	struct device *dev = core->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	uint32_t version;
> +	int err = 0;
> +
> +	err = rocket_clk_init(core);
> +	if (err) {
> +		dev_err(dev, "clk init failed %d\n", err);
> +		return err;
> +	}
> +
> +	core->iomem = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(core->iomem))
> +		return PTR_ERR(core->iomem);
> +
> +	pm_runtime_use_autosuspend(dev);

We're enabling autosuspend here, but don't use
  pm_runtime_dont_use_autosuspend(core->dev);
in rocket_core_fini. dont_use_autosuspend is only handled for us automagically
on driver unload if we use devm wrappers for pm_runtime_enable, so this is most
definitely an oversight.

> +	pm_runtime_set_autosuspend_delay(dev, 50); /* ~3 frames */

The 50 = 3 frames thing here seems suspect. 3 frames of what, and why? If it's
3 frames of something the hardware processed, then doesn't that depend on the
specific hardware and its clock rate, which may change? Plus, shouldn't auto-
suspend be blocked anyway when there's still a job processing? The RK3588 TRM
doesn't make a mention of "frame" in the RKNN section, so if this refers to a
specific workload then that will be another parameter.

> +	pm_runtime_enable(dev);
> +
> +	err = pm_runtime_get_sync(dev);

No error checking done here, so if a clock fails to enable, we just hang on the
read later if it was the register's clock. Though that particular error case is
never passed out from the runtime resume callback, which should probably be
fixed as well. 

> +
> +	version = rocket_read(core, REG_PC_VERSION);
> +	version += rocket_read(core, REG_PC_VERSION_NUM) & 0xffff;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	dev_info(dev, "Rockchip NPU core %d version: %d\n", core->index, version);
> +
> +	return 0;
> +}
> +
> +void rocket_core_fini(struct rocket_core *core)
> +{
> +	pm_runtime_disable(core->dev);
> +}
>
> [...]
>
> diff --git a/drivers/accel/rocket/rocket_drv.c b/drivers/accel/rocket/rocket_drv.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..c22d965f20f1239a36b1d823d5fe5f372713555d
> --- /dev/null
> +++ b/drivers/accel/rocket/rocket_drv.c
>
> [...]
>
> +static int rocket_device_runtime_resume(struct device *dev)
> +{
> +	struct rocket_device *rdev = dev_get_drvdata(dev);
> +
> +	for (unsigned int core = 0; core < rdev->num_cores; core++) {
> +		if (dev != rdev->cores[core].dev)
> +			continue;
> +
> +		if (core == 0) {
> +			clk_prepare_enable(rdev->clk_npu);
> +			clk_prepare_enable(rdev->pclk);
> +		}
> +
> +		clk_prepare_enable(rdev->cores[core].a_clk);
> +		clk_prepare_enable(rdev->cores[core].h_clk);
> +	}
> +
> +	return 0;
> +}

Here is where we will probably want to check the return code of each
clk_prepare_enable, and potentially do quite ugly "always return hardware to
known state" handling if any of them fails to enable, i.e. unwind the enables
in the function exit before returning the error code.

Seems pointless because if a clock fails to enable it's a nuclear meltdown type
situation anyway, but especially when people are writing DTSes or porting things
to new SoCs, it can be nicer to have the driver fail rather than the whole SoC.

I do wish we had cleanup.h helpers for clock enables though...

> +
> +static int rocket_device_runtime_suspend(struct device *dev)
> +{
> +	struct rocket_device *rdev = dev_get_drvdata(dev);
> +
> +	for (unsigned int core = 0; core < rdev->num_cores; core++) {
> +		if (dev != rdev->cores[core].dev)
> +			continue;
> +
> +		clk_disable_unprepare(rdev->cores[core].a_clk);
> +		clk_disable_unprepare(rdev->cores[core].h_clk);
> +
> +		if (core == 0) {
> +			clk_disable_unprepare(rdev->pclk);
> +			clk_disable_unprepare(rdev->clk_npu);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +EXPORT_GPL_DEV_PM_OPS(rocket_pm_ops) = {
> +	RUNTIME_PM_OPS(rocket_device_runtime_suspend, rocket_device_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +};
> +
> +static struct platform_driver rocket_driver = {
> +	.probe = rocket_probe,
> +	.remove = rocket_remove,
> +	.driver	 = {
> +		.name = "rocket",
> +		.pm = pm_ptr(&rocket_pm_ops),
> +		.of_match_table = dt_match,
> +	},
> +};
> +module_platform_driver(rocket_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("DRM driver for the Rockchip NPU IP");
> +MODULE_AUTHOR("Tomeu Vizoso");
>
> [...]

I'll send a second reply with PM comments on the job stuff in the patch that
adds it, since I found something peculiar there while experimenting on RK3576.

Kind regards,
Nicolas Frattaroli



