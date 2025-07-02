Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3289C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9QVOwWxCq6vU9om7he3BjCZEBDSRveGFOzMgdxLpToA=; b=Amn6E9rrRFBlBAJ2oQ8Z8QrOJS
	2Rf8PBEbEP/YX86MZc+7oBg+yzMBEELSQdEkYPRxxA3C6FLyxpprvIbAVnKabb2zbKoSM2z28b6ky
	ktN2aDZ74rUfjBu+W02S/k27g00TLOot4K175l0onOe1Nb+Vb6cXQSspLC8JDR6JOmOah2kzY1TRo
	kH5UxXbP5RjP4h46flEIJ1h7Ku0J44LELt1I1hp67VH2fapPJZ0U7+bwSkgxPe0rr4/nTaJjVKnig
	DyjBQRs4wrDaTBo9smniuBnR6KevW8QvxCQfpAlC3IkkCj1x5NQzWOcp2G776l9sbCGWVApRvI25/
	TzPUmX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0go-000000091zM-2bYg;
	Wed, 02 Jul 2025 16:52:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0DO-00000008w5t-0ZqY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 16:21:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 411B95C54C1;
	Wed,  2 Jul 2025 16:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB733C4CEE7;
	Wed,  2 Jul 2025 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751473300;
	bh=9QVOwWxCq6vU9om7he3BjCZEBDSRveGFOzMgdxLpToA=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=OBaRenqnWo3vVxvR3tpFSU+/CO1Hn/C2AOFYnPCUJtG3yPc0LL9KQguMqJel+PrgV
	 9YwWsHlk+d8l0QcmBa85IGgqVH6Rp514K3Uh+r7GTx6DzrTsm5boDaF7tZcleIEraq
	 lHlxghzWYxvmOiKZR1lfylNYjd1aZlmj8Wk/CM52kH2vwjB57EweNkf0wL+enKMtZT
	 iDuQz2u3453dJmbIgm6BDIr6K90MuF83uFCKsZNJ3Z/xVY4UbKjs7MX6RhuNhYXQoV
	 imIWr+4FKAr9TZIO0ZRivUYvvpzgpdIXOtmA37Xm4DNY+SfTAaThWiC/BqcGDU4k5b
	 rMBj4Ot9czqPQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c20066500908db854aa4816b40e956296bab526a.1750714412.git.andrea.porta@suse.com>
References: <c20066500908db854aa4816b40e956296bab526a.1750714412.git.andrea.porta@suse.com>
Subject: Re: [PATCH v2 stblinux/next 1/2] dt-bindings: clock: rp1: Add missing MIPI DSI defines
From: Stephen Boyd <sboyd@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>, Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herve Codina <herve.codina@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, Linus Walleij <linus.walleij@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Masahiro Yamada <masahiroy@kernel.org>, Matthias Brugger <mbrugger@suse.com>, Michael Turquette <mturquette@baylibre.com>, Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.
 org>, Saravana Kannan <saravanak@google.com>, Stefan Wahren <wahrenst@gmx.net>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Date: Wed, 02 Jul 2025 09:21:40 -0700
Message-ID: <175147330025.1004940.8501762790281649413@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_092142_216909_2D6BC49F 
X-CRM114-Status: UNSURE (   7.39  )
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

Quoting Andrea della Porta (2025-06-23 14:46:27)
> Declare the positional index for the RP1 MIPI clocks.
>=20
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

