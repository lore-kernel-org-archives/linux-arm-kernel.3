Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532FDC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 15:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FONSvainkhZyR+GqgqzxbgjHLuUUwJa+U3QdoTXH0vI=; b=4Em1pJwL2sQgFevvFVnR74EvwG
	2sllC5AyQjINqCBsc2Xr2o5CtQ+UTfA8sIs4g+8QB2YBRHCKXWJzPZfgYMaR9P00AFmFbwR/fQYGy
	AXlByKBlaUVv4DAurPn/lBvW4j4B6ImeAK3wgUB2jDRjFuZb7ITm3ba7kTc+K4vD8sq0fgQhdUbxS
	nsvSjg3pi+7Or90OyWFUfZxmHhOgYdqgSS2IynvbsPnXAo9YQyVS+mBfvRkF7ns5D1zsdVjjqkGTm
	OApfTrOyeAHLJ3910Tel3oqq3mOUZ9rv9tcjvZK0buT/iwJBt42h6R8oTMLU2VipgE7oPg8pNd6M7
	W+0A+jEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2s6Z-00000004BKZ-33A1;
	Sat, 05 Sep 2026 15:14:55 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2s6W-00000004BJP-0l4X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 15:14:54 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C914D40E02C2;
	Sat,  5 Sep 2026 15:14:31 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1HIhP_I34F-L; Sat,  5 Sep 2026 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788621261; bh=FONSvainkhZyR+GqgqzxbgjHLuUUwJa+U3QdoTXH0vI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sqc2kxW553DlZwdvzxxQAZLrbuEWzoW053Da06kVpvIMhG/w09Utt1KsME6FE8EA7
	 4bmXqAlMUyiS4uSmS1AnVyUiRLtwqPt0nl8K3fVENBlwp7sgw/Tw0nEzcEG37loFCB
	 mgS1PIm7zCP/0Ssn/kzUdG66hBPSm0DNJe9xDVY4AE7kTwhUz4YRybbAUhHTl4CDIH
	 K+Y0Dh/gls5JwcexaHzpg1TJ69xD4QC1wBX0Ck1liC07o2RjsQ8z1rDigOfOrZXaRK
	 g6mIAqrcmv4C2IjahRW7eWbaabrLpCqDUIf4zRGzXQzJknEeGu+AgcZvvP4xyYOIF3
	 T3O8Fli+So/ZctqpvNK4agzCRKsqhdI5ZK/35dqJOlU9pZTgGG1waZhUSB+9pdm2ll
	 2YsxS8nxe2/Wrl/GPvOOi8Ms+eJriGvs2xcuQJ5PufEPjZLGuWFAgsnBZEAmFifz5P
	 OKSzs9s82ckTztlOpPziAO9GwuTvz+/g0aq3IweKR5/LpyQOrFiBzriR7ifp4fLMLR
	 fcL3Dg2ckoPZpiK2BRFnc/3Js/PS4aQpBlni4PLwUgCM5zVYdOTcJnbb08M+iiG4BY
	 Z4sS7sWpWoQ1FLxQRaX0Cq2oNJM4MaSH62nXcMiK2+xut+yoH2jAR+KL1eu0JokBJe
	 Fop3BulcRULz8wF9jjCR7eag=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D53D940E0301;
	Sat,  5 Sep 2026 15:13:48 +0000 (UTC)
Date: Sat, 5 Sep 2026 08:13:45 -0700
From: Borislav Petkov <bp@alien8.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>, Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <20260905094649.41996-4-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260905094649.41996-4-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_081452_394717_5A82DCD3 
X-CRM114-Status: GOOD (  10.27  )
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

On Sat, Sep 05, 2026 at 11:46:43AM +0200, Karl Mehltretter wrote:
> edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
> edac_stub.c"); nothing parses it any more.

Nope, it was:

7fc0b9b995f2 ("EDAC: Drop the EDAC report status checks")

> Drop the entry.
> 
> Found by cross-checking every documented name against the __setup(),
> early_param() and core_param() registrations in the tree.

If you look at fee27d7d9788, you'd read:

    Move the remaining functionality to edac_mc.c. Convert "edac_report=" to
    a module parameter.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

