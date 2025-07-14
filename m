Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17BCC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yVeT/eTh5sWtqjaq9LHHtSavLY9flsF9uGG06aY41c=; b=tmcH+OgQc1m9ejb7Y2Uh4VY+1U
	CU3EY4nAv67nGAn17Hde6DPE49/ewgVwWVnJJ9auul+yH+80B6MdWPcuKGEk2wJouQfstvpvEObVp
	lf5CLPrY7vFcsbEZkQg/TQmBofhlag8GhzJXaxSmPvUV8MDkGDlrAGdjC2j1t/vM3GvfBReD9L5dr
	+cnE8NuhFYFokMYLBsJ0XNPmcUdhqPnK8agiLDVGcN8KsHP0gxa0AkpvqbRbxaAHClQVsrkzkOW+G
	vk4fgdJij9c4bln0yNIKJAHlzcSmYBATuN01ZEbaKtoyFVWTDmkmlVPCKyfQZajDgfV7WMfV1dK06
	xsv10ZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJXs-00000002MRe-3RgC;
	Mon, 14 Jul 2025 13:48:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubJNK-00000002KG5-3eIq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 13:37:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 905E41BC0;
	Mon, 14 Jul 2025 06:37:34 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA9193F66E;
	Mon, 14 Jul 2025 06:37:41 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	kernel@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v11 0/2] coresight: Add Coresight Trace Network On Chip driver
Date: Mon, 14 Jul 2025 14:37:30 +0100
Message-ID: <175250020505.487814.2214255862249827250.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710-trace-noc-v11-0-f849075c40b8@quicinc.com>
References: <20250710-trace-noc-v11-0-f849075c40b8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_063746_958151_E2BD248E 
X-CRM114-Status: GOOD (  11.32  )
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


On Thu, 10 Jul 2025 13:27:19 +0800, Yuanfang Zhang wrote:
> The Trace Network On Chip (TNOC) is an integration hierarchy which is a
> hardware component that integrates the functionalities of TPDA and
> funnels. It collects trace from subsystems and transfers it to coresight
> sink.
> 
> In addition to the generic TNOC mentioned above, there is also a special type
> of TNOC called Interconnect TNOC. Unlike the generic TNOC, the Interconnect
> TNOC doesn't need ATID. Its primary function is to connect the source of
> subsystems to the Aggregator TNOC. Its driver is different from this patch and
> will describe it and upstream its driver separately.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: Add device Trace Network On Chip definition
      https://git.kernel.org/coresight/c/015959687cff
[2/2] coresight: add coresight Trace Network On Chip driver
      https://git.kernel.org/coresight/c/26e20622a8ae

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

