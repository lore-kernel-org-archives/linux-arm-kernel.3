Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCB1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeWK8KnE02poaU2apmgZYe7NYIk2mK6ZRM9x7EecA0A=; b=JKARLPxCq8bXA6Ue6E7mwXtqgD
	NUydHt3NYIVH1mRPnqNsjqRfV9PMIXZzt+gHZCYfRPkTruETVb+1NaG0G0n0NUkHFAt6vUDjQFdty
	cFtNt6s+nS7wlHVYocu9pCoRzNlFZt9ClXz61RLGIP4uA0n89adQSs7JC6gGHHeSm0MYyL1VPhVAQ
	+/4ZYcQTVsoPph4mcbyb0ONhFUpiNg8i89kJtR++V9sefB6gpjNbyDrLWpWFL9IvcSmkxPzQ1FO9p
	TqN9DtNfosA2IET49MLXzJTVChvn2kkfAeq1f3tsrk0L5m1eOs/qiW75IYdrMmbH/EehbeKemNRb0
	yth9QpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVBl-00000005jeu-1MFp;
	Tue, 18 Mar 2025 11:32:53 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuVA4-00000005jW7-0dfT;
	Tue, 18 Mar 2025 11:31:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-391342fc1f6so4545379f8f.1;
        Tue, 18 Mar 2025 04:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742297466; x=1742902266; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oeWK8KnE02poaU2apmgZYe7NYIk2mK6ZRM9x7EecA0A=;
        b=U7bkBf1twgH+kVjx4h4MRP03LGKi7B9+ptHkb9ik1s7I69CPXn5HZymnJDOy26dVzN
         GY8egev2y82Gjlyio7oukAsn6zCWgWyLe3DD5zU3QWsAMDbhKa+sBhFQNXnWUlhUp8Gk
         ZbWP7I5iEP23l3rOAq6NQertyou7wDV6xt5oUVzFEXgEVKeWoLd6IfwWIqXIhc5z8W/b
         3K9T3JjasH2p49wJV0VvcLPytRS0UwHVvZCArsQm+/2C0h0mVbXbXM98RUw8anI6R7MX
         pFfW3aUSTCDqew7JN+mrR4LbBrO79Lut+VIn8g7US+zyAb8sMfULlSJW/vSg7PduNV3V
         n/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742297466; x=1742902266;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeWK8KnE02poaU2apmgZYe7NYIk2mK6ZRM9x7EecA0A=;
        b=U54PcZNoJEVLOdhawkvM8WtvGQPJ2bQkSS1RZWFKJq2AA2+reMqVBNAf/okjFHpxdg
         NGEhAbskeWplpS0bh2/JF0Enizc16r7n3jLcKRBA1LmpB9EzVUqfHb2/KXnq25r6fsO6
         FCrn/hPTgjALkuUPy2C/HqMeXfjXBusjl0yupsXN1KnurxbofbpkkQeGHWlX1qixnLLw
         dsmfPuiH4IazjpOovdVZ06yr3PzfRmKJGaDpGpyfGs5J4KK6KgndFvsxGJSaIVcZ1V23
         0aEBZVg7WootRNNcNEoYbp/Z2KWKTRAYm3r+1KsgOZigv5hIyLqdz/NXagZdDq7uci7K
         uamw==
X-Forwarded-Encrypted: i=1; AJvYcCUVEr3oCayTWGS9cAPewuisOMf2LaS94N4AGfrc4P+klZBwQSk9vHIrH/sEzvHWxKLhKpQJxnny175X@lists.infradead.org, AJvYcCWFBl7rYtgaWfwGbktsYBSDtKY5/3vn1OOdGNrSQ0UeptzkTwcTmhW2yO6VyAry8xtstsQO+sdG9MccImYgqpY=@lists.infradead.org, AJvYcCXgdPAAuZ3lxUYla7qNwasUmSXGdmJPLXI+XIveziXqsMpW9vImwXhbCVLt8IgtOKCTac3MTo4ugotsTUmAtwDe@lists.infradead.org
X-Gm-Message-State: AOJu0YxsC7FY+dVoutIN2v2NTDM5i2uSR+JQ2WiOU+Y5pVsdsMPnZjGL
	E5LXMxWsaySw+RkIdDYtA8RZ9oUY8bGckYnEmw4Pl+tDs38kT2ED
