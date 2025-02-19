Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84128C021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 20:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp1oT2W838eKIVFMU4ld+U/sKEoFPsgJksw8L1EP32M=; b=x8Iyr2oMcKaQOpvX4MOs4n0NBY
	lW7OnfAXW8h3sgTF/Cf8CZpnkF7SMLQJH7+O1Be781nrbSf26Zi1ZWnwDpj0pJCyTUFA/97QEcdkn
	8yBobAo69sp5tZ8m/F4/5lC7uLad2TzOJfTzZeE71M6utSIQQgUVGU7z5TPdwuQGOjDGk89+cwX8a
	ub9iQx4ofaUEVa+VP8N2awDT+axKOln0s4makAaGGleCUYelgqW08s58PJD5yMKmoqoc0l7O08kUC
	wFbvPa27KqIN92LlOd411LJHhdEISHBVc0sIMhKI9Eaef41jLFSCOtlrzDQZZDCBJnnHTGqbWpqoP
	C/pf+OXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqkN-0000000Euk2-2xKr;
	Wed, 19 Feb 2025 20:32:43 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqis-0000000EuD9-09dK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 20:31:11 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ECF2E40E015D;
	Wed, 19 Feb 2025 20:31:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id unM9zs4ln9tY; Wed, 19 Feb 2025 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1739997061; bh=kp1oT2W838eKIVFMU4ld+U/sKEoFPsgJksw8L1EP32M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jhZQutJ+C8XpbRvePMuUHuspU/o9D7qmOQ7L59v7dhDXOiAPmeHUDV2VaLhDPqlOG
	 /aN/ZKr7Ne5zN2TS2Ay7ebA+X32+ww82+yw7AAwsh5v9rIxFrWyGmYupxGREDjl4dp
	 ywc3JdIzUHtUpmcFO9G2j9tEJsuAfyu6bn3Pi/Mc2LliZrvVErSFIw+/Rtyh93k1BU
	 7XjoKhgKr57kfib1WKTrvGuFwtELOcxqZuoAa9F9Z+0FGlEPBZHOduHKrPmhvd1sse
	 nFQFHb7SuXbbuM8yNwiGMyfZ+7S147UgBlU19C5xWpxsnXUGhITUacj0rVabBDWyqD
	 n1CcuQjYe5baL7gLyuIfCz9L96Mim1afjkvBh7QOZNzO0iCcOMHnuCU5rFXy/azwP9
	 3vtn2AuNmpEs7GX2VfxyDYDS9XdV9a5fTT/c4Q6b94eimfM190AUFC3TGEqooQaMaT
	 zgG97HynjfC+yC9Myqc+t1ThWmKF1333TTMoMj6qSkL2HmY9c0d0+pwV4X6KmAv2zf
	 LmakqGhTMJ2PKTj37S50hNlL0Y9XLO1Y4g3fN6flDdmCAoB8+Mep9ioVEkvavJKDIP
	 IUEbHUxuppOnnvS3zXuCBW7dW7s6O+C5D9kxS7rfal8bghqqqEZZHb6kDlQKJ1ZAuA
	 NkLRtqoGg8hjMPj/s1M0XGHo=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id BF2DB40E015F;
	Wed, 19 Feb 2025 20:30:45 +0000 (UTC)
Date: Wed, 19 Feb 2025 21:30:39 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ruidong Tian <tianruidong@linux.alibaba.com>
Cc: catalin.marinas@arm.com, will@kernel.org, lpieralisi@kernel.org,
	guohanjun@huawei.com, sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com, baolin.wang@linux.alibaba.com,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	lenb@kernel.org, tony.luck@intel.com, yazen.ghannam@amd.com
Subject: Re: [PATCH v3 0/5] ARM Error Source Table V2 Support
Message-ID: <20250219203039.GQZ7Y_b2xE6GZo5pQv@fat_crate.local>
References: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115084228.107573-1-tianruidong@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_123110_227068_4395658E 
X-CRM114-Status: UNSURE (   9.14  )
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

On Wed, Jan 15, 2025 at 04:42:23PM +0800, Ruidong Tian wrote:
> AEST provides a mechanism for hardware to directly notify Kernel to
> handle RAS errors through interrupts, which is also known as Kernel-first
> mode.

Kernel first? Srsly? No? Oh.

https://www.youtube.com/watch?v=pFjSDM6D500

So what, folks realized finally that firmware-first is simply a stinking pile,
after a decade or so.

> AEST's Advantage
> ========================
> 
> 1. AEST uses EL1 interrupts to report CE/DE, making it more lightweight
>    than GHES (the Firmware First solution on Arm).

ROTFL.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

