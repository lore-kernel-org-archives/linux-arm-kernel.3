Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14832C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 06:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pp9IBKUNCA/ZJDCgfry7+1Ltnk8p0iW227IRYl0yOXU=; b=MAnRwY1rRj9m0zNsGOvkp6oun1
	IztuwuyqgKH5CbgeSK+n7q7eMDII8aS8/Tcq/u44pRyB7e7GeI3pDcE6VK2TwtobIcqBQYUkVf62x
	T5XGnSzxcjeHxaTRPY6YteUG9Zjmn84ju54/gm7nviteo2EFgmdG/kyTQbr4F+egY89iaL0EhOOmg
	7ujJa/863mwoZhpTSweaErGNFq3g8zbC2Cf4A77HAO1t56BVbW8ySRVkbjT+fbk5lM7e4hZb3Q9LB
	dWY193d+r168f8rxoHCnMw0A4oTtzLohAIwdnd5w1w/bsCOcsxRJ5QF29yXGNfkuQ41Sq9LRMzpbc
	tf7jh1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnteN-00000009r19-3sHh;
	Fri, 28 Feb 2025 06:15:07 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tntcp-00000009qsE-2Mz4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 06:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1740723203;
	bh=pp9IBKUNCA/ZJDCgfry7+1Ltnk8p0iW227IRYl0yOXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ditMs+Qb4Ve+EarpPSccKWAdGQWMzmrpNYywK6GlQojWc1Vahufg9xsyjz3kGCk5O
	 gIcp3/Sj7bJmQSNN1Y6xLJrBClGqr1UoSrEbSpYEnP2EkzRUjDZorc2M1SYpPqjg4W
	 xvBjpqq5yBPccr9WMXq7iAoNM72bd2XppoXdOiBbjXj9+5UHYsjhAKKGqD+KqIYYL3
	 bw0oyu141KURV/zuC5UdSEqIRXpyP4r6johtqrPaopw+QKjfhWEIL6jLgCzH7lw65F
	 wZ0rzC32U8Uc2MEcI7qET4/5vBwqKCO3yU1mHoO7QioJWAg0Hucx8Qx3rAjYykmMna
	 MSARqv1UkfSEg==
Received: from [127.0.1.1] (58-7-146-131.dyn.iinet.net.au [58.7.146.131])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 65FE977DAB;
	Fri, 28 Feb 2025 14:13:20 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: brgl@bgdev.pl, linus.walleij@linaro.org, minyard@acm.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 openipmi-developer@lists.sourceforge.net, joel@jms.id.au, 
 devicetree@vger.kernel.org, eajames@linux.ibm.com, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ninad Palsule <ninad@linux.ibm.com>
Cc: andrew@lunn.ch
In-Reply-To: <20250204194115.3899174-1-ninad@linux.ibm.com>
References: <20250204194115.3899174-1-ninad@linux.ibm.com>
Subject: Re: [PATCH v9 0/9] DTS updates for system1 BMC
Message-Id: <174072320025.3245072.10865277615164271412.b4-ty@codeconstruct.com.au>
Date: Fri, 28 Feb 2025 16:43:20 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_221331_807193_521AE453 
X-CRM114-Status: UNSURE (   6.73  )
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

On Tue, 04 Feb 2025 13:41:03 -0600, Ninad Palsule wrote:
> Please review the patch set version 9.
> 
> V9:
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


