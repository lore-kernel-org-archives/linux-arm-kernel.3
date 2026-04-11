Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C208CF44875
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 09:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVBtr8mn+iRbt420nrt38lakPNGv83qgUtc5MygUOu8=; b=3CfId2iJXCfh4/Gn9EROjR9NiR
	zrB3sU6sBLkJJ/GOkY4/dO1aMfCh6dZFpMVcDvJrBaDV80mKhfsuZn2hmYvn6iRvwhnBxvg391roj
	99GmgO+3oHGvA+WhK9qDurnWsKrzHN6/wXWbpSNyqiranerI4USIvGuGnl0Q6SmWg/3+Nx2OhR6mX
	SKTbVoS4oPh2Y2eioXGuG362Npu0ztla69+dr6pBIOg+RMGjJf328ZvkU66Not/bZEUqoHF9FYXOR
	ILZRfT/Yb9GPb5fG6hg6oKLMVPgwQTtPCfANE8nDarcg4wdi9q2jgoLZnSQM/GJVnOQxqKkKROj/O
	vfQ/0ZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBUit-0000000DK0h-2OxO;
	Sat, 11 Apr 2026 09:33:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBUiq-0000000DJzj-2fU4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 09:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC4654442B;
	Sat, 11 Apr 2026 09:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C75C4CEF7;
	Sat, 11 Apr 2026 09:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775900027;
	bh=ZAsojg+L38qGOt1S6SMxGe0ku389Cu0RAoTT2bB7dAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xem/Eip/2oX2CimChE7En/sKX6lP8T6ARSJ2/0J+IpSaqldSb+UEMQCCqH5TWBzNu
	 dLlEWBdN+HdOQhyWfcV6xHZ70NofxBNJRvC7MfrgwLgicB4hKmmjejr0XC0Kt0ENLx
	 hhm3Qe2eyQzfecSGHzlh0DhZSb+kmokRh4amqHMfWK0AQjrCT3iyD4iBXfLJvXK5t+
	 Jep+ZLKvX9ZvU3eUX85V3xmjcuTzIrYs/jcy2RUA9ruzVLm5AkDR/6qsiAIEUSBBt+
	 ld4CSvrZzvli2Ki0hkVweixgxKPdxnsAv86xqzLM7+dOPJCUuujuXQAAQIHJ0fqv9y
	 39LU5RM5x7OkA==
Date: Sat, 11 Apr 2026 11:33:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.1 (#1)
Message-ID: <20260411-brave-armadillo-from-eldorado-3b00c6@quoll>
References: <87cy072bho.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cy072bho.fsf@BLaptop.bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_023348_712633_249AB476 
X-CRM114-Status: GOOD (  12.13  )
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

On Fri, Apr 10, 2026 at 03:25:39PM +0200, Gregory CLEMENT wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v7.1.
> 
> Gregory
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-7.1-1
> 
> for you to fetch changes up to 00e6d608fe80b0f68c325cb46862f78e9a8ec768:
> 
>   arm64: dts: marvell: armada-37xx: swap PHYs' order in USB3 controller node (2026-04-09 10:14:40 +0200)
> 
> ----------------------------------------------------------------
> mvebu dt64 for 7.1 (part 1)
> 
> - Armada 37xx/3720 device tree fixes:
>    - Reorder USB PHYs, standardize names, drop undocumented
>      properties, fix schema alignment
> 
> - Add Marvell 7k COMe board bindings and uDPU ethernet aliases
> 
> - Cleanup: drop unused .dtsi files
> 

Days in linux-next:
----------------------------------------
 1 | ++ (2)
 ...

So a few things were just applied, unless this was rebased?

I will wait with this. It might miss the merge window if v7.0 is
released this weekend.

Best regards,
Krzysztof


