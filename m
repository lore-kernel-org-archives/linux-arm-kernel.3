Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841C6C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQW2piFd37q2SVJWdr1fEbUbrygpT8SHRdtBeH6fKJQ=; b=UC9+CdQHj4fc2o51AZZMELbvMM
	fMIcf62IB3bkS4yG/3a8EdlZY6MZQKfPwJ0YUcShuBM+4UdeX+3fAaVfZXNEqaGf3SpeTKDHYIMDU
	3sdXLXNmu5Cny0WiijxS7Xlh+HyZuAVrWZ8NsaIu9rVWN8NmS7IUSz9nDER6N7ILnTiEVPYnA1cTg
	hi4zOimVCqtB+FWDjmjRG9GcnPZuYlDQsqjLG3tooU5SZZuLna35oFvAp51IdO8c+UTtH/CI2GJ6M
	9N9UX10/VIGfFHQPIRXOF+Ba23xjQlOUL5j/ar69YqrCtBgIheUY5PC18dT++VaKqey4kmee5TAO0
	fOPfMcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1V7-00000000Vb2-1NEQ;
	Sun, 13 Jul 2025 18:32:37 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub1Sg-00000000VOw-3ojo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 18:30:08 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D0CE740E019D;
	Sun, 13 Jul 2025 18:29:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qfbbGh1WaMFR; Sun, 13 Jul 2025 18:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1752431390; bh=QQW2piFd37q2SVJWdr1fEbUbrygpT8SHRdtBeH6fKJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOCdCNIGz2UbfaA9XtLgczLO2znitTyc/ycye3F/YcjtOP+zFtc/F/GDTbkA5CGxu
	 FtVOoBpA7gjeso3pWRj389EtpcAxv8HPXuUl1Hlrm02haUWTA57DcB0MYJbPDCyd4k
	 d0EFjAi3QBnSDxwEVtpr9Bpxjzmi4Fy+T6s74f64rhZ9+THuBnxkTsiFn3Zks45Vtl
	 2zXfwYw8YrsYZr9KGX3RJEPXVC5zXcF4VvHXE3qmwRbAoFo+qNQxs/NlOaqWhLmxX6
	 8+HktBiAMXSNNJN7KrhaiD/T1m06RMgpFHuw5DuG7fOyup6T7SyK3UG61GWvKQhNYv
	 xhYUi+X97VcFkx3rxKFsahXL8uthqR1oekB2LNrl0xJaBHceL29iaGdM6SnTSgWdG3
	 inm7myHZMnTj/kZqvQsuzAjrd2I7shWd0nXz5KMdA2rEwW7mkK9wJgtpxVlVUnxcgH
	 14xTElzILcd1tc2S6Xk2E80qdNluf2HJ0fr8QR7oikov+pglYfjJF6RNMZJDx29b8T
	 R0T+431EDsZOGBKlhOZPpM784RV2RB3dCsCTj0eYgG1E43ZqQLRtHPKiJf9XCLu1l0
	 5wDymncSN+SqrRrpGfnmQcvOlobjPBXbz1DUW38UkoN6/lYfaNjrqb/COs7CdVwsQJ
	 81RTtifcEKul35uPkF6ekZ2o=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B275B40E00DD;
	Sun, 13 Jul 2025 18:29:39 +0000 (UTC)
Date: Sun, 13 Jul 2025 20:29:33 +0200
From: Borislav Petkov <bp@alien8.de>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-edac@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Michal Simek <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] EDAC/synopsys: Clear the ECC counters at init
Message-ID: <20250713182933.GDaHP7DdAhX-8OoaP-@fat_crate.local>
References: <20250713050753.7042-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250713050753.7042-1-shubhrajyoti.datta@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_113007_097766_DA22FD74 
X-CRM114-Status: GOOD (  14.43  )
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

On Sun, Jul 13, 2025 at 10:37:53AM +0530, Shubhrajyoti Datta wrote:
> Clear ECC error and counter registers during initialization/ probe
> to avoid reporting stale errors that may have occurred before EDAC
> registration.
> 
> Key changes
> - Introduced a unified `get_ecc_state()` function that handles ECC state detection
>   and register clearing for both Zynq and ZynqMP platforms.
> - Removed platform-specific `get_ecc_state` function pointers from the platform
>   data structures.
> - Added a new `platform` enum field to `synps_platform_data` to identify the
>   target hardware platform.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v2:
> - Update the commit message
> - Add the zynq reset changes
> - remove the function pointer
> - Use a plat field instead of the quirk
> 
>  drivers/edac/synopsys_edac.c | 96 +++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 51 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

