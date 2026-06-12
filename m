Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75221CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 22:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSsd10hTWtrKk2TikAXFF9vYh/A7HpRUvIn5lroALYw=; b=jg/StYQMH5NkZqScbHEgFaLi0Z
	RnR6IomheGR279wRQcp1dYf2OoWmeEte3GBXk4jfD2ENVcHoaM44ZsGCcsueWfpgS2knzBb2q/wlD
	i37wI7BlHE5cz4mxtC6wIO1jw2P5CQJUk3QAl+LYkmC7p6s1H8FqNmhqakQRHJyfA3LWjM35Hs9zw
	LyvW2kEDarij/Z7KOxtSw/oA3EnAX9P2u08RAg3g2WvwtVnhMyraa9QK0vCkWOZ0Glesal9rExDlf
	XETVZhy4LE08vA4Zp1hahcRYECUpJy3BDvP5TzE6t2QCQH0fdhLl4R+N7GrbF52SerVBnISLHXq7U
	cayE8ODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYA05-0000000BdtY-0ndk;
	Fri, 12 Jun 2026 22:05:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYA04-0000000BdtS-06aK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 22:05:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B05A42B95;
	Fri, 12 Jun 2026 22:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391CD1F000E9;
	Fri, 12 Jun 2026 22:05:15 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id B3D2D180CEB; Sat, 13 Jun 2026 00:05:13 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>, 
 linux-doc@vger.kernel.org
In-Reply-To: <20260426232705.422938-1-rdunlap@infradead.org>
References: <20260426232705.422938-1-rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: ABI:
 sysfs-class-reboot-mode-reboot_modes: fix doc warnings
Message-Id: <178130191372.340022.764793265726304664.b4-ty@collabora.com>
Date: Sat, 13 Jun 2026 00:05:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Sun, 26 Apr 2026 16:27:05 -0700, Randy Dunlap wrote:
> Repair the docs build warnings in this file by unindenting the description,
> adding blank lines, and using `` to quote *arg.
> 
> WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: WARNING: Inline emphasis start-string without end-string. [docutils]
> Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
> 
> [...]

Applied, thanks!

[1/1] Documentation: ABI: sysfs-class-reboot-mode-reboot_modes: fix doc warnings
      commit: a888754e51e915731c8974c4d6d62709facb35d3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


