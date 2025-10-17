Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15F3CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSPqFe3S0bFVfaza5qOmb8ksimgWhn1Shr3aJzL1jL4=; b=nugodxs974p1ycFJDnlIQwGqmE
	P5FOXv//oa0FKTP+PywqaUREuXRUyhUXpEjOuObXy8/OSlAAOlIUoY8ptPphUZNZWmt3BVr2ndqQM
	ZoeQ63qxoFy6kMGoA5oDpqieM1wuTf3k8ciTtVzNAG7doT01NklPTUIcqYoqanqYoRXH1Yo7qnoh3
	E0d9DQUDLrBFWjnknHAw7Ks3F4typlqrnhzyNpPNtxZ49L5d09f8EIBFu1ntL/RkaM+Sa2b1g9F6H
	ZmjHjSNyh1nsY2KGHe6qrmW/3ndRz5bEXbwFcFwAaBDet+Zmc5dhSyKsrsrJKCjBk+n6IAzL6hzTG
	bJKt86Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9daD-00000006gk5-2LVt;
	Fri, 17 Oct 2025 06:04:57 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9daA-00000006gjM-0tx6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1760681091;
	bh=aSPqFe3S0bFVfaza5qOmb8ksimgWhn1Shr3aJzL1jL4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=ka4i6dPRHxsCXqsyxlL789vXXBplQXn+rQsOZupQaXGVhS2VfvbN5EspJsCrA96ce
	 N3B+5bHeblJ8q5T9XYzhouTFLvxPrm4RLuCTtaNzWtN9t7BJMlZpOROBHFgGFgyGFI
	 bMRSmXhF2HxrkiTY2lW5RxBuJI3ZLbJDd9CMXUmTNr2+LeRayr92hbPmkMtMUOdTS9
	 IVbG0COzvRSjOrytIZH5gwSwWkKs9Zuh8NvAScfaXQZkQuyQeDfgg2MwnsUYyY32YT
	 wlb5i3QnWHsFJnpw08f36blNsbgcTvPJAYU9AsnsLfmTlcSFMgTyHNggw8eUiSuiBB
	 YAhZ1F6+qrhfg==
Received: from [127.0.1.1] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E73C8766F5;
	Fri, 17 Oct 2025 14:04:50 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, Guenter Roeck <linux@roeck-us.net>, 
 Tao Ren <taoren@meta.com>, rentao.bupt@gmail.com
In-Reply-To: <20251015204840.80070-1-rentao.bupt@gmail.com>
References: <20251015204840.80070-1-rentao.bupt@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: fuji-data64: Enable mac3 controller
Message-Id: <176068109091.239120.10783664740576101312.b4-ty@codeconstruct.com.au>
Date: Fri, 17 Oct 2025 16:34:50 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cfd50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_230454_683932_EEB1C6AA 
X-CRM114-Status: UNSURE (   8.53  )
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

On Wed, 15 Oct 2025 13:48:37 -0700, rentao.bupt@gmail.com wrote:
> "mac3" controller was removed from the initial version of fuji-data64
> dts because the rgmii setting is incorrect, but dropping mac3 leads to
> regression in the existing fuji platform, because fuji.dts simply
> includes fuji-data64.dts.
> 
> This patch adds mac3 back to fuji-data64.dts to fix the fuji regression,
> and rgmii settings need to be fixed later.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


