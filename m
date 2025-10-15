Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B782CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 00:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a11Ly75LEhJitU7lNgDTcJn7h18/2bw5D0PDGOg2uQ=; b=eE/9WdRfokClFYfpEEhQDkahIf
	eHPbA4zCFTJbbSZZ/5KKZT9x1JG4u3LylNswod85bMfQ7p77Fny95YjJ524bvrqHSVKPvrUJalggS
	/zMrVZFZ6M/rminmAJQFgKW8slbIDEXrRilOtbBmj2LE9dKYQ4OKHIpz4TDkaFWyBXVtiAdCmNY1u
	de78c5L3O50X9U76AHoxBsmex9ZUC17fFmKXEKnvEcC8faXFCzgOzzlmeX+aZNb9fuxnoZvb7NwCq
	qS7QFUkpAKQF9g6Wh1HM6qbTDvvj1zRtPsMCA718RLTttsSCPJugVk5W90Dpg1BR7aVm95PxALhUf
	6s8Fcq/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8p8i-000000004ny-483V;
	Wed, 15 Oct 2025 00:13:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8p8g-000000004mx-3mmz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 00:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2a11Ly75LEhJitU7lNgDTcJn7h18/2bw5D0PDGOg2uQ=; b=MU2FHFDBYBDD2Cwr2NgqvMr4FQ
	c97EMfO7/hKIxqVgd5c9mkR+mPAKvHv+FXXOd0/DcyhkYuHV7WnpPzpBCocQ4CMYHVX2Xaoc0T3NT
	ClOWqa/a0Ht0CtD5G5dKPi0tRsVA0PIMu/QljKdRLn7h7AH1MTzMGSqTYWOCUEuAxlT8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v8p8J-00Axwr-It; Wed, 15 Oct 2025 02:12:47 +0200
Date: Wed, 15 Oct 2025 02:12:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <rentao.bupt@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
Message-ID: <2cf3132e-d255-48ca-b49a-f7b6303efe50@lunn.ch>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net>
 <aO2kLyxGlGt12sKD@fedora>
 <ea64d3c1-e517-4bd8-9a2e-56432f286347@lunn.ch>
 <4e099ead-e6df-4489-a775-1730bc852dcf@roeck-us.net>
 <f801a4cb-3d27-439c-82f2-d5ee5aa0d810@lunn.ch>
 <7197bfc7-fef6-40b2-b3f3-182e9428dc12@roeck-us.net>
 <33b9d6d4-bb2f-47e6-8d3d-94a2ca2b8474@lunn.ch>
 <aO7RJs8ceO3mwjn4@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO7RJs8ceO3mwjn4@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_171310_936382_4847D865 
X-CRM114-Status: GOOD (  12.23  )
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

> The fuji-data64.dts was copied from fuji.dts mainly for larger
> persistent data partition (64MB), and the latest fuji.dts includes
> fuji-data64.dts (instead of vice versa) because we wish to deprecate
> fuji.dts in the long term.
> 
> So it is a regression for fuji, but fuji-data64.dts is a new node..
> 
> My original plan is to add mac3 back to fuji-data64.dts (which will fix
> fuji.dts) when the rgmii fix is ready in aspeed mac driver, but I can
> add it back now if we need to fix the fuji regression asap. Please
> suggest.

Yes, please fix the regression.

> BTW, the current mac3 settings work in real fuji hardware because rgmii
> delay is configured in u-boot.

Which is the second wrong in "two wrongs make a right". Neither
u-boot, nor the driver should be adding delays with
phy-mode = 'rgmii'. That means the PCB is adding the delays.

	Andrew

