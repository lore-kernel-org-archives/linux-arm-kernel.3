Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB32D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kwtn7E+4j95Z2DbZtdDe+NkpflDsdvdS9eNbZHrs5rg=; b=nfj2dKgWspNuhjA4BuRreLwUvV
	8tSUoysn+0wDEPq3/Z9M2RKTtT5jm/nCfaY55tc0DM20TmN41/UHGhzmF/uudEBTagjez2o2TvbF2
	/caH23CNr6l/lXmNW6lC5G+DzlNxpn/kMEUgMjJf8JQyEQn3bR/KKoB1XfcAj4SeC4JXyDiY1ym8g
	3yELWqlMiYZZsdsYQh0dXJhc5s1krzQH/6WMcNQc8AewO5WddADEzX4zihD2EyaPAr7Uwaz7ahFk3
	Z66Ydz/21AtnyoMNBkie14lmOhh1Or6AZls4knbGBpDhDAyoaLRLgtpBZvUdHYayKYl07CyIdg6FD
	mHpdp8WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7trd-0000000Eetv-17Zm;
	Wed, 01 Apr 2026 11:36:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tra-0000000Eeqr-3pf3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:36:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47442408F5;
	Wed,  1 Apr 2026 11:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9D8C116C6;
	Wed,  1 Apr 2026 11:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043358;
	bh=sff6V0+SikbFfnnkuOiFBlCiqZ50wVPswHcHFFLJGmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iBoUc3LC2c+qN4fkZK6Cqw0ymOV5YmE554r9dGUUTJ7ePeCc4aTLdJZgHeyuATAod
	 OW7ZnFmtIf9go8WObN5EjT3d4VNpuWHpc+OoOUneqtbWJ495e1gwd2YwVJkKQH6osk
	 x0Q+9qVhVpqAAw/qGFTGKViqT9KKUK3AG8GNHtkjFmypfV4+YqaB5pFX724M4qxXBB
	 Tmbd/qV7OSfvVc2f/Ycm9o3HEdVCCR2nfka8SxXKibb+81Fxt4aQTBWqt1moenQ7Xp
	 e2ZDPR1I1gzD4nBNXkUd6NBG40yYSCwS1w60HKBZI1QsFyHoLCqdbSvMh4a5dQWF7I
	 B3N/vFNsrmt6w==
Date: Wed, 1 Apr 2026 13:35:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc <soc@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] aspeed: first batch of devicetree changes for v7.1
Message-ID: <20260401-duck-of-striking-engineering-3bcfab@quoll>
References: <df8ef5ea7b9e254658934c18de20fd9805a82d74.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <df8ef5ea7b9e254658934c18de20fd9805a82d74.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_043558_981849_A9FD01ED 
X-CRM114-Status: UNSURE (   9.76  )
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

On Thu, Mar 26, 2026 at 01:39:52PM +1030, Andrew Jeffery wrote:
> Hello SoC maintainers,
> 
> Here's the first batch of ASPEED devicetree changes for v7.1.
> 
> Please pull.
> 
> Cheers,
> 
> Andrew
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed-7.1-devicetree-0
> 
> for you to fetch changes up to 76b4ec8efdc3887cdbf730da2e55881fc1a18770:
> 
>   ARM: dts: aspeed: anacapa: Add retimer EEPROMs (2026-02-23 12:02:22 +1030)

Thanks, applied

Best regards,
Krzysztof


