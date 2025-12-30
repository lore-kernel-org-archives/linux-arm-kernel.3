Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88303E92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 02:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xr3/3S+m/fk/qhvwWxW+siopYza20xJzcZQaFErg5gs=; b=qc9VvUBwK5d4HnxnSWKDTlmCsj
	dtPbE+4vDkMiafQgVUDeqwbrYzfEGBKebF49dqTKPTBidy4aNnw5BjIB12y2qBG9yvI6w+OPBOh5H
	cWc62GvtiJpL/jq4ikuwPiH9+KViTxmCebHU6eyFNzUChN83rWcn63wT1Mpu32h8i6cc1tNzwWAd2
	HZTAXhW6P2bnLMdnl6uYHhqK2MIJQRpioxkwt6Df8GAjssb4rIX6cd9xJu9KbOJmWIbTNCuh1+3X9
	3CZjHZqe0OMeaKnXZMzb4Nruhndme3HJ9eT1okQMtYDFc8YTOETp1Hxq39U1Qg5ioS0SMCXJPHQg6
	6sCplbSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaP7U-00000004Hwa-0lLj;
	Tue, 30 Dec 2025 02:05:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaP7T-00000004HwN-0xMi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 02:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2997C6000A;
	Tue, 30 Dec 2025 02:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E54C4CEF7;
	Tue, 30 Dec 2025 02:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767060353;
	bh=blBBr5bSdI6bhL85aAht4uJAb892PffQuaVXBuFiBI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOllXsWC4JEHwwVwUwGg85Ff/SrA1qmRa6BXj8Zn0T6SdS4FE6RsWYYFUQe3bo3iY
	 uhAgu44OHcGKojNgfl+rk4n6nA6B46nhhqH4qXQGiQENRw17ThE5BzZfEYQK2aV1ba
	 ygKZuKF3Q0Hjwr9ToloOT74GDsWhxqZwBQvP0WLoiaC9Z6lLl7AS1ae8BJNvPp9Wd/
	 sUN1aHnqZhlwh276EL3VktTsmYqIGNwwSHkcr2XeKggu3p6tkWxvjla8jKdkO/c64w
	 kshT+NY43FZvakCaRhlz4GC+PJgp520etkSurE5rH5Rhv49zjJ0YVEwsyPphM9Yoof
	 X8ZEHvkB0A1LQ==
Date: Tue, 30 Dec 2025 10:05:47 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: tqmls1046a: Move BMAN/QMAN buffers to
 DRAM1 area
Message-ID: <aVMzew2DNhm0Vwf7@dragon>
References: <20251201070333.6804-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201070333.6804-1-alexander.stein@ew.tq-group.com>
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

On Mon, Dec 01, 2025 at 08:03:33AM +0100, Alexander Stein wrote:
> DRAM1 is only 2GiB in size (0x00_8000_0000 - 0x01_0000_0000) which is
> already used by Linux kernel, etc. Move the allocation area of BMAN and
> QMAN to DRAM1 region. This frees the complete DRAM2 area for e.g. CMA.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied, thanks!

