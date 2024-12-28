Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F49E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 21:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4OWef3x6DsiVzZ/U11tT+QhzrK2en4wqsgahODBy9g=; b=ErvZXj8Ifi24JsZEuRwkNTgpS4
	vfNrUCU+sZd7dVbaOtbM6yLU6VSGOfCfemtOU38xjgDN7qdrTxCx3cWhYk90Y9ycqQvDICt0IG3dT
	wD7CnjUmRM5qJguNaCkjiebK9o4adiVGV4wwpEJtVBH2ycFfwn5vlQ2TzKYGlNhCXsBKWcQ2AMijL
	E5iodJhFpJCVNjItc+PybWRrGMcvqVRnHhWcyDn27Qj4vQTaFoON0cpCjcpX4ABaRmKUSaYHHmsEe
	hwYmw7BZ3TS9JGHdfZRc0t2O5bhOeRUDYvrdhz4mIb8363jOAhqlrQg+eKsJZzRtO5aMPKe2J3Kct
	DGMafGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRdxg-00000002NEO-36x3;
	Sat, 28 Dec 2024 21:03:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRdw2-00000002N8E-2Eif
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 21:01:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D2C35C4924;
	Sat, 28 Dec 2024 21:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CD7C4CECD;
	Sat, 28 Dec 2024 21:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735419681;
	bh=JSy7kKq7vvXln6X37mx3NLcerk0ooPQdIqGHyzb0PMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bbFiLOuA0eQ9ejBBfHrFyL7mSreqjiOeJrMmtw0Zuu+93uRaUSdR55Upta+G551/8
	 x38gTjEkC9+NKvr4kH6egRYEXPXhVFCSsNSmIyfxiA5NsFLH0VcNG+j29E122Ii/LZ
	 RkXVWMit7LVjKDkMMgwPg8Gz+j8sGjJeOq85aSATw0z9K4y4aDca3J79eIIbHCGwEf
	 ojBwJi4NFyGc6Vq/JKdqPEls0vOliOD8orYtjPj4sk4vSsLsa7pL8lV3xcvOwgJ1pY
	 QfAX2O9Ta9f8HkYxwG7Q6nsQLmbzZGfhXv3Zt0OPUy3m8BYgUE4j0xrVERqquOtI0a
	 iAzFdPAugk31g==
Date: Sat, 28 Dec 2024 22:01:13 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: imx-lpi2c: fix build warning "function defined but
 not used"
Message-ID: <lv7cliatuynamsimld546tjr7uhn3r7dqq5d7uhype2wh3au45@mdiv4asd33ti>
References: <20241228090852.2049321-1-carlos.song@nxp.com>
 <o4hxr2redr6dp4ot35pbc5vyjldiec6sxy72xesharhphsvdsm@mnufmvmpd2dm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o4hxr2redr6dp4ot35pbc5vyjldiec6sxy72xesharhphsvdsm@mnufmvmpd2dm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_130122_626597_BB648579 
X-CRM114-Status: GOOD (  13.58  )
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

Hi Carlos,

On Sat, Dec 28, 2024 at 09:53:22PM +0100, Andi Shyti wrote:
> On Sat, Dec 28, 2024 at 05:08:52PM +0800, Carlos Song wrote:
> > lpi2c_resume_noirq() and lpi2c_suspend_noirq() are defined but it maybe
> > unused, so should add __maybe_unused to both functions to avoid build
> > warning.
> > 
> > Fixes: fa89723f7a78 ("i2c: imx-lpi2c: add target mode support")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202412280835.LRAV3z0g-lkp@intel.com/
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> 
> yeah, I have different PM configuration to catch these kind of
> error and I missed this.
> 
> Rather than applying a fix over a recent patch, I am going to
> remove your original patch and ask you to send a v7 of your
> "imx-lpi2c: add target mode support".
> 
> Is it OK with you?

I removed the patch and updated patchwork. I will be waiting for
your v7.

Thanks,
Andi

