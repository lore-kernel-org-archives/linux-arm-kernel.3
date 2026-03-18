Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D53BFCD0A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 03:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQj0bFjWadUcgXbTgg6MGFPtwTABJbc7PhB3q6d4igk=; b=QyVK9cW3HFLj0xggtXZk+MgJLi
	gOm0uwDeS6ZX9V3otenL+XVdLpXOeY/4e8Od/Cm/EivJWTjj4s/VUXzhpp4/wLUzTQCOr7FxWACDp
	skj9qWOt2Mbk5XsOTZaP+kOokEnYu3G1qMSwJqNQUFvVrbGRGiGRz1Wvcr3iAjJCrB4GVaYrvlg5q
	rRtXj3yEfm1fVvglp4dAWTNOcXAymRGBVlxNbed/m1Xxan3kl+pXuN/XXbbAAlf1/FVkUjIXi6BsR
	t21kfmizu7dya5DDTV+UTrnJOBoDhBt4bvIFNM+I+3iHiLfeQQGwivxjq9OeKfngNSaTss6NhzXvP
	ZvoNh+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2i3t-00000007jnP-0CNh;
	Wed, 18 Mar 2026 03:59:13 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2i3q-00000007jn4-3lD3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 03:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1773806348;
	bh=bQj0bFjWadUcgXbTgg6MGFPtwTABJbc7PhB3q6d4igk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Sh/J5eSVXfwhiP18su5vv07xvYT6L7MM5NHAEQd10+lSARv/26zjCToqf4y8cyS+c
	 WCYE5i/0a0mUgr+l6ttC3GKFcmowYUrCMYTeD2y8GEPthvB8tTzH5R9x8Pk93J5iId
	 ca/Wim3vHxuy0ije+8QA25qSEWIbxpozyC2vYhhtN2aWHs1ecXCkcn0f0pfENGR5Px
	 DAkuJyBolfqt7UUFUofoSnYX8F8erm8PXO+pFi7y7/Isr+9ACz48pU8CmKu5zS8/hU
	 vckifOR1eXQOQnve7GFWLD5q9/TJQX/bksTumzuyKQygO/naB7R6+Vk+m6GUlt7PGl
	 zGuRfKS64sQjw==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ACC9560C33;
	Wed, 18 Mar 2026 11:59:08 +0800 (AWST)
Message-ID: <20ed3dc6f6841435a2c9f8b3cc51a3ca12a9ce63.camel@codeconstruct.com.au>
Subject: Re: [PATCH v26 2/4] dt-bindings: i2c: ast2600-i2c.yaml: Add
 global-regs and transfer-mode properties
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
  Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>,  Philipp Zabel
 <p.zabel@pengutronix.de>, "linux-i2c@vger.kernel.org"
 <linux-i2c@vger.kernel.org>,  "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Wed, 18 Mar 2026 11:59:08 +0800
In-Reply-To: <d5ae7e63dd5a39ffa26002a3a5988eb0d74cb189.camel@codeconstruct.com.au>
References: <20260309-upstream_i2c-v26-0-5fedcff8ffe8@aspeedtech.com>
	 <20260309-upstream_i2c-v26-2-5fedcff8ffe8@aspeedtech.com>
	 <20260313232125.GA3618633-robh@kernel.org>
	 <TY2PPF5CB9A1BE6A19D439C675AF5028C13F242A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
	 <7ae8222bf6abd83a3c2ac976f54a2edbe4e9727a.camel@codeconstruct.com.au>
	 <CAL_JsqKQp=HyA90rQ2Hzu148k63k5-qrGLH6sEHXNcjAu3QSwg@mail.gmail.com>
	 <eeac1db0a5692ae45b5528a85ed1510b8b1cf771.camel@codeconstruct.com.au>
	 <TY2PPF5CB9A1BE6EAA73D3AD6F75F1ABD53F241A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
	 <071adc5f76b71b3e8d2691945e7b178602b285f9.camel@codeconstruct.com.au>
	 <TY2PPF5CB9A1BE67264C727ACBEBE4642C7F24EA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
	 <d5ae7e63dd5a39ffa26002a3a5988eb0d74cb189.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_205911_152160_5BA5BBB8 
X-CRM114-Status: UNSURE (   7.98  )
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

> > Do you mean sysfs select support mode selection(byte, buffer, dma)
> > Or just force byte mode?=20
>=20
> I would think that the best approach would be a mechanism to specify the
> mode - either byte, buffer, or DMA - if DMA is indicated as available to
> the controller.

... with a sensible default mode (DMA if it is available, buffer if
not).

But none of that logic relates to the binding, it's all driver
implementation detail.

Cheers,


Jeremy

