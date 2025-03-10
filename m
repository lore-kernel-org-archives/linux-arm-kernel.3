Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB18C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGTml7RpCjpVWP8eom9oAacKLsbRqPW94SvzBXitgHg=; b=azNT7Uk0Q9FbkrD7ZfjVgnss8s
	nEW4RR5VcMLKT+tJGLhIWX96iiq7WWzDk6SXvGz4bJ9hJ45UWfE3uzPdj6KwsL57+0LZtHsEpoz7Q
	YwKYCdlsoiqrjXGi2H6BQkthiXNKOQH5ywiyGn7OYIsoc03glliL8MPEGxXYJ0UJ0pE2fjKEKLMYP
	xDkPotF5PTNzbwxWr7NMGoC8E3ErEHEZKhFK8ypT0IjFEJXuhALLDty4NKD+46St0yc3G4hBy1E98
	K7bx+z7c9frQJYb3CU0FW9yUbMMM/eaml5m6Nb7KvUJbioNcpU8hiR6Vy9okfTSJO7fEeeIG0yoyX
	+mAmUY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1traXg-00000002HOi-1OX4;
	Mon, 10 Mar 2025 10:39:28 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1traSA-00000002Gc9-0Izz;
	Mon, 10 Mar 2025 10:33:47 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaecf50578eso726669766b.2;
        Mon, 10 Mar 2025 03:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741602824; x=1742207624; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MGTml7RpCjpVWP8eom9oAacKLsbRqPW94SvzBXitgHg=;
        b=mpT4hFY8803mkJbGdDc3bdlgvNr6IENJyFUMoCPlWEJtyXlLNNrbr5UQwAk9U8wBSd
         W2PNLN5n1S8tOu0ggAWDbzxfSnY5GKwOSMYWshIhMmWufF9JasdJCPrNLRe3Lt99Bsz2
         lprGf2XhWssNj1C6407G8UCmi+Hh07OpcqwY/aGo1Q1TBYZ9nV01qzj1uODtbT8OpS+L
         zNXeYS7D38M8E2UK03qXsWHP6Wh45Uy3SsTcdHhPsOwSR+swuuNfZmbqB1OEDruGV4l0
         LLEJJrVtfYx7LFspyZpolZXicNYib8jfD+GEGu1ipLM4yLgJP+3CsmrPhOCHkcUJWQYH
         C6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741602824; x=1742207624;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGTml7RpCjpVWP8eom9oAacKLsbRqPW94SvzBXitgHg=;
        b=llH/o83LBhU5HQPL4gO+DWAqZM2alPArK/QJkS9fZ7kfseJEdTa9sA96P3pAKgKobD
         l+vaLCI6yjSeG4mHy68pN9QZpCwQ+peIAKt1fNFlaflC511EI9NE2vN6Zh7qX5EIBpSG
         3vl4swAjOGC2PLdsD2YHxU0utkCPb8/jH+SQbjecz8iTSmz8YkkQEnLuhrMqRQQo3XCG
         jmPbGlc2eFyzl0iq0L5OJG4YkeUxjHRF+zuvXSW+06tfsgiZQOfBSj0eHaqYvWoMAxDu
         dslgYrtuoNHGbPNPbOeZ7uCojscQ7i5VxTop2EMldVdlESOnwNDiD5iBVfL91P0+iRzk
         b/TQ==
X-Forwarded-Encrypted: i=1; AJvYcCULm/zEXnRYinFNMrJCJueWILqbP4EX+lcipKOjx2w0ucVRYJ4x52Be0dbJDHGyLOaHQDgOUmt+LTBm@lists.infradead.org, AJvYcCUgL93sTUazNhyVlNc8GtROW7Vaq0l4xempLmdZjiGlxaV7euwh7qIrZGIqZXM6NJIdMgZNVPo/O1Qy/keKDZw=@lists.infradead.org, AJvYcCUm+1Db5rgI9YFsQ2c9mApK+qn1m0vU1jcFJTCAbXVocEtJ4mRIK+IK4iC1lO37j+f7/i82JO9UcDXisNY+fLCh@lists.infradead.org
X-Gm-Message-State: AOJu0YwMTkEZ0Ck/Pr9ILNIyNuMmQsiht0x1Dy9eJvXX1qpA7AgKHKbv
	RI9FaQDJWDJxNXAEUrUMi1M1CVxkkD/G9uf5ZYO5h/ZZa+ll9xDt
