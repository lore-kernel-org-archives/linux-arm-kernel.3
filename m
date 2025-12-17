Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89038D68BC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 22:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzcRsvXylZN9aaLtqwzTReh1wZfElthhV45WDpSLtLM=; b=uaYRu0ZFzDU9TldOzSVRIf/AgT
	8jULUyBuwINBrhRhvqatqYn9DQaFjVAaEQwZ7b8ZBXwmtuteZJiqUuJgNINOJ+Wjs4k3tDe52YUUo
	TRYtA+B+N7fcASkcwkdc6KRjHi3oosOMRyi/dqKXpkhKAN8MhCXBzT1zFjP496wLX1QMy8vMn2xtQ
	r+aS7Ax9NvQ9f4ZIP0csmTQ0mYs+cpyRQFfZ4/qz0uM8WC5Nxv8b2kOkf5MntS/tBvo0lL07myNTP
	kbQyDbfJfsWrvtUdPanTttHWJlgXc6RddwtID0+iJeSpTy4Eh1sVv6WQbLzfOmjNnWZMrTrqgubH4
	wVfawYVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVza1-00000007Spm-3KvA;
	Wed, 17 Dec 2025 22:01:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVzZv-00000007Sp8-3yee
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 22:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1766008855;
	bh=fzcRsvXylZN9aaLtqwzTReh1wZfElthhV45WDpSLtLM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fApoOOfAOl/WLHh2U99ktvCT0tJMUee5y+YJOw2D6yPmlO3QXfrC4pXyDavNvNOFQ
	 0ZrLl2bX3drG8K46ydoTHG/YL8MJMBt3Pe/eVVR1eqZnijWe1OvGNMSVrM8q7bfXJs
	 brC4+s/JlkwpbSiFhenmsEWkVTI5ibT6QqI+0gUr7p0qDPwDtBCBsWoXwo43xF/+vi
	 lMW7yiKE8BHSKDNwW7TiyML1D20eSbBYZFMhNZ2ZHfluXXf1HbQdQv358qvwkwywKt
	 VaVXXCJC+ozudhxI89GAzXLN1F4yrkcFrCPjXWe8s43Y7u44/mfwV4Ignyu/jXDdJn
	 fUSaF6GA/zSUg==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5400D7C1B2;
	Thu, 18 Dec 2025 06:00:54 +0800 (AWST)
Message-ID: <d6046a94820cda6bfcc3953d6c737152a9f0cf37.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 01/16] dt-bindings: hwmon: Convert
 aspeed,ast2400-pwm-tacho to DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Linus Walleij <linusw@kernel.org>, Joel Stanley
 <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Date: Thu, 18 Dec 2025 08:30:51 +1030
In-Reply-To: <CAL_JsqJUaKKsJ8BCNbVXe4vLVsQ2Av7VuWqf9DnUKHeLzLb8NQ@mail.gmail.com>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
	 <CAL_JsqJUaKKsJ8BCNbVXe4vLVsQ2Av7VuWqf9DnUKHeLzLb8NQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_140104_183517_8DB90EB0 
X-CRM114-Status: GOOD (  13.26  )
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

On Wed, 2025-12-17 at 09:37 -0600, Rob Herring wrote:
> On Thu, Dec 11, 2025 at 2:46=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > From: "Rob Herring (Arm)" <robh@kernel.org>
> >=20
> > Convert the ASpeed fan controller binding to DT schema format.
> >=20
> > The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> > rather 1.
>=20
> Okay, I can't figure out why I thought '#cooling-cells' needed to be 1
> here. I don't see that anywhere in the tree. The driver for sure only
> supports 2, so anything that's not is an error in any case.

Yeah, I'd started doing some digging to understand your statement about
it needing to be 1 but hadn't got to the bottom of it.

If it can be 2 then great, I can fix up the #size-cells and resend.

Andrew

