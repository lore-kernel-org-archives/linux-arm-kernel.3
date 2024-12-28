Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926FCE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 20:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0k7sZDMcERXk2eLaHDDLcfOeTicjPUtLMWJcbz4osSQ=; b=i0W47JJrXCkwrIdgjWqYosoVRy
	I4tHVvFZSJgf+w3rWW+koXhqrKsXPIhsdtw1KarkCeImoAQg79OIzUeg5Urp8U80fGlDaeGzw8NNq
	FLjTcgcA39dErwzls7S28o3pTh4NWx3FGPOObExVznAOxO+hhiXi/ZiHQYOgjGrzo6HbQfW3a8ppo
	Vwcq9DSQJakaucekliuZy22wE1s4V0RHc1B/mkW+9gCqLlJWJIBnMAKooUds8DLWfbLbY9bCjuCha
	ZBHqCRne2xzFuQKHtosdR7QglWURTjt5aXbotL3n8IAl3fpigQl4yujwsomVs/8yvnXYJhX1gLadU
	sSkoaBiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRdpm-00000002Mi3-2IAt;
	Sat, 28 Dec 2024 20:54:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRdoY-00000002Mcv-3DGI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 20:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 052BF5C55AF;
	Sat, 28 Dec 2024 20:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB45C4CECD;
	Sat, 28 Dec 2024 20:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735419217;
	bh=YiQg+tSMTFVqdZrE2vLVBv2x7p3A1peNxFFdIKqfqGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4HxeW0euO8plHUTonaif3pvstPZLW6W9fGDBaRWhEhQiTGrYQ5MFLgMoQBMJnPB7
	 uTwQRX0ilutRJFnSnhhbkkgRFwUlYD2f8SpEKkWp9WcKGFJiiudXCBehA5XPoCqBW3
	 gfPKkDQAMk7k3ethnGnooWzqTLQav60xINXzoNESr2dW8JtfdLvf/BT4qCa5OITqfr
	 yJffHW6WvHfPxzN3bZDKPa942v/PEhaogNpDepZMQml44ofTAYLDJFYw5bYtHLgaqx
	 DipexVUlwgqQjUf1na2LddDYdxtDJ8/3PaeuFeRg15Hop9NuVMKzp/sJnytyQv7JMQ
	 LKZfe7mdq4CwQ==
Date: Sat, 28 Dec 2024 21:53:22 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, aisheng.dong@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: imx-lpi2c: fix build warning "function defined but
 not used"
Message-ID: <o4hxr2redr6dp4ot35pbc5vyjldiec6sxy72xesharhphsvdsm@mnufmvmpd2dm>
References: <20241228090852.2049321-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228090852.2049321-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_125338_848919_19B026D3 
X-CRM114-Status: GOOD (  10.04  )
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

On Sat, Dec 28, 2024 at 05:08:52PM +0800, Carlos Song wrote:
> lpi2c_resume_noirq() and lpi2c_suspend_noirq() are defined but it maybe
> unused, so should add __maybe_unused to both functions to avoid build
> warning.
> 
> Fixes: fa89723f7a78 ("i2c: imx-lpi2c: add target mode support")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412280835.LRAV3z0g-lkp@intel.com/
> Signed-off-by: Carlos Song <carlos.song@nxp.com>

yeah, I have different PM configuration to catch these kind of
error and I missed this.

Rather than applying a fix over a recent patch, I am going to
remove your original patch and ask you to send a v7 of your
"imx-lpi2c: add target mode support".

Is it OK with you?

Andi

