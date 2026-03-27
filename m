Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6258710ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 12:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBsax8nGU7llN4Jh0OptfmRNsfhKlIWfNl3VBT7S9ac=; b=3iSTIzEFVINU2oXjpBNrU8S32E
	pbLOZvClqn4KMlRQeUAOUhNJDJ/gGpU4gN+YGOljdboalKcnDHM08IR6rr1Rgl47CAKqzhHQh6vX0
	2ZP39F3bE5yOJwXxnnX7ptoUUkfsPMrziCgB0i0vKJymSM1/YZYsfhOMMCaDExTncedbGWgxT7MhP
	QzyQJRyurELgWJYEmTGvdZTRJB509iRFvRy73R0SOLpuq/qzsqzgYwT+He15F0+UGkVdY1B1IaUYU
	dM879eBAMnsg77SZ8THgCetVtB4O6xoONUCWSWJWYq0CdnJ02hg9IfykvSPDaAaD6yBNEGVqErNeA
	YPv0OQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66Ey-00000007M3G-1OwN;
	Fri, 27 Mar 2026 12:24:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w66Ew-00000007M2t-2yuP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 12:24:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YBsax8nGU7llN4Jh0OptfmRNsfhKlIWfNl3VBT7S9ac=; b=QkH+s3Mg5nHaHO5ytrpYnfNEqT
	pSS7IO4qPn2kLaYbNxIdYn0sRu9H2b6w++cleyNzuewwei+ZWrc3sAiQQFzvvI77LBhTwNBbdPN9N
	+4BOjsprnmxS5eqKBfjhVKGP/faZkGh/+0waovhTC00xO5f4ixqTYbbmlmzJnm9x2DpQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w66Eu-00Dedw-NU; Fri, 27 Mar 2026 13:24:36 +0100
Date: Fri, 27 Mar 2026 13:24:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Padmashree S S <padmashreess2006@gmail.com>
Cc: gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm: marvell: Convert
 armada-380-mpcore-soc-ctrl to DT Schema
Message-ID: <3c995404-1b58-48bb-8606-bf7e60a494bf@lunn.ch>
References: <20260327114653.593582-1-padmashreess2006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327114653.593582-1-padmashreess2006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_052438_745400_9CE78BE2 
X-CRM114-Status: UNSURE (   5.40  )
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

> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Gregory Clement <gregory.clement@bootlin.com>
> +  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Please drop Sebastian. He has not been active for many years.

       Andrew

