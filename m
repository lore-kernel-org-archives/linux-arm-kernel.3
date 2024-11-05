Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379EFD1CA15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 02:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5XANYsiW7rPxqKhAnNIWEfYJm2fYNksQ/TuA7JPlMI=; b=hFkCOVmqc+P1vLf39/URgpB0vL
	mTN8dzB3hLc00pNOolWOuXK47/wWItogOhjoP4ZSTP9ix3/CwQh1Vuft5JJQ2mhq5VuwsZB+j7zch
	znDnEp7Afaoowr98JnssVB3bg2rsOQOXyKbgZtJL3fZrtp6HF2bk2MHJCjMPHvQ7idlbB01UkfSVt
	rmYlZ5Q1IgT/NpDopFp8JwJRMB6fca899lE6EMAjVfZ8Rg/5QRfDkY46Wcg3UrEW/OoaWnicxFUw8
	elZy7TJxcFuKzs/xGJFqSGReO7/8ywcYs/NSBQdPbWrt2fUkW1HtBHX91YjfxMdDyOqN17eDNM2xU
	jARxCdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t89Dh-0000000FeZR-0USU;
	Tue, 05 Nov 2024 02:23:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89BD-0000000Fe68-2DAa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 02:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B685E5C56E0;
	Tue,  5 Nov 2024 02:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49996C4CECE;
	Tue,  5 Nov 2024 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730773226;
	bh=H7DITtRwtsNLWdS6hpi1Dq1VgEaFbuMZ06KvxC6YoWs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BpFh/7Ehgn9ARUYp1fdOf8SxLiBRY2aBW0N7E1q9IzeEZIOt7K4hEJdyp+pe6US8Z
	 uIyNHtDk4FANEE6YLIIWaqyy2WSAMBucrhSdie4jQJqi5CI6+gvS2RTiEw6/2F3m5H
	 MaUIe+x0XFTN/YfVkfHLg84xg6XCqVop8eUycfERc2fJrF05xDsfxslKnSMQoMkbYF
	 Uxa4eZ+hJuELXSKtHaX2Jf2azkq+aC0FP8IlyixSRgqtudHMwDHXit5qi0fTWlCMpL
	 jZo34LnPV8ZdXr1T7q8TSW1kBpNOw9XkK4noVxRP/qylQMnK1+j0r0+hO9nM1oe1LS
	 cGZU2YX9017Fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F203809A80;
	Tue,  5 Nov 2024 02:20:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ptp: Remove 'default y' for VMCLOCK PTP device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173077323501.89867.2401311053737596737.git-patchwork-notify@kernel.org>
Date: Tue, 05 Nov 2024 02:20:35 +0000
References: <89955b74d225129d6e3d79b53aa8d81d1b50560f.camel@infradead.org>
In-Reply-To: <89955b74d225129d6e3d79b53aa8d81d1b50560f.camel@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: kuba@kernel.org, richardcochran@gmail.com, peter.hilber@opensynergy.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 ridouxj@amazon.com, virtio-dev@lists.linux.dev, rluu@amazon.com,
 chashper@amazon.com, abuehaze@amazon.com, pabeni@redhat.com,
 christopher.s.hall@intel.com, jasowang@redhat.com, jstultz@google.com,
 mst@redhat.com, netdev@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de,
 xuanzhuo@linux.alibaba.com, maz@kernel.org, mark.rutland@arm.com,
 daniel.lezcano@linaro.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, qemu-devel@nongnu.org, horms@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_182027_631535_86927494 
X-CRM114-Status: GOOD (  11.20  )
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

On Sat, 02 Nov 2024 16:52:17 -0500 you wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The VMCLOCK device gives support for accurate timekeeping even across
> live migration, unlike the KVM PTP clock. To help ensure that users can
> always use ptp_vmclock where it's available in preference to ptp_kvm,
> set it to 'default PTP_1588_CLOCK_VMCLOCK' instead of 'default y'.
> 
> [...]

Here is the summary with links:
  - [net-next] ptp: Remove 'default y' for VMCLOCK PTP device
    https://git.kernel.org/netdev/net-next/c/18ec5491a495

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



