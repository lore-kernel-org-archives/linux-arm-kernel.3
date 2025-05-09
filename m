Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1525CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rRiOmBB5M/tWTyurqW/u/WIN8QWinqkRhXrKsChkJE=; b=N6etMVpm0Ln6FAfSUANxUFtdYZ
	fexRs2/XII9M+KaZkKyRqf63PKyLQZI/rK3kque7/8dfUroyTj0A4RlNNPs2sqfLZIOSyxJdMoSHx
	5LBGzwpxs1Ey8KjYGOlHgPlvQXh38vstsQMeMLM+DaD0AeHXw1+crwm+n0K6HG+a+eulJwDP1DnpY
	L6UavNdLcj/grcgggCwQOAFQRrNaECMLKxDj3YAq9dHkLrHqnAFNJSV7fWUtQ/f0Kt8VkXYwDLOnt
	54XAhQI0ZeV2cy1/AB3JFYuBI2wzL6N9uixxOCnblvVXgLH+sWf7F9pDrIXA4mkdBADoO7Y/lczor
	6WPsJOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQN3-00000004FCa-3afY;
	Fri, 09 May 2025 16:14:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOQN-00000003txC-4AoQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F67E6111F;
	Fri,  9 May 2025 14:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82DCC4CEE4;
	Fri,  9 May 2025 14:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746799802;
	bh=af+UlDGvEnPRHtlg072O638zTmK/MXsSHJDlxvwBJf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSn1GeRA97cqq51SKJmTesTao/PVP6KsOEfzr+w/mw17GqaagBvS2bM/q9mHW4wJE
	 LTtKGeDHXQAEULp1Vj+kEJC+LatnYuSrgdfcqPeZnk5V63kky1krpp8+MqOkgSMLUG
	 B22zzyrArvjfx9gwzd7wSaPGhe14z6SUbvQi8T7FxfyPbk/Yv70fdKAWTmGISgqr0O
	 8gCBoipnMeq3taS7XLYsZSJBg1wVWLPQw7qS9WHroHDYA/R+skWOlLBYY+RCyUYYkv
	 eF66o+R7K9eqc30XLBCGp16bVvOBBxzO6eqRcyx5UXQiLZe7hIEf1HC8rvm8CIPDZY
	 6DR0TAGvVSBWg==
Date: Fri, 9 May 2025 15:09:57 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <20250509140957.GD2492385@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
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

On Wed, 30 Apr 2025, Artur Weber wrote:

> The BCM59054 is another chip from the BCM590xx line of PMUs, commonly
> used on devices with the BCM21664/BCM23550 chipsets.
> 
> Prepare the BCM590xx driver for supporting other devices by adding the
> PMUID register values for supported chip types and store them in the
> MFD data struct as "pmu_id". (These will be checked against the actual
> PMUID register values in a later commit.)
> 
> Then, add a DT compatible for the BCM59054, and provide the PMU ID as
> OF match data.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v6:
> - Move PMUID value to MFD header
> - Use PMUID value as OF data/device type value
> - Add bcm59054 to I2C ID table
> 
> Changes in v4:
> - Rewrite commit message description
> - Rename "device_type" member to "dev_type"
> - Drop awkward line break to fit function call
> - Add PMU ID/revision parsing function
> 
> Changes in v3:
> - Fix compilation warning about device_type pointer cast type
> - Name the device types enum and use it as the type in the MFD struct
> ---
>  drivers/mfd/bcm590xx.c       | 12 +++++++++++-
>  include/linux/mfd/bcm590xx.h |  7 +++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)

I can't merge this until Mark has provided the Regulator Acks.

-- 
Lee Jones [李琼斯]

