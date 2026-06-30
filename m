Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC51C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+GmTPQ2e6Fd3lhsWPVjYHOk225B7AvxIuodTHF3pEk=; b=dtlzrkLptLMk5Ce2AzDIKhLG2S
	4nFwSzHz/AR5wiFZbcM6cK8FA4bqkgm3zDs+zNHVUFdggF/yhmaBm+lWaBbNFiD03p7Swl0RTZmx4
	tIGpu/Z/KmzPTwfIuZB082tIL20EmU4cVylsK9liuIOvTXM1mtEiAEbLbAWJXLbmzPdQ5z6VkR0go
	sw9f+qOpdT8Jo7uX+FnnYvZ/aT0/KF27OwmBSt0YPuovwSLFr8APIdYAJHbuAoQ8LEMc7/4uUQ4BR
	hwcYFTx1nX+Kvc9snvBKEtCa48e+M/UJ1JZm8O1Eq+kh79kCdMbewiHfDyA6Ks/hjVX4nuTVDds+A
	a/FIEeRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVHM-0000000GZ4M-0uoZ;
	Tue, 30 Jun 2026 10:01:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVHI-0000000GZ36-35x8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:01:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A869E2C3E;
	Tue, 30 Jun 2026 03:01:10 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1FAD3FAFB;
	Tue, 30 Jun 2026 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782813675; bh=d+GmTPQ2e6Fd3lhsWPVjYHOk225B7AvxIuodTHF3pEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePlEpp/ULFoRCNkiXLe2wgnWbHFer5U8AJmk00fBT4PXXP0q+BP+U+4PY15JneRyI
	 3d3AYNqFPfX0TLynt4odTD1u1/fryDKGBinH0RTeXIiGcxuc313GYgt3NtZh0qIJ0+
	 929rvDLrRgTlpGVzgVXOidm/HhSYmXtvtPsZemgs=
Date: Tue, 30 Jun 2026 11:01:12 +0100
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
Message-ID: <20260630100112.GF1812158@e132581.arm.com>
References: <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
 <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
 <20260630081021.GD1812158@e132581.arm.com>
 <37017aa2-e18c-4568-a37c-d13964cbb418@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37017aa2-e18c-4568-a37c-d13964cbb418@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_030116_905392_D9B812B8 
X-CRM114-Status: GOOD (  10.81  )
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

On Tue, Jun 30, 2026 at 04:42:39PM +0800, Jie Gan wrote:

[...]

> As Suzuki mentioned in the other thread, I think it would be better to add
> separate compatibles in the of_match_table to distinguish between Aggregator
> TraceNoC and Interconnect TraceNoC when probing with the platform driver.
> This would allow us to allocate an ATID only for Aggregator TraceNoC during
> probe, which is consistent with our original design.

Makes sense for me!

