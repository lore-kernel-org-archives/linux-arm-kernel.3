Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2892DD4336B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 05:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nymakgngEqa2xYkDvgOemL5CEXBpo6nJY1AxWDMssYE=; b=VMN3S/6r2Hma2gW4DI20LWbpXj
	tQgifmyegnziXB0qQEIV/LZNhFD9i0AoHq4o+Nea4lkfmoaM07ct9b3r6PdFlrLz+O6OjPukKjyuw
	Dd4ar4BzKRExU/dNhBcXRGiPpE1XwobXa9MJI8IIhTXJ22ROzOR3qXrj8L9tBC8Re4Mv5LZKwTIgv
	GmQH6ofVZRJ645TILuMKRSKIWMrK6VIdBCmmIQQxEwoRNfi2/PWHsy6QMDHdPp4130SZKrGzO63az
	2Gz4WIBH266UJEN/ogFNU83/Ie6YfUy5mxoFhuqD/gTXQ8oaQ+089Mw2w3O5SFUEmLVB8PIQj+J/m
	u5A0kLFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTw6O-000000007kJ-3shT;
	Fri, 12 Dec 2025 05:54:04 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTw6M-000000007jh-3gQd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 05:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765518832;
	bh=nymakgngEqa2xYkDvgOemL5CEXBpo6nJY1AxWDMssYE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Uw8M944ddkCuo7TKw8vEj0pe9OVwdCUR8ds3VFZPFMoGmmwDDDDAS5gllwdBymtwM
	 rlDGAzgGt52r4DknCy8cSmpnb+STxVnuP+58X3njR8XEUE3LPK8wc55CYRB6ncShPt
	 Q9HW3vTE4rmKy34NEZULugrDyDarw5QL4j5BlqZUJU+1EpGr018H44Wss2dG4RtA5z
	 G0nU4S+rVQ/srzIa5VHUITWlgoDw8+w6nQpRxd33duGKJDOJ6rJApS+PrqshimNe6q
	 hPGK3ovU2t66VXQENfH5OUA8po09EOFJqrDF52BnIjDrfd1EqSGAojvi8IYet+JMx4
	 ThFy1QSuMkcOQ==
Received: from [10.200.3.67] (fs96f9c361.tkyc007.ap.nuro.jp [150.249.195.97])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 16C2664DF1;
	Fri, 12 Dec 2025 13:53:46 +0800 (AWST)
Message-ID: <97f2eee63e1ed908866c10721b9f0a57036723dc.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 01/16] dt-bindings: hwmon: Convert
 aspeed,ast2400-pwm-tacho to DT schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Linus Walleij
	 <linusw@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-mmc@vger.kernel.org, 	linux-crypto@vger.kernel.org,
 linux-iio@vger.kernel.org
Date: Fri, 12 Dec 2025 14:53:42 +0900
In-Reply-To: <f17d93db-f96b-469d-88f0-0878a0fc9fe7@roeck-us.net>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-1-21b18b9ada77@codeconstruct.com.au>
	 <f17d93db-f96b-469d-88f0-0878a0fc9fe7@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_215403_118697_09ABEBF1 
X-CRM114-Status: GOOD (  11.68  )
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

On Thu, 2025-12-11 at 12:27 -0800, Guenter Roeck wrote:
> On 12/11/25 00:45, Andrew Jeffery wrote:
> > From: "Rob Herring (Arm)" <robh@kernel.org>
> >=20
> > Convert the ASpeed fan controller binding to DT schema format.
> >=20
> > The '#cooling-cells' value used is 1 rather than 2. '#size-cells' is 0
> > rather 1.
> >=20
> > Some users define more that 8 fan nodes where 2 fans share a PWM. The
> > driver seems to let the 2nd fan just overwrite the 1st one. That also
> > creates some addressing errors in the DT (duplicate addresses and wrong
> > unit-addresses).
> >=20
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
> I am not sure I understand what the plan is here. I am assuming it will b=
e
> applied through a non-hwmon branch.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Thanks Guenter.

Apologies for confusion there. The series is currently a collection of
miscellaneous binding stuff that I felt needed DT maintainer input, so
I avoided adding driver subsystem maintainers in To/Cc to minimise
noise. Rob's feedback at [1] needs to be addressed - I'll make sure
you're in To: once that's sorted.

Andrew

[1]:
https://lore.kernel.org/all/20251211170333.GA1557987-robh@kernel.org/

