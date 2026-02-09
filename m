Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3B0EF06FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 00:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7MCCqP45D0dY/QaEr0D6Ms9HT2gRvnzr4MI+SBARCU=; b=ZEO/8jfST72+T2mQXf/PJY12tS
	nI2bf9DVVML/f+uVNtQQ9oSQBXmKFzGVk5pH5YnGH1eI/v+Cs4khUZcR4/a4XJOvwOTYNTpdJYZVh
	WTXJ3dz9Llw7a+Pdb6vbkNjtaIlQeXURYjkT3AMTtXZE7yvMIC6PPof68O3RRnsXdky3aOQ8AwC04
	uVkxlBoNSUzhP+NxuHYmXaZ8mMTJAQuixyw63zyMQHr4dYGbxUuhKytxQqyj015ReZVlxD4P7MFQz
	U0H4Q57xFWXYu1EJ8xeEg0jmfKOmD431lH1zwLVio6ABbFM0A0N4xuPhXwU44mveWWk9ffaaRvD12
	S0k0MlVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpFTf-0000000EcUp-0NmT;
	Mon, 09 Feb 2026 00:50:11 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpFTc-0000000EcTx-08NS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 00:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770598189;
	bh=r7MCCqP45D0dY/QaEr0D6Ms9HT2gRvnzr4MI+SBARCU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Qsv95FT3JdSqVtCZt3NjwNcCnqE7TpLFpUEwRs6P6zgVBZepyXw4WDPudVkrI+rlI
	 +DXpoZSJPRHqZ7iytabmfOudbuTL5Se9YCVItkelw2W0caa3RjAM5gagZlCmXBk84T
	 9N38H53KsEEJ3lCDRxmmEMx3LyLm3Zg9g3PpJgC5z95PqkrNDLcTMQDBRttEESbign
	 CD0XUf2CM0ofN1ZTC7ztpbtxQiK9bhdHkNYGBVj9f5Efe8a22do6Eh4DUiO+sIuvt9
	 xtk3UdqIdqPTpNQMosbHFMN0JUkEy4s9jJiSUmc0vulrOd0WImOP1GKfq/NJgsuTdT
	 tvYnDJS+HrL3Q==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B77AB60360;
	Mon,  9 Feb 2026 08:49:46 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Anirudh Srinivasan <anirudhsriniv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
References: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
Subject: Re: [PATCH v2 0/2] Add device tree for Asus Kommando IPMI Card
Message-Id: <177059818618.793195.12078369893551899945.b4-ty@codeconstruct.com.au>
Date: Mon, 09 Feb 2026 11:19:46 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_165008_307044_62D597A4 
X-CRM114-Status: GOOD (  10.03  )
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

On Wed, 14 Jan 2026 23:31:06 -0600, Anirudh Srinivasan wrote:
> Adds support for Asus Kommando IPMI Card [1] [2], which is a PCIe card
> with an AST2600 on it that provides BMC functionality to any host
> without an onboard BMC as long as it has a PCIe slot. The model name
> Kommando is based off the model description in the vendor fw.
> 
> Currently supported functionality includes UART, booting from SPI,
> KVM functionality(usb gadget for host, reading VGA framebuffer from
> host) and LED/Power Control via GPIOs. NIC support is not included,
> requiring additional patches which will be sent later on [3]. The
> entire BMC functionality has been tested on an OpenBMC build
> available here [4] (which uses a modified u-boot device tree [5]).
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


