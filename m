Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8A9CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 04:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVMHhWMWW+z0ftn6nPGu/42b6y9+COcMk+xOQhhhwi8=; b=wXeCQjXUk2FOr9lg8bRxwtx54C
	HvDn9jRLdlFpQl/i3YpnvYs8RnD/1rj9F0Ts+uMPuwvT+w8UfmruGJ9YIuUmDkjrZKieDPCYPMaoZ
	qR4zMHU4FoUmnE6WVNOVDUBd2n1PPbQn3uugUXDOubGy+N7WwZs/Gdt/A9GsR6fIpWJOyGE49fyf3
	1dRw3QWbmskaP96Os4ziLnf2LbQ9iIcq1zTt36U4yzsN8maTQMsUKuXyVDMzpOaWzrbvLNTUqXa1k
	iAUAoMneM7p4NkSgMQI8ZSgsBkYC507sMzHRA8ca0bfsj1OSld/P9IBmqSIgQIdo+poL8u49cbWY2
	LaUWE4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1Bx-00000002ncO-2cy2;
	Mon, 15 Sep 2025 04:51:53 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1Bu-00000002nbB-3vL3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 04:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757911906;
	bh=BVMHhWMWW+z0ftn6nPGu/42b6y9+COcMk+xOQhhhwi8=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=bPIeS0xzB0UGuxDe0qaUYJe5B5ngK9Udw24LmmQDg3olfuibtVqhZDjmR9qPA1uf5
	 6e/O9R4ScNXSvFcagUEcZe+d7VQdQzTqPt9tV57OY6qmcojbUL7dyzzWqsYs9X6nEb
	 zFJA74uy8JM1C6BI3Db36OuzJhwQGSXsT1c9pu/VatP36fASJG7DVKcTYKTktn0xvW
	 vaSv+YmdXDAxdaHgfOWkRLRLD6b3PVLImsj4dOB+x53AMp73yDie/sla6ENAmChbQl
	 e4h7RfL6ZqZsOlwxxoQsSJmW2NtlUhxr7UCJa/pMYIbhEFfIB82iZiquTdQ8ffuc8O
	 5a3yTSkIEy7rw==
Received: from [IPv6:2405:6e00:2430:fb15:b2b4:1872:3690:c682] (unknown [120.20.190.44])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 398DE64CF0;
	Mon, 15 Sep 2025 12:51:42 +0800 (AWST)
Message-ID: <67f2276e99640bcbded80560e8b8d2922b731e81.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rebecca Cran <rebecca@bsdio.com>, Krzysztof Kozlowski <krzk@kernel.org>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Mon, 15 Sep 2025 14:21:42 +0930
In-Reply-To: <04b0799e-b0a3-4dbc-98f3-239869c79305@bsdio.com>
References: <20250911051009.4044609-1-rebecca@bsdio.com>
	 <20250911051009.4044609-3-rebecca@bsdio.com>
	 <1e4c65c6-4745-45e2-9e20-9d2e69ae2ea4@kernel.org>
	 <04b0799e-b0a3-4dbc-98f3-239869c79305@bsdio.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_215151_195016_EBE8D230 
X-CRM114-Status: GOOD (  13.96  )
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

Hi Rebecca,

On Fri, 2025-09-12 at 17:37 -0600, Rebecca Cran wrote:
> On 9/11/25 00:29, Krzysztof Kozlowski wrote:
> > Never tested.
> >=20
> > It does not look like you tested the DTS against bindings. Please run
> > `make dtbs_check W=3D1` (see
> > Documentation/devicetree/bindings/writing-schema.rst or
> > https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-s=
ources-with-the-devicetree-schema/
> > for instructions).
>=20
>=20
> Am I doing something wrong, or are a certain number of validation issues=
=20
> expected?

I expect you're not doing anything wrong there. There are a number of
historical warnings from the ASPEED DTSIs. However, generally, the
policy is as documented here:

https://docs.kernel.org/process/maintainer-soc.html#validating-devicetree-f=
ile

>=20
> For example, I'm seeing these - most of which are from aspeed-g5.dtsi,=
=20
> not my dts file:
>=20

*snip*

I'm okay with taking new ast2[456]00 devicetrees that don't introduce
any new warnings of their own. However, given you're contributing a new
devicetree, it would be super helpful if you could look at removing one
or two of the warnings from the DTSI while you're at it, as this
improves the utility of the checking tools for everyone.

Cheers,

Andrew

