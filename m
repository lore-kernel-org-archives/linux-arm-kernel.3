Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB31C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 10:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blftxeO3iLSnDKoqR4/sTtxvcW9QMXIRLglAwmn6Hqk=; b=QxA4K8TNJSDyVNPZB45bZxMg3x
	3ggiM4+4QUV+5Puc5wJFJpDFFFMMFVPAr8p9+N3BIbAcQ8TBvi+NQW+K1UdYP/9SG+0oWsnDztYeh
	aaI/ZXS/RcDd4rJbhZ/YvsomcDmxaQ+C0ApDj1OU9n0IUt7V2GEy5lpa1riZ4xSOz2AB4dqhEm2O9
	ipYYjFbu096GKiHM5W5hUntadZWl3r9vGdseevAUBb+hDoG79SuRBSeUnMh0AoGtyakz1sMuF00EA
	wAJ4PCLt/AauZFjybkEtM9J+3X9Jjng2eUuVKwh68Tm8KgwFx7YdVmyOZKG7JDJPjyVz4QEwhiFB0
	P4/sMYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5L80-00000000nCj-2ZCk;
	Sat, 12 Sep 2026 10:38:36 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5L7x-00000000nCC-3mZK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 10:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=blftxeO3iLSnDKoqR4/sTtxvcW9QMXIRLglAwmn6Hqk=; t=1789209513; x=1790419113; 
	b=k8QlPMQf1JJvU6pcrNh3naaDtsYahNdxNHLsPlMyURbMLhalny9BFonBRDvisgKsaS73nUAWm6u
	DTfciileZYw7dBECHL/3ReIgCCEccfh90HOd0+GGQchMkyftrFL9RHsdIdO9G+YpvS66iNin64jQJ
	pVEbuSNEO5MDOb77yz25lGIgrSmEhDhXz2NCCtjuR5BKeaDCq1t5xjnR14xLl4h25BvQ8zSs+vkIt
	DCTmV5a9BaPgReQD0SkrZmlvbxNQCzdjVUAqGFguZbi0udf5NQ7YnzApjmCMKzuoFhhv2KJTCtODW
	40sipeaWKD5NUZ2UXmA8nWTutfikR+nm9yqw==;
Date: Sat, 12 Sep 2026 12:38:27 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>,
 David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: j.neuschaefer@gmx.net, f.fainelli@gmail.com, Tony Lindgren
 <tony@atomide.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 0/3] ARM ZSTD boot compression
Message-ID: <20260912123827.3aa54e58@kemnade.info>
In-Reply-To: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
References: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_033833_961634_574FDBEB 
X-CRM114-Status: GOOD (  14.54  )
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

On Fri, 28 Aug 2026 22:32:18 +0200
Andreas Kemnade <andreas@kemnade.info> wrote:

> Add ZSTD compression to still have a quite high compression but with
> not too much boot delay penality.=20
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Anything left for me to do here?

Regards,
Andreas
> ---
> Changes in v2:
> - rebased
> - practically rewritten 3/3 (and therefore changed author)
> - added more measurements
> - Link to v1: https://lore.kernel.org/lkml/ZDoDYh01GYjdwp63@probook/
>=20
> To: Russell King <linux@armlinux.org.uk>
> To: Nick Terrell <terrelln@fb.com>
> To: David Sterba <dsterba@suse.com>
> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <ndesaulniers@google.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> Cc: j.neuschaefer@gmx.net
> Cc: f.fainelli@gmail.com
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
>=20
> ---
> Andreas Kemnade (1):
>       ARM: compressed: Enable ZSTD compression
>=20
> Jonathan Neusch=C3=A4fer (2):
>       ARM: compressed: Pass the actual output length to the decompressor
>       ARM: compressed: Bump MALLOC_SIZE to 128 KiB
>=20
>  arch/arm/Kconfig                      |  1 +
>  arch/arm/boot/compressed/Makefile     |  3 ++-
>  arch/arm/boot/compressed/decompress.c | 15 ++++++++++++---
>  arch/arm/boot/compressed/head.S       |  4 ++--
>  arch/arm/boot/compressed/misc.c       | 10 +++++++++-
>  arch/arm/boot/compressed/misc.h       |  3 ++-
>  6 files changed, 28 insertions(+), 8 deletions(-)
> ---
> base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> change-id: 20260828-zstd2-045ce924f624
>=20
> Best regards,
> -- =20
> Andreas Kemnade <andreas@kemnade.info>
>=20
>=20


