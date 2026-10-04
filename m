Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2840CA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kopioqHpTcZMPLSZnL2p1LjYG4zHRyxFSvg8n/BMRw=; b=gR4f/EZlBn4f4n34X86WW2sjDZ
	MlU+wfF0CJZ7x3MVPFjoR/5UBoULW/gSXpXEjTxSgZpQQIuH5HBf1KB88fuX6OR82mPg/d3dZLJJI
	XnfdxUN40hLDsNw36c5mhmPS6d6XTsxJed9PxIbSW+QjaowQZTTrmz5iV+VU7q6IOEVS+F6rZFb10
	jrXIM+z0KR/08CYoXGr3nUpQvAPMnMqHSKvUtm7Y/o9ljdx06gHGAbhMh3NafV8khakdfsfHvzWcT
	oxfC1uIkPWa9XJAIxOclKE79lS8p7Dg9FW+bhyydk4gq0y+16CyCtQ9mVmUlh8RNM1dYQz1y4FgOn
	A4xSucwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJxu-0000000Egs6-2qVM;
	Sun, 04 Oct 2026 11:01:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDJxt-0000000Egru-2jpK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 11:01:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B242660120
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 11:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C460E1F000FF;
	Sun,  4 Oct 2026 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791111668;
	bh=6kopioqHpTcZMPLSZnL2p1LjYG4zHRyxFSvg8n/BMRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jxahJQzlEPxblUZEXzWhDdypG3mkT9HOSNjeFpqi1Ma2bPQsCNYrtUkdsPP7YEMwN
	 wuwMOaRgDIad/jUhxKy+SrY5tPiAccCfbS/wItq3ytkUtTMay/vK5fv32sqerI3W+g
	 3+f80hcOx49r1enOdCUb5R0vV0KQT3iLWCaER1RowmawO6wLWxvOBmNm7RROj4SbMv
	 nrccLzYhheo6GYRTvaQ/gXDcsT8jjE1JWVyGbArxNZHRnvH9Kqq9abS1JpEyDe4ZDD
	 8qjhdQFDJ4FemT7SAHmnUJ1FbLUwDM0XQ7I+ROqmj8ZkfasD4r2NF60zWGb7WU6e2O
	 kZEeoEfwfcr+A==
Date: Sun, 4 Oct 2026 13:01:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] Gemini DTS changes for v7.4
Message-ID: <20261004-wondrous-convivial-dragonfly-bc44db@quoll>
References: <CAD++jLnPdC-LjiofpLFHHh+BqWUhwmE9ee3xLk1gsmRD5r7wHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD++jLnPdC-LjiofpLFHHh+BqWUhwmE9ee3xLk1gsmRD5r7wHg@mail.gmail.com>
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

On Sun, Sep 27, 2026 at 11:21:11PM +0200, Linus Walleij wrote:
> Hi SoC maintainers,
> 
> the following are two small DTS patches for the v7.4 kernel series.
> 
> Please pull them in!
> 
> Yours,
> Linus Walleij
> 
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
> tags/gemini-dts-for-7.4
> 
> for you to fetch changes up to 5bf1bb010712bba28eda926ed453db3cab91381a:
> 
>   ARM: dts: gemini: Use a level-high interrupt for TVE200 (2026-09-27
> 23:13:42 +0200)
> 

Thanks, applied

Best regards,
Krzysztof


