Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC8BCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jGcvOJ/2zIoXs3jwzmzA+R7eyYFP6KicLp4LvaH6+s=; b=kudZOZJAdMyfFgAMirxZnvgm0Y
	ZfFgg8+qS81zO1Wod8axTJj3LU3Jf1CVzlqe4yDOxE9uogBCmgRhg0hMy8t62wi/OI6L0sAnUWJhj
	sc++4RF3m/vbxe9G9geDuNuvlBnIGPQ6QgWkruAMniSUgzBFnSdwCnEUOxyil48hChgIje5Co77hI
	4cmUzSXUnh7UoK1l5sTPgYdVxIbys2gXvKR1HO4JWxR4wzu8YvGt7q711cNfZOYI1zAD2JlLV/LkW
	KOQt1NObSaMyDmTfJcfhT3a9+wVhXrfL+Zy4aDuvDKMsY5NDtP3TYOkR61Xj+TeibWEZclMwI7jZw
	GzaNw75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdDe-00000001zaQ-3LrV;
	Thu, 11 Sep 2025 09:03:54 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdDb-00000001zYJ-1BNd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1757581425;
	bh=9jGcvOJ/2zIoXs3jwzmzA+R7eyYFP6KicLp4LvaH6+s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=eC7I0Sd8DAcvARRMk7gSLhQfnmUYQpLWw0SxQbapw03i3+CqDJ3UVERzC74tH33Dy
	 Ev7bCORrnoI/zq+uiGhuXWrvVHwT5E/MtrfoUVD2NxCklYAXuEZTXDodeHN1XazLlu
	 4sQZlAZzfCLkwaW3cXZhRKqE5zLOwUfXqILuCVRQEGGPq+WE5xqzeDjqCvAqQxSsIH
	 BF1JxnA1xoFgifHbGydZIM7AEO2as8uTEF7IMa+pcQrzxjHmIfw7G6TcwSYL1U0F+g
	 M2RNjT0NsWWdJNdhKrwwXrVihmPPk1a5WhHTay4pLIFUxPqgEXYFpSR4Uc2r8vWnXU
	 nLrlVqMRqY35Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMs6l4WjPz4wB0;
	Thu, 11 Sep 2025 19:03:43 +1000 (AEST)
Message-ID: <ecefaed7ed0fe83442021c0bfee0a49111269aad.camel@ozlabs.org>
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
Date: Thu, 11 Sep 2025 17:03:39 +0800
In-Reply-To: <3fdee5330d91b5d18a69a311e4df6de874973ced.camel@ozlabs.org>
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
	 <3fdee5330d91b5d18a69a311e4df6de874973ced.camel@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_020351_690934_F7DAE7AE 
X-CRM114-Status: GOOD (  12.55  )
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

Hi all,

After a bit of a chat with Ryan, some updates on this:

> The question was more: it sounds like you're switching between
> *fundamentally different* hardware units with the mux switch - not just
> a different register interface for the same peripheral hardware. Is that
> the case?

Turns out: no. The controller core is the same, but what gets muxed
in/out is more of a compatibility interface. This provides an
ast2500-like register set to the ast2600 i2c peripheral.

So, the plan to use the same aspeed,ast2600-i2c-bus binding for the
controllers (ie, as in v18) seems mostly sensible to me.

The newly-introduced driver can make use of the non-compat interface to
the peripheral (using the existing compatible value), but needs the
introduction of support for the global register set to do so. Ideally,
this would have been included on the original spec for the
aspeed,ast2600-i2c-bus binding (since that's how the hardware is laid
out), but that wasn't the case.

We may want to split the aspeed,ast2600-i2c-bus binding out from the
existing spec, as we currently have:

  compatible:
    enum:
      - aspeed,ast2400-i2c-bus
      - aspeed,ast2500-i2c-bus
      - aspeed,ast2600-i2c-bus

- but the former two do not have a global register-set.

We may have better syscon-like options for handling that global register
set, but that's more of a conversation for the v18 thread.

Cheers,


Jeremy

