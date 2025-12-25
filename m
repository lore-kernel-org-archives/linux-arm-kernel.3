Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DB9E7AD5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 16:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9w9PoOAphBvrMeuMPvt+UDtYQWc7xDRbIiFcY8PW7pU=; b=BcZYl/wT7p7D2feHZ7Ea89juwU
	dCIdD0oGAh3tqP0hCoj078VqmUfzHd00+niCjg93gvAeBI7K5CnPpP09TN/f75rZU6y5pxswa+1uv
	SCssqB0l6WLtTFaER7rk0Q3r641/fCIlto42MzZ+zhzR7GTGDeaFiRUFvFg3Ba5uXEX+gg1WaQjx7
	X+DXpkgcgPDKl+tShAAMbcHIAVx/D71UqbLBNL7VA4DjJ5TA9m51bZdac1Ra/iQ5zi7seGXH59GQo
	Z7qbjv8qFSJxlyKitJ4g5e/7RtrwPQvwoSogDVy8HLT5PYDgVum+uzXOzs9ovht3JkJaTK1NGurA9
	IujTGyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYo9P-00000000XIy-0ExN;
	Thu, 25 Dec 2025 16:25:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYo9L-00000000XHx-16To
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 16:25:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 313F24E41D99;
	Thu, 25 Dec 2025 16:25:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF33360742;
	Thu, 25 Dec 2025 16:25:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BF4C103C8CAF;
	Thu, 25 Dec 2025 17:24:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766679907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9w9PoOAphBvrMeuMPvt+UDtYQWc7xDRbIiFcY8PW7pU=;
	b=JEp21IQ6lhvA7GHyuGEFtjRTQ4IGqq4eZbh2FLAyWSrqCEeOvJV9lOYHMkYJknW5QyyXv6
	PGQpmEkwa+Ttf+W+qBq/IViwdlSgz1BWTOI98b7sbc7y7ggDQCzB+GcyEaNdPW63p56nD7
	VUyEVD8AvdIbBgxmgEW+Ou1evzJhsH2mU8zW39XvcYQ9aON4sQMY3Pc8VNGd8rU1LZ7N67
	v9mruJxmT99O7L9E+AcZwKtSMRHEUdVlFS3hcqeiJ7hZOgufxVRRQoPJ8bQgbMx0b9vV2Q
	SQEfEaeFx0h6BJIg8LdoIOmGeDEhG4BSWIKmxlXpY911xsKxLvOwGckKnEa1jw==
Date: Thu, 25 Dec 2025 17:24:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linusw@kernel.org, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, broonie@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, lars.povlsen@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
Message-ID: <2025122516245554f59e2e@mail.local>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr>
 <20251224-berserk-mackerel-of-snow-4cae54@quoll>
 <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com>
 <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
 <CA+HBbNG+ZVD6grGDp32Ninx7H1AyEbGvP0nwc0zUv94tOV8hYg@mail.gmail.com>
 <d210552f-c8bf-4084-9317-b743075d9946@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d210552f-c8bf-4084-9317-b743075d9946@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_082515_955791_1339B17D 
X-CRM114-Status: GOOD (  22.66  )
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

On 25/12/2025 09:47:34+0100, Krzysztof Kozlowski wrote:
> On 24/12/2025 15:01, Robert Marko wrote:
> > On Wed, Dec 24, 2025 at 2:05 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On 24/12/2025 11:30, Robert Marko wrote:
> >>> On Wed, Dec 24, 2025 at 11:21 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>>
> >>>> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> >>>>> Add the required LAN969x clock bindings.
> >>>>
> >>>> I do not see clock bindings actually here. Where is the actual binding?
> >>>> Commit msg does not help me at all to understand why you are doing this
> >>>> without actual required bindings.
> >>>
> >>> I guess it is a bit confusing, there is no schema here, these are the
> >>> clock indexes that
> >>> reside in dt-bindings and are used by the SoC DTSI.
> >>
> >> I understand as not used by drivers? Then no ABI and there is no point
> >> in putting them into bindings.
> > 
> > It is not included by the driver directly, but it requires these exact
> > indexes to be passed
> > so its effectively ABI.
> 
> How it requires the exact index? In what way? I do not see anything in
> the gck driver using/relying on these values. Nothing. Please point me
> to the line which directly uses these values.... or how many times I
> will need to write this is not ABI?
> 

The index here is the exact id that needs to be set in the PMC_PCR
register and so it is dictated by the hardware.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

