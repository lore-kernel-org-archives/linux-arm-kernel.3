Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DFAD59F50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 21:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYYXYk25+D3vDdu6UDkANuj3wMPCkEo8zuhi/oEZE3w=; b=w/3TH7G8cReVWopbskhP2UBtIR
	/vbSevcrI5sOpIwAfIn3UkddrtZ92ACLN1rq7Zu+dgFnDOzHLeFmVyRFzABcl60gZxl1s37ZGrN5M
	D9VYjh9BIuWwwd9R8oQCsFnKNvbMm9WRDjF/ZD2uuRT6F9xPh/j+X9aRV+yBTbXHCce+GuHlDQXDV
	+k+e2wi68NcP7g795y0FqmA/VCfh7b1Bthx/vOlR3REIHwZEF2dONNdHjGBol5XXjsTxyScRS+1mg
	9T5MAJshMYlldX2Uu+XOBQjtqXpH1u0Yjv0sqbzddEIf8pdxetDs8xmOi2bCxfAKhKDP0arhsVA/s
	WR7NiMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUB9u-0000000189J-2lRn;
	Fri, 12 Dec 2025 21:58:42 +0000
Received: from smtp5-g21.free.fr ([212.27.42.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUB9r-0000000188N-1UVk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 21:58:41 +0000
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:6d9f:c3d:adb3:41ea])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id 811066012D;
	Fri, 12 Dec 2025 22:58:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1765576712;
	bh=gPwKxCd2LVBnJ4p5fX3ephTehUZ4nezWU5qgNY16S14=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dRVPQAQUwrYpZ+vlWxvBAV0aRc3cx/hfMjdv7NoQUmjhWlqo26/6F/ZlYvnWXsWJL
	 ezQkixGbeA5jyETgHYl8xz3Tcl+FZnrv7JCQsf+gHBkkxvYrm596pNcoWvL8miXCRk
	 yeXrt4wsmxVbqJFHPTncFTBBYULcDwWjua4K89L/1wl9JoRmjxlMKWQTDkQ4wWgzaH
	 FzcJDhLzRzi9Zu2zjgJMmOZbS+S2TF6HwoE8LUjHmlAOntGkTzxI335x1/DWjC0aKP
	 oTpNXFtSzpNeiSqWQhbZdWu9Lk+gR8oedCbfeG8/1v8A85cQV7cEFjf1kaJpxLuKDT
	 8dJno7OoFsG8w==
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Daniel Mack <daniel@zonque.org>,  Haojian
 Zhuang <haojian.zhuang@gmail.com>,  Andrew Lunn <andrew@lunn.ch>,  Gregory
 Clement <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  linux-renesas-soc@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
In-Reply-To: <20251212203226.458694-4-robh@kernel.org> (Rob Herring's message
	of "Fri, 12 Dec 2025 14:32:10 -0600")
References: <20251212203226.458694-4-robh@kernel.org>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Fri, 12 Dec 2025 22:58:16 +0100
Message-ID: <m2345fmkg7.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_135839_803515_AE313301 
X-CRM114-Status: GOOD (  13.11  )
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

"Rob Herring (Arm)" <robh@kernel.org> writes:

> These .dtsi files are not included anywhere in the tree and 
> can't be
> tested. They have not been touched since 2018 other than 
> clean-ups.
>
And yet, there are used by people using pxa2xx board with an DT 
support
(like the mioa701 for which a board file was never merged).

If you remove pxa25x.dtsi and pxa27x.dtsi, you might as well 
remove all
support for this architecture from the kernel, as these are the 
building
blocks needed to make it work.

That might be what should be done, I'll let Arnd and Daniel 
comment on
the future of PXA in the kernel.

Cheers.

--
Robert

-- 
Formal Signature
Emacs 25, org-mode 9, mu4e 1.0

