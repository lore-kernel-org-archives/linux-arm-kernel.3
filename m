Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB8FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/9Q87GfCSX07DNRn6GtHmS3mtXcQo/BjHlI0tVBM1s=; b=rCLeGntqx1DPQ3cFeHlXM2/qnC
	r7Rco7URZaMMUZTQxiG8faYGqtnoHpzXmEYfyHmX+4NtsOYPGYk0ETY8KPVBQ/TGC1zFqbZ2gQOLT
	1LdYyxFuV7KU78GHhWIRPwUAuk3MQJFTou8Nd76Jr1BNIhw4HPOMaHg0uEkjQjC6vIJz+WffpkKDu
	M4d3fec11whXVT9n4kahmX0CUPtACxzVQTmK0rFoKHe2nwxoaUbb/BiFYzOTqeqr0cqEC4059Ckiz
	53DIva7MEW+IM6tFRo846jg35JJ3X/yy4zqRxhV5zYIhOcARTaEZhrYxXud0hp2m7dSPOKfVuFtQ/
	R2syRjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUHi-00000004mYA-2u0h;
	Fri, 09 May 2025 20:25:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPdu-000000044tZ-2YIi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 15:28:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 676451595;
	Fri,  9 May 2025 08:27:54 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CC293F58B;
	Fri,  9 May 2025 08:28:04 -0700 (PDT)
Date: Fri, 9 May 2025 16:28:01 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: fvp: Add ETE and TRBE nodes for Rev C model
Message-ID: <20250509-pastoral-mighty-zebra-a1e63d@sudeepholla>
References: <20250508161907.1152054-1-leo.yan@arm.com>
 <174679984987.3368571.16872352739655196662.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174679984987.3368571.16872352739655196662.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_082806_702421_8CF0EBE6 
X-CRM114-Status: GOOD (  26.44  )
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

On Fri, May 09, 2025 at 09:17:00AM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 08 May 2025 17:19:07 +0100, Leo Yan wrote:
> > The FVP Rev C model includes CoreSight ETE and TRBE support.  These
> > features can be enabled by specifying parameters when launching the
> > model:
> > 
> >   -C cluster0.has_ete: 1
> >   -C cluster1.has_ete: 1
> >   -C cluster0.has_trbe: 1
> >   -C cluster1.has_trbe: 1
> > 
> > This change adds device tree bindings for the ETE and TRBE nodes.  They
> > are disabled by default to prevent kernel warnings from failed driver
> > probes, as the model does not enable the features unless explicitly
> > specified.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >  arch/arm64/boot/dts/arm/fvp-base-revc.dts | 62 +++++++++++++++++++++++
> >  1 file changed, 62 insertions(+)
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: failed to guess base
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/arm/' for 20250508161907.1152054-1-leo.yan@arm.com:
> 
> arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete0 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
> arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete0 (arm,embedded-trace-extension): $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
> 	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
> arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete1 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'

arm,coresight-loses-context-with-cpu is not defined in the
arm,embedded-trace-extension bindings though the driver is shared with
arm,coresight-etm. It needs to be defined in the schema to avoid this
warnings.

-- 
Regards,
Sudeep

