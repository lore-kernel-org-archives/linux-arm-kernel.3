Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093A3CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 03:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbO39C/ZfN+vaQhOTHrAHcAQLCUvQ04Z1Ni9DBxqPbk=; b=YtbHeHfcnWcKKRpV8Wwl8vGYau
	IwbY2FacEQ0tohp7q1J7pL96uQ53la7B6U3MKdLtME/BoBE5uVaEjUzL406ZaHRbO6YbSTw7XgV9c
	/AyuxV/yzSwZhk63NZkoP7adlnB/BpEDcwV3XUIF9HQ4zr9xmEwIUIgq+0WWu/3a2K0iaDW1jTowd
	9WRZr78rX7I05SIRXJZmpp6bwmgCCb6BUuRXkve2eGSdclc38+9XyHrMQaSYwAWO/F7ccuEYtEIVP
	jH5vwct19IfYpdRD3YefULaoOG5oPKRmIMw6I2+7nzDg4pN9+Ldw3oWaRtkiLFRMZx7tPXiIAwyCL
	ZbF7qbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII4B-00000004YG4-1jTM;
	Thu, 30 Apr 2026 03:27:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2w-00000004Wps-3Q6g;
	Thu, 30 Apr 2026 03:26:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90D3844592;
	Thu, 30 Apr 2026 03:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3B0C2BCC6;
	Thu, 30 Apr 2026 03:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519598;
	bh=l9exXaykMZZr58ApvA3wgjdBqbjJXmcg2LD51E1L2d8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VQ5fUnGVnOy9olGba/PpFhmIOWwrvE63bg7wf8QD1oVMBU1BxMtz5Q5sq/JwQ9xtx
	 FBCndWX7NJpcwHQS2uh8ZRD+UwKJS8Nf/xOjB7kKUPQy858zCbkge2oAV6lxAQf625
	 gG1qodBE+N3L2UtwgzEs5J0HoMAeFALuJQm6hAGuvkiAJgkXb28kjlalsRs3n3a2TF
	 29IamRcKDsnYhlWjglq3Ko8zPoEuXsWpPSgFQW5Uw0WEZ3PhmG1Et2p+yJY2KivWmR
	 Vv+BDgeCmlfDBpvBGUWuK6vk0BLhwJE3vHWgs2Tf1Bq4zcCUvorNfflKfJA4kV/UO2
	 SQxIDV5JK1LdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F3C3809A07;
	Thu, 30 Apr 2026 03:25:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/8] firmware: sysfb: Consolidate config/code wrt.
 sysfb_primary_screen
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751955329.2274119.12779807302343885295.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:53 +0000
References: <20260402092305.208728-1-tzimmermann@suse.de>
In-Reply-To: <20260402092305.208728-1-tzimmermann@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-riscv@lists.infradead.org, javierm@redhat.com, arnd@arndb.de,
 ardb@kernel.org, ilias.apalodimas@linaro.org, chenhuacai@kernel.org,
 kernel@xen0n.name, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, deller@gmx.de, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-efi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202638_995453_4095C0CE 
X-CRM114-Status: GOOD (  10.73  )
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

This series was applied to riscv/linux.git (fixes)
by Ard Biesheuvel <ardb@kernel.org>:

On Thu,  2 Apr 2026 11:09:14 +0200 you wrote:
> The global state sysfb_primary_screen holds information about the
> framebuffer provided by EFI/BIOS systems. It is part of the sysfb
> module, but used in several places without direct connection to
> sysfb. Fix this by making users of sysfb_primary_screen depend on
> CONFIG_SYSFB. Fix a few issues in the process.
> 
> Patches 1 and 2 fix general errors in the Kconfig rules. In any case,
> these patches should be considered even without the rest of the series.
> 
> [...]

Here is the summary with links:
  - [1/8] hv: Select CONFIG_SYSFB only for CONFIG_HYPERV_VMBUS
    https://git.kernel.org/riscv/c/d33db956c961
  - [2/8] firmware: efi: Never declare sysfb_primary_display on x86
    https://git.kernel.org/riscv/c/5241c2ca33bb
  - [3/8] firmware: sysfb: Make CONFIG_SYSFB a user-selectable option
    (no matching commit)
  - [4/8] firmware: sysfb: Split sysfb.c into sysfb_primary.c and sysfb_pci.c
    (no matching commit)
  - [5/8] firmware: sysfb: Implement screen_info relocation for primary display
    (no matching commit)
  - [6/8] firmware: sysfb: Avoid forward-declaring sysfb_parent_dev()
    (no matching commit)
  - [7/8] firmware: efi: Make CONFIG_EFI_EARLYCON depend on CONFIG_SYSFB; clean up
    (no matching commit)
  - [8/8] firmware: sysfb: Move CONFIG_FIRMWARE_EDID to firmware options
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



