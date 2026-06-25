Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2731ACDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1tff3UVEjaMXl2j/d/HQcurhlW+2hAJ2DR9+gMtLY8=; b=svDCb5WyVw/uX6lFvHNA4tNH2K
	Ey0Exywf0Gr44Ly/ZilbPVVSYHgRTcoz1Kkg+fZFCc/P/HerCys5xVCJySuLG/7LxvIrU3K9SjdiK
	hFj/00ht5N9x1uYabkdDL4v8aw6/jfHp2Auufjc3j8WJer8bl163UD7McuSfkbyjwCMmaHPn06j/H
	e8DO6LGlpnWVGg9gMte1Vcgf75CVa1S6F6mj/KpzkhS5hlY1hUdPZKgWhLzlQF3K4lhiiiSnmLy30
	VBedOcY5oUUMb4vuYx9KcWl+xHfYmtbuuYRG4G4sNnPr6PoJqSVPBFGXqTrX5c39lVM6fSwPVR8xI
	s3094Wzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcftC-00000008rSD-4AIo;
	Thu, 25 Jun 2026 08:56:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcftA-00000008rRh-1T31
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 08:56:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D19042BCE;
	Thu, 25 Jun 2026 01:56:41 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF5873F836;
	Thu, 25 Jun 2026 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782377806; bh=CoaICBgyZOpVW54p1ocJ7jTim5gBU3nJmN8HCHZtt6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hv4iF/4H6zrDi91o12M0JAPWvL9/T2htesNqeEVkmrmHJ0V4OUT3ktuqEwURdFy0A
	 WiyveDBpWP23DIKxMmIWuobU66Luv0Rn+6rapH3Pq+FbkIG+XjxAEYuUJZ/0U/0cvH
	 l/EqyIG68zo2FzVtgIHnjUjSrznrhVOVa69pzW9Q=
Date: Thu, 25 Jun 2026 09:56:43 +0100
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
Message-ID: <20260625085643.GD575984@e132581.arm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_015648_630863_3495E813 
X-CRM114-Status: GOOD (  19.02  )
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

On Thu, Jun 25, 2026 at 09:01:18AM +0800, Jie Gan wrote:

[...]

> > > However, I believe it is acceptable to allocate an ATID for the itNoC device
> > > and the issue can be fixed with this way.
> > 
> > I think so.
> 
> Hi Suzuki/Leo
> 
> Which solution do you prefer to address the issue?

I will leave this to Suzuki.

> The interconnect traceNoC platform driver is intended for the itnoc device,
> implying that no TPDM devices are connected to it. So, if I modify it to
> allocate an ATID, I think it would be better to rename the “itnoc” node
> accordingly? Or it's ok to leave it as-is?
> 
> BTW, the traceNoC device definitely is an AMBA device with CID/PID
> registers.

Just to share a bit thoughts on the driver's design.

I think it would be better to keep the probe function generic. The AMBA
probe should not be specific to TraceNoC, and the platform probe should
not be only dedicated to the interconnect TraceNoC. The probe function
should simply handle a device that appears on either the AMBA bus or the
platform bus.

So the question is: if allocat an ATID for all traceNoC devices, do you
still need to distinguish TraceNoC types? If no, then the code can be
unified.

Thanks,
Leo

