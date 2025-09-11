Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3748CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F01UXaPaBhKCGLzKaH0Cho4DISR/Sr2ga40NNR8fcTI=; b=uFahyiQNOn1rMjEvIWqGFxix8i
	kaMyfjEP3bLDByEaDQm3pSGJmYC006b0x9BcGeYAAcCluiGt4iXv0Wa/kzbhojmQCWx6egOuyEVqa
	PARCbymK8By3OTUgajGAvjCKf7k/SwbIC2WGtSelSuMqQDC6PAT6V3KQD5fX+XObmOkJ7Pia4Tp0B
	mDch4eWT+ia8HtNs8VU8+ITT4JQGqpecuulGtgD/g8iy3tYLcT22FkYFEKYvnO0OXeYmtBt/Hzl+b
	DWr9eDGqWnvq189Fk4dTmJDM7qojpnb1bFaij25adjBArQ28w/jttO7PwDjxO9Mch0jieaM39ypWw
	Vp6/GCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWGj-00000000BdR-30Vm;
	Thu, 11 Sep 2025 01:38:37 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWGg-00000000BcA-32JA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:38:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1757554712;
	bh=F01UXaPaBhKCGLzKaH0Cho4DISR/Sr2ga40NNR8fcTI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lZDvQexRfGR2ujTpjGRc5Utz8gUWAg5HTzk/eyhJXVlD8VrLy5zAYy5OW5RpdWibP
	 4ypXhPyGFxMdQs4BpnClCLhFHL1iyX44hObNcWyxO15XRHR2X1GH84ZsC5FwxBVTEs
	 uwUJUvgTWsJBSHIOK24AoViwxyvIHK6c7gUn2YeJh/z0n3KLvQKV+RMSBFkTj3uVmr
	 W9+VCCVTKI3iMhLgbp6xKTXtIg88IH82U2tPtEmnJd/aRwx0YNZ2vFq40wxIja/8Nb
	 rqIH7bMatrij3/F3rev7bhDLFwIrc/ykBvjULz3lQ4Z+jRZlU38haiU6Y46FB50RWa
	 ZYXzfEbd9OTXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMgF11lvcz4w8x;
	Thu, 11 Sep 2025 11:38:29 +1000 (AEST)
Message-ID: <3fdee5330d91b5d18a69a311e4df6de874973ced.camel@ozlabs.org>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From: Jeremy Kerr <jk@ozlabs.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	 <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com"
	 <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org"
	 <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, Mo Elbadry <elbadrym@google.com>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"p.zabel@pengutronix.de"
	 <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	 <linux-i2c@vger.kernel.org>
Date: Thu, 11 Sep 2025 09:38:25 +0800
In-Reply-To: <OS8PR06MB7541BD362CE9FC0AA3CFC46CF209A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
	 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
	 <OS8PR06MB7541C69AB8E6425313DA8606F2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
	 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
	 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
	 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
	 <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
	 <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
	 <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
	 <52943e49aaea7bb6def5bc51dfd57392b6ae66e4.camel@ozlabs.org>
	 <OS8PR06MB7541BD362CE9FC0AA3CFC46CF209A@OS8PR06MB7541.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_183835_136000_C8C89757 
X-CRM114-Status: GOOD (  10.53  )
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

> Sorry, for ambiguous.
> The global register like a mux selection for new/old register layout.
> Like following example.

That wasn't the ambiguous part - I think we are clear that there is a
multiplexer that controls what registers appear at the node's bus
address.

The question was more: it sounds like you're switching between
*fundamentally different* hardware units with the mux switch - not just
a different register interface for the same peripheral hardware. Is that
the case?

This is an important distinction in that some SoCs have the old
peripheral, some have the new, and some have the mux-switching between
both.

Behaviour of those two peripheral options differs beyond just a
"register interface", and calling it just a change in register layout is
misguiding the conversation somewhat.

If that's the case, then the separate compatible values may make more
sense.

Cheers,


Jeremy

