Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 815C4C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8j/ITVlOQxPRVqu5jSrEwrkx7x0SuDALimgCrujisk=; b=PkqClIpvna3kumuV2U6loFML3k
	sDI+ML3s3bw28YMBZPlHdiGoBxmS7m7hJiJjYWf/kxEqoDdUy6bbRikOHPJwdD9kRX5/Tq92pI711
	BPsYyc4+gzR/7uRj3ZDZnbpEFHYu3vKB3joSfxo4t6HMQ/E5be30VbnuZEYlSLlnz+cDgsFJfdBei
	hKmlOYCXTE35Ka2K3gWEmpoocqpHANP0nC0PKIXy454+sk1iq9X6oX/ItrFSK8CG2CP6t+vVqhNm+
	n2pOtuymyAdm7AxTaMB5ArSIZWRQXP/Rk1z8wg6NJGMy1jirIrE2/iPO+gI+WPilLUUgTOi0fvOhL
	/8ZJsskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27fg-0000000HQKx-40wq;
	Thu, 03 Sep 2026 13:40:04 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27fd-0000000HQJy-2162;
	Thu, 03 Sep 2026 13:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=Y8j/ITVlOQxPRVqu5jSrEwrkx7x0SuDALimgCrujisk=; b=MYVdmgaktCtsAPnBXcEec/G3MY
	NxorhytiJ0rz4vfZR8d5ztfXHixOFjQqNFb0FkhZihK9n6T4HtTtotpaDZcuSaPld+ASw8hrT2ITC
	RCXAcXlnJfhY9/GtktBhfVfL3/AuquN2Ors0H+6+gCLzypjcq1Z0/x8AM3onQkENgRYaxbq2vGzcG
	voUJNaWFZw4i62eEk2HeZWnXyHC85rrX+BsBdZXW3OW10/ZW//Ypo4Qs8gebFzynXEkmu4okehvTx
	fQ9SnaMfzhOhy/M3TbMj12OIetYhQnsZVW7frOQvDneKD3kNYZ8qCtHZNgDLXkdn/SKe395/SvGHx
	H8/tesPg==;
Received: from [179.105.94.163] (helo=[192.168.0.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1x27eq-00EO8X-3D; Thu, 03 Sep 2026 15:39:12 +0200
Message-ID: <a096712c-8bc6-4cb5-94ca-6a82525f1bad@igalia.com>
Date: Thu, 3 Sep 2026 10:39:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/vc4: Reset the V3D block through the reset
 controller
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Stefan Wahren <wahrenst@gmx.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260816-vc4-reset-control-v1-0-896444373716@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_064001_869841_B0F529C1 
X-CRM114-Status: GOOD (  22.06  )
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

Hi,

Florian, Stefan and other Broadcom engineers, any thoughts about this
series?

Best regards,
- Maíra

On 16/08/26 11:05, Maíra Canal wrote:
> vc4_reset() recovers a hung GPU by dropping the runtime PM usage count to
> zero so that the V3D power domain goes down, and then taking it again.
> Forcing the count to zero only works if the driver knows exactly how many
> references it holds, which is why vc4 unconventionaly wraps every
> pm_runtime_get_sync() call in a private refcount and mutex, making the
> code cumbersome.
> 
> The BCM2835 PM block has exposed a reset line for the V3D block since
> commit 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains
> under a new binding."), added for exactly this reason, but vc4 never
> picked it up. This series switches vc4 over to it and drops the private
> refcount, leaving vc4_v3d_pm_get/put() as plain runtime PM wrappers.
> 
> The reset line is optional, so device trees that do not describe one keep
> working: they get the driver-side recovery in vc4_irq_reset() while the
> hardware is left untouched. Of the two in-tree platforms,
> 
>    1. BCM2835 gains the property in PATCH 4.
>    2. Cygnus has no V3D power domain to begin with, so the power-cycle
>       only ever gated its clock there.
> 
> PATCH 1 is an independent cleanup. "brcm,vc4-v3d" was never documented
> and was never used by any in-tree device tree, so it is a candidate for
> removal on its own. It can be dropped from the series if it turns out
> to be contentious.
> 
> This series was tested on the Raspberry Pi 3B and 3B+.
> 
> Best regards,
> - Maíra
> 
> ---
> Maíra Canal (4):
>        drm/vc4: Drop the undocumented brcm,vc4-v3d compatible
>        dt-bindings: display: bcm2835-v3d: Add an optional reset line
>        drm/vc4: Use the reset controller to recover from a GPU hang
>        ARM: dts: bcm2835: Add the V3D reset line
> 
>   .../bindings/display/brcm,bcm2835-v3d.yaml         |  3 ++
>   arch/arm/boot/dts/broadcom/bcm2835-common.dtsi     |  1 +
>   drivers/gpu/drm/vc4/vc4_drv.c                      |  1 -
>   drivers/gpu/drm/vc4/vc4_drv.h                      | 13 ++++---
>   drivers/gpu/drm/vc4/vc4_gem.c                      | 40 +++++++++++++---------
>   drivers/gpu/drm/vc4/vc4_irq.c                      |  7 ++--
>   drivers/gpu/drm/vc4/vc4_v3d.c                      | 37 +++++++-------------
>   7 files changed, 51 insertions(+), 51 deletions(-)
> ---
> base-commit: 09b47186a4164f3aaa3591313f80794443117342
> change-id: 20260812-vc4-reset-control-cddf3eb8a9e9
> 


