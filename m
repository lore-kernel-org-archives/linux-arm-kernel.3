Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8755EC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 01:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THXhfIs9H9rrYB2vrX4MQGnujXZkNVq7DEecFH0R2bc=; b=J6q9bJVyPtFJKHU8a/5EOqBx20
	kmOoxbAb5SQGgBdPD+FGuYX/h3ubEEVkpxuDqGjtpbwZ8p95x0gTNWXw42zgC4K4zCF+5GeualZD8
	fohve2IsNL3nPJgv2Q7TwVeRzN8gsqp6NtIs9ek/C/5o14cHBzynCFD2p54uh/CXySHlGJYyHr1ai
	2WCGCzcsjbvtpoW/IGbY9CfiqbqcdFpDYcaiGktV8xsususLe6Kd1a1SFQad5LV9iiEGrzrkTCIXN
	gKVNNT8GLoqM+e0euGR0O2G5jpu2x20iVzweY2DPvwAPRDrkfpNdCvw6p69Elz8axMxshWTbRccCn
	Ad3kIC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCGp-00000001ocB-1T1K;
	Fri, 08 Aug 2025 01:51:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCCi-00000001o8y-2gZW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 01:47:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754617651;
	bh=THXhfIs9H9rrYB2vrX4MQGnujXZkNVq7DEecFH0R2bc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CWTs9ETKMKNU5vACd1Li7sftjh7SfZF8+G16VrXkmjc2puUADe9n2XkBxAMsc+Gmj
	 k6zsMKq0tD8KbbkjMsEnmSPAkW+tZAnVXNqS4CO4Bw3ntAm+opgbp7rM9beeaSdGnP
	 PoyoGO217ooYZ+MLJaR4hpYCi+fnb0O7GRs8a6BrdVy26kY9QiiWkHaSH1MPMXSVQO
	 EC2kaVA9ebD24Y1va02psaU2Kkxmh+bW5p131xgNLrNS2MDCpTrfHIBpYde+lSn1YR
	 9F8fDY9MH0b/NsZTQpzL6gIBOu1GHFJOhGRlrQbqTu2fV+K8qXAY+oj8KfTgdKGRdo
	 3mpYkp4ktMi9A==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4991E6AF39;
	Fri,  8 Aug 2025 09:47:30 +0800 (AWST)
Message-ID: <a14b98078554e27453fc1f96a667b299a15fd4c2.camel@codeconstruct.com.au>
Subject: Re: [PATCH] dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: Add missing
 "clocks" property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "Rob Herring (Arm)" <robh@kernel.org>, Corey Minyard
 <corey@minyard.net>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, 
	openipmi-developer@lists.sourceforge.net, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 08 Aug 2025 11:17:29 +0930
In-Reply-To: <20250807132852.3291305-1-robh@kernel.org>
References: <20250807132852.3291305-1-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_184732_866072_4FC71E24 
X-CRM114-Status: UNSURE (   8.65  )
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

On Thu, 2025-08-07 at 08:28 -0500, Rob Herring (Arm) wrote:
> The ASpeed kcs-bmc nodes have a "clocks" property which isn't
> documented. It looks like all the LPC child devices have the same clock
> source and some of the drivers manage their clock. Perhaps it is the
> parent device that should have the clock, but it's too late for that.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Thanks Rob.

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>

