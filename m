Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6969CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffR7ZryagVGOEuQIJ783LXqlEOLErcxNTF8ceIZ6QJs=; b=1qqplvx4dhvwgxEWVvXnyRMjJ6
	3wTTl5qBpUDHOtKJ8dmaRoBCKozuBJilwxHDUvCIj1RhMxQ90U2vZ21B2UDWC1edVC4RIDk6ek1KK
	lwLUA7D+ZOsBjyJ7UPMU4x81bmtkoWMettzqtnte4CF7uqCHfJIPzBg6BJbaAo4Kc6xtxM/oH76in
	JloMr8dADD8wGHAI8A9iggwHuWojNsUaUBKKgL7MLhM5swedhN7oh19/Qqw88rQ14S+dRhujN82X6
	Nav1ZozlTRH8/VTzxPfg8jM3cFCHiQcE6W/FkL6f2yWqSkImWv2TehnzBg+T1isPUGleY5Jvkvmji
	17FnCCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5Gw-00000004Jia-0emC;
	Fri, 10 Jul 2026 07:03:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5Gv-00000004Ji5-0A72
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:03:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 818334388C;
	Fri, 10 Jul 2026 07:03:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0A71F00A3A;
	Fri, 10 Jul 2026 07:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783667020;
	bh=ffR7ZryagVGOEuQIJ783LXqlEOLErcxNTF8ceIZ6QJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HkJ1qk3pVg1gNUsVBpd65sgOKOB4CRDg/CH/bZFHYVMz/b02CI7Oy/8lJBqD895Rr
	 QXi94LZLSIuiKmbwV/bp2HgA4hCZc0zi9eXKzfGK4jg6Fhd61aGKCf+iDRTLKG0u6A
	 XEBPoLrh9WKkmLWh7Ul+zBA2dptxL4+SO1xt0CgPFL4BB2pFsF3VwVWLsfpO4XrljB
	 Y1CZowWo+d9HUZqvgFlTI1yAqNiRQXybjjz6C7AdTv/f7hkP6PIoG8R2z/DcV/ilOe
	 NnB1d3bAIhKBtmwcACu/6Bu2gVCYva8FXuqks/N3SZBF6baXrVD9k+ND374UA6s+0j
	 2JVL1iulOtwZQ==
Date: Fri, 10 Jul 2026 09:03:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/5] dt-bindings: arm: coresight-tnoc: Bind on
 platform bus instead of AMBA
Message-ID: <20260710-sweet-loutish-lynx-8698f2@quoll>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-1-41eb36fef8d9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-1-41eb36fef8d9@oss.qualcomm.com>
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

On Fri, Jul 10, 2026 at 10:39:00AM +0800, Jie Gan wrote:
> The Aggregator TraceNoC hardware exposes CID registers, but the Component
> ID value returned by the hardware is 0x00000000 instead of a valid AMBA
> Component ID. As a result, the device cannot be identified on the AMBA
> bus.
> 
> Describe the Aggregator TraceNoC with a dedicated single
> "qcom,coresight-tnoc" compatible instead of the two-string AMBA form
> "qcom,coresight-tnoc", "arm,primecell". This creates the device on the
> platform bus so it is bound by the platform driver through its compatible
> string rather than as an AMBA device.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/arm/qcom,coresight-tnoc.yaml     | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


