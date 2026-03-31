Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4BC10F9310
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 23:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVS8vnwDDp67iG/gjIG0ZPUsJ3Y7Nryk4cO6gyrgH3o=; b=VTAZQMHGayTByyLMEXTgzDSmwx
	6sJL1Yy8cnK9t0Wi57QOjJ7BAp7sXU6bTTDIIjCqhE7io2hWa/8mZ15+7CtkprQVhU88CPdH/urfe
	5FndxxurbaaMZMPW2bQ8gprO4SPy1Z6+PUEPClYI5CAYBzVaSg2vDRqnZi7F3RLQ/KatSR/nLPj44
	NsmvNjDmjtOfobPACWCnY0N3x2Ce66oSnk7QhqNG/iQjA7TcVF1ulRTqvXMo/zixGXtZMnoeYgdT9
	hun4Bcl+UK4IgtjjKCel/506H+ziyq9kG/dlFfnQQlTI/WChblr+pkbOlc7LhDaFI+c7xPuiCMesO
	KO75vCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7icT-0000000DgkA-3aIw;
	Tue, 31 Mar 2026 23:35:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7icR-0000000Dgja-3GKk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 23:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HVS8vnwDDp67iG/gjIG0ZPUsJ3Y7Nryk4cO6gyrgH3o=; b=AN8sx1QjM5M3zl1AAI2+qM9R0h
	xAB/+4IuhBDvVwyAKmk410FBG0H1Nat2S7mFTBxvzyutBnf+EuyCJIbegiitKb9lJqWmB60CfVCku
	GRbY0RUs1BeNYhCGQ1fOvHxwZ621eAT2WAGUmIAIBrGWxVQ2Lc1oMWFDUDzySHSIbcfQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w7ic9-00EG6P-To; Wed, 01 Apr 2026 01:35:17 +0200
Date: Wed, 1 Apr 2026 01:35:17 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
Message-ID: <95d6ae8e-6832-468b-9e04-dae1337a87f7@lunn.ch>
References: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331-asus-kommando-networking-v2-1-f7d72ae5d40d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_163536_180397_F523FE9C 
X-CRM114-Status: GOOD (  17.49  )
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

On Tue, Mar 31, 2026 at 09:18:00AM -0500, Anirudh Srinivasan wrote:
> Adds the DT nodes needed for ethernet support for Asus Kommando, with
> phy mode set to rgmii-id.
> 
> When this DT was originally added, the phy mode was set to rgmii (which
> was incorrect). It was suggested to remove networking support from the
> DT till the Aspeed networking driver was patched so that the correct phy
> mode could be used.
> 
> The discussion in [1] mentions that u-boot was inserting clk delays that
> weren't needed, which resulted in needing to set the phy mode in linux
> to rgmii incorrectly. The solution suggested there was to patch u-boot to
> no longer insert these clk delays and use rgmii-id as the phy mode for
> any future DTs added to linux.
> 
> This DT was tested (on the OpenBMC u-boot fork [2]) with a u-boot DT
> modified to insert clk delays of 0 (instead of patching u-boot itself).
> [3] adds a u-boot DT for this device (without networking) and describes
> how to patch it to add networking support. If this patched DT is used,
> then networking works with rgmii-id phy mode in both u-boot and linux.
> 
> [1] https://lore.kernel.org/linux-aspeed/ef88bb50-9f2c-458d-a7e5-dc5ecb9c777a@lunn.ch/
> [2] https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc
> [3] https://lore.kernel.org/openbmc/20260328-asus-kommando-v2-1-2a656f8cd314@gmail.com/
> 
> Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>

Thanks for the updated commit message.

Is anybody trying to get the changes in the forked version upstream?
It seems like a reasonable way to solve the problem, at least for new
boards.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

