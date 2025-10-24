Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E7ACCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvOaKA7yATNHviA11gu4zFrMYg2AOIM8mTYHs1HrhIQ=; b=2VAfb2YSVwRkN6OfQDuBpxfjfA
	7OV5i/rb5+HHZozc5ULFZmdleCGiPfJi+RZw+BukT8OdEApq+956wCpRkUOHDd5jG9R9P2qfvpEWe
	sCNF7MwtXqoOp9wQ+0w+W0NemS6lpU6ViqsN08yjN48ZL+ogTcRvIpDXLRapxG2ncg3j6UMDYXQZk
	gp9g6KgYKT4fd5NwPa+Yi4Il3LsiuCaVohYuhTPS1+/ptbMlRuxjGQCJ8VaZBdUZoi/4FRuSCU7t+
	PwNWlajxjZmt/xdQ9AY6QeloXbOWvxTivWJ6hi1SIOrHhQH7CdUdZgGaiJUxtUDzAsCopSnqCn28E
	E9qlzq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCep-00000008adR-43qY;
	Fri, 24 Oct 2025 07:56:19 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCCen-00000008aaw-1JUo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 07:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1761292565;
	bh=HvOaKA7yATNHviA11gu4zFrMYg2AOIM8mTYHs1HrhIQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=eTgClpl//Z89Gd3mJ26u/c4wtzTyfWBNQOqpjPZtVQzGYTvZMQdVv1/Wpm/Rr2afn
	 ixqp5Glry95DeQ2s9NOePqNV048rEplCbVMt2Ul1jOE/rEOgl1Dg/zfWxmeQR5yNML
	 XNCBrPiNacSqWAd+MngipGJyTrP5Osv2FMm4YfJEGOPidCmGebP0fiXHOS6ZipyiFq
	 wbATJ/kvggqZTwHSbM7FPjb6+CADOaSZkY51KEnzJaLr4g3rrlSF/At0W9aPaOZU1M
	 w+v6N7CGvrjRFtZxssmUwbCS8reLoFtOy35NSpeH8uE/Jgx9uk/TT+312sYqmAeAzL
	 hAR2vW9ZYV+og==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1412F72F33;
	Fri, 24 Oct 2025 15:56:04 +0800 (AWST)
Message-ID: <bf3d6690b9124ecf74df6c0f9f1c0f72ae1db9f7.camel@codeconstruct.com.au>
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
Date: Fri, 24 Oct 2025 15:56:03 +0800
In-Reply-To: <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
References: <20251021013548.2375190-1-ryan_chen@aspeedtech.com>
	 <20251021013548.2375190-2-ryan_chen@aspeedtech.com>
	 <20251024-dark-ringtail-of-defiance-1daabd@kuoka>
	 <2939cae6-2e8a-4528-8e27-8c932e2f82de@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_005617_539819_335411E3 
X-CRM114-Status: UNSURE (   6.99  )
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

Hi Krzysztof,

> Although now I saw next patch, so clearly this commit is incomplete.

The split that Ryan has done here - by shifting to an identical separate
binding, then making the changes explicit - allows us to review the
actual changes without losing them in the move. Sounds like a benefit to
me?

> You just need allOf:if:then: section to narrow the
> constraints/presence of properties.

That seems like a more complex approach. This is separate IP from the
2500 controllers, wouldn't that warrant a new binding spec?

Cheers,


Jeremy

