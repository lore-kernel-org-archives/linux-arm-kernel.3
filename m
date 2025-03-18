Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0584FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCpda69+4YOXyPlxXr4rhlyiXJ6ySWZXtY4yz6bQvNk=; b=jJQAn2yM5XOWqElxVbLfGUC437
	20/O/FzYjBLMhvZ/rZzq2E6KqEgKs+hwG7vlNhIlrk3g6baC8dJ3zBLOwh7P52ZVCrqGESu2Q/B1a
	+Bk4iWUqLSb87tsVE1cHS3fhjWmxjMRySb5aWLSGjZsBPaM4ugbdCGyvmfPD6JIU+yjxAag1+LeqM
	oo3f3SzZ4RwWLuPQ/6z22UHaDTeg3vpj8i00UCP7F96DoejM7bLqasQfE25mwafQDxr4JHPBiY56A
	CNZpC6Rq6BAj88cBTBWA/WDZnGvNJhi8NEeOmKL+NqNZhurwd3JfA56MjfysVt/V3CpfmLHSwznWw
	qnOgFl0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuT4Q-00000005IO5-2jgF;
	Tue, 18 Mar 2025 09:17:10 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuT2j-00000005IH2-3g6F;
	Tue, 18 Mar 2025 09:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kCpda69+4YOXyPlxXr4rhlyiXJ6ySWZXtY4yz6bQvNk=; b=KAen0TNk1/Ch9gRLVmwOAqN7ww
	i8CBoeBw5RGn57F5AZuWcWu4MPWtC4wrXn/F4nN08gu77G9JPuXmghozKSX5eA8iUxvCI2kqsw/WX
	s/nsdo/5GeQmU8wlXqQ5la71KnKow0xmY49Kwtwl1eHisQm+g8fQBciWbRbeUK0CIZ+Wi9Nf0x6kA
	qS/TpBmnwOF0UGe+ysJBYblLf1YHh+jcACbf/M8S+NuD6H28+bC9kzYB7Rbv5D6m9Fpqx0xzYCmlv
	l7ojCYq4k5hXsxJDEO5LyP4RA0MsjazWJCuIL3WeL9/CQlbrHwX4+++XMpL62qGg+klNt/1nRHKNR
	lbHZMGtA==;
Received: from i53875bc6.versanet.de ([83.135.91.198] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tuT2g-00054Z-JC; Tue, 18 Mar 2025 10:15:22 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, detlev.casanova@collabora.com,
 sebastian.reichel@collabora.com
Subject: Re: (subset) [PATCH RESEND v2 0/6] RK3576 OTP support
Date: Tue, 18 Mar 2025 10:15:21 +0100
Message-ID: <2364081.ElGaqSPkdT@diego>
In-Reply-To: <173978599692.25901.15315285566342669137.b4-ty@linaro.org>
References: <20250210224510.1194963-1-heiko@sntech.de>
 <173978599692.25901.15315285566342669137.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_021525_942543_B71E8B7A 
X-CRM114-Status: GOOD (  17.35  )
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

Hi,

Am Montag, 17. Februar 2025, 10:53:16 MEZ schrieb Srinivas Kandagatla:
> 
> On Mon, 10 Feb 2025 23:45:04 +0100, Heiko Stuebner wrote:
> > This enables OTP support in the nvmem driver for rk3576.
> > 
> > I expect to pick the clock patch (patch1) and the arm64-dts patch (patch6)
> > myself, after the nvmem-driver and -binding patches have been applied
> > (patches 2-5).
> > 
> > But kept them together for people wanting to try this series.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/6] clk: rockchip: rk3576: define clk_otp_phy_g
>       commit: 3e081aa132bbefe31ac95dd6dfc8d787ffa83d0b

the applied message says you picked the clock patch, but it's not in your
tree - probably because you realized that it's a clock patch? :-)

So just to make sure it doesn't land in two trees, I should probably pick
up the patch for the Rockchip clock driver, right?


Thanks a lot
Heiko


> [2/6] nvmem: rockchip-otp: Move read-offset into variant-data
>       commit: 024e21343f3cbcde0343473fcaf094d2c19cc7bf
> [3/6] dt-bindings: nvmem: rockchip,otp: add missing limits for clock-names
>       commit: a1bf00100d06ad69286154a63e548ae6f6ce8539
> [4/6] dt-bindings: nvmem: rockchip,otp: Add compatible for RK3576
>       commit: 8c94337ebbfb840944574f82df0cbe35930d8df8
> [5/6] nvmem: rockchip-otp: add rk3576 variant data
>       commit: c5ebefe4e20d9fd99ae49cbfd1c18632cf338fa5
> 
> Best regards,
> 





