Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC47CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 07:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yCeW08scrr2ACBo1vbxVy1YcULpnUDlueJqIMQ2qt7E=; b=mUfxJPC9gn5EOPtIblQbxlvEX3
	ISqfeoP186lNmkIW8Kvd0YKtj981ejwNxZPZ1HNakyYnSiEcmZH105qwKPXgYJ3FWbf/oUwDGSWyj
	z9B4QpJR9zPBYbwFzz4lXREoBhhMHpsiNqEMMB9yUUj6GBIZZwNw/O6VVz0resWt9Zu9gY2o0G2r6
	OT5fOUUsbI9b7r/tE6f54hriUGRPLSncxkYSaHJlnDsgzC4M3CsX/EQfX1uk53jkCcWEmpEiGaqHq
	zoYaT5sD/bDtiDyAwygrhb40NUZ82dleCJZCl1Lj5LouyKHkuXNRggHeyj6YNIcyhknJQjP1xVq76
	cJFsozcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeVv-0000000FTyv-3eLa;
	Tue, 28 Oct 2025 07:53:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeVt-0000000FTyS-1VfD;
	Tue, 28 Oct 2025 07:53:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 980F145037;
	Tue, 28 Oct 2025 07:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAB9C113D0;
	Tue, 28 Oct 2025 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761637984;
	bh=yCeW08scrr2ACBo1vbxVy1YcULpnUDlueJqIMQ2qt7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJ9GAhwGQiUOpcjuOp1NuWsZ3BZtwb4Eri9cttZxeRuZUm14FV9fzvpPkqAD/YJ4R
	 2YsxmfjFSooPJ8j/dKdWTQp9CEysFOjZruputzlsYvAdBjwOi+lJWEIiz+GI8fTmze
	 T8gOxlLywka3cT/6t1L/5aAu3EL+FsjmPEVXF80Y2eZcEdZYK9bTI+UgQmBRwe/RSC
	 p3Sm/0khowvPb07B5bgjZSydbQnzzhWG252l2CkCmzXu6NXTv814h5FfLwhF7lZXbv
	 e0zs3EsjocEpcO7ND3rFjhfG51I/1I7EgOtDRN3NbM4QPCNbT4BTKGaLmISZHWak+p
	 XhqHrydapfx2g==
Date: Tue, 28 Oct 2025 08:53:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, kishon@kernel.org, 
	linus.walleij@linaro.org, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 4/9] ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST#
Message-ID: <20251028-witty-nickel-pig-5bd4bc@kuoka>
References: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
 <20251027095825.181161-5-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027095825.181161-5-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_005305_414178_C669C138 
X-CRM114-Status: UNSURE (   6.11  )
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

On Mon, Oct 27, 2025 at 05:58:20PM +0800, Jacky Chou wrote:
> Add pinctrl support for PCIe RC PERST#.

This is part of PCI commit. Makes no sense on its own.

Best regards,
Krzysztof


