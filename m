Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E8CCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 12:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsdXJp86K5ab4HHYw1xGTfHLEqKgPkpx6m1TS1FEEL8=; b=0kbfg3t3l+BedInKKNgDyU9QiG
	y+Vc44omOED2x2y44XHJdm2JoY14cjUToA2GFydxxQmSrUxpci8/mX7pPn9QlmRcl57vbAnDPa5z2
	mGe8EKCJ8Oe/E8JNw+HcYJnSd6McHgilTS0B2MeyZea0b0yMv/BUToYiW/IZz0DHM+ZCqwmsoh+q+
	Qjzm2fnbfO8fAlpSX8+sO7+nFaScYMgfWMrzmcYGzbJxMPShHPH01ox0R2qBRpIeZwXqB3vVrFjsZ
	T4IZOtFFnEMA4UHBnZSj0ML4j8lkCpPcAj+PXutZlM9K7/81q7a7wPMLKGF7FszDoq0ysZWnWsPiX
	UoaLouwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgf6-00000008uhf-2CTo;
	Sat, 09 May 2026 12:20:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgf5-00000008uhE-1pCl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 12:20:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A76360120;
	Sat,  9 May 2026 12:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD15C2BCB2;
	Sat,  9 May 2026 12:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778329201;
	bh=Cq7/QM49XQIon1SXcxU39hmlYFljvekcg/7oaZVUPos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XhcFoNnOLchiOyp+IpFy1WAwrUu4KBrpYvJztnKdW0Fn5ebQPp9EmbiZ4y1NxEsxT
	 XG4bho/mW5xFbcUaMPIP/k2s7GadqLGLbR8/vaC9HDU6d5Ar13ATXwawARlLZHJ84k
	 TwfB3jjeIp3g/FD7k2sk4mRvnzprCP8t3blehYM48Q5A9uqy1/eVf2AMgwiX2wA9dj
	 VXk5IIUzNABErG86Ak8X6EjAWhg9vk2yhffE8xSS17c1O9BOZUVdlH4i9XqDQ7hzVg
	 VEhuaSywM7P/1ln4541/Ucc97rcSGO2u4yAPdRdyH5ClLKijctKTxB/Umi1FhUSSrn
	 hGDT+AgvS6NXw==
Date: Sat, 9 May 2026 13:19:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jack Matthews <jack@jackmatthe.ws>
Cc: Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: Regression in split ARM MMIO timer driver
Message-ID: <20260509-ruddy-dragonfly-of-poetry-45e9f1@sudeepholla>
References: <46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws>
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

On Fri, May 08, 2026 at 03:48:14PM -0400, Jack Matthews wrote:
> Hello,
>
> I am working on mainlining an old chip, Qualcomm's MDM9625 modem.
> I had previously booted 6.17-rc3 before putting this project to the side,
> but when I restarted work on 7.0 I was unable to boot. 
> I have bisected this to commit 0f67b56d84b4c49adfd61f19f81f84ec613ab51a
> (https://lore.kernel.org/all/20250814154622.10193-4-maz@kernel.org/) and
> reverting this commit makes the device boot successfully. Unfortunately I do
> not have access to low level debugging such as UART so I have not been able
> to pinpoint exactly what is missing.
> My changes for this chip are all available here in case it is an issue of my
> own doing: https://github.com/jackmthws/linux/commits/mdm9625-latest/.

Looking briefly into the DTS file, I couldn't find the sysreg based arch
timer node in the DT. It could be just an overlook unless there is some
issue with it that it's not added. After the above mentioned commit, the
MMIO timer gets initialised bit late in the boot and could be the reason
for boot failure. Unless you have intentionally not added it, I would
suggest to add it and try.

-- 
Regards,
Sudeep

