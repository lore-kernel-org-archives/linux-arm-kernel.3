Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6072C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytTx95qoRjRjEXhKZCVV8kw7N8ZFwUXVcBHACpAy3OE=; b=NtcW366nqB1+8VhgO9IgQka+sz
	UzIBjcntMK8Gvnn03iXvAW9Kugs3NTAMmSCbMs2kl/nOHoSCym2llICUlfyA/Sv6b/d7olX4bKe4T
	zNeUWMg2SNOUCEjTFFor01sp6mVsik4lhxRrDWIu9xrbCmiCAWIel+/hWwWdc4NdvW1I75eqIe20V
	3hjgysC3fTYfboXNHCFtCqvUssreSkwb3V8l5bGIWJKiGAsgp/xBBxiRTxKfsZbT+L0Zb29tVaMFp
	mMaMAtZnasP1BL1qhKsqeW0BgKoPfbkijQDLeZPCS35HpzzxVApub6dOVhuVbtYRbu6JouFmagO4C
	Po0ZvN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdr4Q-0000000Agfv-4BWI;
	Fri, 31 Jan 2025 13:28:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdr37-0000000AgaI-3dxP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 13:27:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B25EA497;
	Fri, 31 Jan 2025 05:27:33 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DE033F63F;
	Fri, 31 Jan 2025 05:27:06 -0800 (PST)
Date: Fri, 31 Jan 2025 13:27:03 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Alim Akhtar" <alim.akhtar@samsung.com>
Cc: "'Devang Tailor'" <dev.tailor@samsung.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<faraz.ata@samsung.com>
Subject: Re: [PATCH v2] arm64: dts: add cpu cache information to
 ExynosAuto-v920
Message-ID: <Z5zPpz6WAbPJX701@bogus>
References: <CGME20250108054224epcas5p399f3d734f8d9f82e5ae75d183d1a5344@epcas5p3.samsung.com>
 <20250108055012.1938530-1-dev.tailor@samsung.com>
 <006401db73d6$2af35fb0$80da1f10$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <006401db73d6$2af35fb0$80da1f10$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_052709_946146_288A5DD3 
X-CRM114-Status: GOOD (  17.98  )
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

On Fri, Jan 31, 2025 at 05:19:09PM +0530, Alim Akhtar wrote:
> Hi Devang
>
> >
> > Add CPU caches information to its dt nodes so that the same is available to
> > userspace via sysfs. This SoC has 64/64 KB I/D cache and 256KB of L2 cache for
> > each core, 2 MB of shared L3 cache for each quad cpu cluster and 1 MB of
> > shared L3 cache for the dual cpu cluster.
> >
> > Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
> >
> > ---
> > Changes in v2:
> > - Added L3 cache for all the three cpu clusters
> > - Corrected L2 cache numbering as a part of review comments from Krzysztof
> >   and updated as per cpus clusters.
> > - Link to v1: https://patchwork.kernel.org/project/linux-arm-
> > kernel/patch/20241231064350.523713-1-dev.tailor@samsung.com/
> > ---
> >  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 127
> > ++++++++++++++++++
> >  1 file changed, 127 insertions(+)
> >
> [snip]
>  > +		l3_cache_cl0: l3-cache0 {
> You can add one node for cl0 and cl1, say "l3_cache_cl0_cl1" and
> Remove the specific node for CL1, because both are same.
>

What do you mean by "both are same" ?
Do you mean both have exact same properties but are physically different
caches ? OR
Do you mean it is just one shared cache ?

If former, we still need distinct node to get the cacheinfo about
shareability correct. If this is about avoiding duplication of errors,
you can probably define some macro and avoid it, but we need 2 nodes in
the devicetree.

If latter, you suggestion is correct.

--
Regards,
Sudeep

