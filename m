Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E0CCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+s5ufsbM4de2ozJVwmJOUwsTUW4s0vdVuHE3vQrGIk=; b=tnRjNHwQiW82zbDePqcDxIxg8+
	bjjEKipJe70u+tM4Ax27z3A+rJnRl9Cj/x23TzKvfA2F1wn8il1ChDgejNhjeNWz8joV3pgMsRkLs
	4R2X9qTafR2mdUVFHvTTD+5fgE6/uyucV96Uw8txZvAGzN5SWotsS8FpqkxOkWg5O4RSCl7Byu7Ib
	2nDmjCGp+TbeZtuB2ZoHRN3pu0x7fS6GWPZ/ILg9Ny38I6QGCo+LC1SXn7YRPEM2+ysPCkhgIBeRO
	IEMRfQFwywf4TveKCDHTo6K0IlfIxPrKZLjR3dyTNZvA2/rsrCPc//GYpY4coJMlYfg6/TLGQjaly
	/GXDNIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zdy-00000001Ph8-0TP5;
	Wed, 15 Oct 2025 11:26:10 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8zdv-00000001PgX-3DDb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 11:26:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=c+s5ufsbM4de2ozJVwmJOUwsTUW4s0vdVuHE3vQrGIk=;
	b=Y/IowBSLSq1NO6xzjp4FJbgZWy3bRzxWhz1135maJH5D9nfbyxW+QshoKMYXdTuSwBZPdWIyw
	5QvEtL1EzRpBmce/b4EtbQndkHfMSyNsG5XcbAUxsdT3eRDaqttTCO1QJV8V0jkG+ohU9GZdd/Y
	oJsFdXg3XxXgcAg8jQyOXmY=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4cmpfG1K9Dz12LFd;
	Wed, 15 Oct 2025 19:25:10 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 4130D180B72;
	Wed, 15 Oct 2025 19:25:55 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 15 Oct 2025 19:25:54 +0800
Subject: Re: [PATCH] arm64: defconfig: Remove the redundent SCHED_MC/SCHED_SMT
To: Huang Shijie <shijie@os.amperecomputing.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>,
	<patches@amperecomputing.com>, <cl@linux.com>,
	<Shubhang@os.amperecomputing.com>, <linux-arm-kernel@lists.infradead.org>,
	<krzysztof.kozlowski@linaro.org>, <geert+renesas@glider.be>, <arnd@arndb.de>,
	<linux-kernel@vger.kernel.org>, <peterz@infradead.org>
References: <20251014023158.500932-1-shijie@os.amperecomputing.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <8dff1052-d524-5702-6f58-bbe192d80672@huawei.com>
Date: Wed, 15 Oct 2025 19:25:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20251014023158.500932-1-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_042608_295532_C7B6EEFD 
X-CRM114-Status: GOOD (  13.39  )
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

On 2025/10/14 10:31, Huang Shijie wrote:
> The patch "7bd291abe2d sched: Unify the SCHED_{SMT,CLUSTER,MC} Kconfig"
> has enabled the SCHED_MC/SCHED_SMT by default for arm64.
> 
> So remove the redundent code in defconfig.

s/redundent/redundant/

> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  arch/arm64/configs/defconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e3a2d37bd104..f089ec615b90 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -82,8 +82,6 @@ CONFIG_ARCH_VEXPRESS=y
>  CONFIG_ARCH_VISCONTI=y
>  CONFIG_ARCH_XGENE=y
>  CONFIG_ARCH_ZYNQMP=y
> -CONFIG_SCHED_MC=y
> -CONFIG_SCHED_SMT=y
>  CONFIG_NUMA=y
>  CONFIG_XEN=y
>  CONFIG_COMPAT=y

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks,
Zenghui

