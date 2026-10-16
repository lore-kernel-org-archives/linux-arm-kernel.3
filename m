Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AD1CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUVEi0pr+VoPpvpQj6uEtBoIW4WTZ9cIOWwgbcn1NSM=; b=TmuQOKc49T++cX1dpCsAgpvwah
	FhawVQrzZYgAYAfnifhJTr+lqAe/4OZHE7B2I9eNz1wxaiR2j2IVacO1uNz0wg+KjRQ2z+56dQcCB
	wc9oNjF0aza11hTyVBePzo0Dss74cUCWs9HQo4zdVOkixmPUmJUdw0RR4Lswb8XQeQDHmE9yw8Tck
	zKTLAlJbdaV3iOuND5B3QO1emMpg1R3iNIlOoh8QefOPk9jyaJxl8olQ09ug9S+e8Ce6fSzJNvEDQ
	uHyiIjc36524oe06Ws20HMvb0HEf6M0GOG0G5V1OVeK5Yiy59K/RWhcJrtpBvrCb9OPwpX+zEOXRm
	VjZoyBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeEB-00000002TVT-1flt;
	Fri, 16 Oct 2026 09:27:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeE8-00000002TUR-0qQP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:27:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D27914BF;
	Fri, 16 Oct 2026 02:27:42 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3A353F673;
	Fri, 16 Oct 2026 02:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792142865; bh=rz69uRgiNAeoZ5OdOTX4VEkIT4UqBR0eCnCPDwkcXa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhDRptFsJgCt0n0l/pYLbpT/xgXvLsk1RooJ/SVvS+JIOCwsWdYo7yISXq8iaU4KV
	 Q4kwO8MCm1w2Cl8vor8+UEEKKW5BY6SULxguqF5IOeMj+t8GpiXVOQZsfHnsBTWwvQ
	 RLM/jvCbGe3N5MBxzniwuyou/TkJChJEFSRZ+Klo=
Date: Fri, 16 Oct 2026 10:27:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Michal Simek <michal.simek@amd.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Wei Xu <xuwei5@hisilicon.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: coresight: Limit static replicator
 to atclk
Message-ID: <20261016092742.GD26205@e132581.arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
 <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
 <1128f456-ed6e-47ee-8dda-157af99cc404@amd.com>
 <20261012162851.GB26205@e132581.arm.com>
 <e64a1339-f66b-4f29-b95f-01578223f1a4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e64a1339-f66b-4f29-b95f-01578223f1a4@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_022748_397964_A28FC541 
X-CRM114-Status: GOOD (  21.08  )
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

On Tue, Oct 13, 2026 at 07:53:20AM +0200, Michal Simek wrote:
> 
> 
> On 10/12/26 18:28, Leo Yan wrote:
> > On Mon, Oct 12, 2026 at 02:35:37PM +0200, Michal Simek wrote:
> > > 
> > > 
> > > On 10/2/26 17:07, Leo Yan wrote:
> > > > Static replicators have no programmable registers and need no APB
> > > > programming clock.
> > > > 
> > > > The Zynq clock controller registers dbg_trc and dbg_apb and calls
> > > > clk_prepare_enable() for each gate the bootloader left on.
> > > 
> > > That's one bootloader behavior. If there is another bootloader that clocks
> > > can be simply disabled. I don't think there is any reason to depends on
> > > bootloader behavior. If there are clocks which has to be ON I can't see any
> > > reason not to drive them.
> > 
> > My reference to zynq_clk_setup() was to explain that this patch leaves
> > the existing management of dbg_trc and dbg_apb unchanged.
> > 
> > The CoreSight drivers do not request clocks named "dbg_trc" or "dbg_apb".
> 
> And this is the point. DT binding is not describing what Linux driver handles.
> Binding describes HW itself.

I agreed that "Binding describes HW itself".

The question is which hardware clock connections the DT properties
describe. Arm DDI 0314H, Table B-1 [1], lists ATCLK for the replicator,
and ATCLK and PCLKDBG for the trace funnel. The static modules have no
APB programming interface.

> And for proper functionality these 2 clocks need to be handled.

Please point to the Zynq TRM section or clock diagram showing how
dbg_trc and dbg_apb supply the replicator and funnel.

> That Linux driver is not doing it that's different issue.

My understanding is the CoreSight drivers have already followed spec to
support clocks.

[1] https://support.arm.com/documentation/ddi0314/h/CoreSight-Components-and-Clock-Domains/CoreSight-components-and-clock-domains

