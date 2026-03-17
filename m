Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E199F3381B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKZpy5G3BxRfZqGQ4S9UGexEy6BgcDUNFDUvHzkR8Lo=; b=U/s6n3zDPC0ArlkgoMWuN4rdH8
	dCR1JBM576LQ2t9fNThOlpu086pJSew73jlJtlPVxNcJ6E0/ucnYrrTENxxR40dAfxcpsWVf3KxJw
	oEjg/e0CSnojwwxovf2dxAk1dQAnvh9FbEE1SpNLTikWkJRw8buMNgcYSXyXOMzrdw+iSatVpZR3B
	S5hRKC4llsZSKAfn8a8ZrZ15JuSQpA+9Ymu1c7TItfRPwjMjUhlqp1j3VBBchWqDNfi0XzjVg9lqH
	1HNmP3qliRM0KdJV8YTTRLpK47LvUbs9zOHrc5sUCH8Fc5gZvqd2nHvi192EydreS7j4QLD8VTcPj
	jX7QJyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q6O-00000005lG9-3KOR;
	Tue, 17 Mar 2026 08:48:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q6M-00000005lFZ-0DaR;
	Tue, 17 Mar 2026 08:48:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C478A4391D;
	Tue, 17 Mar 2026 08:48:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212EAC4CEF7;
	Tue, 17 Mar 2026 08:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773737312;
	bh=tDo9OmIfiT5G3x5H5qI/bsN8tjRVgdhgQfHqmc1A6Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=laEyObRactQ5CBD7PtTv3zIoevfgiUwGfSazVh/UIZI5QYKl8MTU5/Tvrpdi+K7Pj
	 cc6BqNwaelGiGBLdCgFqGsxkVUfd8AqIUsxmYMBYr2DRvgOook17Un2v0V5EL+dLCQ
	 ftlGMlakXdzZPMREs013dieOJ/cMIxvA6fL0wFDarokubAE/IaTfFmZSupSpKI6nw/
	 w8FEU8iJOakGe4TSTKJWz++Q0DMeAwl877ANPlGrlM6JtKBdhBvDq+v+4xb3UKKY+e
	 ofViXdFqoLcPZu0RRRuiCAFW1kZNXQCcUadwRPMDHaKqVtSXHCU8uQWKuTEUhFBO4K
	 KTM8wnPTdOh7w==
Date: Tue, 17 Mar 2026 09:48:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 7.1 #1
Message-ID: <20260317-impetuous-attentive-penguin-43a503@quoll>
References: <13966995.uLZWGnKmhe@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13966995.uLZWGnKmhe@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_014834_112096_6F68A0A1 
X-CRM114-Status: GOOD (  12.90  )
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

On Sat, Mar 14, 2026 at 07:45:34PM +0100, Heiko Stuebner wrote:
> Hi soc maintainers,
> 
> please find below Rockchip DT changes for the merge-window for 7.1 .
> 
> So far only arm64 changes :-)
> 
> 
> Please pull.
> Thanks
> Heiko
> 
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts64-1

Next analysis reports:

Days in linux-next:
----------------------------------------
 1 | + (1)
 2 |
 3 |
 4 | + (1)

Please keep changes in next for at least few releases, in case of
development pulls. Allow community to actually test your code before you
send it to upstream maintainer. We are early in the cycle, so there is
no need to rush changes which were almost not in next.

I will leave pull for later (not reviewed yet).

Best regards,
Krzysztof


