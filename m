Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E37C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 19:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gX05dgJCD27mH6llDY33IsMXzdisHFKzePgC8oqWYI=; b=SBnepBB0TI1zgRk9D6/DVkdKZs
	yyWdGHBQfFYS1aDXEn+cOZAU0T3Le1k+S8cGi4LhF7lD47hRitKi4Gt9B0tqFm4q+hkxySU5OcYUD
	+mLfmMdFw5k1WdctX0EHf6WJmSaz1RDuunRN2ttiPm02a2KwvW0Cqh8wYvO7+cP408YbmpNBOfan6
	SGDY84XtMqNO9C7oHvqBRtLanAED0MsFDagYpeD33rfXIiqDD6YGx8cq/1YTe9BC0cAwHqpuBqs0t
	/iY6/hVWvoMr08QcYsabVeE8HxB4R52dizWUqEoO43NKFFj+pf3LJwVfRhV3ouwsSdRjwqutVJ8cN
	YEOnuaCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYrR0-00000003Qx7-3xT1;
	Mon, 07 Jul 2025 19:23:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYrKc-00000003QKM-0DoD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 19:16:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 351D7A5433B;
	Mon,  7 Jul 2025 19:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEAEC4CEE3;
	Mon,  7 Jul 2025 19:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751915808;
	bh=NarcBfymvbhJkXFt0N1R9Pad6pw+hlSq8V8tsPduM5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uOmVkdSJJx+g32aZ7Cd3tzvKPvjuJupHAF9Xlqd5qdTN6o69DozdHyLuG8odDbjML
	 kCfjy3uH0/RNHx1umv8xPXj1ZX6DahZuMwRSQsE4Tv1n0OZFJ0qceiDDpKXM2dAfaq
	 uEjeMfxRQXFoqWFz815ZqG+1xgCauJUcBDjzjthrotM4ifHaMFRbeX1fMaX3HPsW70
	 tZYSLtKk8qjqRj9fOlO4vWjUEWvEbATTJK32/eAvM4VIt7NzEcdVeRwY1JePXvmqfJ
	 ylVuIu8QEv6FgJ2tTWKHnYCzjcwHIEp1gQVCW4pgLA/dgoSJclaSTYIavJdbLcrLxE
	 pXMNxA87v2LPA==
Date: Mon, 7 Jul 2025 20:16:44 +0100
From: Simon Horman <horms@kernel.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	darren.kenny@oracle.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: thunderx: Fix format-truncation warning in
 bgx_acpi_match_id()
Message-ID: <20250707191644.GC452973@horms.kernel.org>
References: <20250706195145.1369958-1-alok.a.tiwari@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250706195145.1369958-1-alok.a.tiwari@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_121650_166937_F93FD2E6 
X-CRM114-Status: GOOD (  14.80  )
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

On Sun, Jul 06, 2025 at 12:51:42PM -0700, Alok Tiwari wrote:
> The buffer bgx_sel used in snprintf() was too small to safely hold
> the formatted string "BGX%d" for all valid bgx_id values. This caused
> a -Wformat-truncation warning with Werror enabled during build.
> 
> Increase the buffer size from 5 to 8 and use sizeof(bgx_sel) in
> snprintf() to ensure safety and suppress the warning.
> 
> Build warning:
>   CC      drivers/net/ethernet/cavium/thunder/thunder_bgx.o
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c: In function
> ‘bgx_acpi_match_id’:
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:27: error: ‘%d’
> directive output may be truncated writing between 1 and 3 bytes into a
> region of size 2 [-Werror=format-truncation=]
>     snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
>                              ^~
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:23: note:
> directive argument in the range [0, 255]
>     snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
>                          ^~~~~~~
>   drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:2: note:
> ‘snprintf’ output between 5 and 7 bytes into a destination of size 5
>     snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
> 
> compiler warning due to insufficient snprintf buffer size.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Thanks Alok,

I agree this is a good change.

However, by my reading the range of values of bgx->bgx_id is 0 - 8
because of the application of BGX_ID_MASK which restricts the
value to 3 bits.

If so, I don't think this is a bug and it should be targeted at net-next.
With a description of why it is not a bug.

Conversely, you think it is a bug, then I think an explanation as to why
would be nice to add to the commit description.  And A fixes tag is needed.

-- 
pw-bot: changes-requested


