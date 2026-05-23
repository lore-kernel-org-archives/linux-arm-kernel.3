Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1A1CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kMDEKtDLmLVx96pUCq4Po0S8WmghIroryWHxcT4k5M=; b=ZTvnoWn3daixEB1buo3ECkIpzp
	JaEDex8ynVqSxUDOEhfpwesvRMcrEEwbpdeGaLI+H59RvsGnPmBAZb2X9XG3mqM1OCFAmFW0888Lz
	XEu1bxoY69dUCpubIh20QaKC0xTG0rzRUleJdpM5QiuEabVgsILrPgzFjMkSylA991k5DBKJTMH4Y
	fo5k1ra96oH3lAV+vTOr4zx5L1xRzhyMprYzOVXUiCkRhAmzpxOwES3TmeLu3gFTsOXf8J1uiesDQ
	gvIxxi3zCb6OO8nrYWyE5n+IHEHGG9ArNOambOcqqBKbKdd2rTgthkWdXwq9kE58O+lXySJ1EtlSD
	jZ2Ni2XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQfq1-0000000Cnrn-0aUs;
	Sat, 23 May 2026 06:27:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQfpy-0000000CnrH-0ZGF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 06:27:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A2C21F02;
	Fri, 22 May 2026 23:27:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 211CB3F7B4;
	Fri, 22 May 2026 23:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779517671; bh=JEVR6CkLj/c0gaMD1sZUS4SWLivaFbisW4FMLpwuuDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uIQJFM/cEmjlN4stENbpOIKjt/iyaSbTyh5hLaLGIXxF5+qBDVQp/OE3m2CxHVp/O
	 sWtBL7579DfUCAmc8WHI8dr0MQGjw0iVJjBYEegAij/WaCFEgrX6P4bNO4EZyU8DAI
	 8mOq6ipz1yrieS4cv9bsHmMFlxHkSofGAUYfjwE4=
Date: Sat, 23 May 2026 07:27:47 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/4] firmware: arm_ffa: Register core as a platform driver
Message-ID: <ahFI43hT9eoktFlU@e129823.arm.com>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
 <20260508-b4-ffa_plat_dev-v1-2-c5a30f8cf7b8@kernel.org>
 <20260523001148.GA1319283@ax162>
 <ahEyBrZGSVbdQxDJ@e129823.arm.com>
 <20260523050555.GA1121518@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260523050555.GA1121518@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_232754_243956_AC685746 
X-CRM114-Status: GOOD (  27.00  )
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

On Fri, May 22, 2026 at 10:05:55PM -0700, Nathan Chancellor wrote:
> On Sat, May 23, 2026 at 05:50:14AM +0100, Yeoreum Yun wrote:
> > Hi Nathan,
> > 
> > > Hi Sudeep,
> > > 
> > > On Fri, May 08, 2026 at 06:54:16PM +0100, Sudeep Holla wrote:
> > > > Move the FF-A core bring-up and teardown paths into platform driver
> > > > probe and remove callbacks, and register a synthetic arm-ffa platform
> > > > device to bind the driver.
> > > > 
> > > > This makes the FF-A core lifetime follow the driver model while keeping
> > > > the device creation internal to the FF-A core. Use normal platform driver
> > > > registration so the probe path has standard driver-core semantics.
> > > > 
> > > > The synthetic platform device is a temporary bridge until ACPI and
> > > > devicetree describe the FF-A core device or object. Once those firmware
> > > > description paths are defined, the internal platform device creation can
> > > > be dropped and the driver can bind to the firmware-described device
> > > > directly.
> > > > 
> > > > Since the transport selection now happens from the platform probe path,
> > > > drop the __init annotation from ffa_transport_init().
> > > > 
> > > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> > > 
> > > I am seeing
> > > 
> > >   arm-ffa arm-ffa: probe with driver arm-ffa failed with error -95
> > > 
> > > on my two arm64 test machines after this change landed in -next as
> > > commit e659fc8e537c ("firmware: arm_ffa: Register core as a platform
> > > driver"), is this expected? If so, perhaps it should be silenced?
> > 
> > Could you share the .config file you used for this?
> 
> Sure thing! It is attached. If you need anything else, please let me
> know.

Thanks! unless there was other error log from ff-a driver,
I think this happens because your environment either doesn’t
support FF-A or is using an SMCCC version earlier than 1.2 from
ffa_version_check() or ffa_transport_init().

If that’s the case, You can ignore this log since this behavior is
expected, and the dd core should print an error log.
Before this patch, the error was not shown because all FF-A initialization
was done during the initcall phase, and nothing was printed
even when the initcall function returned an error from caller of initcall.

[...]

--
Sincerely,
Yeoreum Yun

