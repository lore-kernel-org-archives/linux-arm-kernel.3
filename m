Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8802BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 03:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqWhlTFl2JAy72IYNnWE0YfoxeHWY2CLGFAimHvN9f8=; b=I5J/PkFCkucf79bW90TKQwg/ma
	+733uBrcgCPmptJ1hekTT8HjYX7vUzRdexL5AG8ogLFjN8ot6RuLBR+vZUNJ70Js8Nmz0MUX/XaEE
	jiwx27MwANsAOCx+RqVNcAJlQwktsJpFrekf8FCdZ//59OEWWOArTND6kaHBZpxzNQslTKjj0Ouoc
	il7tnWTYLr4IXuikpX3kFLUIhfQWpZV15GzPAi8iDZ5WrTWnBnC8qCE5wYnPbkqqfHx12/z/DlaD7
	UC0SXrkxSdAlMQi8UgLZlddxhhy03+5H3t3VxCWJPMycGsVHOpNiX3sZoSc1eCLoIT+SmHkJ7NDJ9
	woVZfQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1pQ-00000009vCn-44RH;
	Thu, 06 Mar 2025 03:23:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1mL-00000009uub-1Qy7
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 03:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NqWhlTFl2JAy72IYNnWE0YfoxeHWY2CLGFAimHvN9f8=; b=a0/0LZy98PBYqTYTyHPETDuzLT
	L8ZQv7Rm/06y/b4hb3ZZCfccVC71WJZUpNY1OJdMXrU4uwE/BX+MaBlktHfe65clWUBMPyeDQC0ku
	6s8D6oeA72Q/g53MXvMKyXW/47JDeDELHWhYXknyxrtfW408FMM3LbYJRuD/Anmi6yKPdMGde5TGl
	KEb8U/vQ+Jfx8bI3SqQ7AyGD3McZ3og5vFS/0J2twTNRuq7mEShUahdNBIU0E5d/nTYhZX45WYWgO
	UlyNHw6SvwQ990y6TYHyQMifMeFHTpBw0jYbqmQfPeis57IMwOiaqNnaUBCa6Ou0TdNFK1Gew7uUx
	8TDHqb7A==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1mI-00000000tAf-0gMd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 03:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B5B5A45BA2;
	Thu,  6 Mar 2025 03:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506A9C4CEE9;
	Thu,  6 Mar 2025 03:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741231202;
	bh=puW1fkF16Qim9hZZEw4ModRCF3+zrl3JO6/d11Mn3Uk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hN+i3tkhBsXNtUnRx9tV1K3ezT65JSWich6bKEtNqjEB16j4/AnXmyeLyJwFpcY+v
	 mz0SizSVVZ2G0R7l7mTgBqYv4vN97mJhSRCB6D1WrF7HKK1f6fm+pxW2lFwwie+aCe
	 aJEIFrY2Z58zuUpeiiLRTs6SOK6T0765uz+uy2YHy7BH7q0YYELaxZE7ugKGDOBS2/
	 q73tcgEuYon/1TdOyEKwMCYht45VykkNl/LHXGmEDgazQn1Iw6S/xJWWP8xiJc2NL9
	 90zXfea49B/wVQDkAYGenbtXLbc7XZl45eOwDsUxrtuWKNeKRaqaE7Q8ZA86eCVxs7
	 EFzIxwEW+ZipQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE2B5380CFF3;
	Thu,  6 Mar 2025 03:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v9 0/6] Enable SGMII and 2500BASEX interface mode
 switching for Intel platforms
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174123123550.1112346.5967919465567432247.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 03:20:35 +0000
References: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
In-Reply-To: <20250227121522.1802832-1-yong.liang.choong@linux.intel.com>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: horms@kernel.org, joabreu@synopsys.com, Jose.Abreu@synopsys.com,
 david.e.box@linux.intel.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 irenic.rajneesh@gmail.com, david.e.box@intel.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 jiawenwu@trustnetic.com, mengyuanlou@net-swift.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 richardcochran@gmail.com, fancer.lancer@gmail.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_032006_402448_6D1B0AA9 
X-CRM114-Status: UNSURE (   8.61  )
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 27 Feb 2025 20:15:16 +0800 you wrote:
> During the interface mode change, the 'phylink_major_config' function will
> be triggered in phylink. The modification of the following functions will
> support the switching between SGMII and 2500BASE-X interface modes for
> the Intel platform:
> 
> - xpcs_switch_interface_mode: Re-initiates clause 37 auto-negotiation for
>   the SGMII interface mode to perform auto-negotiation.
> - mac_finish: Configures the SerDes according to the interface mode.
> 
> [...]

Here is the summary with links:
  - [net-next,v9,1/6] net: phylink: use pl->link_interface in phylink_expects_phy()
    https://git.kernel.org/netdev/net-next/c/b63263555eaa
  - [net-next,v9,2/6] net: pcs: xpcs: re-initiate clause 37 Auto-negotiation
    https://git.kernel.org/netdev/net-next/c/065d3cef99a1
  - [net-next,v9,3/6] arch: x86: add IPC mailbox accessor function and add SoC register access
    https://git.kernel.org/netdev/net-next/c/7e2f7e25f6ff
  - [net-next,v9,4/6] net: stmmac: configure SerDes on mac_finish
    https://git.kernel.org/netdev/net-next/c/e654cfc718d4
  - [net-next,v9,5/6] net: stmmac: configure SerDes according to the interface mode
    https://git.kernel.org/netdev/net-next/c/a42f6b3f1cc1
  - [net-next,v9,6/6] net: stmmac: interface switching support for ADL-N platform
    https://git.kernel.org/netdev/net-next/c/7598ef621a43

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



