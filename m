Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B377EEA865
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 22:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GV8hBS5Tgl7u1CZV8aPlJf6q4lsvgjJFR85H62IsRDQ=; b=gGzdVQBu/JVsTaj5YhCFx5TVpN
	L3pyM+FiN0uC2BhBc6Mtc/ewbtrZF+58HDCVcACWaczqN2EqR+u7jVgB+Ambc9lgnKILWWSbmoEqH
	JlJPhTZWbhk+PL/30JikekqFbgOhkDuBPwCQri5Hvm+Y5oxB6VZXnJwM4YWiDdIDWfOdiIRgwvbVo
	vAJjvrzR2dw6pvK5Y20PJNXhe72MDsIARI2ds/ut8tP0uKJMV2F5rmEe8vVreF8VzohbM+vI2yuTU
	eL0RGsF6NnMvPyVaZPK8y+tWkFscMYngBoRX9wtFt4qK6yFQIUZkTY6mk/HUwOUYKa5ay6P9Pjreh
	rQvNziOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqenb-00000002gQK-2Pwn;
	Thu, 12 Feb 2026 22:04:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqenZ-00000002gPo-2iKM;
	Thu, 12 Feb 2026 22:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770933870;
	bh=pgou1iAOo03EeIFUgC5tazbjBU6EIspSIgadED/BlSQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=AsmeFdtk4nzmEGGCH0TaWKY4Mc+L909ckX7EIlyLRduCbSzoTfKa+GLp/YGC1DEP5
	 kYrOsZiGNdH2e0qGu8qh2tQjADPh3PxWHw4y37b9VWwjjOjUvRVxmkA2dAIstkaINZ
	 w6E+Ya336ifoxNxZlVVJYBeoUjRWE4BTHxICRGViXmIGSt2HG2J7+OaPa8ALKKCB/Z
	 Ahv0te1cv0fEDfPRRq2zG/JIXEtPQLXFsR4Onu1F9nUh620EzKUbab9GXw4ociPylp
	 9CEAV3Hw6KLKhzsbsDOABmbaQ0siY+mhBpEcxAF8SCoD8d2MKDCOu0ir5fI9bVPsYl
	 iwMyKXN2kNcXw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 098E617E127F;
	Thu, 12 Feb 2026 23:04:29 +0100 (CET)
Message-ID: <8e410a11-bd7b-4a12-a711-0514a59409c0@collabora.com>
Date: Fri, 13 Feb 2026 00:04:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after phy
 rockchip samsung hdptx HDMI 2.1 FRL patchset
To: dubito@online.de, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_140433_918602_42B68B35 
X-CRM114-Status: GOOD (  19.21  )
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

Hi Thomas,

On 2/11/26 11:20 PM, Thomas Niederprüm wrote:
> Hi,
> 
> I'm running a Radxa Rock 5B (rk3588) on a 10+ year old Samsung TV screen
> connected via HDMI. This worked flawlessly in 6.18.7 but does not work on linux-
> next. I bisected the problem and identified commit 3481fc04 to be the first bad
> commit. This points to the phy PLL clock rate calculation to be the problem in
> connection with my monitor. As it seems relevant, I attached the EDID of my
> monitor.
> 
> I'm booting the kernel out of EDK2 after which efifb is correctly taking over
> the initialized display and I can see the initial kernel boot messages on the
> HDMI output. After the drm/kms in the kernel takes over the screen shortly turns
> black, changes resolution, and then correctly displays on 6.18.7. However, in
> linux-next the screen remains black after kms took over. I cannot see any
> obvious differences in the boot logs but I attached two boot logs, one for the
> working 6.18.7 kernel and one for the non-working linux-next kernel.
> 
> When reverting 3481fc04..de5dba83 (i.e. the faulty commit and the ones that
> followed in the HDMI 2.1 FRL series) I can build a working kernel from linux-
> next.
> 
> I don't know where to dig from here but I'm happy to run any test necessary to
> track down the problem.

It'd be helpful if you could resend the logs after booting both kernels with the
following params (requires CONFIG_DYNAMIC_DEBUG=y):

  rockchipdrm.dyndbg=+p dw_hdmi_qp.dyndbg=+p phy_rockchip_samsung_hdptx.dyndbg=+p

As well as running the command below before connecting your display/TV:

  $ echo 0x4 > /sys/module/drm/parameters/debug

I've noticed you're forcing "video=HDMI-A-1:1920x1080M@60", which should be
anyway the preferred mode (according to the EDID).

Did you try choosing a different one, e.g. 1920x1080@50 or 1920x1080@30 (they
are supported according to the listing in CTA-861 Extension Block). That's more
a test to confirm the issue affects a particular modeline, or is more general.

FWIW I've tested over 40 modes with different displays/TVs and didn't notice any
regression, hence I'm probably missing something here.

Thanks for the report!

Cristian

