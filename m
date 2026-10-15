Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D7FCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGxemQzLP7mSaxp2FxA3NW6pQnFC4/3ja+XeKl0+AlQ=; b=y0kEbJSwmATvKih4ioB9l4s1cZ
	JJDtcM/zEVWt/H2dml1oSJPg6O6zTq8Y1RYZYU8ohzno3O1TnzZp/tFnyEULMGyg/qxlMshAmsz9C
	Leprn7hZj3E/hOVaBAdinGYyg8sSbUELfr94XXoSL+Zu9M6nrQLvdTldOapIj81CMXa9YlEFUrUHP
	K10/MYRSuEQX3fO/wIJGfU+OvDheG1ThGCcbXXbnEywdvZdNDp9o0Y2bMXNV5y7XyUuFH98dw9feZ
	5u8fgBk3HjtNleT546Ilnq4/tmWCkPNvpQXhhBTp3sIJ/2OjgcDqnEqo+2d6bD21NLvq424zCOx5H
	++lfCvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRf1-00000001Hfl-0phm;
	Thu, 15 Oct 2026 20:02:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRez-00000001Hfd-0nDL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:02:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B4946021E;
	Thu, 15 Oct 2026 20:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98DA61F000C4;
	Thu, 15 Oct 2026 20:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792094559;
	bh=nGxemQzLP7mSaxp2FxA3NW6pQnFC4/3ja+XeKl0+AlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Dc01fAVwein07mQywrLDVQwSQDyPdtkuPZkQRajp5lCPoSGGFjns8btldPMB2trf4
	 KgJ/M9jEqWP8ZbNLBCp42E4sxYve0KGfoZfZu5zbsmTPjmEk7djAGqU+lJBkyAIvIo
	 VTk5BnrxCuaZavxMMFYKk73em3LCgblug3zNNm4ye2M1VOVrDF44pxyvGOA42WJHa2
	 /TGev1WgkkJSx8wxgg562/JWkgYmocaElhw3N3/kqlmNWmdGisq7cEos1JEZge1LjJ
	 OukvETxPumDSR6HklCm4NhVGpG6krstf+H9VelOvACqzZsCF+Fdso69V4rgd4uk1Br
	 BDtnPxGCrwRCA==
Date: Thu, 15 Oct 2026 15:02:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jason Li <jason.li@cortina-access.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 03/10] dt-bindings: arm: cpus: Add Cortina Systems
 CS7542 enable method
Message-ID: <179209455732.2799921.10391094188509474166.robh@kernel.org>
References: <20261013-b4-cs75xx-v6-0-37e8f3969b7c@gmail.com>
 <20261013-b4-cs75xx-v6-3-37e8f3969b7c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-b4-cs75xx-v6-3-37e8f3969b7c@gmail.com>
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


On Tue, 13 Oct 2026 09:06:04 +0300, Fil Dunsky wrote:
> On the CS7542 the bootloader parks the secondary Cortex-A9 core in a loop
> that waits for an event and then jumps to the address found in a global
> software register. Add the "cortina,cs7542-smp" enable method for it and,
> as with the other release-address based methods, require cpu-release-addr
> to point at that register.
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


