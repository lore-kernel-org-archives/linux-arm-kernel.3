Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DB8109192C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 23:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7iEul8PkyqOL1kmhWdX/Hl9Wp9bzifRAyc9PTSF/7M=; b=F/zfGG64npqMFfINoXSmQtwxER
	lGgaA7b2v9Nb2O9ughlgzKHiVfcB5N51oopMSNX98TizgYCwCckyp1HFN0rqymDGpiIokgOp9FZJW
	2mdHAGJ7PThGeIlINGcjiQxQz3XqO22LmyIJeLOxeNU+v/V6H3t++c7AU+N5vO+jGDg8ihiFlqRfx
	vEmbM+EqSHq4P5jdNQ0QeaN98nEAyYnTx8aNh3ZQYby4H7a7k6lk5LiHDvqn6NiBwzE7sVFf9PwUB
	nqK/nWLRNPB3Yo5ABtkswx1kUr0Ejk49SIGJB9pgbe2afWL1vhQW/F4IJkpNs/Two/L3A/OXqct9X
	Bsy3l+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3MOS-0000000Blzn-2O3B;
	Thu, 19 Mar 2026 23:03:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3MOQ-0000000BlzP-3OJT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 23:03:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E76A3440E7;
	Thu, 19 Mar 2026 23:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C437C19424;
	Thu, 19 Mar 2026 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773961385;
	bh=4z7FT567dS5vlr7HalD/BlGQW0hDW6XnMyUGAseCIis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YzVVW9G5ffgHdcvppH8RWNQj0rnk/0/dDS/ycv+oUzbF33vjp5Ac70gA1J9WCatoA
	 uxXcAK/NHguxV116k7TbmnqlaAuuB5P5O7XERe3Kr/O3vUIlbEd6UJL1gc9eFRrh3i
	 UZP2cUJ8p7SXX3Dgnvswi1koS+utB8gX4tJRwVLI9Hl9q+2xHbxVuxyayC2gqRjpP5
	 RntrFej53D87UdPGUCrqrrJEug6CQhbvpgLRe2HRsAPcFU5bcdbxyxziwxbXrMqwPB
	 jtmDHxQ5MX6+LGwmSy3+BRzAEVm8rM7TCyeyIeMcn1kAd/XK/CzYhfwsnSC8vARFoA
	 YzmsQOEt7q4/g==
Date: Fri, 20 Mar 2026 00:03:00 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Hanna Hawa <hhhawa@amazon.com>, 
	Robert Marko <robert.marko@sartura.hr>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, stable@vger.kernel.org, 
	Imre Kaloz <kaloz@openwrt.org>
Subject: Re: [PATCH v4 0/2] i2c: pxa: fix I2C communication on Armada 3700
Message-ID: <abyAI0ANDdxYO3uD@zenone.zhora.eu>
References: <20260226-i2c-pxa-fix-i2c-communication-v4-0-797a091dae87@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-i2c-pxa-fix-i2c-communication-v4-0-797a091dae87@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_160306_864431_5CBF9CFC 
X-CRM114-Status: UNSURE (   9.03  )
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

Hi Gabor,

> Gabor Juhos (2):
>       i2c: pxa: defer reset on Armada 3700 when recovery is used

I merged this in i2c/i2c-host-fixes.

>       i2c: pxa: handle 'Early Bus Busy' condition on Armada 3700

This one can't really be considered as a fix and I removed the
"Cc: stable" tag from the commit log.

As of now I merged it in my i2c/i2c-host-next, which is my
testing branch. Once the fix will be taken, I will move it to the
i2c/i2c-host for the next merge window.

Thanks,
Andi

