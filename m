Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AFEC531F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 04:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaJOo1fGnJwGh4Gr/3goN5pUbF0FQr87BcJRyVpakvE=; b=gkPvVwgPJn4kDSXmg2Wjj9Vv8T
	yhw8XIdczJ2SqiyDje8rczw4eXDbAnU7YsybsCO0KOEMDXcWhUSpXZ+0RqwE+zNJAmP00i0QCCt9w
	xdLopgext4RiS5BSH2zBkdVYdF3Mj2Cgcv5vukPd+d86C5LnmHr2xdJizhIomWmQPKj2CTQZ4ZW0k
	8+Q8YzdTJYwzXhyfFqUO/SRakDkicnrrykA5cV2wqjWKQ4EqyK4qRB9YIo6i7+49vuaQpHzselAtJ
	zgrYUlvL+K3/O6zGYZKQAq5yNg2gOBGTSvvA6+DKBfx0tVgIdqLGPk2LjezbpwucLXHDY65EDhOC2
	eGExGfFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHql-0000000DCM3-2CJz;
	Fri, 20 Feb 2026 04:10:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqg-0000000DCIH-3uYO;
	Fri, 20 Feb 2026 04:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 562A86187D;
	Fri, 20 Feb 2026 04:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2047BC116D0;
	Fri, 20 Feb 2026 04:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560638;
	bh=GmIn9ZeGRzlEikXjbn7PLITSKNkbNMHLY/Yf0fqF/IU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=VlSJ+SBeeAPfhnON1ZyXqzphBgx4V3bgTvauvu85YeiI5mlTREBkb61m+04o3wIWh
	 6Pno9LXCnhI8nC/hRuhMd+fgshIq0F1mAH/DEcZO4aKOqExOeYtnuKxBzsIJIvpQze
	 kdL6hhYvFuStENEHeFVIsSx0Au5ENsZWIX8atJWOiOnN2444grbOsGlgPysnVsmu9E
	 V8116kPklhvS6giKFOfwBSN9DJyoDX0edjy80ThUYXR7VyxfB9IkYX0z/CHc2Wnpsg
	 m5FnCTC63lZ+rp27A0NoXGnjEIsJQjZpptu6p3QNXtBcuAzBXZ7aD+CXrcMpktT189
	 t7CzKaZ1g1AUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FD93809A88;
	Fri, 20 Feb 2026 04:10:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/9] arch,sysfb,efi: Support EDID on non-x86 EFI
 systems
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156064628.189817.770597310770698604.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:46 +0000
References: <20251126160854.553077-1-tzimmermann@suse.de>
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-riscv@lists.infradead.org, ardb@kernel.org, javierm@redhat.com,
 arnd@arndb.de, richard.lyu@suse.com, helgaas@kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
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

On Wed, 26 Nov 2025 17:03:17 +0100 you wrote:
> Replace screen_info and edid_info with sysfb_primary_device of type
> struct sysfb_display_info. Update all users. Then implement EDID support
> in the kernel EFI code.
> 
> Sysfb DRM drivers currently fetch the global edid_info directly, when
> they should get that information together with the screen_info from their
> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> passing this to drivers enables this.
> 
> [...]

Here is the summary with links:
  - [v3,1/9] efi: earlycon: Reduce number of references to global screen_info
    https://git.kernel.org/riscv/c/b868070fbc02
  - [v3,2/9] efi: sysfb_efi: Reduce number of references to global screen_info
    (no matching commit)
  - [v3,3/9] sysfb: Add struct sysfb_display_info
    https://git.kernel.org/riscv/c/b945922619b7
  - [v3,4/9] sysfb: Replace screen_info with sysfb_primary_display
    (no matching commit)
  - [v3,5/9] sysfb: Pass sysfb_primary_display to devices
    https://git.kernel.org/riscv/c/08e583ad6857
  - [v3,6/9] sysfb: Move edid_info into sysfb_primary_display
    https://git.kernel.org/riscv/c/4fcae6358871
  - [v3,7/9] efi: Refactor init_primary_display() helpers
    (no matching commit)
  - [v3,8/9] efi: Support EDID information
    (no matching commit)
  - [v3,9/9] efi: libstub: Simplify interfaces for primary_display
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



