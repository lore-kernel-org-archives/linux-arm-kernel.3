Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD7BD63938
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZ8VhjqFAzj7yD9bsPRz9+ha7C6s8OG8O5C5kN+xmUk=; b=GnH/Ax7UhUdojdllMlYLX/atYC
	lnDjmOUjDbDZicDNaG0jQQtVBPjxOKrQQmvkgBV0oA5BOM+JkielviQSneCPsX49H8M5v0kbCIOIi
	mEXZlqyO703R06pXwY2NoaJJa1jYzPTD/Hml3zrojiu+FVifF9sEFC8d6bY6JpZocrdD18iJXCtnk
	SQX5kXfOH05BrX7NaH47cqv/mWYTn3bNWh0x+wUQpkqQ+cWCV8wE9/RsIpDe8O6hBCrLTJo5uej7s
	XdDbY4vlGW8k1gjz4MpVlRuG+/oX/LjGndA+agOD3QujrotYu42BGeKmfSZJC5zg91iyvGtWCdski
	Vq6l243g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkPy-0000000FNQC-1wbs;
	Wed, 20 Nov 2024 13:06:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDkP1-0000000FNKs-3pQF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 13:05:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7C81F5C50B1;
	Wed, 20 Nov 2024 13:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E783DC4CECD;
	Wed, 20 Nov 2024 13:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732107950;
	bh=OrZhBNtRFLPlaGhj+G686tbV9mW4nzFS5Z4fiD5DDbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXEFli8S0S0RY0bHvO/X0Uk41xKM3YJEZz7yiloTnieO0v59BEHVon1+EJJjI1Tj2
	 dJh00zqR2gqq83o+wTVOPExHEh03ImPVTF+Tk0/pnDcXkbhHOqYI+9yrtrR15LeEOg
	 D36Dn95UmDcZeEw+sKdusdaNDWz0gOlWHssg7/cqK1MaggCFYsyd0nBcr8NrzVU8jt
	 8JmJwuVTKvVE7Flk6Z/wl8JI3nueLeDwfjizU5Fv77KTX52/Nef4KB4j6k7eKrlDpi
	 SH1A8KlHYZ+WqCS1w4WIfpgeoM14ELE16LJ80HRm3b68rGHP6z9BTBv3QzRs9oB2aX
	 l6gKhI8yGj+Jw==
Date: Wed, 20 Nov 2024 07:05:48 -0600
From: Rob Herring <robh@kernel.org>
To: Stanislav Jakubek <stano.jakubek@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] arm64: dts: sprd: sp9860g-1h10: fix
 constant-charge-voltage-max-microvolt property
Message-ID: <20241120130548.GA399236-robh@kernel.org>
References: <cover.1730918663.git.stano.jakubek@gmail.com>
 <aa557091d9494fdaa3eda75803f9ea97014c8832.1730918663.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa557091d9494fdaa3eda75803f9ea97014c8832.1730918663.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_050551_997368_82138B67 
X-CRM114-Status: GOOD (  11.15  )
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

On Wed, Nov 06, 2024 at 08:05:29PM +0100, Stanislav Jakubek wrote:
> This property has hyphens/dashes, not underscores.
> 
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> ---
> Changes in V2:
> - collect Baolin's R-b
> 
>  arch/arm64/boot/dts/sprd/sp9860g-1h10.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>

