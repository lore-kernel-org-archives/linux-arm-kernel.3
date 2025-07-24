Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE3FC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 00:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdMyNpyczdlOF7zghQKC0llIb5aOLp+CiZl88HV1/CY=; b=3W79x5FNcnFzaA2bmG9yxrGSP4
	w6lgR0FvgTfmqInDZFBhLc0vJ+BgqYYyVCN/6xtJqJmks8i+qssbXBlI8m8T8+Cl9s+lyWHkpLR03
	9mI+ezoGzWtI/xPBo9CuKQpBXfTnmYjWMAjDIfarE02jCiMmrKyRqXIwks6yY/9BuX49LuzcHX8qJ
	pJuGeDVBZUlSrffrH0LTdvwQEDEdgKxTO0RYImhv4rBT+hUNORoBzClDUFqjU/03S5V5ry9Zz+lfF
	lc3aCGhyVMX4GS3tDqQcLH91xW88T3uE/lyUrz0BFzL7q4b4Wt0StycXen9AGPRG/Q9b6tdYHBwxG
	7Smmsi7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejZj-00000006DLr-3CwZ;
	Thu, 24 Jul 2025 00:12:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uejQz-00000006CaW-001X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 00:03:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wdMyNpyczdlOF7zghQKC0llIb5aOLp+CiZl88HV1/CY=; b=FFjMXEE0dft5Mn5To34aMAJvr8
	FHxoLBZ+8iDP57LHB1cR5amgeViOAMJdI0zlKqag8LggouCHo55dVo9BBj3SgM/KamWMM6K2Fk0Cd
	kDuszKOEo5VSLCKafxlGKhsjfMOevUJP5Md+PFzLd5xH5RdqPMbiO++iN42cyFe19FGs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uejQf-002hyY-0O; Thu, 24 Jul 2025 02:03:21 +0200
Date: Thu, 24 Jul 2025 02:03:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: rentao.bupt@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 10/13] ARM: dts: aspeed: Add Facebook Fuji-data64
 (AST2600) Board
Message-ID: <d09667e5-992e-4ced-ae30-7a4116a72c62@lunn.ch>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-11-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723233013.142337-11-rentao.bupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_170341_037415_9A2A6549 
X-CRM114-Status: UNSURE (   5.95  )
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

> +&mac3 {
> +	status = "okay";
> +	phy-mode = "rgmii";

Does the PCB have extra long clock lines to implement the 2ns delay?

	Andrew

