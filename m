Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB14CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSQDEVYojpqUsVcDydeFyzVEZCVIa8DW4oEeyDGqo8E=; b=TlsqX7bTRLuzJYfOBtCSm0wi1I
	5iThkuSsBY7Lyqr2DqsWV0k7uw/C+awaeluOXi4VKS1zgsd+mZh+HFgLrMtV7yKF3bi0yh4MBxMOc
	1ROx1q46/w+OuR3xVf9c0tHeaYhr34rQdupoHTJ5IgSrk5dPmDhgJXmFvQyZe/bbWJo7yWQrg0BNw
	JNwns/3YGItr5nKeXtCqj8cl9HkJvSK/Btfs/MUaYZVFLbSj10PdlEniUkWSpYspbKpJ62vDkdajD
	eQZmouQ/KrfkpLYOv8NLEZjE+Yw1IwATBh1kYWNEfrRXebvYlUQNlvS/MtGQl8ErWLON8ImYZ3cl6
	oK47W7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unIvc-00000004qnn-3hUB;
	Sat, 16 Aug 2025 15:34:44 +0000
Received: from mx.olsak.net ([37.205.8.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unIcH-00000004oh3-1T23
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 15:14:49 +0000
DKIM-Signature: a=rsa-sha256; bh=OSQDEVYojpqUsVcDydeFyzVEZCVIa8DW4oEeyDGqo8E=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1755357181; v=1; x=1755789181;
 b=TXqIFPiu6ruM8+TZCP7ahhsw6qYop9K/l1fCNrrqliT1uZk7vu1AzGR1/A19LlPkTANLZoEu
 aOhte95klePHknLPz9jeiQ1J8m8KWcUc1qD3YANM04M4R+5VWBwv408nNHpSfhvZqD3o1IudYE/
 5oy/nQtqAeBqojkzXAH6V2Uzy5kvJVOMRVPBenkGd6eL1JY6MgHZftTadmQ3EnqrCFIgt44XpiP
 WI2rJgMDlEz3yd8Nyje075Ns+6LtDmlpKQeXihPAM2dZ/vuzDXp5BH70FaW+orF8e0etwUYrkk4
 Zk4pf5s0w+ttb0XY7QjBJfHZK+MBrwqHddhw9+/QhPdvg==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 12f6888e; Sat, 16 Aug 2025 17:13:01 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Wronek <david@mainlining.org>,
 Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH RFC 2/5] dt-bindings: power: Add Marvell PXA1908 domains
Date: Sat, 16 Aug 2025 17:13:00 +0200
Message-ID: <6196438.lOV4Wx5bFT@radijator>
In-Reply-To: <5e79b123-b29a-4edb-8e70-3b7fa6cd3674@kernel.org>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
 <1950265.tdWV9SEqCh@radijator>
 <5e79b123-b29a-4edb-8e70-3b7fa6cd3674@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_081447_441797_58B02BFA 
X-CRM114-Status: UNSURE (   9.92  )
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

On Friday, 15 August 2025 08:08:24 Central European Summer Time Krzysztof K=
ozlowski wrote:
> On 15/08/2025 00:08, Duje Mihanovi=C4=87 wrote:
> > > I am asking to see complete binding with complete DTS in example and
> > > submitted to SoC maintainer.
> >=20
> > Hm, so if in the example (and the actual DTS) each domain is assigned a
> > clock, can I then keep the domain and domain controller nodes like Medi=
atek
> > and Rockchip have?
>=20
> You would need to point me to specific files or show some code.

Sure, mediatek,power-controller.yaml and rockchip,power-controller.yaml
in Documentation/devicetree/bindings/power.

Regards,
=2D-
Duje




