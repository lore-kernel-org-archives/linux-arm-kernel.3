Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6ECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 02:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hXBvMjTwymyUvCvSreGUZBFX4rEGzicOQzp4XIztm0=; b=3KDngcP8d7fWE9e8Ww7PtrNvsP
	o0phVsQh+XNeOXBCdzIw3g8PvOXMBuNQ9K8Urlr1pThlYO6lyHz1WWipJ+q0luXCbVURdGPj0d1ru
	VQJP7rQ0wARuMy++rUJ3T5Oxznf3IBEBrAksM62YSEyQGq37SFp1fcb6Dkva85RJtUzSbH/ev9jlP
	t/tdo45JANrDik5UeVhiZ/RIRK9rdEJyDhgstNvmpgXpchhGAgq4Ki2xdvuLx5TBZDPTa6sTh8JFj
	nmhjY6/XjamjWoix+bPV5oDnW8vXR3tcsLlW+tgkNmHSvsRQi23Tj29rqBAYv8IydWMilsnzg6Rb0
	QjOyYZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIEu-0000000GAtb-2Xyb;
	Wed, 08 Jul 2026 02:42:20 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIEr-0000000GAsz-2BYE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 02:42:19 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 42DA040E016E;
	Wed,  8 Jul 2026 02:42:04 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 41QuxmgCLtQY; Wed,  8 Jul 2026 02:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1783478514; bh=9hXBvMjTwymyUvCvSreGUZBFX4rEGzicOQzp4XIztm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ws9sWML2zHDjcRXq0gCKTHLTcpqkKpbWB58VTH7TYqpHIKYRh7zLWxewIBrAbo82m
	 JpoTT06YX+xY8kuGrnuWxKPbUmItAsXpDugALD739OogDX6yY8pgO4dy/Qr4loP/9p
	 wyMhfFNn8XdspQDR/XXKtGu4P2uhRIuPX3fdKps6n0IPlivofaz8IhenKZeyBWTD+e
	 +Q1nBWYaBEa6KU6Fp3wgY4urFwq2nO/7yNqY2D1c0KE+Q6WSkykyXG/uoLpXYbxTIS
	 S5ttEB7RBVwYfGErb/BNX3HsM5zznneqS2+oXaPjOjWwLLbDctOJORErWHZwxK4UvR
	 FKtlhqR/fQylyLuqzSqUG3cmSX68eqoRrOEeZ0QJsVUXv+eKBcnLGn+cfOfgYmK39J
	 rWqs2eif5nHOupvyBUKaY5TZDdHAD9bTd6KjM7FFgi1ahferVcPki26i3YoNfgQhuW
	 NyOoqKyLNRc4M93I7OJhBNwHfovX3TAarQttuLuJ0CtLhpMTXUIaLNtwULNuybRz/N
	 qwa8+yXoulZsdi+3xzuTWHeI3UyGDC1wiBM3enb5DZ9sG/CPA3u+S90RfBkfdWlpoc
	 /Ttd3Wxhcbg6Suot/dOOupv1++p3zuYpUa2vTKLgb2XNljhDdIcRhoc7ceGiX8eoUf
	 eleB4cOJdWATBzvDKHkbtILo=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 79EA240E0163;
	Wed,  8 Jul 2026 02:41:34 +0000 (UTC)
Date: Tue, 7 Jul 2026 19:41:31 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
	zhuo.song@linux.alibaba.com, oliver.yang@linux.alibaba.com
Subject: Re: [PATCH v7 00/16] Support Armv8 RAS Extensions for Kernel-first
 error handling
Message-ID: <20260708024131.GCak242z-9YE2xL6q0@fat_crate.local>
References: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260602071540.3711528-1-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_194217_892619_614042E9 
X-CRM114-Status: GOOD (  14.29  )
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

Just some superficial notes on this before we delve deep...

On Tue, Jun 02, 2026 at 03:15:23PM +0800, Ruidong Tian wrote:
>  Documentation/ABI/testing/debugfs-arm64-ras |   87 ++
>  MAINTAINERS                                 |   11 +
>  arch/arm64/include/asm/ras.h                |   99 ++
>  drivers/acpi/arm64/Kconfig                  |   10 +
>  drivers/acpi/arm64/Makefile                 |    1 +
>  drivers/acpi/arm64/aest.c                   |  423 ++++++++
>  drivers/ras/Kconfig                         |    1 +
>  drivers/ras/Makefile                        |    1 +
>  drivers/ras/arm64/Kconfig                   |   16 +
>  drivers/ras/arm64/Makefile                  |    9 +
>  drivers/ras/arm64/ras-cmn.c                 |  479 +++++++++
>  drivers/ras/arm64/ras-core.c                | 1026 +++++++++++++++++++
>  drivers/ras/arm64/ras-inject.c              |  130 +++
>  drivers/ras/arm64/ras-storm.c               |  198 ++++
>  drivers/ras/arm64/ras-sysfs.c               |  319 ++++++
>  drivers/ras/arm64/ras.h                     |  374 +++++++
>  drivers/ras/debugfs.c                       |    3 +-
>  drivers/ras/ras.c                           |    3 +
>  include/linux/acpi_aest.h                   |   36 +
>  include/linux/cpuhotplug.h                  |    1 +
>  include/linux/ras.h                         |   10 +
>  include/ras/ras_event.h                     |   79 ++
>  22 files changed, 3315 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/debugfs-arm64-ras
>  create mode 100644 arch/arm64/include/asm/ras.h
>  create mode 100644 drivers/acpi/arm64/aest.c
>  create mode 100644 drivers/ras/arm64/Kconfig
>  create mode 100644 drivers/ras/arm64/Makefile
>  create mode 100644 drivers/ras/arm64/ras-cmn.c
>  create mode 100644 drivers/ras/arm64/ras-core.c
>  create mode 100644 drivers/ras/arm64/ras-inject.c
>  create mode 100644 drivers/ras/arm64/ras-storm.c
>  create mode 100644 drivers/ras/arm64/ras-sysfs.c

People have got to start naming their files properly. I see this everywhere in
the tree: there's "ras" in your path and then you add a "ras-" before each .c
file name.

Do not do that.

But this is not that important - what's more important is exporting generic
interfaces which are ARM64-specific. Like in patch 11. That can't work.

But that's still not that important - what is even more important is who from
ARM is going to review and maintain this? I can take a look at the generic
bits so that the RAS stuff coexists fine in drivers/ras/ but I'd need an ARM
person to take care of this.

There are enough on Cc so let's see if anyone moves.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

