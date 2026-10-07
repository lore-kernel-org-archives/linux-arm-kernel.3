Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2779FCA600A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFF3LPZl8ZhJEd5YpwT/YjFiCZO7rblB8TxKAWBvQ6w=; b=cXiDF/tG1BFMqn59tGKQRxjXhG
	QPoKy9i+34h3OyktFaJ+pYQxklyOO1hP59aXDXfMkpOQPQ8pcnDZYtc0b+AQ9zQjOzQGy6gFQhU/s
	CyMipNFbGZPptkoKVXdiBeWspVQAIQeupPLt5IUO3PfZzrKV9D9dJFY2bPgZBZT6+GzAnsSs1SMPa
	JgYNN3+RMGhPeQb7zWeGv5FitJqb4PLGf759hTla7jNaDyGU62qjGsvc3GUwaznLgYHc+5tcpga6Z
	PiusFvn6Gv28+Bts1gi2RYO9P/vdkkluUYgS0UDWIVWiZ0th69qWbjjCvZipJj8Fd9S9OIFH2ISq3
	nZsPgcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ1L-00000003BMS-1nH9;
	Wed, 07 Oct 2026 21:17:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZ1K-00000003BLp-0Kap;
	Wed, 07 Oct 2026 21:17:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86DBA60A53;
	Wed,  7 Oct 2026 21:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128C01F000FF;
	Wed,  7 Oct 2026 21:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791407869;
	bh=VFF3LPZl8ZhJEd5YpwT/YjFiCZO7rblB8TxKAWBvQ6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZMa8U76nE2tvAbtN7nHxioC57XLL5twQGg4tccenKDGDDn5R3Es3UZ0hyAMvIdL13
	 KJNLYufm9K9g96mSDU2pn0QSubXw3NvV4UgdHZBnjJQibEvrHCAyDekJmCoNKBj1T3
	 jfeQyqomiGBI9XTzyXESwdrYSuWqBgrxeqI01o2K500AizVBSOD/7Vpn4liO81/pNc
	 DyNiLFhNnR2iRkxIY5Sy6XP5J3r9ny/XLd4bnMPf/j2k/bsSwrL1SpeACwuSGeYkcW
	 UtD8CVZMj2fQ5IsQrH/nRidHTmwgfzNgLmgdWRv032HrfTCkQxpA7CB+UY6omt0cN4
	 bUDqc19pAMMUg==
Date: Wed, 7 Oct 2026 16:17:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Charkov <alchark@flipper.net>
Cc: Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: rockchip: add boot ROM download
 boot mode
Message-ID: <179140786784.381047.12884810066150774616.robh@kernel.org>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
 <20261006-b4-rk3576-reboot-mode-v3-1-6edba064693b@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-1-6edba064693b@flipper.net>
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


On Tue, 06 Oct 2026 20:02:39 +0400, Alexey Charkov wrote:
> Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
> when they find 0xef08a53c in the register they take the boot mode from.
> Add the magic under the name U-Boot already uses for it, so that boards
> able to request it can do so symbolically.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  include/dt-bindings/soc/rockchip,boot-mode.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


