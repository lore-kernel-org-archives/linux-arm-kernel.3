Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FE8CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 03:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Al1glvz/IJj4lju1yIZV4opc56skglAbD2Mb6ols/Lc=; b=NSXrURGkbWJR+YPC6HcO+r3ZL0
	XPWpkcHthJCQBa2UyMPBZsXntNa+AHZAW99Cx7SavIhpeJ3m/d6unRlW42gIrFza+/ePJ+aj7WgZj
	lbudEgkS0MYcrfVWQu12Te23HAPu4B2LkKNXA9ofiDbfxKu/tdrP8G8E2yeCjhaInAMOmPE8Bw4eF
	0EQajYZpS6M79bfxp+jNc396XgMbfRiJzCR8CTY1vCv7jLUyPF8Db/5atiA878tHmdzNdh/eEprSh
	NAveDh6deOXBBEPBqXHNcQZfZtsV7mWi2ZPxLZih7OEUjBnoFsWpDjQLujs6pZuDjZ2ESgodrV+HI
	eaPSWVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOZa-00000002DrS-2jph;
	Tue, 29 Sep 2026 03:32:06 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOZX-00000002Dq4-4C7n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 03:32:05 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B20B740E015B;
	Tue, 29 Sep 2026 03:31:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id AGeAEptx5KvJ; Tue, 29 Sep 2026 03:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1790652700; bh=Al1glvz/IJj4lju1yIZV4opc56skglAbD2Mb6ols/Lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2xX83qVtrqyb8mS4q5XqI6B7tukE5G9Ex9svkbCNsvYQM1STItgNJZLhFH7jOprf
	 ZnqnWsAjGzvXa4ki+Ce8YhW25fxIk4zZP2MPu1m5uewrjzU6AgIY+YDt/hlX5A/WnS
	 wbNbX+EoHTWQ57uwS5dGF6frcpjZnoL0AE4nFXPdx8rIzQS6huorHx9QDgADcTu6np
	 BvX8XqqYx7r4h7hY6KqCbHuOVsdpcC3WdaaoYkl/EaeQ5mBFoP5HX1541VuIF7BN++
	 +ftjgZxmLw6V65pAWX6aM8i/A24gXBPDWi0sELtxxwdDtuq5vdkpbSXpHa+s0PTfCy
	 bMamNYiYhF4Fc3QBie1uJfojYAbTH1ij0mfqFcLiDfKSbOXnr1Beq/YZiyiYaMIVCy
	 c1ygwBZFNoQARMOYc/U5L7kfjr7H69AisDYf/erqcbyINHQjmuZKNfcZzykI6w3Fz9
	 AB3JN+Bqdtz6AOlE0Kg+4hQxJYRfXcY1nCFL38zGXtwU6l16iyFsaKV56NAt5/pM2R
	 jNueI4+E7Fdc9DKceSw2zwHEaCaNKysybe4tMHcYZyFbXrOGueSE3nkB1FCNmjUuq8
	 N5Eff6NarqWMZvBBgInzKSvjdKwBfoZ9+edWyzJuq3kWDFSrW4gIYNwFxuyg+ow3XY
	 zppgwRQH2s14Ti8O00DZC6so=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::3a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0679240E015D;
	Tue, 29 Sep 2026 03:31:23 +0000 (UTC)
Date: Mon, 28 Sep 2026 20:31:21 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	Borislav Petkov <bp@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v3 0/9] Add Aspeed AST2700 SDRAM EDAC support
Message-ID: <20260929033121.GDarsxCR4uIpLB69P0@fat_crate.local>
References: <20260916-edac-v3-0-23e9ed2fbdf9@aspeedtech.com>
 <20260925054444.GCarYKTAdrrJ5a2VYO@fat_crate.local>
 <TY2PPF5CB9A1BE6EE1ABEB80D36C3365473F28C2@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TY2PPF5CB9A1BE6EE1ABEB80D36C3365473F28C2@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_203204_202039_DA3FC726 
X-CRM114-Status: GOOD (  19.91  )
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

On Tue, Sep 29, 2026 at 03:26:42AM +0000, Ryan Chen wrote:
> > Subject: Re: [PATCH v3 0/9] Add Aspeed AST2700 SDRAM EDAC support
> > 
> > On Wed, Sep 16, 2026 at 01:30:37PM +0800, Ryan Chen wrote:
> > > Add ECC error reporting for the Aspeed AST2700 SoC to the existing
> > > aspeed_edac driver.
> > >
> > > The AST2700 memory controller keeps the same overall EDAC programming
> > > model as the earlier Aspeed BMC SoCs, but uses a different register
> > > layout, a split interrupt status/clear/mask scheme and DDR4/DDR5 memory.
> > > Rather than fork the driver, the existing code is first tidied and
> > > generalised, then the AST2700 is added as one more per-SoC variant.
> > >
> > > Patches 2-5 are bug fixes and cleanups to the existing driver.
> > 
> > You always put the bug fixes first in a set. So it should be 1-4 bugfixes, rest new
> > features.
> > 
> > --
> Thanks your review.

Not done yet but you can send a new version if you feel like it. For it, you
could also pick up Stefan's patch and merge it with your last one so that the
driver doesn't become orphan.

Also, think hard before you mark fixes as CC:stable because stable fixes
trigger a lot of work downstream: stable trees, distros etc. So consult:

Documentation/process/stable-kernel-rules.rst

before you do.

HTH and Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

