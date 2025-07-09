Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F882C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9O4wep8X80DnfmVYqTYuUTz8kwz/OoeOVVejGNflgW4=; b=dPS4TuPbepz2tUwRvWSYxEgJpu
	jG/Ny72+32Fp9+RnDqfNyxgTWB3SRRubr6etl5uPfiopaA9PcjNPg3EbpNpM1Ygf3SJXtSSOz22Bf
	7sDR/+cGT6ieHYt5nPi745BXG8H3TX6f3JEqDrw5eb+yBVY1rPM+/Ln4YsUXqM0wTKi5t2t/7NdRS
	dG4Gz+6QHXHJzFfcRuMnXOHYV1Hbsx1fujUyGv3qUYoj3INLxcHAwqdAfGGZElrZZxVgZVONneka6
	/FHEwnUEV1gtYFzkc3FfjHr20qkuB+4o/2GEasiiTzM2jmsx5oXGXbqCB74pZWJcb33EYYVe9Uo2z
	TKEKzJ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQoW-000000084jK-0eIM;
	Wed, 09 Jul 2025 09:10:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZPHm-00000007owo-1ujb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C52D4A54687;
	Wed,  9 Jul 2025 07:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA84C4CEF0;
	Wed,  9 Jul 2025 07:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752046329;
	bh=9O4wep8X80DnfmVYqTYuUTz8kwz/OoeOVVejGNflgW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9O01RLaIusvUqR/F5/lKlhbtGKqEdItzKwGaL4hISRhsf5Mhy3vHF/+UjRds0xZl
	 1GVNVlK5DEPm9psaU5Od/+qxB5DQWtYbxVInihuL8082el1hqwNRIMfuqCebnTU8pZ
	 aQA3wzK15XNOK1tVpfE3d01Wd+5+o1YyWeRZ+AKYTBrvFK5JnpfeURHIPyzRmN7kG3
	 CJJkwskmrqm2FW5P1fKNIbps2BKuIBU+aG4+aBkYWjrPVTOWWSGwSLi8mV1810tPJL
	 c87u/Phg/PE28r5b+PmWxGbdpB7JqrKJaydOEqQxx/GuqXP/kMotgvr3H7zAjn7hDg
	 DnzEBVDT/xRCA==
Date: Wed, 9 Jul 2025 09:32:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-hardening@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, soc@lists.linux.dev, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v16 1/5] dt-bindings: mmc: sdhci-pxa: restrict pinctrl to
 pxav1
Message-ID: <20250709-spectacular-goat-of-tenacity-ced55a@krzk-bin>
References: <20250708-pxa1908-lkml-v16-0-b4392c484180@dujemihanovic.xyz>
 <20250708-pxa1908-lkml-v16-1-b4392c484180@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250708-pxa1908-lkml-v16-1-b4392c484180@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_003210_697645_758B32C1 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 08, 2025 at 07:09:46PM +0200, Duje Mihanovi=C4=87 wrote:
> The current pinctrl properties apply only to the pxav1 controller.

Why they are not applicable for pxav3?

> Adding one default pinctrl node to a pxav3 controller therefore causes
> a schema warning.
>=20
> Check the existing properties only on pxav1. pxav2 and pxav3 may add
> their own set of pinctrl properties if and when needed.

This should be rather made complete here, because properties should be
defined in top-level, not in allOf: block. Strictly speaking pinctrl-xxx
are defined in core schema, but still the binding should follow same
rule - define them in top.

Best regards,
Krzysztof


