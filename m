Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7431CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N62L5MySoLDe9DnE0AwRgvg51Fn01HXyH8vRI2MXe0E=; b=wHP0h+ldPKacq45uaC5fgqJItg
	fwiz/cNqLd2Srwbd3b342iR2MLMXVgkIrFYpOXDPYB6JQqfdpXfboQ8OL4wpdxTws6VnNlbJY/08S
	O3EJihpNqpHqUbANvpoWRfuw1ohcf6r5Bl/28bKCKpqv+LiFyb3VgT4TDO+z7M2e1+s/34ekg9jJv
	+VPbCrAVKt0j8kZoJxLZ/eF4AO/inwAlobIalrn6qJa1NJA1VsOl1ThbbmBoLpKA4TebCsa2ZJUFr
	k/y5RgZCo1pBRSDmRs6ABm0+kXGSitzz3BmyD4CjrvkmgRB42cwNOYfmZlnD6doeMokq3vosb/qnR
	cbMuFV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbx3f-00000005xen-0s5X;
	Tue, 23 Jun 2026 09:04:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbx3c-00000005xdt-2vOU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 09:04:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B13A51A25;
	Tue, 23 Jun 2026 02:04:30 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1C083F62B;
	Tue, 23 Jun 2026 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782205475; bh=gw3gZeekv8xyI4T6op9F8Q8ETcLNgRNqHoHyyoQXOiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cqU1NEFbkXN4nrHizhDMdUF8okxq1C69v6atEHWnKEBSviSUk/7/0fWC73RKf9f6e
	 F4TlqP2vzM64eE+RotXYUHmjphkvON9GYZv7L8UN2tstCt3SwifkshqE26FlUhGvyF
	 8YSAb2BUS8uT1jDjbaaP1rjNpUImglLpAnD+TQPc=
Date: Tue, 23 Jun 2026 10:04:32 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
	tingwei.zhang@oss.qualcomm.com,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v10 0/5] Add Qualcomm extended CTI support
Message-ID: <20260623090432.GG31870@e132581.arm.com>
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_020436_856566_911BC030 
X-CRM114-Status: GOOD (  13.99  )
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

On Mon, Jun 15, 2026 at 08:32:28PM +0800, Yingchao Deng wrote:
> The Qualcomm extended CTI is a heavily parameterized version of ARM’s
> CSCTI. It allows a debugger to send to trigger events to a processor or to
> send a trigger event to one or more processors when a trigger event occurs
> on another processor on the same SoC, or even between SoCs.
> 
> Qualcomm extended CTI supports up to 128 triggers. And some of the register
> offsets are changed.
> 
> The commands to configure CTI triggers are the same as ARM's CTI.

This series looks good to me and I tested:

  - Confirmed no any change for standard CTI;
  - Perf command;
  - Build bisection.

Tested-by: Leo Yan <leo.yan@arm.com>

Mike may also want to take a look in case there is any overlap with his
claim tags init patch [1]. I don't have a strong preference on which
series goes in first, as the claim tag handling in this series looks
clean enough to me.

@Yingchao, just a small suggestion: rc1–rc4 is usually the best window
for getting patches merged. If you receive comments and are able to
address them quickly, it may be worth respin patches during that
period to try catching the next merge window. This is no guarantees,
just thought it might be useful to share as a general tip :)

[1] https://lore.kernel.org/linux-arm-kernel/20260619160148.499223-2-mike.leach@arm.com/

