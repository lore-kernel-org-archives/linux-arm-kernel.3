Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ECBCD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vDOEE8xBUSXxvq4xLfdOp0TCxRvuaF7+Cmh+3kfoHpg=; b=OvMVwZ1gq0AqwvzC4mZI+mIgGd
	6R0zIncn+aN2y5e3IjX8RO3knxIzhXvOWmRTIsvpxGTfOqCiDkSn9WUFAaAqoyIBaoKOawdNEg6Bu
	+7gq01SsiAMS/FQ13ltPGn6hnAy8pxPgmUKkHkRgo7v9m4qWxrudK5UmBEm2URvFwzxBuNZNPNMOd
	XzziE1+RvqTq6rbxF84lNNrCpia+/qVLP8LQUmmG5GFrhXfgMi/x7rShoQ+l8MkABMQ7CUZsFevKf
	etzDF+eYnJTyNkTt/AhsbKpoFdtR+NIu1wRtuIUFBZrUiTGKLQqhRNN4aWobINS8shDV3dBHs2+hz
	m4lPw16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvQ3-00000005Vsx-3lYp;
	Tue, 09 Jun 2026 12:18:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvQ2-00000005VsT-2sH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 12:18:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A3FC4353C;
	Tue,  9 Jun 2026 12:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE091F00893;
	Tue,  9 Jun 2026 12:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007538;
	bh=vDOEE8xBUSXxvq4xLfdOp0TCxRvuaF7+Cmh+3kfoHpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nUrsJUo4SBKUrJ95fNqHM7pJvu41I5sV4u6qmdzT46KMoUiI3QxhnETMEomM1BtgF
	 wwaQL/RoH5HufkUOZectSI3noKVXotyShS5hikS4/xGVaGHzXQgVRALWFpNSLv4aYh
	 Gey+VJ+gxydk9kYpnIuoGKemrS98uO5GM5ATv1knOtXYsn71FnX3YbVaLM+8ITLkuS
	 D6TWh3teAkMZFabGIlK01zvI9Wb7JyqsopMHLibnqbW6imSojLIiRVJ+eB369GeaGc
	 ITPlPwPtKqR8wraGxn/YyxqOn0xg2qhZrv1O49cLoo9uyOFKfLSr15B5KMvuSoH2j/
	 HtkYY9mICf1lw==
Date: Tue, 9 Jun 2026 14:18:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [RESEND,GIT PULL] aspeed: First batch of ARM devicetree changes
 for v7.2
Message-ID: <20260609-axiomatic-bizarre-boar-03f773@quoll>
References: <cbd2822caa9fc7c2b4567703be785b9b4fd829cd.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cbd2822caa9fc7c2b4567703be785b9b4fd829cd.camel@codeconstruct.com.au>
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

On Wed, Jun 03, 2026 at 04:48:43PM +0930, Andrew Jeffery wrote:
> Hi SoC maintainers,
> 
> The first attempt[1] missed the preamble, so here's the same again,
> this time with it included.
> 
> [1]: https://lore.kernel.org/soc/55ab27bc5e09252b1dbfdf1505693eb193b8e846.camel@codeconstruct.com.au/
> 
> Cheers,
> 
> Andrew
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.2-devicetree-0
> 
> for you to fetch changes up to 1249ee157de518a76cec169e2a5db4d6e523cc90:
> 
>   ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename (2026-05-27 12:44:26 +0930)
> 

Thanks, applied

Best regards,
Krzysztof


