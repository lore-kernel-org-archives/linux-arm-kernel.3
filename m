Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EB1C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSUcECaT1FXRl1tOQMCsQPhZDrTWY4R3QGMSSL4r6OM=; b=UpQVWYqWztzyB7PPpAI4KNp5ym
	6X6J4IXoqE9ESKOdVX1/bgFOdOuixXITrrxrMMOCF6/Bd9PJUu9/ShjqMPDKZq2byXwo//CBRGTGc
	kRs0wZLX3poKedmxwsb6zOQwQPaatyb8UxAA75Ww4k/FJuuvAuGbUh1hfi8/aBVUGw8An7z0NlQOW
	nNfn6Vt9NFKa8FC1am1TyIf2cznXCZAP+pjdXrFsA91LK5nubnNIFlLansKLrpWeG67U2eYHRaOMv
	egjERxU09RYKaSN2DRoQoIReShDwf15kmdlSbYM3kotzsgxsjeARwLg6krfyt7/l7/PduxS1Z//OP
	xQppuUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9Eg-0000000FaWF-1v6H;
	Fri, 24 Jul 2026 06:18:18 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9Ee-0000000FaVI-08TZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:18:17 +0000
Received: from [10.94.177.11] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id 54EC820B7167;
	Thu, 23 Jul 2026 23:18:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 54EC820B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784873881;
	bh=pSUcECaT1FXRl1tOQMCsQPhZDrTWY4R3QGMSSL4r6OM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iuCwkr7Np4jQomXIo0k52C8vXtVhu+N7R9U9GgMeVwVgjpZoUa+/RGB2CA/xWtvna
	 flbaaQssMzmLeRpsCzhVDFFlES4BBA5FzPTuSjJUaW5F3lEEywhjBVdDo8dpex8FHF
	 mVuEgpDulQ4+i5mAi6lmYBGq/fVW/cOCi0nlChfg=
Message-ID: <51e25452-a982-444e-b6f2-13e30c85984d@linux.microsoft.com>
Date: Fri, 24 Jul 2026 11:48:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] firmware: xilinx: Clear firmware notifiers across
 kexec transitions
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
 git@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260723124841.2567827-4-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260723124841.2567827-4-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_231816_105065_15A28660 
X-CRM114-Status: GOOD (  22.45  )
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



On 23-07-2026 18:18, Jay Buddhabhatti wrote:
> During a kexec restart, only the kernel is reloaded but notifier callbacks
> in firmware persist, causing state mismatches between kernel and firmware.
> 
> To address this, introduce PM_ALL_NOTIFIERS node ID to unregister all
> notifier callbacks during kexec. On a graceful kexec restart, this occurs
> in zynqmp_firmware_shutdown(). On a crash kernel restart, it happens in
> zynqmp_firmware_probe() in the reloaded kernel.
> 
> Unregistering all notifiers depends on firmware support for the
> PM_ALL_NOTIFIERS node ID. On firmware that does not implement it (the
> feature check reports a version below PM_API_VERSION_3) the step is
> skipped and a warning such as "Firmware doesn't support unregister all
> notifiers at once" is logged, e.g. on Versal NET firmware that predates
> this API.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
>   drivers/firmware/xilinx/zynqmp.c     | 14 ++++++++++++++
>   include/linux/firmware/xlnx-zynqmp.h |  3 +++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 64d2109eefd2..fc7212f554ee 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -2110,6 +2110,20 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   				 "Bulk device release is not supported by firmware: %d\n", ret);
>   			ret = 0;
>   		}
> +
> +		/* Check if the firmware supports the PM_ALL_NOTIFIERS node ID */
> +		ret = do_feature_check_call(PM_REGISTER_NOTIFIER);
> +		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
> +			/* Attempt to unregister all notifier callbacks via firmware */
> +			ret = zynqmp_pm_register_notifier(PM_ALL_NOTIFIERS, 0, 0, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to unregister all notifiers: %d\n", ret);
> +		} else {
> +			dev_warn(dev,
> +				 "Firmware doesn't support unregister all notifiers at once: %d\n",
> +				 ret);
> +			ret = 0;
> +		}
>   	}
>   
>   	return ret;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index ac39e5492961..69a2f74269f3 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -149,6 +149,9 @@
>   /* Node ID for all peripheral devices */
>   #define PM_DEV_ALL_PERIPH	0x18224FFFU
>   
> +/* Node ID for all notifier callbacks */
> +#define PM_ALL_NOTIFIERS	0xFFFFFFFFU
> +
>   enum pm_module_id {
>   	PM_MODULE_ID = 0x0,
>   	XPM_MODULE_ID = 0x2,


Looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>


