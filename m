Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5E2C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjkEkBPDQJ582dX+uFcTKm3bmUmk8z8f27YlZSyzGbs=; b=yJny8o7CgsaEynrHUDdgDZXtQf
	t+ViGCHLTmeKkYy7mbDn6NrqxZFJiNZq19Gawfdpj3g/lwC+aBLZpQFD7ecBLI0W+6QTTNoMH0YyA
	TSdsUnVHnRr8jZtZxhanh5HfhD/BOTEvW+E0EeF0b8cxRkjTD5ggtH/ousOqKD46zCYrHA5hi73EH
	ZXU1Fvyr4J4R7vMU53o+7Zt9ZRB+6ayi84CBGWGCPQEL2fgJ4F4WqhcYfCYZrXTRW42Xcoh8u5VEH
	/aOj+lif6DhOuAzi7LDmY8rb1NfupvztrIWAKVKh5+3rzeMj1ej5vuDMlwQfYF1DrJqlhv6vzXKt5
	/XtlK2Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taAlI-00000007RVQ-0HGu;
	Tue, 21 Jan 2025 09:41:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taAiO-00000007R6D-2bCx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wjkEkBPDQJ582dX+uFcTKm3bmUmk8z8f27YlZSyzGbs=; b=mIUi34eAzNBy5HmInVbW788CZF
	ulTw/HdVH6Ywx7HZLiEl0hWmh4O9SCe9Bo0qvk20bB79R1DwWTmzUoQNLmJQFOQKydiJjE0blKDTI
	8wGXG0+/afcvJ2OO0CzGhHdpaG/owO8QvVzWqJ0chZelbsWUeZPAPQy/jkKda0F4HSele14Mc0yiv
	935THd6q1u51LF2iM2MT2wY73c72DFRvOwmzm3DQ+vIBBkYUK2P2a52hOhRqhoeZWbNZDZ/cDhMDs
	JBXEtb42cGbltEchop3aj/opd1abd7pmj1ZuJnKZqw2FPGfxh80CgirNC/xko82jg4BXvPXy+xhtc
	Z/3rcgxQ==;
Received: from i53875b61.versanet.de ([83.135.91.97] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1taAiL-0008S2-At; Tue, 21 Jan 2025 10:38:29 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: Move uart5 pin configuration to SoM
 dtsi
Date: Tue, 21 Jan 2025 10:38:28 +0100
Message-ID: <3355298.oiGErgHkdL@diego>
In-Reply-To: <2d80ae4a-f836-4492-997c-69dac32be41b@cherry.de>
References: <20250121092255.3108495-1-lukasz.czechowski@thaumatec.com>
 <20250121092255.3108495-2-lukasz.czechowski@thaumatec.com>
 <2d80ae4a-f836-4492-997c-69dac32be41b@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_013832_681150_E26BE398 
X-CRM114-Status: GOOD (  20.26  )
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

Am Dienstag, 21. Januar 2025, 10:36:15 CET schrieb Quentin Schulz:
> Hi Lukasz,
> 
> On 1/21/25 10:22 AM, Lukasz Czechowski wrote:
> > In the PX30-uQ7 (Ringneck) SoM, the hardware CTS and RTS pins for
> > uart5 cannot be used for the UART CTS/RTS, because they are already
> > allocated for different purposes. CTS pin is routed to SUS_S3#
> > signal, while RTS pin is used internally and is not available on
> > Q7 connector. Move definition of the pinctrl-0 property from
> > px30-ringneck-haikou.dts to px30-ringneck.dtsi.
> > 
> > Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> 
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Considering that I'll request the next patch to be backported to stable 
> releases, we should probably backport this one as well to avoid a git 
> conflict?
> 
> c.f. 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#select-the-recipients-for-your-patch
> 
> Essentially: Cc: stable@vger.kernel.org
> 
> @Heiko, this one patch isn't really a genuine candidate for stable 
> backport as it's just moving things around but it'll result in a git 
> conflict when backporting the other patch, how is it usually done for 
> stable releases?

Just Cc-stable and possibly explain it being a dependency in the commit message.

And patch2 should ideally get a Fixes tag



