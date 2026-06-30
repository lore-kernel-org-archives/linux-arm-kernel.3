Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F234EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yn9a1pMuk+0EVbSfN5ssmwshxbV7SKxh43cJVgK+o6g=; b=ViCIK3i91T8QEkFBO83vSMTecj
	ZLcaD+K0OGYCQaxr5ifIOV/YSIDxdy0em4I0h/O7TxAJSQXoD2m3z7P+3f0jU80rhc6DefICCGAwp
	lavkIXV1RwycI2V6v8qSzVhIN3ygTaIXcbdU7hDrjlXxDpfBQE8txeBlZH6sj1BMDHbKUw8+ArQ6y
	g6yylJhl38Xs43zphE2nTahc1wJXTuLpXD++koZiANSAjU9SLAW3z99NRTZIRx5CqEaHsu3BpKreQ
	Q6BgfIM3gwd8kXj84MHMH0dm3g/g9S2U+95lzDy+Jz2Rkkrdn71Am9D/pxHpQmM5KoGYePxWWEai5
	xIKL3uRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTY3-0000000GEyg-3MIF;
	Tue, 30 Jun 2026 08:10:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weTY1-0000000GEyI-2roB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 08:10:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77C7E22D9;
	Tue, 30 Jun 2026 01:10:19 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 709923F905;
	Tue, 30 Jun 2026 01:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782807023; bh=Y44WNqCqpvHywWSbjQZkdja/2YAXek3Djdm80xnI13M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+Tiyq6Z2r/ysjEKRkLNrZe7WjxZIFrfI16Q00mNuwaXZzLMYamHP76j8c0Oj0ZCx
	 oATd1jsV20bjvkqASMMW347xXShaAapUryOwNBm+XzYUyZ3gjF4T51Lf8EwdFwn8IR
	 kDB0PB5aoGQRJlOi/uL4tsBaGPeeiVJoJ3GJTmgs=
Date: Tue, 30 Jun 2026 09:10:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Message-ID: <20260630081021.GD1812158@e132581.arm.com>
References: <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
 <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_011025_795694_A60D9F5B 
X-CRM114-Status: GOOD (  14.30  )
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

On Tue, Jun 30, 2026 at 09:03:52AM +0800, Jie Gan wrote:

[...]

> >    - How can you guarantee that a interconnect TraceNoC will never
> >      require ATID in the future?

> From a hardware perspective, there is no fundamental difference between an
> itnoc and an AG TraceNoC. They use the same TraceNoC hardware implementation
> and share the same AMBA bus type. The distinction is purely functional: an
> itnoc is used for local trace aggregation within a subsystem, whereas an AG
> TraceNoC serves as the top-level aggregation point for the SoC.

I'm still not convinced that adding "arm,primecell-periphid" is the
right approach.

From the description above, I'd expect either the hardware to expose
bits in a register to distinguish these two module types, or as I
suggested earlier, to use a DT property to indicate the module type (or
whether ATID is required).

Or have you tried to detect the last tnoc on a path and allocate ID for
it? (You can retrieve csdev->path).

Thanks,
Leo

