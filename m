Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E77CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKs6AUeq9WOwt2hpXLAT4tJphlsnE2LMUBd+nVvwWs0=; b=JJ2EBqlQMaNMkmdS2fq8Ov1Amb
	KaJK27S6IEQp2rjl4ZuG9QOAKi35pC2bOZmI8uEXSYP4/zXTDNb5VNcZ4Nrh1TAxv9a8i801UZEJA
	WKIMVAieEUgw/tVJkutGEZ8AwVI2XytJN14gX5yOJf3Tmi2dL9NUXD8Kb0VSZwC+0Se0tCT4vjA8T
	yrAKo+S9kG6MZM6M1ajN0PIdsIpuMHa0qe6o7Yrcagd0Ch73PyerUQSNw1rmGAiH44T4qt0/UkT8B
	IgxWXnAp9GekS62HazqAB3K2H4XSxzF5rGWUfcOCBgRYIWSacPcWdTsfVge7Pq99Olu9sHWvSKdwV
	l6hlkZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwIL-0000000ADmK-2TKZ;
	Mon, 01 Jun 2026 06:38:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwII-0000000ADlq-2XS7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 06:38:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8FB09C6247C;
	Mon,  1 Jun 2026 06:38:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A761D602AB;
	Mon,  1 Jun 2026 06:38:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0544110888CD5;
	Mon,  1 Jun 2026 08:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780295916; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hKs6AUeq9WOwt2hpXLAT4tJphlsnE2LMUBd+nVvwWs0=;
	b=auC+lupWuS8GhPyQlNi7w45/CzhD1MjdgPxIHg9F5a8sl4htUESoji6GxHIL1+GWBiY4jf
	nSMCJshn6jxQSpKRynBaZmTp4O4CtE/4HEX7GINAH7vX+DN7A0K25s8WXRq57N3Lvy/WzH
	l9tF3z4L8kN4lWKxUnSUSEf/KRzOmsRj3gTA68y+WJH8wa/IEpjqABuCaFKBFOLvwB3Fa6
	MP4yKN3HIwHOLvj8oeN0yQl7G6hb8ujCUwGCZ9CU0cwj+PYOxOt/y9U8RHHZgoTjuE3A8r
	WJ7dcdEw1v7VAzEHyekcCbT9S3rmZo4JvU9xP2YXGa8HFCX+EIbgRJ74Imo5zg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Ethan Nelson-Moore
 <enelsonmoore@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH] arm: mvebu_v5_defconfig: remove stale
 MACH_LINKSTATION_LSCHL reference
In-Reply-To: <20260509022744.40063-1-enelsonmoore@gmail.com>
References: <20260509022744.40063-1-enelsonmoore@gmail.com>
Date: Mon, 01 Jun 2026 08:38:33 +0200
Message-ID: <878q8y22ae.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_233838_822778_7D85DA54 
X-CRM114-Status: GOOD (  12.47  )
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

Ethan Nelson-Moore <enelsonmoore@gmail.com> writes:

> The legacy board file for MACH_LINKSTATION_LSCHL was removed in
> commit ecfe69639157 ("ARM: orion5x: remove legacy support of ls-chl")
> after it was converted to DT booting, but a reference to it remained in
> mvebu_v5_defconfig. Drop this unused code.
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Applied on mvebu/arm

Thanks,

Gregory
> ---
>  arch/arm/configs/mvebu_v5_defconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu=
_v5_defconfig
> index d1742a7cae6a..c42e2a4f8bc1 100644
> --- a/arch/arm/configs/mvebu_v5_defconfig
> +++ b/arch/arm/configs/mvebu_v5_defconfig
> @@ -15,7 +15,6 @@ CONFIG_MACH_DNS323=3Dy
>  CONFIG_MACH_TS209=3Dy
>  CONFIG_MACH_TERASTATION_PRO2=3Dy
>  CONFIG_MACH_LINKSTATION_PRO=3Dy
> -CONFIG_MACH_LINKSTATION_LSCHL=3Dy
>  CONFIG_MACH_LINKSTATION_MINI=3Dy
>  CONFIG_MACH_TS409=3Dy
>  CONFIG_MACH_TS78XX=3Dy
> --=20
> 2.43.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

