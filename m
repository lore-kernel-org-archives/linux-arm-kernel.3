Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14D9606AA36
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=05b1CUK1;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RWO3itM9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g803D2zbJ/JBZXy9DR+iWHmKrtF5UIWiJln+2x87kg=; b=05b1CUK1uiy4DEtCBJ2WO7zTEb
	c9jkP+I5TYRNdj1M1YU6vxSakc0tdSdWttm7bgo72dQI2TRUCChtNAWwGjjsQO3J22rQZ8Xi20aVq
	Tu1eZ/igO3OyBpyYZxqZiY2/wmOUPLBcV6QJUNVBP3QWrEyeAvoqPf/LGBt03/lGXVaFwgzeFkt8S
	ap1mpyVXPAjoegUoJ+121ybfYe2VNr0SlDzZbUavqYJybrVMrkB2QRzp6Cz+uRcZWtzinepV2Vzbt
	o8EAOdvcan1Y1anl3LeV8tIYf77HpGa8RPeVMGoq1oMjiWvBqqFHcBryfDU2TQBJPd+8bVCldBkzA
	QUpmwo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAam-00000009tWS-0pxP;
	Tue, 20 Oct 2026 14:13:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAaj-00000009tVo-1XsF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:13:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E2E516F8;
	Tue, 20 Oct 2026 07:13:20 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD9C23F7D8;
	Tue, 20 Oct 2026 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792505603; bh=A2T0lfaK6o/24VhUDeMj9aSquS26n/1b1DGxnbDkyAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWO3itM9Nu9R4vjzPvqT+vPGPipq2Ac1It2dWSM+hjHtyVwco836OX2wgq9AMisgk
	 iiZiFelZ7NQPkWLvZtWZz0Sg524hu92DZh9Bk3neNYv5lWfKplXr5LaaB/MD+s7OJi
	 o1j1fd8gdZ/m0OrmeulG9aXaKdUxtK+OAYsYj4YI=
Date: Tue, 20 Oct 2026 15:13:19 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <atd2_9Q2wTv_3MXz@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020135006.GO14213@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_071325_520265_C0338CD4 
X-CRM114-Status: GOOD (  39.16  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 10:50:06AM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 02:41:48PM +0100, Yeoreum Yun wrote:
> > > On Tue, Oct 20, 2026 at 08:13:37AM +0100, Yeoreum Yun wrote:
> > > 
> > > > > Also this is weirdly structured, it should just be one driver under
> > > > > drivers/attestation/ that does the measurement register part of firme,
> > > > 
> > > > JFYI, FIRME's platform attestation token doesn't have the measurement
> > > > register. ploatform attestation token will include the firmware
> > > > information (e.g. firmware hash) and verifier checks the firmware
> > > > information. the meaurement with RIM/REM will be part of Realm token.
> > > > FIRME's PAT is for host attestation and doesn't include Realm token.
> > > > 
> > > > Therefore, in the new UAPI, attestation only have the evidance
> > > > interface and MR interface wouldn't be used by making mr_cap as NULL.
> > > 
> > > I'm aware, and this may change.
> > 
> > Yeap. but current, it's enough with evidance.
> > 
> > > 
> > > > > it shouldn't have two components and some weird firme_get_instance()
> > > > > thing to link them together. That isn't how to build HW drivers in
> > > > > Linux..
> > > > > 
> > > > > Since ARM has bundled different concepts together into one SMCC FID
> > > > > range, it probably make sense for the smccc_devices to somehow spawn
> > > > > multiple smccc_devices for the various internal software aspects
> > > > > rather than have one driver spawn aux devices to split it ..
> > > > 
> > > > If FIRME were intended solely for attestation, I think your suggestion
> > > > would make sense.
> > > 
> > > The FID are largely orthogonal, AFAICT there is no shared
> > > infrastructure between the various functional blocks.
> > > 
> > > SO it needs to be split into proper narrow drives in the eventual
> > > kernel implementation. token goes to attestation, link ide goes to
> > > tsm, and so on.
> > > 
> > > > However, considering that FIRME may be extended to support other services,
> > > > such as IKE key management, I think having FIRME-related code scattered
> > > > across different subsystems would actually make things more complicated.
> > > 
> > > Nope, it is the right thing to do from a kernel perspective. We always
> > > de-agregate these kinds of multi-function devices into proper
> > > per-subsystem driver.s
> > >  
> > > > I initially considered introducing a dedicated FIRME bus as well,
> > > > but I felt that would be overengineering.
> > > 
> > > Nope, just use the smccc bus and split up the 'multi-function FID'
> > > there. It doesn't need to be over complicated.
> > 
> > Then, I think the arm_firme layer could simply wrap smccc_driver and
> > smccc_device, with an extensible base interface shared across services.
> 
> I wouldn't over complicated it. We already have smccc bus to do this,
> we don't need layered stacks of busses here. Just change smccc bus to
> be able to break up the multi-function SMC into several devices.

I think my explaination was poor. Apologise...
I'm not saying another bus making but just wrapper of smccc-bus APIs
for firme specific and definietly, this would separate the
multi-function SMC to defien each firme device (attestation and IDE).

But, the *base* is common. and I couldn't find any proper location to
deploy *common* code unless making arm_firme.

Also, this arm_firme  is useful to managing *firme* smc call
seperated only from the attestation stuff and this wouldn't be not
compliate since the /driver/attestation just call the driver register
and get the firme_device wrapping the smccc_device with proper
smc-callback for firme in its probe function.

> 
> > Would it be better to post based on Jiri's branch [0] for next-spin?
> > 
> > Thanks for your comments! :)
> > 
> > Link: [0] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_pre_rfc_draft1
> 
> Lets give it a few weeks?
> 
> I'm confident both of your attestation drivers will go ahead at the
> fastest possible speed once we get the subsystem settled :)
> 

Hopefully. and I'm seeing his branch and found a little bit fault.
I'll be back with some comments as soon as I check overall.


Thanks! ;)

-- 
Sincerely,
Yeoreum Yun

