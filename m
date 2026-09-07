Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C07EC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0wXLyUa1TwSBmuzh8NevtI2afeWnZRT+jWRYMt7at8=; b=PG8McWfCxm1DPoF47K5rvYI9KX
	tJEm7K2KK1T/OVGHFRziYwto4thlSREpXKNcsoGfEgV8cTHoRdaWYVuf+R38+d4jb1AxpNxGeCZUG
	1oFKvBQM1gezoRYyRCL7Dt3vdFjrZKnJ65XRrrYCzQUHRdZieDRHcS6aFQWQwOOoAQbvMsHiaeaIB
	SoBT59Go7oEyj12YvgdzL9zlJz/RQJs/MMHsLZEf4VhkOU4TJymLTh+J8lGWs60qTRVZd0grxNS5V
	VFmFzeY0cvddbadQbXJRwoy61G3l6x+9svJijCVtbrTJenXLXwEIdQ14L4FqejDI7Paw8M+Tpuwau
	AdCe4XVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WIj-00000006SGL-1guC;
	Mon, 07 Sep 2026 10:10:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WIi-00000006SFw-1PEy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:10:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5B3B41FB6;
	Mon,  7 Sep 2026 10:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEC31F00A3A;
	Mon,  7 Sep 2026 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788775807;
	bh=p0wXLyUa1TwSBmuzh8NevtI2afeWnZRT+jWRYMt7at8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hBvzSdKn8WjnewtGNbglwtT7c1Bjxiycup7wyUCDyFt/phnuRMOBtb5kwIEo6sQqf
	 urtyqrCgz6i9b1B2H3G6iGe7/laomZTzacAn+QOZIiH52M4e1S9c3Qe5M/xqg8we0j
	 uZcBMpzQHrwwRdEOw/zvXFZlPkld6u2uRRXyyESIoQSBjvphpX5DMohmFzE22BPnbY
	 3BIHFeDCSxvJXqYXiH2jqEf/ZkAkzUL1W1u00ekq0tVFqyjHtuc822yYJYjkZZW9h8
	 eSZ76BJH99kAVwiIC/Fsk+oQrTYnRv19CdFepB4VZVewTUzbUeMLndZGjkflJeK5K0
	 rrqciS1JiIxiA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
References: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
Subject: Re: (subset) [PATCH v2 0/2] Exynos PMU fixes for cpu hotplug and
 cpuidle routines
Message-Id: <178877580432.239288.6322757955792613582.b4-ty@b4>
Date: Mon, 07 Sep 2026 12:10:04 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Fri, 28 Aug 2026 06:36:45 +0100, Alexey Klimov wrote:
> This was reported by Sashiko here:
> https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
> and was mainly introduced by enabling cpu hotplug
> support and cpuidle for gs101-based SoCs.
> 
> In this second version one patch was dropped to keep things consistent with
> downstream implementation and due to lack of information. Other patches
> deal with a few missing error paths issues here and there in
> setup_cpuhp_and_cpuidle() and around. They were updated per discussions.
> 
> [...]

Applied, thanks!

[1/2] soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
      https://git.kernel.org/krzk/linux/c/48f344b3e83211025763ca9bc1c5f3dc544b9613

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