X-Gm-Gg: ASbGncv8dQyGBEfuCa6wVFKOPWnSVAX1a78okHtZSjBTvNp5HD/zkd7HrpdDb19o+9j
	kE4QL6F6C9Td9nP++maOdJGN8Zg9vejmImFIwzHx50UyJYfzZdqkPEB9wFyhmD6MVQ9yc3WOX5n
	Dx6ICCF6klfgTSY31HeEX20h5ovcGzg+sZjh1OMw6kX9QgEIICv9Pjro+NoF+4HieMitoW3sA8T
	NVNAicXKg9nT1Iec/PecSQAB/L03hBCAXzY/yG1wDSu9AJNuSW9f7xJ2YH52nm8aCBSZLEvzGPO
	Xu3x8fiYpcTCV0gBgiGEMNx27rgu5EWiDeltKHi3vA==
X-Google-Smtp-Source: AGHT+IEWMSU1qAY2ggbAzuaICqttRpwRQzqd5Fp6/64RTbush8Y1vjOdi5AqZxhsuRglYeOy1RqUkg==
X-Received: by 2002:a17:906:9586:b0:abf:56e3:e899 with SMTP id a640c23a62f3a-ac252f8d705mr1216793066b.40.1741602824270;
        Mon, 10 Mar 2025 03:33:44 -0700 (PDT)
Received: from Ansuel-XPS. ([85.119.46.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2397363b7sm736352266b.121.2025.03.10.03.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:33:43 -0700 (PDT)
Message-ID: <67cec007.170a0220.37245a.99cd@mx.google.com>
X-Google-Original-Message-ID: <Z87ABZwgZPU2P5-X@Ansuel-XPS.>
Date: Mon, 10 Mar 2025 11:33:41 +0100
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
Subject: Re: [PATCH 04/13] dt-bindings: soc: airoha: add Documentation for
 Airoha AN7581 SCU SSR
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-5-ansuelsmth@gmail.com>
 <20250310-aromatic-chihuahua-of-priority-4ee73b@krzk-bin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310-aromatic-chihuahua-of-priority-4ee73b@krzk-bin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_033346_112829_FA113E2E 
X-CRM114-Status: GOOD (  30.29  )
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

On Mon, Mar 10, 2025 at 09:00:40AM +0100, Krzysztof Kozlowski wrote:
> On Sun, Mar 09, 2025 at 02:29:35PM +0100, Christian Marangi wrote:
> > The Airoha AN7581 SoC have in the SCU register space particular
> > address that control how some peripheral are configured.
> > 
> > These are toggeled in the System Status Register and are used to
> > toggle Serdes port for USB 3.0 mode or HSGMII, USB 3.0 mode or PCIe2
> > or setup port for PCIe mode or Ethrnet mode (HSGMII/USXGMII).
> > 
> > Modes are mutually exclusive and selecting one mode cause the
> > other feature to not work (example a mode in USB 3.0 cause PCIe
> > port 2 to not work) This depends also on what is physically
> > connected to the Hardware and needs to correctly reflect the
> > System Status Register bits.
> > 
> > Special care is needed for PCIe port 0 in 2 line mode that
> > requires both WiFi1 and WiFi2 Serdes port set to PCIe0 2 Line
> > mode.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../soc/airoha/airoha,an7581-scu-ssr.yaml     | 106 ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 107 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml b/Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
> > new file mode 100644
> > index 000000000000..4bbf6e3b79a4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/airoha/airoha,an7581-scu-ssr.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/airoha/airoha,an7581-scu-ssr.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7581 SCU System Status Register
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +description: >
> > +  The Airoha AN7581 SoC have in the SCU register space particular
> > +  address that control how some peripheral are configured.
> > +
> > +  These are toggeled in the System Status Register and are used to
> > +  toggle Serdes port for USB 3.0 mode or HSGMII, USB 3.0 mode or PCIe2
> > +  or setup port for PCIe mode or Ethrnet mode (HSGMII/USXGMII).
> 
> typo, Ethernet
> 
> > +
> > +  Modes are mutually exclusive and selecting one mode cause the
> > +  other feature to not work (example a mode in USB 3.0 cause PCIe
> > +  port 2 to not work) This depends also on what is physically
> > +  connected to the Hardware and needs to correctly reflect the
> > +  System Status Register bits.
> > +
> > +  Special care is needed for PCIe port 0 in 2 line mode that
> > +  requires both WiFi1 and WiFi2 Serdes port set to PCIe0 2 Line
> > +  mode.
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-scu-ssr
> 
> That's not a separate device, but part of the SCU.
>

More comments on this in the MFD patch.

> But more important - such definition of choice of serial engines is
> really not flexible, not reabable and not helping integrating into DTS.
> Are you going to grow this for next chip airoha,serdes-wifi20, then
> airoha,serdes-wifi21, 22... ? And then how the if:then: would look like?
> 
> Assuming you do not have here child-parent relationship, like usually
> for serial engines, so then this should be somehow list of devices
> (strings) you want to run.
> 

You are right, string is more flexible and I don't need the include
file.

-- 
	Ansuel

