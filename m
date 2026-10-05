Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C84CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 14:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMhaYCPC8NyJ1NiGxrtOVIykNU0YGns1JsietJFxXSc=; b=fUowfyC39ANEQBwfe8Xal4DObl
	FjZE0YmhKEvP5/MXSIxGo+dcEGaZjCD9AoS9RMy2HR2fkeldWggbHXp/lCrUi49SCHoONbxCh29V9
	I2rMTDSMTwRqwVP4BOn+eLNDEB5mqt+zberEEAWkQzhiD0Tdpx+BkgRhqN89r61vZwKSf3LV6doj0
	AFhTV4fXwzBp3DjSUkgIXnLonbeJ+xav11bTHqXRYdW+UYdS1jSMoyS+URF0OLUB8LVgdtEo0/rPl
	KeR5fCkNPP0iVeYfK3BXxLsMki4nEm05EPn2bVAAPEi1OdntDIVXP8sPccOGbzj4V4IVp5ENJstwM
	ZVJxTWng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjyU-0000000Gfjl-0QWe;
	Mon, 05 Oct 2026 14:47:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDjyP-0000000Gfiy-3u8t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 14:47:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57A2A152B;
	Mon,  5 Oct 2026 07:47:19 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CCAC3F66F;
	Mon,  5 Oct 2026 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791211642; bh=9T2fmSNRbjXFVPQksKl+UwFKOHU4uZBn0rZ5YRuuXiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRmoPjy4x1D3I65S3fuZZwvM/YUbo+fDHogt0bn7J0vJ8JhY0OZ5z7xjxXYwh4Rz9
	 AYZH7sCcEGNxNA68Dmth5z95uoeV7a5lbogEIuC1al6IH7rte27ZOnL8amzB8MTpiA
	 97wr+5l/e0XGTei4n9y2QszmJh7+fFW/IcOgkRas=
Date: Mon, 5 Oct 2026 15:47:20 +0100
From: Leo Yan <leo.yan@arm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>, Michal Simek <michal.simek@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Message-ID: <20261005144720.GK1208404@e132581.arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
 <z2bu73w3xcl4ofbp4td3rj7wazzoth5gq35obiqkrfhhfxufcq@hrfvij5jnb55>
 <20261002153328.GE1208404@e132581.arm.com>
 <umknnkfjevejagydaktpq6zgh4l2uuxy4k2f5l7v2ypr2xb57q@obtxdmeihisp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <umknnkfjevejagydaktpq6zgh4l2uuxy4k2f5l7v2ypr2xb57q@obtxdmeihisp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_074726_016951_20A89631 
X-CRM114-Status: GOOD (  21.23  )
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

On Fri, Oct 02, 2026 at 07:05:14PM +0300, Dmitry Baryshkov wrote:
> On Fri, Oct 02, 2026 at 04:33:28PM +0100, Leo Yan wrote:
> > On Fri, Oct 02, 2026 at 06:21:36PM +0300, Dmitry Baryshkov wrote:
> > > On Fri, Oct 02, 2026 at 04:07:24PM +0100, Leo Yan wrote:
> > > > The APQ8064 static replicator has no registers to program, so it
> > > > does not need an APB clock. Remove its RPM_QDSS_CLK reference.
> > > > Other programmable CoreSight devices keep their clock references.
> > > 
> > > QDSS clock is not actually the APB one, it's required for the coresight
> > > (or to access some of the regs) if I remember correctly.
> > 
> > If so, it might be atclk for clocking the module rather than the
> > register interface. Could you confirm this?
> > 
> > The replicator is just a middle component on the data path. I read
> > that it shares the same clock with other CoreSight components, so it
> > should still be safe to remove the clock from the replicator node,
> > as other components on the path will ensure that the clock is enabled.
> 
> Unfortunately it might be hard to find info for this platform nowadays. 

How about rename RPM_QDSS_CLK on the static replicator as "atclk", the
optional clock name supported by its binding.

          replicator {
                compatible = "arm,coresight-static-replicator";

                clocks = <&rpmcc RPM_QDSS_CLK>;
-               clock-names = "apb_pclk";
+               clock-names = "atclk";

I would leave the AMBA CoreSight nodes in the same dtsi unchanged for
now. They need an apb_pclk lookup for register access, and so far we
have no evidence to justify adding the same RPM clock again as atclk.

Please let me know if this works for you.

Thanks,
Leo

