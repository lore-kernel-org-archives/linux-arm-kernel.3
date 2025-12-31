Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7656CEE6441
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 20:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMB6FHkyf7/v8LqSMqiEqVuARzXP05OREo5piGW2h+s=; b=LmiKlk2ybGWobyLJYvrx77rdRo
	92aCYh115XFMUGdAeSA7jw+uqYzGPdjiWEj9C1R1GsrHzM+cr+xZc6bhCVDl+nVcvFUsOT1OSL33S
	rmjvxoLjTuieHvM7Efs9QOnG6f+aonNmwtb0X21wAMxG+fsKBPJhJSpTTeFekDATb3YLShaV/QbtG
	8hL7ozdIg+f/bkg3qlLUopAVGaAD86+2WCLiJ9wwM53CycGw7WKxoRfSzRkvxSKecP/eiyzYtkjNU
	ru328q3ahc2Aq4/UP1dj5/mgkYTxaaxt8OBGvsnJtWIj4i+S6fGISrIuU2t5YffRq2dVcb3UPHN5Z
	X+Gji2Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb31K-00000006Jnk-3qtp;
	Wed, 31 Dec 2025 20:42:14 +0000
Received: from mail.maslowski.xyz ([45.77.158.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb31H-00000006Jn9-1Ler
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 20:42:13 +0000
Received: from localhost (unknown [IPv6:2a00:f44:8b3:d5a5:7b2b:659:ea7c:8a59])
	by mail.maslowski.xyz (Postfix) with ESMTPSA id 108237DD15;
	Wed, 31 Dec 2025 18:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maslowski.xyz;
	s=mail; t=1767204856;
	bh=ukIz+YmXXIniB0b2ohWyVcvtGKfgOQxdYnCnw+gL+rk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=nwMedLeqIpgdsHyPOSktO7KnbT98FWSJPBXVYrS45JTrCyJqp4nM0zQUgEAwo/Ug3
	 7atXQveIpP+Rof6rC3NlsEHtV38ttcLGJW/wtX3pjyUgLNhhfkLR9PX1o0m0yIIYzv
	 tHmUWB0koMJun2cXqeiZDz9fq+NJajTczAvdWMEXvTclNvpr0PKMAfCK7ASpHedBf6
	 Diy8fOWgUvuxTTrkHFEg7lo+7Cvfe6xLULZ0WZMYWMbGhKHpBITIGwTt76Ltj1EM6J
	 oL5qWaPStYY5igAOr8VLGMXG2EwDzbSqPpoAI2iE6Tq0pGORevLNt056+liFPGIwoW
	 i01QoL3TiIK9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 19:14:13 +0100
Message-Id: <DFCLU67GQO86.1NY037FRPJ4E2@maslowski.xyz>
Cc: "Nick Chan" <towinchenmi@gmail.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Catalin Marinas" <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, "Sven Peter" <sven@kernel.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Apple Silicon drivers
From: =?utf-8?q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
To: "Janne Grunau" <j@jannau.net>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net> <20251231-arch-arm64-apple-defconfig-v1-2-4ff19805ba39@jannau.net>
In-Reply-To: <20251231-arch-arm64-apple-defconfig-v1-2-4ff19805ba39@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_124211_535133_75636582 
X-CRM114-Status: GOOD (  10.20  )
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

Hello, I'm not a kernel developer so this might be entirely irrelevant,
but while browsing the list I noticed something you might've missed:

On Wed Dec 31, 2025 at 16:42 CET, Janne Grunau wrote:
> From: Sven Peter <sven@kernel.org>
>
> Enable drivers for hardware present on Apple Silicon machines. None of
> these drivers are critical so build them as modules.
[...]
> Link: https://lore.kernel.org/asahi/20250612-apple-kconfig-defconfig-v1-0=
-0e6f9cb512c1@kernel.org/
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Janne Grunau <j@jannau.net>
>
> ---
> Changes compared to the original submission:
> - Remove AIC and APPLE_PMGR_PWRSTATE as those are selected by ARCH_APPLE
> - Add new macsmc drivers (mfd, reset, hwmon, rtc and gpio)
> - Add BACKLIGHT_APPLE_DWI, DRM_PANEL_SUMMIT and NVMEM_APPLE_SPMI
>   (suggested by Nick Chan)

What about DRM_ADP which Nick also mentioned?

> - Add PWM_APPLE and APPLE_M1_CPU_PMU
[...]

I tried to check whether it had possibly been taken care of elsewhere,
but I didn't find anything related on the mailing list(s) nor in the repo.

Cheers,
Piotr Mas=C5=82owski

