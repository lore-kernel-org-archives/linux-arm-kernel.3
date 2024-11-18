Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA634D591AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NutJMTMGBpGlg6jc4CAOpY+tUMerhneIWFgqOFsouME=; b=uJ2IAdI4slomWuk3xx9AsadfI1
	JK6yMYapW3ja3MEoutrVSusFJQ3VAxW16xKnvI4uuSBwzqsh1tQRfPuGHHOsHacwamQELaRvlHiSW
	yfZO//qkTZsmHF8zMy+ZBiLrATH80wGrHHIbxBOz64+G5GwMbz8Yv6Gh4ANKRBLCkJyy97kvDWaw9
	MJ033DbMxk/6JWW35yP7UKgMXAcIPqzYUh6wP8NWMSFo4YbMLdGW3o4oFwXjVlS+abPhbIasZmevd
	UFCpoSY4fnOOYxBcCdKu4DhBrPGEGu1Dhyqlr0MSypY5B/JukL0XIWaPjoWD2fNgr6JV6oMyjvaiT
	ZAQ0zIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD6bm-0000000AMQo-2kw7;
	Mon, 18 Nov 2024 18:36:22 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD6ar-0000000AMI1-1V8R;
	Mon, 18 Nov 2024 18:35:26 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-382378f359dso1491221f8f.1;
        Mon, 18 Nov 2024 10:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731954923; x=1732559723; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NutJMTMGBpGlg6jc4CAOpY+tUMerhneIWFgqOFsouME=;
        b=UrrS0yJtzqdAlhW+Yyd4yxhdtT4G+MsAG4vdUuQp9kWeATo/iyFQGQJbxaTmCsO+CZ
         6Wz6Ii1sO69iYXOs+OCXmVC+9HepTrZCVVaI4mRU4J2JCMBGvEJBzXbVbVn19mFEZ0jx
         0wxW3lEVjfEirmXzg/mhn/e5wfWKgPEOMpSeSEjQqjsEeDRx3zgKvKZasVkbq2cgfMub
         YYenpXxxEetBufd6dv+cauiIzvks/Yg/chgOsQO498JAI01IDRUfQxA3wLtBEWmXQTWM
         kuehlIFCEGhg+mhJSnx8K5T8+6BYyYuGNk4K7AGtgS342ipHi2s2DIRhay8D/3CbLEec
         TzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731954923; x=1732559723;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NutJMTMGBpGlg6jc4CAOpY+tUMerhneIWFgqOFsouME=;
        b=wW2lV4M3fv0QueFS3smfhT6T0gC58/K4noWxsChNZjWrf/DQLjds+TS7aqhm9Jf+QF
         /HEfM7jWa3ApI0Jdg+J9OJjageWgjIizPdAROMYrZ84CI/5y74/ohIdoroGN/9YSyQE7
         +yc9QE/9W9mNQz0/y1F/e8i72cCMs50cvhNWt96ei9G0ifZ7O+RKxOTaR9mHurw0RSn9
         LlVD8OabIxUZQNO1p7JX1dxzhw+JMg74ntfVuZ5JoSMs9V/9UyKl5N09wm5/4Prnhor5
         CqDM+lmS2Frarrdng9C5m3uw97AN3mqWSq/F1MWiAIgQJoz3O1OEYvYm77r3D6YY9PjX
         lbAA==
X-Forwarded-Encrypted: i=1; AJvYcCVcjRrABgSWH9P4NUwHXmW43AvdxG1ohzUUCsfU18p0FVvccYF7btXI4EOX/9WG60uxwX5MjLzMVQfkvZCwbHVj@lists.infradead.org, AJvYcCXhsk4bOW7lehPacPYpDo7GfdSQf/Z9jOFO00x2DvDQmJYfIPGYLmzSRkdpD/TNPdAL2cOv9Pml1NLyzmB4JF8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwE3JQ2G7aUKV9wwOYR5jzMUb2nVLZQ5WeMea7JfxvhvMKOOUqs
	ZAVP5ZSIApQSnWj2yozr3uwSCnEMN3/4f3dqnk0pzHwW8+8EL71r
X-Google-Smtp-Source: AGHT+IFjKnwL+BAcS4FvmCWrXf++f05PwJmlO/bTN95oll3IN9DWzzjQsayZ7u1F458KkypWbgNafg==
X-Received: by 2002:a5d:47a4:0:b0:37d:46fa:d1d3 with SMTP id ffacd0b85a97d-38225a931abmr11496928f8f.34.1731954923402;
        Mon, 18 Nov 2024 10:35:23 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ae161b5sm13816130f8f.74.2024.11.18.10.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 10:35:22 -0800 (PST)
Message-ID: <673b88ea.5d0a0220.17b04a.bc4b@mx.google.com>
X-Google-Original-Message-ID: <ZzuI5vA-PUWpe5CR@Ansuel-XPS.>
Date: Mon, 18 Nov 2024 19:35:18 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
Subject: Re: [net-next PATCH v7 0/4] net: dsa: Add Airoha AN8855 support
References: <20241117132811.67804-1-ansuelsmth@gmail.com>
 <20241118144859.4hwgpxtql5fplcyt@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118144859.4hwgpxtql5fplcyt@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_103525_393864_23126999 
X-CRM114-Status: GOOD (  18.52  )
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

On Mon, Nov 18, 2024 at 04:48:59PM +0200, Vladimir Oltean wrote:
> Hi Christian,
> 
> On Sun, Nov 17, 2024 at 02:27:55PM +0100, Christian Marangi wrote:
> > This small series add the initial support for the Airoha AN8855 Switch.
> > 
> > It's a 5 port Gigabit Switch with SGMII/HSGMII upstream port.
> > 
> > This is starting to get in the wild and there are already some router
> > having this switch chip.
> > 
> > It's conceptually similar to mediatek switch but register and bits
> > are different. And there is that massive Hell that is the PCS
> > configuration.
> > Saddly for that part we have absolutely NO documentation currently.
> > 
> > There is this special thing where PHY needs to be calibrated with values
> > from the switch efuse. (the thing have a whole cpu timer and MCU)
> 
> Have you run the scripts in tools/testing/selftests/drivers/net/dsa/?
> Could you post the results?

Any test in particular? I'm working on adding correct support for them
in OpenWrt. Should I expect some to fail?

-- 
	Ansuel

