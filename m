Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D061D232C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 01:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3E163uI3K5tcHbZm92cmc4Zh/3hUlsioPVQnfeSCfU=; b=V259h+ThanmyKA7B3hsGDKEhqU
	vQSlEm7LKIZLJ7GCU8zCCcoZVmthKhVDBTsK3MSg0TFu4SwVZWKrszk0eKP60c0T+38MNV5+le72D
	EP7ZsENRk+u7Mz1YvF135PcxL6GuLgCItdr1skKGVH8vypThpq8o2j3SEuhbdKsT3tp5adV9SSbtz
	d+yyzm2mG6vduFT30LtJA30fshY1wP7wOjwko1Jd+tlq9cSlAEF/lYygl/Lz8JJSbndf+zad9OeQD
	28TG5MqrWtu7TTqJvRL8Xck2iu+ZyS6EUYi6qJLO2v/ChSQWVN8PZGWcPDpHbd3iJWc0ei5CaS4ZN
	gz/J1FCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve15u-000000013ft-3YoL;
	Fri, 09 Jan 2026 01:15:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve15o-000000013fN-41PW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 01:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767921306;
	bh=q3E163uI3K5tcHbZm92cmc4Zh/3hUlsioPVQnfeSCfU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LRIkXzIr3s7sm5+72Xzzm8SjVCwh35y5UgkNyHoV+JM3WTIw4jCZ0lDvwCm+aPN0e
	 OQgFLIKM4BqvXo0NDLP3ls7rFqmmBeyhe3rnpJu/pg93332Xw7ohD6Pd9ZJ/hjBMlU
	 PRjuB0y52YZmZ4+MH64SFaK4M4cz7aGbppx05rQHhJZ74p/FIDNPTDWN0K4c0V0JgD
	 wiw55qfCcmMSwZ6OUkuCfyWIamYz6ikXWYRWi0kp9pEh45rf87ky9C+o4xQpR/1WKQ
	 AYxvTEvGFmjwoc8wcX4fj2oaw7HDda+hVz5pALgfHA8ZdaPbXUesk0VOJX+gMBis+I
	 YapIA/GolbjCw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 50B3D7E142;
	Fri,  9 Jan 2026 09:15:06 +0800 (AWST)
Message-ID: <0671df0ea3568056e4d46112c4c9d132c64aed01.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 02/16] pinctrl: aspeed: g5: Constrain LPC binding
 revision workaround to AST2500
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 linux-hwmon@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Date: Fri, 09 Jan 2026 11:45:05 +1030
In-Reply-To: <CAD++jLmNGrDt3_w=DFnBnjEuz3LN-=uc1o9KHv1j=4gbGPoPQg@mail.gmail.com>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-2-21b18b9ada77@codeconstruct.com.au>
	 <CAD++jLmNGrDt3_w=DFnBnjEuz3LN-=uc1o9KHv1j=4gbGPoPQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_171509_220331_DD8A79D9 
X-CRM114-Status: GOOD (  10.48  )
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

On Wed, 2025-12-31 at 22:37 +0100, Linus Walleij wrote:
> On Thu, Dec 11, 2025 at 9:46=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
>=20
> > Discovering a phandle to an AST2400 or AST2600 LPC node indicates an
> > error for the purpose of the AST2500 pinctrl driver.
> >=20
> > Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>=20
> Also pretty obviously correct, can't I just apply this one?

Yep, I'm happy for you to apply this one now. I marked the series RFC
because it's a bit of a scatter-gun set of changes and I figured there
might be more feedback than I've received so far :)

Andrew

