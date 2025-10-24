Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D0BCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 08:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wem404aV0t2DuNDE8zK+b4FQd+9biDbjtIJpBHo0aMM=; b=oqFA0f+U8wlzm/SxUqSxKj1ifV
	8QzB49hpEGLgWwCASht+bs3ks103IrXuDYT977Y0G2Z3U8o4YB4A8pLPqt4EfZnk4d9v2S5N+GnYj
	HwLAkLF0mj4uwLJ0nsFQqksUFbcx5wYHEoxfkscmjdKGImZxNLyoY8VyLCRSv8NoHizW2i+DktqJv
	cHiSuy5vDW+uxkdPprnEYkDZN8vIJrhdhJ0ERXrrjgyWPh2LyBNQAp4EGiX61X9vMuT85I5h6xNFE
	TjUgj3ceDQRqbG4Q1hvuCTLli2eId3YmBi8XAX+CfEiyjmjtnFE/rfyHXfq/FtWtcswT5rqX1YUM/
	pqUTFr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDLp-00000008kWF-3eJB;
	Fri, 24 Oct 2025 08:40:45 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCDLn-00000008kVQ-1ktN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 08:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761295240;
	bh=Wem404aV0t2DuNDE8zK+b4FQd+9biDbjtIJpBHo0aMM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ctHyGqsvOYJRXH+CRvOB4EQgB2myWy+sZO7qcXv8RFGMv7dH/Fj1rE1hMKQ3/2asX
	 dznZtEj8rUzVAFUfkDGlJdkrxwpVjqqVIo/MDLcEXQ2TWUDM0643iNBIuphCjKW7oa
	 wuIhoShV671DebHHgJ3XSvHwkvGN8M2/YOG3zDL8H48oIG0A8t3NLjeSZNhj/XuVGy
	 OC4t7qGnJMJmGaxuR0gZUVTlS1ejQSnvd9IMcDLG9YBG8hPT2iWfjx0B8oNMmGweZf
	 ehNN1u8WGnbSlIwqCvAAyrgGJezPC76kXI924y6QdY7bsfYPQjIAzHLEgtxfl3y5Oi
	 bqxRfJYA2S4JA==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6DE8772F33;
	Fri, 24 Oct 2025 16:40:39 +0800 (AWST)
Message-ID: <7a650d60cabcbd33b65c954b0c9c5918dfcabb09.camel@codeconstruct.com.au>
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
Date: Fri, 24 Oct 2025 16:40:39 +0800
In-Reply-To: <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_014043_649370_82E0C7B5 
X-CRM114-Status: GOOD (  13.07  )
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

Hi Krzysztof,

> On 24/10/2025 09:56, Jeremy Kerr wrote:
> > Hi Krzysztof,
> >=20
> > > Although now I saw next patch, so clearly this commit is
> > > incomplete.
> >=20
> > The split that Ryan has done here - by shifting to an identical
> > separate
> > binding, then making the changes explicit - allows us to review the
> > actual changes without losing them in the move. Sounds like a
> > benefit to
> > me?
>=20
> Not related. I commented that rationale is incomplete. We do not move
> parts of bindings because new device is someway different. There are
> hundreds of bindings which cover different devices. We move them
> because the binding is different.

OK, but in that case I think we're after guidance on the threshold for
"difference" here.

> Not much different than every other soc. All of them are separate IPs.
> Look at any Samsung, NXP or Qualcomm binding. Separate IPs.

So, something like this?

    allOf:
      - $ref: /schemas/i2c/i2c-controller.yaml#
      - if:
          properties:
            compatible:
              contains:
                enum:
                  - aspeed,ast2600-i2c-bus
        then:
          required:
            - aspeed,global-regs


I can't see how we could represent aspeed,transfer-mode though, as it's
optional on aspeed,ast2600-i2c-bus, but prohibited on others. Any hints
on that?

Cheers,


Jeremy

