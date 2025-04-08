Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA69C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vNCSsrA43Xw69R9A9V/cKlmb6WvgG09tSHxuWzo5JE=; b=E7ut4AxCS4hYaJ0gFtoo8Y6U0N
	VZVJeMDaBGQOrjB/AxKHCXQz8f6D8v2fJWFswjG5YzUzftQ9u15eFDvXFbNMGHnyoLCJug8+4Bw3Y
	8/2mvsZO9atiBFoKro5rdFi5CNN2cufma18zsIizGEyHchi87jwsbyHc9ieNZY9dzxcip4bFYxald
	ZidPZZnA6KxsS4W5xoxz8OuDVT+SKacY9pyk74Ux6xwhoB7aGOkk/4F0Ui8BwQCYbipXcD5bPjnQZ
	qhab4yOb0bx9AgpwMpzOhpMFVOhpzYAb8MTzRJ8n+0S/hwmYlMMAINRZk0lFrkc8SuwJL6D63gC4z
	exhMGEsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2ASz-00000004UmE-4ATD;
	Tue, 08 Apr 2025 15:02:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2APl-00000004UDT-1B8F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 14:59:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 296B25C5DFC;
	Tue,  8 Apr 2025 14:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0970C4CEE5;
	Tue,  8 Apr 2025 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744124339;
	bh=YvdHl1/Z4vQg1X2njDEqwyEHsxKugzx7tWbrj/mGuto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nl0emsqpUJ0D+aADf9ENV/mLocPn8KFDil18e0TyKmPCQ6PGjlZ2x+d3+7TSj8CQ0
	 qgEUx2j2jv3lZo2G+SKJBfWwkkp8N/fOT9+TDG+xXsuEwbp4w2sBnHIGAvv8CpMFCM
	 buMpRieSWXok7HFoLlUk/HFsiKaqbVMkLcXTuA7d5vKf+DMny8hIRFK24AKKwSs146
	 1gq8QsXfx2ir1fR1TpkHGqKgWJwzdppxbe7MuTsK7ZTkIiUyrmORQBest5MMCf8PVx
	 D0jG6462EwGU8W9Yy4feQm27Olp1ANlMfouSLrcjdZQvIf3ZhSbxow9z4zpUS6sj66
	 FclbqQBHQLFJA==
Date: Tue, 8 Apr 2025 16:58:54 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 01/24] Documentation: devicetree: bindings: Add GICv5 DT
 bindings
Message-ID: <Z/U5rvfU9CWUpYCc@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
 <174411521311.1639476.6777663294037851144.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174411521311.1639476.6777663294037851144.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_075901_431859_1DE7AB58 
X-CRM114-Status: GOOD (  24.80  )
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

On Tue, Apr 08, 2025 at 07:26:53AM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 08 Apr 2025 12:50:00 +0200, Lorenzo Pieralisi wrote:
> > The GICv5 interrupt controller architecture is composed of:
> > 
> > - one or more Interrupt Routing Service (IRS)
> > - zero or more Interrupt Translation Service (ITS)
> > - zero or more Interrupt Wire Bridge (IWB)
> > 
> > Describe a GICv5 implementation by specifying a top level node
> > corresponding to the GICv5 system component.
> > 
> > IRS nodes are added as GICv5 system component children.
> > 
> > An ITS is associated with an IRS so ITS nodes are described
> > as IRS children - use the hierarchy explicitly in the device
> > tree to define the association.
> > 
> > IWB nodes are described as GICv5 system component children - to make it
> > explicit that are part of the GICv5 system component; an IWB is
> > connected to a single ITS but the connection is made explicit through
> > the msi-parent property and therefore is not required to be explicit
> > through a parent-child relationship in the device tree.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 268 +++++++++++++++++++++
> >  MAINTAINERS                                        |   7 +
> >  2 files changed, 275 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.example.dts:43.27-28 syntax error
> FATAL ERROR: Unable to parse input tree
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1522: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

Validated the bindings, not the example within, that caused this to trigger,
apologies.

Already fixed it - please review the bindings though, feedback on them
appreciated, thanks.

Lorenzo

