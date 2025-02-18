Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D0CC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 01:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj40kfo5LTXmVRg+URNHrrqgZztW7N+flpz//iXaH54=; b=NYVyaN9AERy6RrsR/fr2wXnPgF
	e3hu5K98GY4HAsoqXxxPuie/AHa5jrYZujhAm/iRn2uPZMWD3OfprEVrtFCro5GffcvIDktfDmlDa
	4WbpH3veNPY9T+cm5mJf2v25RshG7ivAetImubA53OKxn7UZ4OFXd21/2q7rlI/22EmSy3G7SbE1J
	rgKil/On2xOIYw113bw5525wsim/0gbcF98rAbEDc579okOurJK3MG/qsSZMlWZCOHfFxA9Gb0RUX
	oEkX3UrnwAQVEqDCtXg8MlbcYq1zHg5lu87u2yG48BxGOGt3WdVUASyvE7C8Nb9WLj/RrDP/1+Dkn
	9rBPCNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkC6z-00000006Ot9-33PR;
	Tue, 18 Feb 2025 01:09:21 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkC5V-00000006Ojn-45hH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 01:07:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739840868;
	bh=uj40kfo5LTXmVRg+URNHrrqgZztW7N+flpz//iXaH54=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=I6aW0j/Q7wosLhgwWVgS2ECPPxJu0Jz5eA+x22jBTYj9oIDxRj0FBplmhlWK8By0V
	 cs53Kda7flynNbNsRNveiFnXSyouKwqp6kKuUiYHNkxHMQtJQOppXaT41G5fbUhGvF
	 nqP9xFALQGgh4jMBFpedK0oE4DYmcS/nghS32kdsni7oVy2DYHgNj6bVuRC8czWgef
	 Qok189hdfmtVLn3cIH+ytCjNyMt81Zeht6hDfg02nqyLLi8/2NbRTIstrGNChAVJpy
	 FCpsFwNlmLu9sJ4dqQCdUcbO3tU/o+hn2NutXREhRWOzEHi+2oymvBxf4ppsW5CdXS
	 W2pCgR5F49Nmg==
Received: from [192.168.68.112] (ppp118-210-165-49.adl-adc-lon-bras34.tpg.internode.on.net [118.210.165.49])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DA66B759DD;
	Tue, 18 Feb 2025 09:07:46 +0800 (AWST)
Message-ID: <a8ff6545da9dceb2b745e6301e1f997ba97776fe.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, "eajames@linux.ibm.com"
 <eajames@linux.ibm.com>, "mchehab@kernel.org" <mchehab@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Tue, 18 Feb 2025 11:37:46 +1030
In-Reply-To: <TYZPR06MB656841B1071626B0B684B49AF1FB2@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20250213015338.3243171-1-jammy_huang@aspeedtech.com>
	 <31c7189bc04ed8c5cce463951b717bed6a2ccf9a.camel@codeconstruct.com.au>
	 <TYZPR06MB656841B1071626B0B684B49AF1FB2@TYZPR06MB6568.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_170750_211878_6AE30007 
X-CRM114-Status: GOOD (  14.26  )
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

On Mon, 2025-02-17 at 02:11 +0000, Jammy Huang wrote:
> Hi Andrew,
>=20
> Thanks for your feedback, please find my explanation below.
>=20
> >=20
> > On Thu, 2025-02-13 at 09:53 +0800, Jammy Huang wrote:
> > > Convert aspeed-video.txt to yaml format.
> > > Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER fil=
e.
> > >=20
> > > Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> > >=20
...
> > > +
> > > +required:
> > > +=C2=A0 - compatible
> > > +=C2=A0 - reg
> > > +=C2=A0 - clocks
> > > +=C2=A0 - clock-names
> > > +=C2=A0 - interrupts
> >=20
> > This should list `resets` as well, as that wasn't optional in the text =
binding.
> >=20
> 'resets' is not listed as required here is because ASPEED handle reset in=
 the clock driver
> in ast2600/ast2500/..., etc. So I keep this part identical as previous as=
peed-video.txt.

It's not identical though. The text binding listed the _optional_
properties, while the yaml binding lists the _required_ properties. The
reset property appears in neither list across two binding definitions,
but it has to be in one or the other for consistency.

However, it sounds like the text binding was not accurate, and this is
reflected in the video nodes in the SoC DTSIs. The yaml binding
definition at least matches that reality.

Andrew

