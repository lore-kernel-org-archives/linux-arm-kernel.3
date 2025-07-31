Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F258C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pD5TIR77XFUXDaqKLs8daYrh/+bzI8XGfpyQVZKFv4=; b=HbgktAB7VFMD1hwHS72OU4jUqt
	VRwNSco9eaLvB3JpPMJ7snprC4Y6xKW5DKRiQ2m6D2aHXC6sNTscvFT6uVJITx7Bevpu4TK/strlF
	ce0sclyg+DtQUY/JFZg91d5Odw4VmxXjnkjMBPdq/RO1q2+KFU8SDa7dzV/Fcbic6g7u5RLNas4hr
	4i+DeK0ahd3Fv4ch1nfpOtWKJRCj3llC353vHB7mdT0tQR5AfTTZW1cU5oZ/aa1bg8I0CthmvZSwD
	/Vx6rmiUNaXX2KAxyrSxMY5o0uTvfYXaCseoi/i0rKboGfHrpILX7TNufL7oYuObHlhNNSJY0+LSc
	WcI14GTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSye-00000003enX-3Pn9;
	Thu, 31 Jul 2025 13:05:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhShd-00000003cZQ-1fym
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 12:48:10 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bt82g6P8Yz6L534;
	Thu, 31 Jul 2025 20:46:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id CB7421402EA;
	Thu, 31 Jul 2025 20:48:02 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 31 Jul
 2025 14:48:00 +0200
Date: Thu, 31 Jul 2025 13:47:59 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>
Subject: Re: [PATCH 8/8] Documentation: hisi-pmu: Add introduction to
 HiSilicon V3 PMU
Message-ID: <20250731134759.00000c74@huawei.com>
In-Reply-To: <20250729153823.2026154-9-wangyushan12@huawei.com>
References: <20250729153823.2026154-1-wangyushan12@huawei.com>
	<20250729153823.2026154-9-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_054809_589210_F428BBC5 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, 29 Jul 2025 23:38:23 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> Some of HiSilicon V3 PMU hardware is divided into parts to fulfill the
> job of monitoring specific parts of a device.  Add description on that
> as well as the newly added ext operand for L3C PMU.
> 
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
There is one fixlet hiding in here that maybe could have been done
as a precursor.  I doubt anyone cares though!

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  Documentation/admin-guide/perf/hisi-pmu.rst | 43 +++++++++++++++++++--
>  1 file changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/perf/hisi-pmu.rst b/Documentation/admin-guide/perf/hisi-pmu.rst
> index 48992a0b8e94..4c7584fe3c1a 100644
> --- a/Documentation/admin-guide/perf/hisi-pmu.rst
> +++ b/Documentation/admin-guide/perf/hisi-pmu.rst
> @@ -12,15 +12,16 @@ The HiSilicon SoC encapsulates multiple CPU and IO dies. Each CPU cluster
>  called Super CPU cluster (SCCL) and is made up of 6 CCLs. Each SCCL has
>  two HHAs (0 - 1) and four DDRCs (0 - 3), respectively.
>  
> -HiSilicon SoC uncore PMU driver
> --------------------------------
> +HiSilicon SoC uncore PMU v1
> +---------------------------
>  
>  Each device PMU has separate registers for event counting, control and
>  interrupt, and the PMU driver shall register perf PMU drivers like L3C,
>  HHA and DDRC etc. The available events and configuration options shall
> -be described in the sysfs, see:
> +be described in the sysfs, see::
> +
> +/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>
>  
> -/sys/bus/event_source/devices/hisi_sccl{X}_<l3c{Y}/hha{Y}/ddrc{Y}>.

This is fixing existing stuff so maybe should be a separate patch.

>  The "perf list" command shall list the available events from sysfs.
>  
>  Each L3C, HHA and DDRC is registered as a separate PMU with perf. The PMU


