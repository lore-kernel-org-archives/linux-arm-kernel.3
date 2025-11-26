Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDDDD1118E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWdu1QKRt293wd3c69EPVsacBDDd5FucA/VvvXIcm1s=; b=Lf5AkNYGqiiCA9uQacwijygeA3
	SFCEIRM1sOeUuBuE9J7pRWyMfKdNekgwOKCKwl6pRsBbshSocVNgeeugm97j+H3mAhMORE6oC0n6J
	m8UxNHkFjcOrQbyXZm7Z93MN2xsq2ZLsu/Jr7IYfi5PxOyb2g1wijlrwB4MOoFVjURuLMQnxaeu50
	xoRcIqKqyO/SUYwbCGHT8LDEKRvW4DuQxd5zqVvXgR6n59RuAv1uWA9doNHAi1T8PxEv+QULIyoMP
	RWK4WrbIlqDJ4R/R33YVEGoTgBdXVgMhDJTblmv0iOyMz42LCMsgCjuYt54KB7WG1ftrpGuipYQHj
	lA28ALPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJyq-0000000FTyw-43do;
	Wed, 26 Nov 2025 18:11:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJyo-0000000FTyG-2Atk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 18:11:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E25168F;
	Wed, 26 Nov 2025 10:10:52 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 569CC3F73B;
	Wed, 26 Nov 2025 10:10:58 -0800 (PST)
Date: Wed, 26 Nov 2025 18:10:55 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, Will Deacon <will@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Casey Connolly <casey@connolly.tech>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Alexander Martinz <amartinz@shiftphones.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Pablo Correa =?iso-8859-1?Q?G=F3mez?= <ablocorrea@hotmail.com>,
	Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH QUESTION] arm64: configs: Add Snapdragon 845 config
 fragment
Message-ID: <aSdCryMAOb7Qk-qq@arm.com>
References: <20251126-sdm845-config-question-v1-1-ffa91ed53095@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-sdm845-config-question-v1-1-ffa91ed53095@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_101102_603220_70D59F88 
X-CRM114-Status: GOOD (  18.30  )
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

On Wed, Nov 26, 2025 at 05:19:20PM +0100, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> This fragment provides reasonable default for the mobile devices
> based on Snapdragon 845 architecture. While default config could be
> used, the reality is it brings many issues to the development workflows,
> which are much harder to address than on generic boards or devices with
> available UART console.
> 
> This config fragment produces the .config used by distributions.
> It is designed to be fairly minimal and specific to the
> supported SDM845 devices whilst offering all the features you would
> expect.
> 
> It disables other arm64 architectures to speed up build times and
> decrease the size of the kernel image.
> 
> To generate a .config use "make defconfig sdm845.config"
> 
> [David]
>  - Dropped distribution specific options.
>  - Added entry into the MAINTAINERS file.
[...]
>  MAINTAINERS                      |    5 +
>  arch/arm64/configs/sdm845.config | 1048 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 1053 insertions(+)

I really don't think the kernel should carry configs other than the
generic ones used by developers. We had this on arm32 but mostly because
we didn't have a single kernel image for a long time (and when we got
it, it was mostly for v7 cores). I don't want to get back to hosting a
multitude of configs in mainline.

-- 
Catalin

