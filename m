Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA52CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 05:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smTkU2GnNvjCJezcGlAZjehrG4lc28ix9HlpJrEC1zM=; b=OsZln1ViofBEZQuNpsNOTkIg3N
	TNdT5VnLojitSGkoZypmpmzLN0oHR0S6usB/gC8c8JB+W+d7EItJ21ICxcKd3Ls4GhDSZJXeU32mH
	dqykBET6q7Pdh6Fom2ypXXpAWRwJl12SlDv3wsl5OT50PgY9ph8KO59AqwA2Oyjbj6Zkt6BICGJ0K
	5yrdwREqPGLFuaGnoVWEaELLDiGl5KkMN3rgWzq+XM/R/lXSOCzUaNjRxqbuZ31AIF8clurnvJNkZ
	TBNolQQYVAO6CYrFYxc3d5DrrUgBFCEw1fBSVpoVVmK83PEoo2Hg2xKt4lsci+g/HG+ExM5cu6DiE
	dy4HHajg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQeJb-0000000ChoH-13jb;
	Sat, 23 May 2026 04:50:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQeJY-0000000Chna-0nFW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 04:50:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BCF81D15;
	Fri, 22 May 2026 21:50:13 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 138B63F85F;
	Fri, 22 May 2026 21:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779511818; bh=XmvhcCMIyo6mbxY7y8SuJFHc01ftQ4EjSoIcMDfl8vM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzHVuZt+7Gx0IxrA/jJUyXVmCQt7cfSi6k2mMPe8nHd4sfRjVlGTNBoGM5H52rIVN
	 8A3HtdwyDPKY8sMi+Ut8F8j3d40pXrL7n/BBO3SK1gqNrdHDwjIAKUICsChx131qDp
	 QSk/Uav64ygKlsTZaSAwXeNfEvYNn4lDNK2r43uk=
Date: Sat, 23 May 2026 05:50:14 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, yeoreum.yun@arm.com,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/4] firmware: arm_ffa: Register core as a platform driver
Message-ID: <ahEyBrZGSVbdQxDJ@e129823.arm.com>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
 <20260508-b4-ffa_plat_dev-v1-2-c5a30f8cf7b8@kernel.org>
 <20260523001148.GA1319283@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523001148.GA1319283@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_215020_365949_F186DBDB 
X-CRM114-Status: GOOD (  19.62  )
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

Hi Nathan,

> Hi Sudeep,
> 
> On Fri, May 08, 2026 at 06:54:16PM +0100, Sudeep Holla wrote:
> > Move the FF-A core bring-up and teardown paths into platform driver
> > probe and remove callbacks, and register a synthetic arm-ffa platform
> > device to bind the driver.
> > 
> > This makes the FF-A core lifetime follow the driver model while keeping
> > the device creation internal to the FF-A core. Use normal platform driver
> > registration so the probe path has standard driver-core semantics.
> > 
> > The synthetic platform device is a temporary bridge until ACPI and
> > devicetree describe the FF-A core device or object. Once those firmware
> > description paths are defined, the internal platform device creation can
> > be dropped and the driver can bind to the firmware-described device
> > directly.
> > 
> > Since the transport selection now happens from the platform probe path,
> > drop the __init annotation from ffa_transport_init().
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> 
> I am seeing
> 
>   arm-ffa arm-ffa: probe with driver arm-ffa failed with error -95
> 
> on my two arm64 test machines after this change landed in -next as
> commit e659fc8e537c ("firmware: arm_ffa: Register core as a platform
> driver"), is this expected? If so, perhaps it should be silenced?
> 
> Cheers,
> Nathan
>

Could you share the .config file you used for this?

Thanks!

[...]

-- 
Sincerely,
Yeoreum Yun

