Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E8CD68BDA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 23:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiJda9W8rYQ25aoVKNjG4upIlR/b8ZNesPsVfBmzmp4=; b=2xjUjG3A2SCRnivFpi2iZuXEMr
	+TbBzshLeiF2qoPHMAXh6azlfK+60cdW5+1AFh0A80gO/ArnV2yDESeCNZg1FCoJmbtBPPoWV9pEN
	eH7XhDocYqfrLft7V7gO5gW4uLtIqxEIwKXbQ0wG403WcN4u+AOu7/Lm3A5FthZ0tF1gI1anSX0wy
	TygXraUh1E/O9vzwlH5uWEKb58e6Kw3GRvwQaFly0/cjaBCf8dk4f1shyq1cxQ4fEKfG0p9nDGx0g
	GAjcTY5fKvWtI0RsPyheaTKI/S9eswtAfa9yUfSSCduOLm4OgH3+TOcNMSElfmCBSpuEreFp2GOkx
	DaAeJ+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5bn-00000004XRI-1EFh;
	Fri, 15 Nov 2024 23:20:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5ar-00000004XIO-0byj;
	Fri, 15 Nov 2024 23:19:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so1326215e9.3;
        Fri, 15 Nov 2024 15:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731712751; x=1732317551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CiJda9W8rYQ25aoVKNjG4upIlR/b8ZNesPsVfBmzmp4=;
        b=XAvOTgLu+aj2iWGOoVDr6lSEoOrh8sdY5p0kiERIAi00uODvMZr/AR5J6aVUOZMcXW
         kooJRI/ujGJxm3so/VSDZqg+FgbttUPw/ns+SEKc9q4B4NKM66Pxe2A74IRBGu6ktACg
         UXq0nsIvTQXcf8b1Jj1hnSyjfVGtLVu966tLo7MNO7lVtJN5EZQAcqyv7Zbwi0beN06M
         e/sM2v4FlhyyCFODiP8dGzUiK+rE1pQuayTFmCWSuP3SIqQ02oKBkf+3w08XfhAEeYBf
         dw+blNSOBmxCRkT3VL6sC6SAi0JGU+lBhf+6viDzjjfXP4c7Kogi9L7afOZNPRsC+WYf
         cJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731712751; x=1732317551;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiJda9W8rYQ25aoVKNjG4upIlR/b8ZNesPsVfBmzmp4=;
        b=izCDhun/opeE+T+NCD3UZmQ2HJwkXR4sdgAQdQxzYz2ETu6O7ROWzTwJZmc3RTPq3I
         j3O8TdSGzTUtp+BUTUBWZABawpS6TQijG5d9j7C7Y3PUO3hyqhp/D5gfjZSYuzVytD0T
         02vXiVamoKrhhEFU8DaTfHdq+CYCwu8pxVKTtqn1INAjJbBqkvv+9mnBXvhwy/rn5oSx
         uTfc4Ibn7XSL+QaGk1Npv5SOWY0zXhpBRroDtQRRp0qpFPNMuSbjjCoUjq94bkdUtrxg
         dZEL/gIKe10W4nvVXDvKJmCGE9XPq+bdcq2n7AljVMZ2XuuNcHCaRBVBh1BbmqsUvVc5
         UF5w==
X-Forwarded-Encrypted: i=1; AJvYcCWsGcTne7xaE+b4kRsFNrFmVQr5m/0CoBdPzPUs5CcFEGKFXwXWKRD6jgDjGHA/6HsFsU9qzZWgKZtVITg1l/0=@lists.infradead.org, AJvYcCXvSnYccQVwmu62MqJTwOyX2Ho/gNcBk0swf2P256iEajxXxjsBHUIVSXuHx/Q8dEt0W0sBcGrkR4MGpIlCwxue@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkj0ZbFaBcEgAm9GUA+IwJ7PUCdC/j/xqF75Lqi5rHvyz2N5wN
	7TBd+/EeYS2UZvDJa0NPfp4VgCn5widUA/LGI+0LhumBWXVZCAuf
X-Google-Smtp-Source: AGHT+IEuO6BO2OZ0lz6Px1gCfwr1s+/P/FdZIjh0SxJhkn+AIGHj1BkY+4LWXmmNkKyjGdn4wRI4SQ==
X-Received: by 2002:a05:600c:3111:b0:431:5c7b:e937 with SMTP id 5b1f17b1804b1-432df74c8bdmr41371685e9.17.1731712751200;
        Fri, 15 Nov 2024 15:19:11 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298c81sm73081885e9.39.2024.11.15.15.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 15:19:10 -0800 (PST)
Message-ID: <6737d6ee.050a0220.34072b.91c7@mx.google.com>
X-Google-Original-Message-ID: <ZzfW6oLHfmanuyV-@Ansuel-XPS.>
Date: Sat, 16 Nov 2024 00:19:06 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v5 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241112204743.6710-1-ansuelsmth@gmail.com>
 <20241112204743.6710-4-ansuelsmth@gmail.com>
 <20241114192202.215869ed@kernel.org>
 <6737c439.5d0a0220.d7fe0.2221@mx.google.com>
 <20241115145918.5ed4d5ec@kernel.org>
 <6737d35f.050a0220.3d6fb4.8d89@mx.google.com>
 <20241115151553.71668045@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115151553.71668045@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_151913_182234_770394C2 
X-CRM114-Status: GOOD (  17.97  )
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

On Fri, Nov 15, 2024 at 03:15:53PM -0800, Jakub Kicinski wrote:
> On Sat, 16 Nov 2024 00:03:55 +0100 Christian Marangi wrote:
> > > > Ok I will search for this but it does sounds like something new and not
> > > > used by other DSA driver, any hint on where to look for examples?  
> > > 
> > > It's relatively recent but I think the ops are plumbed thru to DSA.
> > > Take a look at all the *_stats members of struct dsa_switch_ops, most
> > > of them take a fixed format struct to fill in and the struct has some
> > > extra kdoc on which field is what.  
> > 
> > Thanks for the follow-up, they are the get_stats64 I assume, quite
> > different to the ethtools one as we need a poll logic. Ok I will check
> > what to drop and rework it.
> 
> https://elixir.bootlin.com/linux/v6.12-rc1/source/include/net/dsa.h#L915-L927
> 
> am I looking in the wrong place?

Yep should be those.

-- 
	Ansuel

