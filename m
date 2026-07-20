Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E408CC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTIwKVdKZU173iAcWjlu5l9Df98D2bOwnoVu+TPacbk=; b=N7ItSK97fcEOhMdodc90zBwb0d
	50o7Xkzkt3HTuXuAGBmR4Nf6IFS8PUkKx8M2D9RuVaigl+A/kt2lXwZ4t/Nb9Fj6MURRBVB1f4UnL
	FxD3xGIa0vAq0hiumynfFFYpZ/CWY/EN0U06JNzse4OAAR+JhgoqRrq7gBRqPRH4gXSWzEX0xfbdq
	MoF5bBcGvs5LSgBQ9TbXkK4MUwxorpOmTncmA8hXTis9s4CF4WZHfE1yMHOdEoiIdDJ7cX8bNDFmM
	e5Dh8paR0UFINPAhgC/A4HVkN4VniCKMIBquXI11+7o5KJtkoGKikgY7Cdn6VBsdcPuTMXO8+dFtj
	/McMIdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnF7-00000006iHM-49nx;
	Mon, 20 Jul 2026 12:37:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnF5-00000006iGg-2zfY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:37:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8D672B;
	Mon, 20 Jul 2026 05:37:02 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81BAB3F99C;
	Mon, 20 Jul 2026 05:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784551026; bh=QoZXWCCWj7RXQVpY9Sjmih7yMJj+sgfS0a7gl569fo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kosco1Cy1pDSoV0PcIrPGpBQUNkkFGMpMQeJ5pVwnoC5lP7z0aM1i2jiHhwclKhk6
	 ChmD+7wvVpg7TqzzgGbAtZ6ETgdf60GJYld68A9uWSxUZfn34dUrsKZ+CB1Vfureeo
	 nX2Tz8J1by22HqNVF0HslGH4s324hb6Q0hPyZR1Y=
Date: Mon, 20 Jul 2026 13:37:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] coresight: dummy: add missing MODULE_DEVICE_TABLE()
Message-ID: <20260720123704.GC3998092@e132581.arm.com>
References: <20260720114514.51656-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720114514.51656-1-pengpeng@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_053707_788323_61244E19 
X-CRM114-Status: GOOD (  16.23  )
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

On Mon, Jul 20, 2026 at 07:45:14PM +0800, Pengpeng Hou wrote:
> The CoreSight dummy driver has an OF match table wired into its platform
> driver, but does not export the table to module metadata. A modular build
> therefore lacks OF aliases for automatic loading.
> 
> Export dummy_match with MODULE_DEVICE_TABLE().
> 
> Fixes: 9d3ba0b6c056 ("Coresight: Add coresight dummy driver")
> Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
> Changes since v1: https://lore.kernel.org/all/20260704121621.48544-1-pengpeng@iscas.ac.cn/
> - add the requested Fixes tag
> - carry Jie Gan's conditional Reviewed-by after making that change
> - rebase onto v7.2-rc4
> 
>  drivers/hwtracing/coresight/coresight-dummy.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
> index c176a2f57300..04880d38feb7 100644
> --- a/drivers/hwtracing/coresight/coresight-dummy.c
> +++ b/drivers/hwtracing/coresight/coresight-dummy.c
> @@ -212,6 +212,7 @@ static const struct of_device_id dummy_match[] = {
>  	{.compatible = "arm,coresight-dummy-sink"},
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, dummy_match);
>  
>  static struct platform_driver dummy_driver = {
>  	.probe	= dummy_probe,
> 

