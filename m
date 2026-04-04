Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154BDD73094
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 15:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVDbOrXa2ubu/q0FucrYegxKXZoRpDNtXGFfNR5s6YQ=; b=NpSc+Lg7A+Ck+yYFem4EivHvzN
	DLMadfHgwUQSJ7/0DH74mYHDHWf2MoSwYQzBUknZZc7f3F8dnVjzPnJq9ekUldJhViVTO5L+T6NTb
	nc2h7kkOa+75MsdoBcze+q/fLFKc6BWe6qwCk6KJv+zuUMqEg4GfatPm3zxp2sB1CmgQlUAtphex1
	kvXEenTd2RjOyO2XhMt4ABKVqj27SuWmGpmza15UDltllxE2ZdVW0mGD4j/paRc2kPoNUcYQ+EDxs
	S5JR3zzke+e70+KSu3kRcCKd7hE4PC9v8H/D/ePd7N/3PpGfrad/VVl01SMaYzeKvPCnRVQfAFJdD
	rUfhmUgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92pM-00000003Ycl-2pDo;
	Sat, 04 Apr 2026 15:22:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w92pK-00000003YcO-2K4w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 15:22:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E790540A3C;
	Sat,  4 Apr 2026 15:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456FAC19421;
	Sat,  4 Apr 2026 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316141;
	bh=Ppz/O79346bLLCfgNyv13kyN0qysezj1EnPkWURU7AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qrUMiwftsg8nYQqjIb9yjkXV117omnCPLtwqjPTBTsEqW/RrQOjrp228U0mib0Hd2
	 OkahZMZm2pvowXdxaL3jYER0x42Dr2mNCrIuUzBwF1t2QprNb9W33Ng50yqeBxWRRW
	 ClajmeDno5mYy25X8EVDk5yScVciDcKDfV4iksmvXwzcLAv/94l6+qwoJVUDcV65vv
	 UTWWtfUoD7LIJ/fYwagYWBZ0o+nyX2gsGHdi7dujJ8/L14pwL1Z9gCZnb2v++dV96O
	 +43wVQi757XUPo2/o/dtUnkoq3zJDWz6p4Uw/qnC3RQ3c8vc1VSV4PxQPM/z15lgZ9
	 CzAzMirSOX4ug==
Date: Sat, 4 Apr 2026 17:22:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org, arm@kernel.org, nicolas.ferre@microchip.com, 
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Microchip AT91 fixes for v7.0
Message-ID: <20260404-enchanted-proficient-nyala-a5fede@quoll>
References: <20260403070239.2552455-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403070239.2552455-1-claudiu.beznea@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_082222_610817_A02AFAE9 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 03, 2026 at 10:02:39AM +0300, Claudiu Beznea wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-7.0
> 
> for you to fetch changes up to 907150bbe566e23714a25d7bcb910f236c3c44c0:
> 
>   ARM: dts: microchip: sam9x7: fix gpio-lines count for pioB (2026-03-23 12:54:24 +0200)
> 
> ----------------------------------------------------------------
> Microchip AT91 fixes for v7.0
> 
> This update includes:
> - fix gpio-lines for SAM9X7 PIOB GPIO controller

Thanks, applied

Best regards,
Krzysztof


