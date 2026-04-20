Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1D2F588C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 13:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUC2t9kCbTutWnz6IuPE32rjpeccnNIrpMgaz4pD0xY=; b=RzABq95srmCRrP3UOBj9cpbPBI
	Pp2p87nLe0ZjjjeWqD/RnNyNfEpjRiZZ3huA8KqgVlrMiVuezUZtu7cl06fifeYTbn13XIDDxAOzH
	WsPWnZSOl4XkMkGEHkja9Tpyi+f4IYFrcFFDhylJawZSIXsgP81J+Y76S/ZkBpW/cLXCUzXb/JqQr
	KrcrAkFxPatcz1VITbkvfm0081ghEqS6IxeMLnsma4Jd/mFiextHf/aJSKEEq8iiXfxqsqDQ4XMn4
	xH90snygk+ralgQDUGRcVTEbSx0Oo2LJE1CZMwSe9fgZ9gsAVJz5guJ0icpe6oHzDjgmQVHvUPL8K
	cM/JGpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoF4-00000006wUg-0N02;
	Mon, 20 Apr 2026 13:00:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEoF2-00000006wTu-13Lb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 13:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64C5A6014B;
	Mon, 20 Apr 2026 13:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBE1C2BCB4;
	Mon, 20 Apr 2026 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690043;
	bh=tUC2t9kCbTutWnz6IuPE32rjpeccnNIrpMgaz4pD0xY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlVcalFzn0PvL+6InUzgqSW+//qTjGG/EfiW0TS8x0zIGJ4uAz3KtlCEIdTY72YTy
	 SATZbU4nIdedKAryE4IKUikbt2UpAV670DGv37zi22wOPDSq32Z0Zdb/vPQOAHhV7L
	 R35f+tkpc9jcihD1qrfP0TKz+3uJDOYMmGiwmrFTnnSqiFNSetkcePBGG/xKu5LGnu
	 asbzNN9TTZLZUbSEsaJ20Fz2H0Z2/jWZQogamuUR9uXs321B0epvjSiYn6Dvex523d
	 fVOWm2enR6PxWJfmlCw2CuN/R6tbyJzFVc94nrBqhpt1kLO+3wVyNbmb/1ps8rY0Q1
	 wlb+04KJisEeQ==
Date: Mon, 20 Apr 2026 15:00:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org, Drew Fustini <fustini@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, soc@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-serial@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: arm: Add zx297520v3 board binding
Message-ID: <20260420-blue-parrot-of-spirit-2b5f6a@quoll>
References: <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-2-e19d02b944ec@gmail.com>
 <177646012448.2165534.5760108355183774935.robh@kernel.org>
 <6264667.lOV4Wx5bFT@strix>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6264667.lOV4Wx5bFT@strix>
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

On Sun, Apr 19, 2026 at 11:30:04AM +0300, Stefan D=C3=B6singer wrote:
> Hi Rob,
>=20
> Am Samstag, 18. April 2026, 00:08:44 Ostafrikanische Zeit schrieben Sie:
>=20
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
>=20
> Here is a new PEBKAC issue for your mail template: I ran dt_binding_check=
, it=20
> wrote the warning you pointed out, but I only checked the return value - =
which=20
> indicated success. Which I guess makes sense for a warning, since there s=
eem=20
> to be a few preexisting ones. The warning itself was somewhere in the=20
> scrollback because I let dt_binding_check check all the files.
>=20
> So I learned I have to actually look at the output to see if there are an=
y=20
> warnings.

Same with every other tool warnings, like compiler warnings...

Best regards,
Krzysztof


