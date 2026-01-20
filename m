Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91551D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBvyFQuCshmJ3cwSs+iBUFdLtp7nh3PV7P2ugBf4G88=; b=j3JeMz+Jdz+uNFdkq2o6C3o88L
	LB0wcgkUdFfhWYKfcC9vYVdYw7XPgioV+NsSZx94ndfnev6jHsz4T5XBqJSFHI9WGXjUjF7tGh5p2
	ZMwlOg3CBXoHdVSjKyK4ggYLrwNXZlNn7D6yEaZT4ZK5eoDgZBXclIN2K4HiTtkwJfRv9txMCRLeZ
	oQmD1ECrbydxPCzX+ushxesmhoNIB51eRoEi95eecWrxASFgflHd7NrxKVZRjAA8tlKETLF3zXVAU
	8n16G9zDbQo6WebxcoJ8MzAOTH088bhe0HGcs8MmaXAM60eeq1jHU9mUK76aVFYQiNvNdBMi/veFu
	oSnYUffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9iF-00000003gtP-3owC;
	Tue, 20 Jan 2026 11:16:00 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9iC-00000003gqs-16nw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:15:53 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7199C40E0281;
	Tue, 20 Jan 2026 11:15:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id fFjED6RZL-lM; Tue, 20 Jan 2026 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768907730; bh=mBvyFQuCshmJ3cwSs+iBUFdLtp7nh3PV7P2ugBf4G88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJw+RVECP6474Z9cwnRQGBFv8sIk9xEMcHs4PCqMOUshWVcXgh1mGxVFayiYt2fJU
	 eNYOSPBgcBeAgyReMkkDtu7lDihOkorQe4FUa98gHynKy9tGbToHOIuBPLZukB/tj6
	 6r4oJjQu9sOeLiMlXfHXGewjHRLvyjwiGzhNLSkFPmN7sUhHhxjtQPM0yrXCwXhHVd
	 iWGuqYVtK78Y0cRmoyDJG9Cv01CGcoMSMDOrFw4dADlnjMF7oCVgXyRpMAbhzOG/hq
	 Esq04zqEy2Zu5YrvmxwlO+KcaREy6Kpmut1oGRtHKNDtEccmH8bkcfTisf8MClvz4c
	 6NCHWGEXr9OtuynPNfZv8JhNxDWqUh85cEq0NJn2K1ARIjqpid8uhO8MT7IYIjnG8T
	 jAIwJ+Ru7XsdwVk9vptU2Pxd9Y46JEoMKtTaW07A4H2ylEwEdZqD9lu+m0WbSvGEup
	 +MNT+Inm5j4hQO1nWyPfA9VLthy2QBEnoUQ0uX5fb5Wh8tVcLJY3v54M5R+UMCQJva
	 7UDxdiMItyeuNLCKzULsjsXkUJmSR2QnQxy1THgfaj8fGQgShD+yVrqbMfdGr4SJjB
	 VbxKe5F5k/aZqkahc3I2g64Wk0FkxDYScDW00cxNsy99hbgVLLOz21UDlpl+4ZI6zm
	 2k5tV0YS9O70NRnieMr4FyfA=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id DB45E40E0268;
	Tue, 20 Jan 2026 11:15:15 +0000 (UTC)
Date: Tue, 20 Jan 2026 12:15:09 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	tony.luck@intel.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, rafael@kernel.org,
	linux-doc@vger.kernel.org, Dmitry.Lamerov@arm.com,
	Michael.Zhao2@arm.com
Subject: Re: [PATCH 00/12] ras: share firmware-first estatus handling
Message-ID: <20260120111509.GAaW9jvTirZhL_pHTT@fat_crate.local>
References: <20251221013534.GAaUdO5vWqMWAdbWbd@renoirsky.local>
 <20251229115440.2734800-1-ahmed.tiba@arm.com>
 <20260114141551.GKaWelF-Gsvzr71LUs@fat_crate.local>
 <dc2f3dd7-b9db-4a2d-b431-f70738cefcfd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dc2f3dd7-b9db-4a2d-b431-f70738cefcfd@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_031552_457545_E319D8FC 
X-CRM114-Status: GOOD (  14.16  )
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

On Thu, Jan 15, 2026 at 12:17:17PM +0000, Ahmed Tiba wrote:
> In drivers/acpi/apei/ghes.c, this subset of CPER handling
> is already implemented using a number of helpers mostly named
> estatus_* rather than cper_*.

Which helpers are those?

$ git grep -Ei "\Westatus_" drivers/acpi/apei/ghes.c

doesn't give me a single one. Maybe I can't grep.

> The naming therefore originates from the existing GHES implementation, not
> from a new abstraction.

And even if, calling it a "estatus core" and making it a separate thing is
just confusing and unnecessary.

> What I did was lift that existing estatus_* logic so it can be reused by a
> non-ACPI provider, rather than duplicating the CPER handling
> in a parallel DT path.

Nothing wrong with that as long as you simply export common helpers and we
agree on how they're going to be shared. We do stuff like that all the time.

> Because the DT-based path still needs a clean way to call into the shared
> logic without dragging in ACPI plumbing.

Yes, carve them out in a separate compilation unit and select it in your DT
glue and that's it. No need for a Kconfig item and calling it a "core" bla.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

