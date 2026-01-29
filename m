Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48746D73E87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeDMpJ65mp+98QISIa6zGzqYGRyHyE/0c63dQ1J//No=; b=WEXe8DL4JBkA1PLRsPK30Oc+Iw
	H2la3sZqhDt0tvnIBGU9yEDjefEbBLL6UUq+s4wCkxu6OYgu2f/4naIYdwq4+xOlGYovIg5YZlAVq
	g9XwIVAi1SdbAvufKMih5vE639HoQhlxYGYXQqc5Ozdiz9i27cR2vk7J26FQc9UtklwtvFJMBTqvx
	u433FBDzuFHq+WCqDnQb8fDA09Kwrkk53THrD1VoJaD2OicmpQjHUppKiqqT/3PdVTOdEMOJgWqfd
	ewzkGSilRre4xLe5kwp7yhT/55rZUA+MIozGQrfiUzAIGSPDgAiDeHowmTzMwHgwx6y2v1cEkaj1B
	P+cnttHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlaY8-00000000jp2-41c3;
	Thu, 29 Jan 2026 22:31:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlaY6-00000000joX-21uJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 22:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1769725886;
	bh=XeDMpJ65mp+98QISIa6zGzqYGRyHyE/0c63dQ1J//No=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=maXuXDBDY5E82w+PEupDgyz4HMJpbKuw1UzO+dIkS5jxTm1C/okzqrlbeKVwP5/2u
	 Qmlwe1QlE+tToivLA+Co71fnsoyIwW+7Ac7wb/oLse0BIQHmHL1b4kESpKUryAJSH5
	 zz1AYVHdKrtJxdw68fXAgjGC3zdLRRl+DqEIzH7+zSxuwZgFryX4FpjGLfaHjLSBnh
	 N4LG5nd9/2dhd4+30p/dIoCMLGZn24TWDGPOKEniU5PKzNcg2d1CNTXMLAUg1Az/hM
	 20YqxQthcjTdbkupxPsQgS4k/x+Blm/TSTl02Q1sKw5XjzbabaZ9c7kQExTjo8WmXj
	 K0yNxc7jhe70g==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 679D860035;
	Fri, 30 Jan 2026 06:31:25 +0800 (AWST)
Message-ID: <547396d9f2aaea032fa62e7adcafb423a9467446.camel@codeconstruct.com.au>
Subject: Re: [PATCH RFC 05/16] ARM: dts: aspeed: Remove unspecified LPC host
 controller node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Linus Walleij <linusw@kernel.org>, Joel Stanley
 <joel@jms.id.au>, linux-hwmon@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, 	openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org
Date: Fri, 30 Jan 2026 09:01:20 +1030
In-Reply-To: <CAL_JsqJxfVaLqzTwm7iEvc4maBzVvpc-i5uD6CZRtiv+V+7+1Q@mail.gmail.com>
References: <20251211-dev-dt-warnings-all-v1-0-21b18b9ada77@codeconstruct.com.au>
	 <20251211-dev-dt-warnings-all-v1-5-21b18b9ada77@codeconstruct.com.au>
	 <CAL_JsqJxfVaLqzTwm7iEvc4maBzVvpc-i5uD6CZRtiv+V+7+1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_143138_717614_697E978A 
X-CRM114-Status: GOOD (  10.01  )
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

On Thu, 2026-01-29 at 09:16 -0600, Rob Herring wrote:
> On Thu, Dec 11, 2025 at 2:46=E2=80=AFAM Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > For the AST2500 the node was used for pinctrl purposes, and while
> > the
> > hardware capability is also present in the AST2400 and AST2600, the
> > their pinctrl no relationship to it. Further, there's no
> > corresponding
> > binding, remove the node for now to
> > eliminate the warnings.
>=20
> Odd line break.

Ha. The preceding sentence is also a mess. Not sure what happened
there. I've extracted the pinctrl-related patches to their own series
locally, I'll send that out when I have a moment.

Andrew

