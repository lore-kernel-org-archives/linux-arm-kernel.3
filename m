Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D81CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKSOC1Vhj3/K1lHMAJqVnEIHAnZb+VZJn1jtizYpufc=; b=39tO06ZOE/TKUF1zrHSNyOPscM
	S9Wxnq25l6qcCBqglbfk1O5+WrAtGFF1T2dFF4ourFKOBypk0FNke/H3lq5CmRM90SPW5OyJeOQx9
	H+V0h5MZE5jq33D+LgxEov5KY3H6gp5cQQAEOJ9Aka7UCPJtxjOTm50VBrs4ph3YpmH5UX0TBTLEP
	UzjtYgQosdSA19cvvGqfpPIfAs6RL2/B6dsyjB4wR9wKbYjkHskLjHGFdTH3KY36SvCWXtnfliwc+
	G0mAQtirKWM6HtKST8KpGOT0jqM8P5rCOqMZ2Dizt6lIZhFcXBO7JtEM1TvUfIg6nStZeeIkG3XVw
	hK+5RQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoFc-0000000H3dL-0D88;
	Tue, 12 May 2026 14:38:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoFY-0000000H3cK-435J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:38:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 489531691;
	Tue, 12 May 2026 07:38:13 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83DA03F836;
	Tue, 12 May 2026 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778596698; bh=rSXU/QT/5syqTUC8Y8n7TUTzW+fDLj5ueNyOCl83wz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYgRNVDzd5s7doteDmod39vWeBM3TOLwmQAQ9F9OoB8K41KXS/BtxIqYOAzG16uOg
	 OH3xLrYxb2F/M2lQaLBhQ9GLbptOuorMloKGIczCjYRJX2PPfAtHfw/8Ies1JclQUB
	 EI+H05v9XPVY2N+9QPy3AfQbQWI9kUAFUcSHhOmQ=
Date: Tue, 12 May 2026 15:38:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v4 2/2] coco: guest: arm64: Drop dummy RSI platform
 device stub
Message-ID: <agM7VmoQ--ylUmyM@arm.com>
References: <20260427061615.905018-1-aneesh.kumar@kernel.org>
 <20260427061615.905018-3-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427061615.905018-3-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_073821_235106_A6986DD5 
X-CRM114-Status: GOOD (  10.50  )
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

+ Suzuki again

On Mon, Apr 27, 2026 at 11:46:15AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC firmware driver now creates the `arm-smccc` platform device
> and also creates the CCA auxiliary devices once the RSI ABI is
> discovered. This makes the arch-specific arm64_create_dummy_rsi_dev()
> helper redundant. Remove the arm-cca-dev platform device registration
> and let the SMCCC probe manage the RSI device.
> 
> systemd match on platform:arm-cca-dev for confidential vm detection [1].
> Losing the platform device registration can break that. Keeping this
> removal in its own change makes it easy to revert if that regression
> blocks the rollout.
> 
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com

I wouldn't merge this now given that systemd checks this file. Could we
have a symbolic link instead for some time until systemd eventually gets
updated (years?).

-- 
Catalin

