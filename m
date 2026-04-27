Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B541FF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX5eF+8gYTT19gPIBFZGuNHLw/f5dY5djv0a1JvKY4A=; b=BYRMltR5mmJAIFt8leV7grbt4d
	NRwPVpFBiMzcEpFlVA6yg+y/5Qk5nVyKJ2rkCR1eTG1QB8VdxG3sQ5FdcjQ6o4BM71PxcgSvyxY++
	0NNOWR+In6srADY93FDt3kvvAZTXkyAqvpq5J0OJtj0xkrG2wKem2psSM8XQao9dCtC/YCKMHzNus
	sXzrfA8GMOQNsaHrO2pjDzOaImlDt6wDofPdPJE/A6wE4cKgcAhLt+F5gjpg4VUXzLetqJPiTyh+M
	S6MtiygAJJjFFu86VWZ29O8pET7WLMxoqd5wVknZHyBY+8MoNLJL6vx1yQ8lSMXwGr8mqOHrzdudj
	hKAg33zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFqi-0000000GJUP-2rBP;
	Mon, 27 Apr 2026 06:53:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFqg-0000000GJRe-1ng7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 27 Apr 2026 06:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hX5eF+8gYTT19gPIBFZGuNHLw/f5dY5djv0a1JvKY4A=; b=hDcoVt2RMRI3OePFRo4MZr1hWE
	pINGUjO4Nu4uRYolK9OOnpUX7VTL1bo54vk/KHUiYAyWcGHoklUhef4VbdXZq0AKlkXDPMJKTk1kr
	+ayom1EHxNua3xKH5k5YMFpvVhSLfcKmClGZnZsmQQfuFUonvmATfStfdWYON5GNfNTvMbsz1OfBT
	s06XRJWSyZNrJt1cYLgudzGE8KwO/wnACEVmFZT+u/X6TLBP75CAIM6UyudOnbxte2C//BVJS0Nbe
	iC3orGMjKRkfONsxzTjGdyHqurjF2ijKvxJ1MNf2aPil3fKA7l2AflqXuW3z9oP346NgbieVkMzcq
	4/Pn8KPA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFqc-0000000HVlI-17l7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4BE443607;
	Mon, 27 Apr 2026 06:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C16C19425;
	Mon, 27 Apr 2026 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272812;
	bh=890ee2WIAhjqI3oDPRvaOKgFzFUsMQwVAfSk0a+FCeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TSDvVByUmBtWQJpIPY32dgpRtW5XlQveXSPXq0PKU59u2zyBASZfQ8kbuUfA99met
	 XPVou/62YnE1y8bb3yguoGGUxykrUFsXBwgEjEQnJiwI3iG1NPT+JzQEw0FQ72Ek66
	 PIyP8uYkplDbtY4NlBr/pPZdLHewuI/wTdE+l3WM8naJoRtfRMrxgHxpOxjyCncUGX
	 sPPzrGBpIavCk6/bnrAxZ7KnTIjZOH2Vb5agkOzia00N+d6un3lFnXPqlxRVlUR3T2
	 /buSSa09RVO0D5okIQxkKHIZQjfmT4IM2nzM/uVV/g+sqv5fO+kLnDnRc2FWToA3Xf
	 Fkmd72n/xXj6w==
Date: Mon, 27 Apr 2026 08:53:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, soc@lists.linux.dev, 
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 2/6] ARM: zte: Add zx297520v3 platform support
Message-ID: <20260427-married-overjoyed-panther-c773c1@quoll>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
 <20260426-send-v6-2-d49efa72bb09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260426-send-v6-2-d49efa72bb09@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_075339_045762_6A06302B 
X-CRM114-Status: GOOD (  14.27  )
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

On Sun, Apr 26, 2026 at 02:54:15PM +0300, Stefan D=C3=B6singer wrote:
> diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
> new file mode 100644
> index 000000000000..2e3abee94994
> --- /dev/null
> +++ b/arch/arm/mach-zte/Kconfig
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menuconfig ARCH_ZTE
> +	bool "ZTE zx family"
> +	depends on ARCH_MULTI_V7
> +	help
> +	  Support for ZTE zx-based family of processors.
> +
> +if ARCH_ZTE
> +
> +config SOC_ZX297520V3
> +	default y if ARCH_ZTE
> +	bool "zx297520v3"

"bool" should be the first line in the entry.

Also say something a bit more useful, e.g. "zx297520v3 SoC" becuase
unfortunately the model number looks too close to random set of
characters.

Rest seems fine:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