X-Gm-Gg: ASbGncvZT6ORR1MRQNHUCYdMy5go4zocoQidy7CILP1XwBDhsqEeQeyhG8kA/lvoVGl
	16U3bNSTIN9O+P6fBWN2BI/0A6kC9bcZOQLBzIsyyf3IKHzy+owQnerVa96OEv6OKO0ouujRqyC
	f8ZWUW69lx3oV+G/W3rwbNvGJxsy7sM/TZiHV43lwkZ2e63tobvzQlyxwq1hHKKaaMybExOUMQF
	D2Hl5eCtiFCCppfv5ONX7sN3YSe5tiIZZlQEOT2L++adZ3lTfBjEbspnOV94xG+MnktQCqgBgwI
	nrbIMN5p3EpRknV8hpseOLbyE14Jnx5hauuS/Hkd9XGliIJiklgUciRFzkj3QM7zUsc6DVceTf2
	Y
X-Google-Smtp-Source: AGHT+IFpi+zFuJ8XXOnGn4TOSQKOE+/3yFEH37sz6LbTqTOZGYuC+54cInlqBrHl+fxwxahe/rNImA==
X-Received: by 2002:a5d:47c9:0:b0:390:e311:a8c7 with SMTP id ffacd0b85a97d-3971cd57eb0mr15913025f8f.5.1742297465853;
        Tue, 18 Mar 2025 04:31:05 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8881187sm17594872f8f.41.2025.03.18.04.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 04:31:05 -0700 (PDT)
Message-ID: <67d95979.050a0220.166852.25e6@mx.google.com>
X-Google-Original-Message-ID: <Z9lZdFMUpqWwpsA2@Ansuel-XPS.>
Date: Tue, 18 Mar 2025 12:31:00 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 09/13] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-10-ansuelsmth@gmail.com>
 <4f16d239-f540-45d5-b67a-767b09f1c70c@kernel.org>
 <67d0862f.df0a0220.375bd.6b15@mx.google.com>
 <4a9ac302-dfbe-4d76-a634-a445957c313c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a9ac302-dfbe-4d76-a634-a445957c313c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_043108_190937_FB768341 
X-CRM114-Status: GOOD (  26.45  )
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

On Sun, Mar 16, 2025 at 06:01:02PM +0100, Krzysztof Kozlowski wrote:
> On 11/03/2025 19:51, Christian Marangi wrote:
> >>
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    enum: [0, 1]
> >>
> >> I don't understand why do you need index property here (which are
> >> usually not allowed).
> >>
> > 
> > Eh... As said in the description this is really to differentiate the 2
> > different physical port...
> > 
> > Each port have a dedicated oscillator for calibration and these
> > calibration are identified by an offset (all placed one after another in
> > a separate register space).
> 
> So different oscillators? Then describe the oscillator and its differences.
> 
> Different programing model? Different compatible.
> 
> Other difference? Depending what is the difference.
> 
> But there is no such thing as "different port ID" based on your
> description above. You just claimed that they are different, but you do
> not put that difference to hardware description. Instead you encode that
> difference in the drivers and it should be opposite. The DTS, so the
> hardware description, should tell you the difference. And I am sorry,
> but in 99% of cases "I am the first phy" and "I am the second" is not
> the actual difference we are interested in.
>

Ok to make it as clear as possible. (hope I don't contraddict with the
previous statement) (actually yes the "separate register space statement
was wrong and sorry for the confusion")

- 2 USB port
- USB 2.0 needs to be calibrated with an oscillator
- Each USB port have his own dedicated oscillator somewhere in the HW
- Each USB port have at the same offset a register to SELECT the
  oscillator. This register refer to the same oscillator selection in
  the HW.
  
  Example:
  reg 0x1fac0100 MASK 27:26 can be set to source out of oscillator 0,1,2
  reg 0x1fae0100 MASK 27:26 can be set to source out of oscillator 0,1,2

  Both register refer to the same oscillators in hardware (hence each
  port should select the correct one)
  Selecting oscillator 0 for both USB port is problematic.

With this in mind is it ok if I describe this with something like

airoha,usb2-monitor-clk-sel = <AIROHA_USB2_MONCLK_SEL0>;

and some dt-bindings include

#define AIROHA_USB2_MONCLK_SEL0 0
#define AIROHA_USB2_MONCLK_SEL1 1
#define AIROHA_USB2_MONCLK_SEL2 2
#define AIROHA_USB2_MONCLK_SEL3 3

Or an enum of string like "osc0", "osc1", "osc2"...?

> > 
> > Oscillator 0 for physical port 0
> > Oscillator 1 for physcial port 1
> > 
> > And model this is a bit problematic without an additional property, any
> > hint for this?
> > 
> Best regards,
> Krzysztof

-- 
	Ansuel

