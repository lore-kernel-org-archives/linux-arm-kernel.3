Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B65F94CDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfXH8NQ1ZpBZnpvilSWV6pku7kNpSxrvSxuhdAohpuY=; b=DCk/6+I0jYPLSu4H3WM6bEZwob
	/xRJhQwgqP6eDfsmuTC0JjUq5zuTFYe6/YOtGWVCGLYEupqOKtEMDTgzqxhamx05Uw5nBHQV8IO7i
	SMknIDRdhTKoG49HobCznv064aqzJORIAzWMgj5DTEXJQVJ/u7PwF59jeA07z6NQZGnJtYknfcb9g
	Z3sZpGUwmlrwAQJ1+CmxMpV2E3tqxLEHThlVMBQvSlmtkLldWdezvMfggiRQ3IWaEJsAcK5sATIhL
	CNdCCOT7tP5c9dOIA+ZbRtJfeZyWiiUbR7Pmw42CL0jt4Ee0Cxy+k2/p5n7h5SGZPbubUTKz7l/uA
	yetfyouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRjE-00000009huz-2KxL;
	Wed, 22 Apr 2026 07:10:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRjD-00000009huo-10BZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 07:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5361A60018;
	Wed, 22 Apr 2026 07:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78075C19425;
	Wed, 22 Apr 2026 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776841830;
	bh=KvmZiFZoDwQVe3uf1Ar4i8FckEwLYLs0mfXSzOsjS88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUnwRQJ0eXfclcS0MbVxMPh/mtzCH9rqCF9Qa6j1gaL5mh51IZY8ZLV5mRsHSXNSY
	 gP+Un7p66fiRWVywu3gbbJp94KnTdnkNRxhLnhnay5a6ew505gsn2MAyQYV3yeHCL6
	 1SQA+lgc116iQtjJzBPG9UNcfDm+LrdIuRUeKEy7noR9zhGxty1lfDlGt6Z5sHqS5l
	 wXnJhYiZdyFHhM7kkPTeZYY7B8LnlesEefPlwNCOdJeUkPT4x+pkvLkf3Zjovlnk6r
	 4YlA8iXJc55PH+sXDM8YzkDOECVL2S8YtAjGZhQ1TdMyYsaoxDSzlAXFJrbldK/kZ9
	 me8aFI3uywGJQ==
Date: Wed, 22 Apr 2026 09:10:27 +0200
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
Subject: Re: [PATCH v5 5/8] ARM: dts: Add an armv7 timer for zx297520v3
Message-ID: <20260422-zealous-utopian-dinosaur-ca0d5d@quoll>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-5-ace038e63515@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260421-send-v5-5-ace038e63515@gmail.com>
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

On Tue, Apr 21, 2026 at 11:23:13PM +0300, Stefan D=C3=B6singer wrote:
> The stock kernel does not use this timer, but it seems to work fine. The
> board has other board-specific timers that would need a driver and I see
> no reason to bother with them since the arm standard timer works.
>=20
> The caveat is the non-standard GIC setup needed to handle the timer's
> level-low PPI. This is the responsibility of the boot loader and
> documented in Documentation/arch/arm/zte/zx297520v3.rst.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> ---
>  arch/arm/boot/dts/zte/zx297520v3.dtsi | 24 ++++++++++++++++++++++++

This must be squashed. You add new SoC - that's one commit. One logical
change. Adding "not working SoC" and then "let's fix it" are not two
separate tasks.

Best regards,
Krzysztof


