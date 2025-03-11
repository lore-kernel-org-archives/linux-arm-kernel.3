Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 665E9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 18:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8prSSxCWFyaE3NIaTiPLNINpW01RXfUXWbnUrBhzNjM=; b=rDI2/5kw8EI9G2XENWPXmSwzw8
	GCqSJoo6bGP9DctysJ+jTUXUP1XBAhicTUBxipFkCItS1+yOzHCimB9a1VUxafdtveuZHFdBEwFX9
	GY3xZoAgoavz0xXMfCACrthH2kowUW8kFgk5yKYweLZD21MMhjgiK9TrvE2X7jfev70AZDwGaotgx
	lUvxihFLh4rLBbfshH4HeNt379rACpvCk2pqz7tUN1R2FQK+7qbd04CqyvDhjis0v1nj7iuCrK/0R
	TXYICQKqKp0Zve1vkJz6A+illRnu//YKHIeIo1LjSNpNcM5FvU3igUCY9bqOU7CuIPIgqoB5Wq/W3
	a+siXiLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4mt-00000006h9H-2YOw;
	Tue, 11 Mar 2025 18:57:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts4in-00000006gk7-3zpQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 18:52:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C923A460CD;
	Tue, 11 Mar 2025 18:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB04C4CEE9;
	Tue, 11 Mar 2025 18:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741719176;
	bh=k8MfRkuQVtNg/Whp5KqW04/5VaX4YAL8LC6xTwCfixc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3EdhOlYj005iywEv7h8Yi7UH2k8LzKHIV2MjxFB5TLpJ2amc+PGLk+ZyAk3d0tVw
	 OhyBphnk3V1oiPPtClm0UI4WytsnvUSLNjtzUpxkK71YuREPmEjnLnd+rmT7dBdGaD
	 mD/3USPdtjZhXSH98gl2AUPmhjOQrjZhHR1uv53ZLuDMt6y4VIqpwu6S3MezOEctDm
	 npWvxG+Lmuzt6j4vmF1aLNJxlz2WUQiBIKUYD54x0VYZNIqO6/bBSSUt4qYDNcqLOB
	 tNB6QeW2IG+LfivLSJY/dul5SxAT+2QSnyqjbjYscr4s3Xfa7iFuXnwA8dqPYybWVQ
	 Jyb1oLP5SAqig==
Date: Tue, 11 Mar 2025 20:52:52 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as
 built-in
Message-ID: <vjkdwjudqsgcq2leabscnb2r5dbtztgfq3jlkfowcauslaymkp@qsxnpis3ksp6>
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_115258_050252_DCC3B29C 
X-CRM114-Status: GOOD (  21.56  )
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

On Tue, Mar 11, 2025 at 07:02:56PM +0100, Christopher Obbard wrote:
> Currently some Qualcomm interconnect drivers are enabled
> as modules which isn't overly useful since the interconnects
> are required to be loaded during early boot.
> 
> Loading the interconnects late (e.g. in initrd or as module)
> can cause boot issues, such as slowdown or even not booting
> at all (since the interconnect would be required for storage
> devices).

This is not a good justification. It should be perfectly fine to load
block drivers (including their dependencies) from the initramfs.

Up to now we have been enabling only those interconnect (and pinctrl,
btw) drivers, which are required to be able to open the consoe (thanks,
systemd).

> 
> Be consistent and enable all of the Qualcomm interconnect
> drivers as built-in to the kernel image.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 219ef05ee5a757c43a37ec9f8571ce9976354830..6582baee2ab02ecb2ff442c6e73aa6a23fee8d7f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1656,11 +1656,11 @@ CONFIG_INTERCONNECT_IMX8MN=m
>  CONFIG_INTERCONNECT_IMX8MQ=m
>  CONFIG_INTERCONNECT_IMX8MP=y
>  CONFIG_INTERCONNECT_QCOM=y
> -CONFIG_INTERCONNECT_QCOM_MSM8916=m
> +CONFIG_INTERCONNECT_QCOM_MSM8916=y
>  CONFIG_INTERCONNECT_QCOM_MSM8996=y
> -CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> +CONFIG_INTERCONNECT_QCOM_OSM_L3=y

This is the memory / L3 / cpufreq interconnect, it has nothing to do
with the block devices.

>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
> -CONFIG_INTERCONNECT_QCOM_QCS404=m
> +CONFIG_INTERCONNECT_QCOM_QCS404=y
>  CONFIG_INTERCONNECT_QCOM_QCS615=y
>  CONFIG_INTERCONNECT_QCOM_QCS8300=y
>  CONFIG_INTERCONNECT_QCOM_QDU1000=y
> 
> ---
> base-commit: b098bcd8278b89cb3eb73fdb6e06dc49af75ad37
> change-id: 20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-258fcc961b11
> 
> Best regards,
> -- 
> Christopher Obbard <christopher.obbard@linaro.org>
> 

-- 
With best wishes
Dmitry

