Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884F9CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 13:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DA/0xI9XuzSTt1Z04u/yEWZyQXZYqt/97+Wy6DIq3e8=; b=JHZd31KCvcQVbqlWbUPhMEEi3E
	p7baoYKs7IN9d0lRQeE3tY2POJyGwUqzbtcktkbFzcrL4mTHiMQJ73RPDwd8dD9pSdXlkx/BPPf0N
	EJ+LtCyXKa8HzxbrFNWOS7st2i+ZX0ZCMdPUM3Ar/1MgsPdpjD/b2v2otgQE3S1UE41Cqr7b4cVtX
	1ddFBGz5UI6y0DSfpd/wIo5sbvcEYgnAtLXOMKe22vyOMq+t0Q2JkTOLgERIDll94yInQT6M0xFhm
	7pDRwpsehXVEisVvyrD37mnSCBK49C450bmlmWhOBAqCWs2OYqh2U3IPW6hO4r9cw+tGt+Yvsq6gG
	TzG6+uog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHcU-00000009VFb-12ec;
	Fri, 24 Oct 2025 13:14:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCHcR-00000009VED-1HNm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 13:14:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761311639;
	bh=DA/0xI9XuzSTt1Z04u/yEWZyQXZYqt/97+Wy6DIq3e8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=AqgzCm1dd0k/aUIcEdl0Hm9L6+HrivMtdltLfAdJ2V/UI101YRpopWMxclWZUsxIi
	 fdEz5ofPGQuugnuX06FonSsV3olkpSXMfKhfM7uc7Eu9G1KCURvO2lTOhSotyM/lbK
	 RQHU40m2L2xgkYBRaQ04HyxImQISWA1MEdNEuqEXdI5u3e65SGrQNdHYA4HvJn7cE3
	 rz6caVpUMvGwUJYT9M7C9vj6+LJc1grMs42vuG+HwMqgDt9VenQSzV69+AtinBJ55+
	 s3lhGGE2m3GZmBY2PByLJgrrEwe6bMTwzd4gtr0rqlYG/S6ftJgD9xuIyYDOJqzgSQ
	 Gpdu1qonxkVbg==
Received: from sparky.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B9FB37561D;
	Fri, 24 Oct 2025 21:13:56 +0800 (AWST)
Message-ID: <9c0252401fca51549cef2586e9171fa167cc0c53.camel@codeconstruct.com.au>
Subject: Re: [PATCH v20 1/4] dt-bindings: i2c: Split AST2600 binding into a
 new YAML
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Krzysztof Kozlowski
 <krzk@kernel.org>
Cc: "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au"
 <joel@jms.id.au>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>,  "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "naresh.solanki@9elements.com" <naresh.solanki@9elements.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Fri, 24 Oct 2025 21:13:56 +0800
In-Reply-To: <TY2PPF5CB9A1BE6E6E8FA67CDC03A55A439F2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
	 <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
	 <8341a903-639b-471a-8425-a98c473f5ab0@kernel.org>
	 <7a650d60cabcbd33b65c954b0c9c5918dfcabb09.camel@codeconstruct.com.au>
	 <563d6efb-966e-41e7-aade-ddec2abc7568@kernel.org>
	 <TY2PPF5CB9A1BE6E6E8FA67CDC03A55A439F2F1A@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_061411_558255_5DEA8B0B 
X-CRM114-Status: UNSURE (   5.32  )
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

> I will modify with following.
> if:
> =C2=A0 properties:
> =C2=A0=C2=A0=C2=A0 compatible:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - aspeed,ast2600-i=
2c-bus
> then:
> =C2=A0 required:
> =C2=A0=C2=A0=C2=A0 - aspeed,global-regs
> else:
> =C2=A0 properties:
> =C2=A0=C2=A0=C2=A0 aspeed,transfer-mode: false
> =C2=A0=C2=A0=C2=A0 aspeed,global-regs: false

I think Krzysztof was fine with your approach of the new binding file,
just with the improved commit message.

Cheers,


Jeremy

