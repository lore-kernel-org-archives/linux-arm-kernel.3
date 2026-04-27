Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6CEFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 06:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dla8YPisQpFUiP5CnszIEM85dQreW5Y1H3GYNrZPlik=; b=DAl5POafe1BCjJ7Ua9wSzFSnyL
	vtO2uCcNXoQT/dFd1M6RMflFaAVXihHzf/aFnMXtgON8aJQjr3JQD/nMbYDfeksW/ufzeZl9kfmF4
	TMGEBr2km5fRVQ+OldMYV4HF8nxSAPGad9aBt5JXgMCMGE/d8qERfjdd2IGxTSptDxldhaZV/JuPs
	fg11i7j7R/3ha4Gcy/uGZe8xDxuVMISxRtDYaCzjDIF4VrfKV6+abPFesjEM38QzRVqlBpo6liM4x
	r6AhdzGQjAExtuSxnLJXHO4ZeJa5t8FzkQxmXDTVEGabIOnCe8I48151PCx0FMcs/B7w5kticy+M+
	5PFT5NPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFnd-0000000GHue-3QcT;
	Mon, 27 Apr 2026 06:50:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHFnc-0000000GHuY-2PQP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 06:50:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73D9F6013B;
	Mon, 27 Apr 2026 06:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F754C19425;
	Mon, 27 Apr 2026 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777272631;
	bh=Dla8YPisQpFUiP5CnszIEM85dQreW5Y1H3GYNrZPlik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GCkc95Sx9kdNbmFV/rzdEM1yffrI/VxN+1rAlBSULk+BxBPjpu/hzOR3B+aUJODsu
	 7imrTdTNeRDqM6lfzTHSjlStp8XLPrL6jHCsPXwQgzEhgPv9Vf6qrby0yZ5dYY85uj
	 tLM8W1PyeDVLeX3ZDZD6qFlEBKY6W9FHX1cHZLJlNhNQAr8qBPweYZIek8zsbbiqZW
	 xjap0l0S7bYTm3PAoM06R+QU6tnd1A1uCf5oV58uLycNDBcW3v4tRfXsdWUPM8yApS
	 MSe/MY5WRjcZrVdGgJ6kn6oKGeQ6XtEb7VMWNHI5ZQPGIty77U4nxCM9BaO+vtIzl3
	 u42tUzPkTRBog==
Date: Mon, 27 Apr 2026 08:50:27 +0200
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
Subject: Re: [PATCH v6 1/6] dt-bindings: arm: zte: Add D-Link DWR932M board
 based on zx297520v3 SoC
Message-ID: <20260427-neat-quoll-of-current-fed19c@quoll>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
 <20260426-send-v6-1-d49efa72bb09@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260426-send-v6-1-d49efa72bb09@gmail.com>
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

On Sun, Apr 26, 2026 at 02:54:14PM +0300, Stefan D=C3=B6singer wrote:
> This adds a new binding file for ZTE, containing their zx297520v3 SoC
> and one board (D-Link DWR-932M) based on it.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


