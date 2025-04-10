Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48176C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 18:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAc+8MmXaPw82AK614idcCEM+ZCB9j3mz3cx8QDG7lg=; b=qtlwZ5hL1S7T9aJYaMzQ2YVwK0
	P7wZby68LwAuYjbD98NStiJe2PGwMoF4j1EbgbmCSjvwMf/bOSffZ8g6ETYuJ5PURTlk4XK1qmhNt
	qbIxfVybe52vooilkkh5qG9j6789dZGslCpwNLB3flooNwnlBRdU2orHXUwJ1Y8WRQf2zxZyctrNh
	Xdo0V6L7AYGPe5Q8nIwrfrz5xUaBWIq3hc3FAjSDN6eTayptRuF52/QzQ1B4M7hIKhhbvjXSQ8zs/
	vRryM0Dt2f0H5MzzdAtzWcH+Pyj8PGjV1iv+mFdxJJzy7Oo8c5oxuFID4ePuzD8bV1qB6V6d2xbGR
	RuODM7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2wKP-0000000BUME-3ywy;
	Thu, 10 Apr 2025 18:08:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vbB-0000000BMFV-00mC;
	Thu, 10 Apr 2025 17:21:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso12619905e9.3;
        Thu, 10 Apr 2025 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744305715; x=1744910515; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dAc+8MmXaPw82AK614idcCEM+ZCB9j3mz3cx8QDG7lg=;
        b=QtJXuOHnVLK0vMHL4p4RMwdRP/MiQQDqrk5JbofYsqYfiRKcHg9/kMdmtVUu2s6Zl2
         JDXQIU3zurvKjtbzMGm8vW2sSDJMmJIDCwJimAZZ6F49xKRfSu8dUXCeAHoHjPv3q5Kl
         wINyNETSIRVXj6VKFsxt0vqXaDEiGr41GA7iSu/MwBTuDJJbDvv5YLzyiNpipC6Zxaqr
         LwXJUztA+fThT3O5OQ0pPBR4dXCTzjcZBqBSylADnWJq80bwXb0kA1Rjx0y/+xj5Naa1
         CyaE4AOTdT1P7AOS6nbLzvsKZE5NnguoO+CWBkpP2tjYGynDu6W93s9wpBPvu/ZPHqAo
         s4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744305715; x=1744910515;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAc+8MmXaPw82AK614idcCEM+ZCB9j3mz3cx8QDG7lg=;
        b=M6PODQ8dG/NWdUWuwIFEL0+n1PrJ3+fO80i7+ejcvgNs3MOKOhOFuRWnn3n7k45bpE
         HWg2CJjJiLVZUddqZwdtQTlJUPhpXABSE+PmS5A3HjIJlOlKk0uU5t+5ukAzUlaM4Rka
         IwRvzPqlqlXNdtQbzXmzeGVgABKHv/c9F0TTlwnyCeLeGF3ntuXaudnO5y997AZkyTri
         /iet01R11CyL2di4q3maNaJZDafP8Sb21IOTiQtUY2dtPs+YYNJ5+Yn00h2DRHKJz2Vi
         LT4TGrb6pJykppmpzUGK2mdkjyJE7zik9k5058S5gjezC+HdENal6JFmomy5lPg2QokW
         ZwIw==
X-Forwarded-Encrypted: i=1; AJvYcCWBgn1wf5YWO7LRllfPtY7DF8V+c6j43f3VA6ZDTw+DSSEsnJwWu+mYsA4CQoMkB6oQmL1haEMBZppcMX2kWQw=@lists.infradead.org, AJvYcCX/0d3uDMktykdcGFGUV306CCjiMQzaqEbygha074QPDSoFARW3lkSXw89uCyd3HAki0vvrUkPuUPS+eoCW5ltO@lists.infradead.org
X-Gm-Message-State: AOJu0YxDEljp2Lh8Sl8vQuA7dijyNc5P+qAqUJzCDVu1a3zBVpWt9Fm9
	r1g3/3MLwfMSPcwD4GkRhmVebBpE4X4Z+/BZxIYB5WpB57trXS9y
X-Gm-Gg: ASbGncs/hVvuvACJa+V+W8rFbtlmaW2xPS++cglpdQ6cJy0VC0G39TldYPr5dbwRVvW
	LcXo1aVbb9a/XxQr8ULL/mXlWpSEoc4C22mrMyH/y6kdJiph7MAptYFFluuWPnEhVE0VJ6taxPX
	+wV7c3KK7PTrFYgZEe4AxDnt32cYBDH3P6G46RIaa2NUFjmQOzYYYpmrvh6cEAyYK38VMiwvrrh
	hZvcRc4a6ENO7UJR/e3NnaOSGyfgzC6NljxOWZYnzahLjkla6DMVaJ2zUYnP2MOdC+64dyC1uvl
	vU2+Fu5gFjYhEEbGr662IzcxuN05baXWvMVGKdQH7Wyo89mU1W07Trxk+xpQNczq+SIbKJMi
X-Google-Smtp-Source: AGHT+IH9Q8JVxZ+OtPlHUwBVz66fYYqdFxCdjwnV7YZ5WdP6zgznnwKgqIHbad9mCS+gFQ4yfd7yUg==
X-Received: by 2002:a05:600c:35cf:b0:43d:aed:f7de with SMTP id 5b1f17b1804b1-43f2ff9c1c8mr27833405e9.21.1744305715155;
        Thu, 10 Apr 2025 10:21:55 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc99sm62515765e9.29.2025.04.10.10.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 10:21:54 -0700 (PDT)
Message-ID: <67f7fe32.050a0220.130904.08f8@mx.google.com>
X-Google-Original-Message-ID: <Z_f-MLd5pX41-Zh6@Ansuel-XPS.>
Date: Thu, 10 Apr 2025 19:21:52 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v14 06/16] net: mdio: regmap: prepare support
 for multiple valid addr
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
 <20250408095139.51659-7-ansuelsmth@gmail.com>
 <fc1ee916-c34f-4a73-bdf6-6344846d561b@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc1ee916-c34f-4a73-bdf6-6344846d561b@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_102157_040583_3E27266F 
X-CRM114-Status: GOOD (  15.84  )
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

On Thu, Apr 10, 2025 at 07:13:34PM +0200, Andrew Lunn wrote:
> On Tue, Apr 08, 2025 at 11:51:13AM +0200, Christian Marangi wrote:
> > Rework the valid_addr and convert it to a mask in preparation for mdio
> > regmap to support multiple valid addr in the case the regmap can support
> > it.
> >  	mr = mii->priv;
> >  	mr->regmap = config->regmap;
> > -	mr->valid_addr = config->valid_addr;
> > +	mr->valid_addr_mask = BIT(config->valid_addr);
> 
> I don't see how this allows you to support multiple addresses. You
> still only have one bit set in mr->valid_addr_mask.
>

This is really a preparation patch for the next 2 and split from the
other to better evaluate the change for the mask.

-- 
	Ansuel

