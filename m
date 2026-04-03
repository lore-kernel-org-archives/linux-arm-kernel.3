Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6F5E88D6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 23:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPzFxlb75AaK7b+esnZ1DlVZcRcBf8MNbtpO4jivLCY=; b=g9Dtwa84Vxx+G4o5ZrnemyatQD
	AftttaoPYiNPQjEJGHQ7PTsFOSRwfbfeCXKHahskqQMzA9Ty2etjF4M6hIqKCg4Dts4E12LLaZO8X
	BIWQGuAc+kh5C6kE1UjRvaEf+zjUdq0FcN5Kwp2BSwSjzxlkA35GEJLdWv9iaRhCR38rnwCZG782W
	A+KAfQbiU/5E8RN+znPUykD+pGXHPQo7M/jI45b9L3d1CDFkSbPEWNrt8pzDGFNQF6GXu9xaojma/
	84Ij3p2cX4tsZea7giaRbiPNWpmCcU8ZkK+F4HINUP3Dw38GdCbUgx89YI2sAf2oUOA9J5nBxa4am
	XfeWcEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8nfF-00000002iDM-1KnC;
	Fri, 03 Apr 2026 23:10:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8nfE-00000002iDD-22YM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 23:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93A5660008;
	Fri,  3 Apr 2026 23:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43777C19423;
	Fri,  3 Apr 2026 23:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775257855;
	bh=n3LehWgz9wnM7EuFvftUNoRlpMbwXDJqIaSXFpk9NEI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jKPFRKDa6ASnKu0/FgjKgDVNXFPW40qQmZd2x71dXfNOoH6y9NNSEmBvC5qwBH+hq
	 fXlXtLEhtBVmp/Fj8ziOzD1aDV2ZzpW+KUxmqSQLKnCz9+nGN2o66epCOTV4FSGgTn
	 lP0PsLIZ9OFaJXnOsyi6+CANuin/OdQnIuuN9LcKjbPupVufAW6jexEQe47SRv1wQD
	 ynrPNp+PyGX/OfXuLb7zOY/UN8jWwQcZJw1ZDE42Ub/HKDn39IeKEAl07qoF6TvSlF
	 EsDNCxNYRG26RAfOpEeVVEr9w9TSsqRdR962GXw4s8iBjDkFjMo+4DVQkPbyFxDtL1
	 NFDk9erUEmfNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02DC23809A14;
	Fri,  3 Apr 2026 23:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] stmmac: cleanup dead dependencies on STMMAC_PLATFORM
 and
 STMMAC_ETH in Kconfig
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177525783653.1484550.883019937304044818.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 23:10:36 +0000
References: <20260402145858.240231-1-julianbraha@gmail.com>
In-Reply-To: <20260402145858.240231-1-julianbraha@gmail.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: davem@davemloft.net, peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, linux@armlinux.org.uk, kuba@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu,  2 Apr 2026 15:58:58 +0100 you wrote:
> There are already 'if STMMAC_ETH' and 'STMMAC_PLATFORM'
> conditions wrapping these config options, making the
> 'depends on' statements duplicate dependencies (dead code).
> 
> I propose leaving the outer 'if STMMAC_PLATFORM...endif' and
> 'if STMMAC_ETH...endif' conditions, and removing the
> individual 'depends on' statements.
> 
> [...]

Here is the summary with links:
  - [v2] stmmac: cleanup dead dependencies on STMMAC_PLATFORM and STMMAC_ETH in Kconfig
    https://git.kernel.org/netdev/net-next/c/e2f152c822cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



