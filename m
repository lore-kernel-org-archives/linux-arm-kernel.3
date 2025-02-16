Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C56C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 10:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGarZozGAl6CKN/wi5UFirJktubp5acuW0QTwj6NYIU=; b=kknupE2AE5ENihP/8A07VGAG1s
	ciAwOjvNJO2YwdX8OJrNqPVy9lujR+EG7b5bzulZZ09CwyBfor3LNytkwG//LIJYEv6FhNY0fcZDb
	ABLn0ZboXdrC0MAUutL26+ZlK8oJoPUtYuzRpDfFSfXHIawZA+lYhkhSmGCMRp7UInShqcPLZJZYW
	rY80x2D4gsZ5EDM3TrLG48sOwbfWHcHs1pYx846YLUOWT1sevy7b53VYB/Wey/vTJJFRXqL3bWLpM
	8IuK6oWczWMTsV9gKwlmzgiTXBE+09lcvJna4nxIXtIHZ2T1DuOK6G2emdKtNV2x6ZWwcS+zC2NsK
	N4f5E+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjc09-00000001eXl-0nHX;
	Sun, 16 Feb 2025 10:35:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbyg-00000001eQ8-3y9x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 10:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YGarZozGAl6CKN/wi5UFirJktubp5acuW0QTwj6NYIU=; b=VjJneWTjzD9tIJJu9OCdzjp5c1
	DTEVY9e58W1HB8t9izvBS7heYLqPPXPMYwcd3eoGnSEuCMEgP27GI2LwTL5r19f44QOE151IfsBI/
	KgjCrAzPhLx/4qlklsURPRVW1PhYfPAfrFrDq5zuR+RUm2G1oM6TJufALXEUDZ4wLiilHT1o9I8FH
	aZmS2LrSl64QtyEBjBQ6bP+/292Ez+hcAUknA38hhGZIsNXSMvHqMJQ2I0rTHuY/bMcIG1xodWGaa
	D1u6FNM3B1XdeMPnRKSz3nzwNJv9Aou5u+E/JMRpKmcVfL6+S8mTi2dPW4avcHZIV2fTT2N1A6DMT
	YLZlwSyg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53324)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tjbyS-0002w6-31;
	Sun, 16 Feb 2025 10:34:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tjbyE-00058N-0u;
	Sun, 16 Feb 2025 10:33:54 +0000
Date: Sun, 16 Feb 2025 10:33:54 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Yu-Chun Lin <eleanor15x@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, visitorckw@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] net: stmmac: Use str_enabled_disabled() helper
Message-ID: <Z7G_EpgKRdaCRKfy@shell.armlinux.org.uk>
References: <20250215164412.2040338-1-eleanor15x@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250215164412.2040338-1-eleanor15x@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_023422_986574_BD693382 
X-CRM114-Status: UNSURE (   9.56  )
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

On Sun, Feb 16, 2025 at 12:44:12AM +0800, Yu-Chun Lin wrote:
> As kernel test robot reported, the following warning occurs:
> 
> cocci warnings: (new ones prefixed by >>)
> >> drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:582:6-8: opportunity for str_enabled_disabled(on)
> 
> Replace ternary (condition ? "enabled" : "disabled") with
> str_enabled_disabled() from string_choices.h to improve readability,
> maintain uniform string usage, and reduce binary size through linker
> deduplication.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502111616.xnebdSv1-lkp@intel.com/
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

Patch looks fine to me, but netdev requires that the tree for which the
patch is destined to be specified in the subject line - either:

	[PATCH net] - strictly for fixes only
	[PATCH net-next] - for development/new features

Given that this isn't a user visible bug, net-next would be appropriate.
Please resend with the appropriate tag only after 24 hours have elapsed
after the last interaction with this email thread.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

