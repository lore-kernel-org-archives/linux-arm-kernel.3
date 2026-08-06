Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D381AC56205
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rGqzBb0sYOGN7VR0c1ptkLaLOY684Y9Zkrymft+ud4=; b=lyChAB8pbXjR1XTIHgVINZgIux
	9uogfS+CWR9Y02ahvLqHw5EHpm5R9CGY/mBP2Jc9t27lz2YohN3bUa1kFR4O8rHNrROYTtXzDbd41
	dJY8JFCF3SL7HLlLtcC/RSfLx83duYrJjAjj0iNjJHW906hDbnCIxFI+17ypfCuMbYmdcegA+JCAm
	b2RLHVr9TcG7vjY1czT4h7oCYpmTe9OcbHY5nSJVWE/AEu3uB+bRVLPaaIYUy9y5vLxY/qlZNcWc7
	a8vNEh0WpVsaaCSNxPNLAgs3UC5J0x0TNmAV/nuCA7ReAy6ujj0B61EsAT594ftPpaJDt8M0pDb6U
	UkGXXHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwsx-00000005iAw-1QYu;
	Thu, 06 Aug 2026 12:07:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwsv-00000005iAf-3GVt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:07:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1EDF60A75;
	Thu,  6 Aug 2026 12:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631C41F000E9;
	Thu,  6 Aug 2026 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786018060;
	bh=/rGqzBb0sYOGN7VR0c1ptkLaLOY684Y9Zkrymft+ud4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Cg1vR0XZ3XOyvNTpvh+5zuMK2t5GW28Es/jpHHkwWWXgyVOv9bS+o4jzDRxBN0OuN
	 kz2el/iqQr+/Fotp9GCCmFMC9exIbsFirTa6yN9YG0/DaqG352LPFH79bu7MH20HXX
	 FF72e2eGO0d/txciGcXt3AzbTEhffsOLXPL73CUfTaqj+2lqPUBtqTmjdm87GW8KRH
	 oeEkon+UvcB9y8z0zarYmUS8tTQZzKZVpdwCkCPzY036j6e/pZAM8xC3F7T03egip3
	 dDwB9q3Ijy6hHjl8bzxjIQFvdMJHgW5PLohHQvSFBhOn6HuuCwIzpE094yyrH3VmnZ
	 Q+S0Mjkg1YpiA==
Date: Thu, 6 Aug 2026 13:07:36 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, ilkka@os.amperecomputing.com,
	leo.yan@arm.com
Subject: Re: [PATCH v2 0/5] perf/arm-cmn: Support CMN S3 r2
Message-ID: <anR5CDq3efkXzgG6@willie-the-truck>
References: <cover.1785252273.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1785252273.git.robin.murphy@arm.com>
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

On Tue, Jul 28, 2026 at 04:59:20PM +0100, Robin Murphy wrote:
> v1: https://lore.kernel.org/all/cover.1782830759.git.robin.murphy@arm.com/
> 
> Hi all,
> 
> Since nothing else has come up, this is a very minor respin to fix
> the bisection nit that Leo spotted, and hopefully it's good to land?

Please can you check the comments from Sashiko?

https://sashiko.dev/#/patchset/cover.1785252273.git.robin.murphy@arm.com

Will

