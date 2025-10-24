Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9D5CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZfVFPPVci4GUAmOUXfZfQZBdluA6oZlONV9IUe8Pos=; b=iX5yXDYwjkzOUxH8O/fb4EyIdA
	J6kdtVlDnaHAKFOTCuWg3nL4NXeY7Wp5zBpPwsXv4jhOcLu1ebpxQkh/9w8ikt6V5eTutEC/DhNez
	wsiUcQ9tHEZbC78rNmkqhN7YkwRZtv1QoDRIx1STOovp7JJX9haQUCaSiidoqbTPJ2LJb8CIUGa58
	mWeKsoJDdhSeR0suDX+cSSYtcvGgD+0hz256sNFdeBrCskVBsJ/Zy7yPWX1sk3YknoRlVZ5lPg6OX
	H1WC9XjIJ/2QncnSF1fu9e4zpFqhRW88o+u6IU+ZVrCoolXonrO3Ev5wlIr+7dlS+v3IIMqh1/hjv
	ATuWVAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDN5-00000008kpr-0Qbi;
	Fri, 24 Oct 2025 08:42:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDMx-00000008kn7-3Pcw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 08:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761295313;
	bh=xZfVFPPVci4GUAmOUXfZfQZBdluA6oZlONV9IUe8Pos=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QdSsnlyOf0QUVeogjKCGYkZww/gZfXB4OgrMZ1sqUAMhfbzOHiy4r9c1xnXsRXoKi
	 GYIHmk+q49Z4uKdasQ7kKFbCOJyKGJdN4BlMEXYPltF6UXs9xyeFqPFuzCZ7Xb+Tnt
	 Ml2JBDe1pZERGcJ+wbfpP9cXVZA6m7SR7aJSegGeMM4/IEk2l41hsbGzgjxReVjtWD
	 VSZvBLp/pdYMDZ+Iyiiu+fWujwYDVCN+rZWhHXqWoXwk7P+oH/b01nOqnRWcafwrWD
	 bIoiTjByPrVq0IE88W7XeP3cNeh6wFzCYNj9BzGZld15rFKMJVEgFZ0WlJxJxerlK+
	 19XYnV6k5PaKg==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BC02072F33;
	Fri, 24 Oct 2025 16:41:53 +0800 (AWST)
Message-ID: <76a0b578efb62a6e6bd7dafd477fa15b1062a09c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrew@codeconstruct.com.au, p.zabel@pengutronix.de, 
 andriy.shevchenko@linux.intel.com, naresh.solanki@9elements.com, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org,  linux-kernel@vger.kernel.org
Date: Fri, 24 Oct 2025 16:41:53 +0800
In-Reply-To: <c20e0b8a-ec59-4359-ba5e-1a616fde9894@kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
	 <c20e0b8a-ec59-4359-ba5e-1a616fde9894@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_014156_040723_099BB93A 
X-CRM114-Status: UNSURE (   8.66  )
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

Hi Kyzysztof,

> > Not much different than every other soc. All of them are separate
> > IPs.
> > Look at any Samsung, NXP or Qualcomm binding. Separate IPs.
>=20
>=20
> So let the move happen, but please explain in the commit msg that
> devices are completely different - nothing in common - and thus the
> binding will be different. We indeed do not keep completely different
> devices in one binding, but based on commit msg I had impression this
> was just major block upgrade.

OK, makes sense.

Ryan, let me know if you need a hand with the commit message changes.

Cheers,


Jeremy

