Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC08BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrmgUU8m2W+dm6XtC7Lvzp3134bSe6hwOO06zK/FM4M=; b=X+4wbVG0CQad/r80HeI4pczKYZ
	NPilqu687g+VS2nSWzoG/UWxSOCkMTXqP+zMjpu+k6U9d78LG9xSRgCwVO7D3p4u8Jy6PggWnjL5x
	KORkftz9ggCQRkv/N3/BjvCuX7Vdb1grW6NhiirG8rWmLZeYV2YKIyfL0bGqYQOiDtgA7M5Dj0BAa
	Shq73MyqOlxS8hx1kfEKQdlmxu4dRQukd9pulD27PMVxKbHw9AtwPb9WhLfnSL+Q1MTLQrgLdMYP1
	1KAt+6damlJVY1I7KAZb2ru8ZZawZCDM4Oo0QwZbohGx5JJODFYEbeGA8oZCJBX5E0k1vwAu5WRMB
	9xSL24oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKvo-00000000uTX-0E1n;
	Sun, 09 Mar 2025 17:59:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKlR-00000000ssG-3Qvq;
	Sun, 09 Mar 2025 17:48:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43bd5644de8so36413745e9.3;
        Sun, 09 Mar 2025 10:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741542516; x=1742147316; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BrmgUU8m2W+dm6XtC7Lvzp3134bSe6hwOO06zK/FM4M=;
        b=fzLUEejCjQVswt8N7BFI6XHFYfnT1sbgnVYwfFGnG+qXUjRE1XUHVVuntX080c8pkt
         xUNZmcCozheKXO7hhZmmy4Xzu9jyj4JD2/KH5rGps52p21B2Y3mw85zA0W4Wy3rSo1Yb
         9EeecFselJzAocJOJkw+WLdeKBkf9mlOj+JTjfbbtIVUSkX7kw3hu8go32Xca+ofJGHN
         WL88s3EzT5MT1wOZkMtkTqExgol+ybqnPy6UIQz+vrorFqCMswp/hAYiXv02SeBVhbNN
         0aazzlo3uNAUIdRO2AGWunMmqFpMlJpec0gqeDR+tZ/erkII7PoIMd7yKU1/prMfiYPT
         xo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741542516; x=1742147316;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrmgUU8m2W+dm6XtC7Lvzp3134bSe6hwOO06zK/FM4M=;
        b=FhWPtZfaafSojP2MI/vqi/4neclK9Y9FerCP73OOIl0oE9m7OZ9nenjNZLbC7VvnjQ
         Om3uRC80EFppeUCdq5brZFIaFCY2SsIKedbnhEPiNyFHIFoimjQh5v9i6Dj8lhZZlT4V
         N8Nggi9KzRCe45oM0pVhLa3EVqrj84ljDLlD7RSAn0ii57XLk2kwarkjjX/9nSgNZJXG
         2Y8lmzDdT4eKV1YoqPwhXNQBNcf9A3lCS5zwPrhxHSbdAVlyMSsuLuL4BcUI/yOS9QA1
         ooMFnWjhFEHanrbOrI9w307x9eMIP5coPHJyMpwFDxvpi9/axt4svXZ+PmAXZxU71uEW
         PsiA==
X-Forwarded-Encrypted: i=1; AJvYcCUYOS9av9GPTL2SHIGBtuz24KyvftdUaOhqHSLb3vrkhb4+tAVKFEXDKll+kzfjjyYrTZ6Qw84B4hY3ByTZzNxW@lists.infradead.org, AJvYcCVzlxtxMZ6DkSBMt5kH/lOvZgG+r/6E73BtK+zBKeYKIueoFi+nrMC77KeitNDAGoqoHfeSkYC/w+QVn7xw7js=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoYckg+tSsrlDFg4PMVDArMMA8wSOgSZfCSM2AHm7OD/wOoPiF
	fA/ooYgVWildz5ZDTu0WSeq7754TexUop6j9ebM1MKQPpfC9HySj
X-Gm-Gg: ASbGnctDJ8vR9Hgi47nI7BZqUHoCUdcowEeB+DMvaSidLfLLQJn8vwW1ckc51JvHh2K
	XBjjNnyikOUIDsw+pMULWe62vQ33/rrs+spYgJdEEEEl8fly9XV9BYoOb3pULLtPf7/H2NqZaMT
	8aZfFPKzgaxmY2LkGiubwv6avq1v8yN4J2osXdLhlakXT5OH5msXcjpgukz7RoofjyEL7FGYnnM
	vZx0eRu7OF6CVHmaS7DYPMSIiglzfm6R4n5eHms18ZbTUQvEwTnpUlWP4eJAoOejhI0TQfJ3va7
	yVcwxXx+i4nw0Rc+3/5mV3E6IX0sr8msOfdhdyMUcal0KnwcKku5pjHIYwlR+s3nkGnLfi3soh6
	q
X-Google-Smtp-Source: AGHT+IFqmRVo6FIysacWzJ33TfZtTvUxXtYg7bp/VcB+skW5kxcsz3otvb9dL4N79FYLMYigyzY4bQ==
X-Received: by 2002:a05:600c:524a:b0:43c:f75a:eb54 with SMTP id 5b1f17b1804b1-43cf75aed5emr10293205e9.13.1741542516005;
        Sun, 09 Mar 2025 10:48:36 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce8a493d0sm59519715e9.1.2025.03.09.10.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:48:35 -0700 (PDT)
Message-ID: <67cdd473.7b0a0220.170541.e2af@mx.google.com>
X-Google-Original-Message-ID: <Z83UcX4X2gpPogQs@Ansuel-XPS.>
Date: Sun, 9 Mar 2025 18:48:33 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 08/13] net: mdio: regmap: add OF support
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-9-ansuelsmth@gmail.com>
 <Z83R9qVfGbSc8bJs@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z83R9qVfGbSc8bJs@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_104837_868660_C2F471EE 
X-CRM114-Status: GOOD (  14.97  )
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

On Sun, Mar 09, 2025 at 05:37:58PM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 09, 2025 at 06:26:53PM +0100, Christian Marangi wrote:
> > Permit to pass the device node pointer to mdio regmap config and permit
> > mdio registration with an OF node to support DT PHY probe.
> > 
> > With the device node pointer NULL, the normal mdio registration is used.
> 
> Should this be using a device node, or a fwnode?
> 
> It depends _why_ you're adding this, and you omit to state that in the
> commit description (hint - it should say why!)
>

Ugh totally forgot... It should be a device node. The use of the of_
variant of mdiobus register permits to autoprobe PHY defined in device
tree.

The current regmap driver only permit manual probe using the mask value
so it's problematic for MFD usage with an abstract regmap and PHY
autoprobe.

Will add additional info in the commit.

-- 
	Ansuel

