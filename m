Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D329E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbL/krlMll3S2kVTqYaIRGP9u2Lqdwfdc2KndPTPmZE=; b=sa+EEUDw1McIropMD8Gc85Uq+s
	12QPV/0TlKIguV3nhCKHdyF6ZWgACvO0jz/agFSw/l5mhrDCE0+wM+HXi/nCoYjUf94ECVCz1c3aW
	eUIoqV9fUyY7U9fjYQB9ZgMsGlzwMrWuHxy6DfKT9mmJXdhAQEDwQkVKRWKSqHU1cXI4q4UrBwNjk
	AHwg8fo6GgUXtPizGPsXjNlPMz5c/faZP4OM1+6MkmaQSD3PyFvV+mPUcQHSQs+tau+COJULUu0NG
	ZUnKI4UI9c+szIQJ1gTTAgppCkJhcinJTnoGwBavdIJADSIpI44Fv15s7X9i/DwthomOsIQ+T13M9
	2kvn03Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRFp-00000007WcK-288E;
	Wed, 08 Jan 2025 08:17:29 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVRCP-00000007W8v-24cK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 08:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=IbL/krlMll3S2kVTqYaIRGP9u2Lqdwfdc2KndPTPmZE=; b=0o4c7CYmBj3lHwVgJ2P5zHQ3Qy
	dX+OT5s0v9fVVgsB1vrGlLJcHqMmNvU53lr/X5Cxvq4ClNs6VNQE+bRuy32KudSks9fctsVjBtARO
	kn9pGX9Cbd5x9zzaRMfIdgT3b2Kp+jDxmN5pgjiTinNeX8sx1Lky4Ab0rS4rrbeHPuG41zMHLVZz7
	kMrsNgR26P53ZnID33AkcTSXZMols9PxOyAzGvt+bMlPqy6g8GEmj5KfJvQ2L+elw5KJRfaEOIqb0
	2QQ0zPPS5D8I02PetCF2c40ruTCP/boYib5l3FmVTBKvhn9tv3+XYqwebmIuW1mMywUwe3n4WDlOq
	jIj6UXFw==;
Date: Wed, 8 Jan 2025 09:13:48 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm/omap: drivers: updates for v6.14
Message-ID: <20250108091348.46f71e35@akair>
In-Reply-To: <7hcygyb3yi.fsf@baylibre.com>
References: <7hcygyb3yi.fsf@baylibre.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_001357_538501_156CE18D 
X-CRM114-Status: GOOD (  10.59  )
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

Am Tue, 07 Jan 2025 15:26:45 -0800
schrieb Kevin Hilman <khilman@baylibre.com>:

> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/drivers-signed
> 
> for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:
> 
>   Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)
> 
> ----------------------------------------------------------------
> arm/omap: drivers: updates for v6.14
> 
> ----------------------------------------------------------------
> Andreas Kemnade (1):
>       Input: tsc2007 - accept standard properties
> 
>  drivers/input/touchscreen/tsc2007.h      | 2 ++
>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
This is input, the only reason that is goes via soc to keep that
togother with
ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

So shouln't it go via your dt branch?

Regards,
Andreas


