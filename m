Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D17CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efbW/Sfe0OW517ShQC9CjQHOEKr+0UjfF7wcZYdo6R8=; b=Dtj0T2ejlPMsWq8tYxzsRt9iG5
	2L1zzr6pD4UPW5xsMoz4yyRpB/WJjS7Co5vBelQ8gyHP1MUPZIaXME9vGD+7BxQtdI3s9bpTBCkUA
	8FXWdvYxtHcZ/bMSc/cqRxU1T5Y7+HffV/ofo+uoD0oC9yq3I71QXUnzbvhUrQ+EXLvCLdftJnaYe
	v49APf4wuiFcnIGEq2WiR+37OC4eaDFpi3ffis3qHKyOepbfTBHeU+2M5vyNmhmWXO7cpBHIryDx4
	PP9qOAID8CLOGD3UWXGfBGvO+/1Bg00MCsy4Z5cdV0SbA/EfuW1U36UJvGf9XJMbknvFoVZxNqT9d
	T9z/PrVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzcW-000000084tW-1WEH;
	Fri, 12 Sep 2025 08:59:04 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzcR-000000084pl-32ls
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 08:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757667533;
	bh=efbW/Sfe0OW517ShQC9CjQHOEKr+0UjfF7wcZYdo6R8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=gQUT9pxhlZK5toz3qpJBhksN8GlW+u9S0jSBZhnkiD/iqI1/v93UiO6gp/fkoZnEu
	 BNG+EutVZjFVqSirhIOp9fSYQ62IQ4INHGAyJvkiK9+A1vB/LEavjFnLdNacsgCQ2Z
	 o6LCVucyWVOHDpGi+qSdfStgOMsE5J7GWUNCuRD/0BUcXLU5sUrMvNKoFp9QUiNLgc
	 vn3Qbpd4Q51l4mdF4ikc9hTCo0Ye6qznEroVNQNMwlE6uJhmbzZJRRBJ3WgTGzfF/c
	 zy0yPCrTWAvFjjWyhASWPxKXd3EEk8Y0+aU3hBPJ87ASCBluY6wm4OsxTvCmdxEA/3
	 5QIYAH+Ufn03g==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0A84664748;
	Fri, 12 Sep 2025 16:58:48 +0800 (AWST)
Message-ID: <9d6660f0bf5119cedee824cf764f15838622833a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v18 1/3] dt-bindings: i2c: aspeed,i2c.yaml: add
 transfer-mode and global-regs properties and update example
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org, 
 joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
  conor+dt@kernel.org, andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 12 Sep 2025 16:58:48 +0800
In-Reply-To: <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
References: <20250820051832.3605405-1-ryan_chen@aspeedtech.com>
	 <20250820051832.3605405-2-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_015859_982945_07C3D898 
X-CRM114-Status: UNSURE (   7.19  )
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

Hi Ryan,

> And AST2600 i2c controller have two register mode, one is legacy
> register layout which is mix controller/target register control
> together, another is new mode which is separate controller/target
> register control.

OK, but the ast2400 and ast2500 I2C peripherals - which this binding
also describes - do not have that facility. Given the 2600 is a distinct
peripheral (as discussed on the v16 series), this would seem to warrant
a distinct binding.

Should this be split out into an ast2600-specific binding, to reflect
that it is different hardware? The reference to the global registers and
transfer modes would then be added only to the ast2600-i2c-bus binding.

Cheers,


Jeremy

