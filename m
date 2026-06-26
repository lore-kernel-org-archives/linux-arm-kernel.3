Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D1ECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5va8VVBtKzACCnxfjlpbKMW6UASR52rb8m3xvY0zgsI=; b=5A/slDiH74w96rV5e4+N8TAzQ7
	3r6Qpp+wjwrozzSZ5dRaBYtNTo/TqxiWUpXzzhi/30Nkc1qBukRB+Vcylmo8AqLyk30T28wVPIPol
	P8rBGcfEjWwcIW3J/KIpDJZ0Q0schfHsTYSze7tTzqWrEsld3O/L8KDUNpYFk6ttdolNmKrB3i8YO
	zQR+XLRzrMtvzA6eI+kDG0qdBDgVZboyOxf3B0VN37fC7CUz8bspIhGefXwmUGd5DoiYfm85WK8Jf
	VOi7B4dVpnfnKbRGlgChX0VBK0rwKsI8S4SZV/2zPTUsxOvcHSbDc/4VU7idJ6VtVsSZFy5JR0qOi
	KcQM28hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3pG-0000000B6ML-3vCG;
	Fri, 26 Jun 2026 10:30:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3pE-0000000B6Lv-40tl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 10:30:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4ED1E7D;
	Fri, 26 Jun 2026 03:30:13 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BF623F905;
	Fri, 26 Jun 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782469818; bh=RPGjuxweSBX9qRHLJv2h8Lc6/pXmWzN6MYxGMUlho+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtZlT4mW9DHylU7QLNesKElwkkpftd5nTIxv+S9wuUMph7P9GGp96HJDF2jvsOYDu
	 I9zYagqIC/ZzmHL76+l2jcGIX3CBhssPlBMdS1+w6QMKhZKZNtEbN4vbbNyuZ3KvNj
	 T98VxNktwCAbIgDHJHkGrjEtBHZHSrkknWolo6bg=
Date: Fri, 26 Jun 2026 11:30:15 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Message-ID: <20260626103015.GE575984@e132581.arm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_033021_036842_D055A857 
X-CRM114-Status: GOOD (  16.95  )
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

Hi Jie,

On Fri, Jun 26, 2026 at 10:03:41AM +0800, Jie Gan wrote:

[...]

> Hi Leo,
> 
> To be honest, I would prefer not to modify the interconnect platform driver.
> On some Qualcomm platforms, multiple itnoc devices reside within small
> blocks(one or more than one for each block) and are connected to a dummy
> source. In such cases, two ATIDs are allocated for a path (the dummy source
> and the itnoc), which is inefficient. This is why the itnoc platform driver
> created to avoid this waste.
> 
> The TraceNoC (called as AG TraceNoC) is a generic TraceNoC device which
> connected to multiple source and link devices, aggregating data from all
> source devices into a single output path.

As I said, it may be fragile to couple a specific device property (ATID)
to the AMBA driver.

You're now facing a case where a device cannot be registered as an AMBA
device, so it cannot use ATID. Likewise, I can imagine in future where a
device is registered as an AMBA device, but you don't want ATID.

> This device is implemented as an AMBA device but lacks proper hardware
> configuration. As a result, it must be handled in the driver as a
> workaround, which unfortunately breaks the original design intent.

Seems to me, it is not reasonable to pretend an AMBA device but AMBA
ID registers are absent.

How about add a new DT property ("qcom,tnoc-enable-atid") to force
enabling ATID?

Thanks,
Leo

