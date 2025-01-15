Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA4CC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaOcGj9j9Cemvm+vFePyCuGaT0+qHLpoq0/snIH1qN4=; b=jxctXs2eWggAwSk9xF4EBMBXbc
	XxELQ4DP4dDlWmyz92wkTBsp8j2Q6pri9hIL6IcIbq6x5NSBy9QxB/nY99dbJM7udv8/Wcdpp+0av
	Fq5zoFL4efjeCDOOmZxyWT/Qgn8vCwawACgY/Reml7XFqEYOS4YdowzKtD42HxPsAkTsjD3o71boG
	pKd6M5OgGyzg3YRSI2mM0SdBoz6i3QKvxQKKidK77V2vkCzaZ8esmtSPiJL0d8wTAI7wzSlmhoa0w
	ZaM4sqDMHmBckzietG05OjtgeCyChfVaOggwttMD+IN0zjudjQkCb1jxnTH14dPOrDjG6PzIVAoSi
	Zp3CYtNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4Lo-0000000C7Qd-30bG;
	Wed, 15 Jan 2025 14:26:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY4KJ-0000000C7DE-3fON
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 14:25:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6325A4056A;
	Wed, 15 Jan 2025 14:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1BAC4CED1;
	Wed, 15 Jan 2025 14:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736951098;
	bh=WMcIZXIWDa7GXnAeCZ5NxIJiTsw13XWfpqK4pCdgiWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upw8EeuXYaML9/AhOywPJDa8xi5WeR9m2yIsNolj7dP6UH8uX/xTo9rVWXny5BMTZ
	 5kTFQyivcoBL+oastN9JqrQe83FruI51a77YqLwe3+7tX9GRcy/piFAAR5Hi/iZ3Ob
	 D0a7xaDbn513HeQ/MUnlsaiuvxDctoKXJhl3txNtdwiRqfYrJEhk4eeo5P1X0Z6oFJ
	 jP89kAQhk5CKJsTMXGDDzO5WYoXqqIhFWMm/6UbCeTkVhvs6DUJMf816Z5iEyHUkO+
	 bake0gHU9EG6GTTYaKYBI4BEEZ1A+HJzsGVWCiqY4AVHvCQ8HDDmEv0nHySoX000YD
	 k1PSgi2nMvPiA==
Date: Wed, 15 Jan 2025 08:24:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ninad Palsule <ninad@linux.ibm.com>, minyard@acm.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, openipmi-developer@lists.sourceforge.net,
	netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/10] dt-bindings: gpio: ast2400-gpio: Add hogs
 parsing
Message-ID: <20250115142457.GA3859772-robh@kernel.org>
References: <20250114220147.757075-1-ninad@linux.ibm.com>
 <20250114220147.757075-4-ninad@linux.ibm.com>
 <mbtwdqpalfr2xkhnjc5c5jcjk4w5brrxmgfeydjj5j2jfze4mj@smyyogplpxss>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mbtwdqpalfr2xkhnjc5c5jcjk4w5brrxmgfeydjj5j2jfze4mj@smyyogplpxss>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_062459_978859_AE6E9CB1 
X-CRM114-Status: GOOD (  15.32  )
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

On Wed, Jan 15, 2025 at 09:45:50AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 14, 2025 at 04:01:37PM -0600, Ninad Palsule wrote:
> > Allow parsing GPIO controller children nodes with GPIO hogs.
> > 
> > Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> > ---
> >  .../devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml       | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> > index b9afd07a9d24..b9bc4fe4d5a6 100644
> > --- a/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> > +++ b/Documentation/devicetree/bindings/gpio/aspeed,ast2400-gpio.yaml
> > @@ -46,6 +46,12 @@ properties:
> >      minimum: 12
> >      maximum: 232
> >  
> > +patternProperties:
> > +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> 
> Choose one - suffix or prefix. More popular is suffix.

I was about to say that, but this matches what gpio-hog.yaml defines. 
Why we did both, I don't remember. We could probably eliminate 
'hog-[0-9]+' as that doesn't appear to be used much.

Long term, I want to make all gpio controllers reference a gpio 
controller schema and put the hog stuff there. Then we have the node 
names defined in 1 place.

Rob

