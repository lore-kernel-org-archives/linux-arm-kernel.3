Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E3DCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k24+zt0rfnYQxi626h0DuXxdL/2faB7sC7masLcnUEM=; b=4CLy8OVrbWwgc4NX/Bjj/vFQv/
	ZHIEQ+HFVOhxswGbIFWmT5p5sHns+Z5+WDOLXxwFq8+iGUc0pmm/kLCSOuS7p8eX+aHRVstP6lxOf
	t7cN+i90JtiCJWN3XlQMvRjqrotUSbfA6JhD2yWQT6nzNI5vO6QqvSGBpR9HOAtWUgmfHJH3MAUnN
	dmI/9YqizLPFdlhJxiMiM4v0flVC6HAyVz1awTU93OMMWeNcRHzKQvpE5H/LYYeBMLc/WrjAEYOWe
	BwBGPDygT2Y9Qa8u7DNIuJ1vlgy0ZQQrJioqjRC9Q4n2VqsnIRs7BnKT1N7KyQe0N7OnJlC2Uvow5
	v/xRLPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPKr-00000007yo4-04nN;
	Wed, 24 Jun 2026 15:16:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPKo-00000007ynb-3L1i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:16:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D60602308;
	Wed, 24 Jun 2026 08:16:08 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01EAD3F905;
	Wed, 24 Jun 2026 08:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782314173; bh=PX10r5f9OoO8qOWEx/oZ9VqNT3djQJ+d35yaUiPexng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BmBZGjT4U3qcNtktNVR/2XoYS3e6/c+LO8+3D5K7T+hH/5zmpU0WSE2VIm9ZpaUsW
	 GpozDJqWM3t+QRFsHr9Eq2dqg7Bra5Z6r3HJCfidsc1hnl5eyoRv8/WUNeTTsuHuHD
	 +RZhpP0fYme53aFTKa6uhjX+//zPxUOuHUSzf2r4=
Date: Wed, 24 Jun 2026 16:16:10 +0100
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
Message-ID: <20260624151610.GC575984@e132581.arm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_081614_880947_1E5A5775 
X-CRM114-Status: GOOD (  18.03  )
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

On Wed, Jun 24, 2026 at 11:08:32PM +0800, Jie Gan wrote:

[...]

> > Why does it fail ? power management ? hw broken ? Is it really AMBA or
> > do you pretend that to be an AMBA device by faking the CID/PID?
> 
> The CID reads as 0 from the register, which I suspect is a hardware design
> issue. I have not yet confirmed this with the hardware team. As a
> workaround, I provided a fake periphid via a DT property to bypass
> amba_read_periphid.
> 
> 
> Leo commented in other thread:
> >>tnoc.c registers both an AMBA driver and a platform driver. Shouldn't >>it
> >>be registered as a platform device instead?
> 
> The platform driver is intended for the interconnect TraceNoC device and is
> not designed to allocate an ATID. The issue is that the TPDM device borrows
> the ATID from the TraceNoC device, resulting in the ATID always being 0 when
> associated with an interconnect NoC device.
> 
> However, I believe it is acceptable to allocate an ATID for the itNoC device
> and the issue can be fixed with this way.

I think so.

