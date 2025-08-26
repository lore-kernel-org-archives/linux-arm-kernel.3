Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB7ECA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 19:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEUE9aUN8wXQVbxEpHIID3syGeWcmhU2rRqGHrupRBw=; b=45FaIehaq0sgazC1EB5wV0kQui
	DL1HcpkkdbdrLIE4qYN77wF2ldGhCiPFiEK7cAf+6uFUIMA5d6yFRirgHO8gr2H+hqWgUAWPY9+Mi
	3fvBlKXP/5/6w7FQaPu+PWDmiOGacqv76RJ7cwY9jxpmoitjEA6Qgn0vdYQ/oz7/+ljjTgVZHgPtM
	LQIwW4Rjhe+QvSbczjftU1bLP+Z9GgY+rzYtTdAHA8m+mmZU3+N4FttK3L3Qv0Sqt6afQusosNSQW
	ZegB+xQyq4xe/rv5l9dHIaoeUPufgy6QfXQFctJyM/feaHo70odfsrFaRkbaiahgwZN25nkoGhOrS
	3ekqO8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzms-0000000D3O2-3qoH;
	Tue, 26 Aug 2025 19:56:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzTn-0000000D0xH-3AHV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 19:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C535601F5;
	Tue, 26 Aug 2025 19:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A72AC4CEF1;
	Tue, 26 Aug 2025 19:37:13 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:37:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: b10902118 <b10902118@ntu.edu.tw>
Cc: oleg@redhat.com, linux@armlinux.org.uk, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM/arm64: ptrace: fix unaligned hardware breakpoint
 validation for 32bit
Message-ID: <aK4M7P9qb5TVou-p@arm.com>
References: <20250824124317.390795-1-b10902118@ntu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824124317.390795-1-b10902118@ntu.edu.tw>
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

On Sun, Aug 24, 2025 at 08:43:14PM +0800, b10902118 wrote:
> b10902118 (3):
>   arm64: ptrace: fix hw_break_set() by setting addr and ctrl together
>   arm64: ptrace: minimize default bp_len for hw breakpoints to pass
>     check
>   ARM: ptrace: minimize default bp_len for hw breakpoints to pass check

We require real names from kernel contributors. Unless you can show
b10902118 is your name.

-- 
Catalin

