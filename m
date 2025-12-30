Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EADCE95A6C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 11:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8mJjZZ+g0Ane4YM5RznnhE0rIh8fOKol1HCX6F0D/o=; b=KIwPSco7EVdnKllZwxKOuH+Sg4
	TS+bEWBGQgliV64ts/OXkLRLEIgyj5zWwgRQKsnqzk0XJWxakEQhOFQxXCFx3j56B0PnzxgZyohou
	XAMEhYtkTMlZJVdVnNpYnfhs5t8KwG2N+u4k6j5KjtM3NSPwA1XKXp8p0ar1eeW6dG0i2ln4JcHuU
	ZoqtbWM7xWWByItLC5DOaLZJpD6dLqaP8UAZNDZYRUxPayViKfTWQ9fQuMQLXFSosappaggyyVvEF
	K2g6tGrhKSiLwHX+MQzEdnj0M6lpjJwzF2CscsDFANwIYI4cXSIEEyu8TZi/1os5kH7ive8FK3uo3
	c+mSSc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXdk-00000004kG2-0fHf;
	Tue, 30 Dec 2025 11:11:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaXdh-00000004kFa-2Fgu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 11:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q8mJjZZ+g0Ane4YM5RznnhE0rIh8fOKol1HCX6F0D/o=; b=BPSqJZYsaDZ7VTxZxtC4xtF6us
	nnjomjcgInese737gA0SIxpFBCz7H0JDBXU54soQ8qOVSs5CkVNUP9O+4a+uuggu5w1dTXvExFTl3
	PRjqdtUvdlsZscGftFRaZDTwJ+quhkt62MOip2ShMGaaaVfA1cM/CWjeCEkgxtQBiAic=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vaXdU-000rjY-5P; Tue, 30 Dec 2025 12:11:32 +0100
Date: Tue, 30 Dec 2025 12:11:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mamta Shukla <mamta.shukla@leica-geosystems.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	bsp-development.geo@leica-geosystems.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] Revert "arm: dts: socfpga: use reset-name
 "stmmaceth-ocp" instead of "ahb""
Message-ID: <8997facb-068b-4088-b996-1c0898dea19a@lunn.ch>
References: <20251229-remove_ocp-v1-0-594294e04bd4@kernel.org>
 <20251229-remove_ocp-v1-2-594294e04bd4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229-remove_ocp-v1-2-594294e04bd4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_031145_578373_DD217AFE 
X-CRM114-Status: UNSURE (   9.24  )
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

On Mon, Dec 29, 2025 at 01:17:19PM -0600, Dinh Nguyen wrote:
> This reverts commit 62a40a0d5634834790f7166ab592be247390d857.
> 
> With the patch "add call to assert/deassert ahb reset line" in place, we can
> safely remove the "stmmaceth-ocp" reset name and just use the standard
> "ahb" reset name.

altr,socfpga-stmmac.yamle says:

  # TODO: Determine how to handle the Arria10 reset-name, stmmaceth-ocp, that
  # does not validate against net/snps,dwmac.yaml.

Please add a patch to the series adding stmmaceth-ocp, but mark it as
deprecated, and comment that ahb should be used instead.

    Andrew

---
pw-bot: cr

