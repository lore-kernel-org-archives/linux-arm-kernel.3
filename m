Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB9FF36BA7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xhK77/UIpdhZz3lUa/o8N/+3Mt+a5NIgj+isXT8ZXw=; b=MQoyXlqyiCZHPf0jp/pU9CC1bi
	e5mVZRNMxqgI/9YPJ4gQWLCpYS5nU9Jj3IgXZeG0ZlwRky/UZt3MCrO/WHrHWJY9+ui4VnhKkWNUT
	Fnb8iM4xF1z/T3aF+0de4W1e3X25FdzL6BhOmyWUPVUbs1BYj+7GGHCxGYmwSJZNNiJlNM6lN0Mj1
	+wlNOjXZpd/Ygeh00Bn3HDJuDlUMTQPx8kmihl0GqIPcOyHRw5IQ4XDCShT+a65PFbZpv565mGlKD
	oHUQcRJwgFVgTHArfzErzrJSX606aKVNMtWksc3OF8Dwdf6O8JbP5LMHCXn3TDCm4qIHDcntCYJm0
	irlGGOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTTp-0000000DFt1-2bxk;
	Sat, 11 Apr 2026 08:14:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBTTo-0000000DFsr-2JHN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 08:14:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9240F60141;
	Sat, 11 Apr 2026 08:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89ADC19425;
	Sat, 11 Apr 2026 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775895251;
	bh=dwBCOiXBWQ9YL4DB5lMeqs9qrMikjKAukVChq9kRbDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhwFuPMPpUhZQESrVQ7+1xVqqd844um0qi670mptM2+luPvwdYlm73uks5Oxwyim5
	 pd3Dxztg3X9znhTbFIWjZ44uwtI8RR5Zddyb5tEC06MBEgTaZQPBEp/IvYzyQFe6of
	 wvzKGah5MdEaI+Ny8jOHr7XnKmRrXNT+hjwFQnoQ8UQZHkSrQQ7uLETHrtzJdy9vaZ
	 J5LHDkcgxhaoypQy5UsyviYgcNnvU0xhNfPk4t0pmA+5m/SNDZdMIsiHfj5UR9AFz/
	 snLMBLyybSFWvDS3JbyQrxnFuGfI6ZbeFWMlCrrQAjpksDNMcKI+wM+KpJN52dUyCf
	 JxlYYfJTb6ZWQ==
Date: Sat, 11 Apr 2026 10:14:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: soc@kernel.org, arm@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] i.MX fixes for 7.0 round 2
Message-ID: <20260411-ancient-okapi-of-excitement-e5e22f@quoll>
References: <20260404001857.3374669-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260404001857.3374669-1-Frank.Li@nxp.com>
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

On Fri, Apr 03, 2026 at 08:18:47PM -0400, Frank Li wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit 511f76bf1dce5acf8907b65a7d1bc8f7e7c0d637:
> 
>   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-17 23:24:44 -0400)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0-2nd
> 
> for you to fetch changes up to 42a9f5a16328ed78a88e0498556965b6c6ec515c:
> 
>   arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for PMIC_nINT (2026-04-02 22:07:41 -0400)
> 
> ----------------------------------------------------------------
> i.MX fixes for 7.0 2nd round:
> 
> - Fixes interrupt storm by adding pull up pinctrl config for pin PMIC_nINT.

This is way too vague. Commits are odd and suggest that you rely on
driver. Or that DTS and driver are inter-connected. That is a warning
sign. You need to explain all this here. We had internal discussion
about without clear resolution, so I decide to merge it.

But in future this is your message to convince SoC maintainers that
such DTS changes are correct from rules point of view.

Thanks, applied

Best regards,
Krzysztof


