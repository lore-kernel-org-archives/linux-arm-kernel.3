Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B57CEB2CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aELsIUzLiqlHggHr/vvjmtG9hFo4MABRnCl29hm0mCY=; b=gFjhIMgonE5AcOwQOrIHMi96V3
	+XyNUspI4AWuTxFsCyRTyRQ4ZAmlvCW/us4JLHDhILo6fvOFbvLgfp5c7MMwAxkf6WlK3vTWd2Vhc
	Rb+/CRjUgDJ96DZ7APKqOpJyMSxtd1cqTeOqgTbGsEpwZJ2cDY+R7Q5eLNSiMuXWL6EbjF0PHF75L
	2GoZR0kj3QBV4Pnw5iMdRr/4IqyzK8MORbQA58Pe6wCrDQ0MiXvNS/dylxZDRlJ/PJt4lG7mlTadf
	p3owGkrDclJsrpJWJTbSHaF4wtY1uPVTgauhnm6itBERF0bBoh/fbH82XBMw4rDSkBsDKIvmS3XWP
	J1B9DPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKEqy-0000000Dkhk-3JLH;
	Sat, 15 Nov 2025 11:54:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKEqx-0000000DkhW-1PU3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 11:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E4B2600AA;
	Sat, 15 Nov 2025 11:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B10C4CEF8;
	Sat, 15 Nov 2025 11:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763207641;
	bh=SFB7UaLZKoJrkoVjVZhNqv3hZFUKGA+4m7Bp1LsdL2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOMX0Fj3iIPiDVFtVpxagbIGgwOwiXzYHeNfDxdzn3Y+Drgoad1nvs/ZVmSQjT8Z1
	 1ILqDkPZgBPFl5NIhf6jgWLbKGTp5ifd9Aa0BwwubeY8Sn+v8OnkBJovhA5ba1kQOu
	 EhGYVfZQE1G9gebiPQI8/JwqLQ/bZS5Z7GqDVxu/BOnEgF4/lCH+XpC0V7wNxrdV1S
	 tPgJQViGcYmbfV7ddftluG2Bt6mSFnzcg1CAxf45RBfSfukQvPBhASjJeY79G8YxMD
	 Nf3+0+dbw8/tiB1P0kyhnmvTM+GCNU7MHmKhznPNGoi3edo6dDmVeVvAfIO8jxxRmG
	 kqOvyxMxqvcbw==
Date: Sat, 15 Nov 2025 12:53:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: freescale: moduline-display: fix
 compatible
Message-ID: <20251115-spicy-gifted-newt-3644ec@kuoka>
References: <20251114-disp_fix-v1-0-49cbe826afc2@gocontroll.com>
 <20251114-disp_fix-v1-2-49cbe826afc2@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251114-disp_fix-v1-2-49cbe826afc2@gocontroll.com>
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

On Fri, Nov 14, 2025 at 03:11:50PM +0100, Maud Spierings wrote:
> The compatibles should include the SoM compatible, this board is based
> on the Ka-Ro TX8P-ML81 SoM, so add it. Also add the hardware revision to
> the board compatible.
> 
> This is a breaking change, but it is early enough that it can be
> corrected without causing any issues.

You did not describe what is here wrong that it needs a correction.

Best regards,
Krzysztof


