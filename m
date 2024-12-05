Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC51E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9GVm87bSpq/hl/hsc8tzDLtFmHzFt/UjSs+LY2xa7s=; b=qlu1Ruckv8p3/8kZ/2PhVDAjJB
	cu48IGlHp92wAaXd6rmxBOJIWkZXbBZxM6v/SPkTw3MEOKwd5wyFXHBOa93BZYo+tlavRUVAj51YJ
	RBk+gR0k9V5c4iykieX+PNkX98CWrRDFCVWkJd0DOi9yzLOBU4B2F1PvljiAL+Tv9kzlyn6iXDmTu
	ex87fbSY2m9kVAiPEgxDUEuiGl7oJ3m+amQO3QL/WZ3QJk43RfDyo9rNNZ/8Laml5ZxV2dTKTW+v9
	v6YUhPP2qTjkluJcVOMh7S+AwX3iBT3UsXtPzceSJW2RfNrRAGqoMiGKRCTB48oYtzEfHKcGfFkjI
	4J3Pa/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGKr-0000000H51t-2n7A;
	Thu, 05 Dec 2024 18:12:21 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGEY-0000000H3sc-2n2b;
	Thu, 05 Dec 2024 18:05:51 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d0be125958so122221a12.3;
        Thu, 05 Dec 2024 10:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733421948; x=1734026748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9GVm87bSpq/hl/hsc8tzDLtFmHzFt/UjSs+LY2xa7s=;
        b=lC4eto72Kbp5t6+murH9wL3ogMXpadI1NC+oqs+vDNVRpRHU5dPzw1k9eim1Tg+sBP
         05Pe7/KlGG4nL7KS41Uqn0zR8loLMjENPdaVz49Kd0vl5Gxu9SC7L4wsAScxG9Hz0fgM
         hYyX3AmpOXlcQtONZMU/1tvacCZ8zGv3FpHBtF3kqmCSiXmUkg83/lm5bzJCbJy+D9Wf
         FQUFeNHPE6u+IinYbA/6VSq+QoI6wXQQYD2wjOrUBGEhWUW6cyeXhRpWwec70v6B794r
         9prAgPg8PDRqQfkL32rr7UocgLh2GHbSa/VVApRFIaazeoS9eHb6yv9TP12AandbbOed
         y4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421948; x=1734026748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9GVm87bSpq/hl/hsc8tzDLtFmHzFt/UjSs+LY2xa7s=;
        b=QtFCtqF0poclEW7009SniuHOatM2VZFSoBuLwgyZFdw9NQjrAvX2ivcDt877DcAt8s
         GnWpGfVPbGY9FrjEerL65HR0ayZ34WYhsaZLuNiNGR8e9unKlZAbVGaNbYdPQluEPUWB
         etFv8Gz/oHuyOZs1TUhlw2es8n5D51rjiUXNNtyhkmUhn3aLebzi1iQkSVl6CcXfCAQg
         YeSN4/llLUEqAtM4UD8nFPGQn2VqtB0kafdMzjGXqVM5W3ZyIeIXxx5VfMnPSlF6lV/K
         jGqqL5TdihAJbVtiQgnKiZCUMkdCku6kVCCQ/W0OGlL7SOEnV+V4DSm1Y/OIsm5sSbe5
         A6/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBDDK1D4mrSXqYLnAYQ+HKofyjVemKVvqzugd+CPePCBeZ02PDsf/pxbJoMfZxivRAu3Z8kDviGXWp1RE1L6dh@lists.infradead.org, AJvYcCV6N1yr9kH0Cbr3T8gZomA1011mIxnJmE09d7VX3lpVP4t+WH1F644mZlfdvGf7ltUANxQLGTv2NKD9xi+cSLY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLkZMVaYRpiRQx6d/mK9m5O1jWm/z1u8nMvEuV0+bUO/OSlPco
	r5Oe097G29h/dS5eyKgzqR6kkcJBph3cdbjmIE4dYtIXhJD9Luxt
X-Gm-Gg: ASbGncseB9bYNfmQbHZzk3LGIZ3opVg7AnxynJ0e+gQjdd6/3etYtqx2BggRtqXD49/
	c30CwGQhDEO5oPNCTAcc0LGzEVmV47IWkUrG194n+Gh8au5QIQ078lZdYBhsgYzbHaetezz6aQy
	zFBgMUV/Es64QyGgLTVHgFW1EmeBdeD3n8SPPkoa9qcZJnRRvZq9d7jTp9ax/d+AROSg8+kzoA/
	mgEoHHXjRvyxUGn7AKG117U+ohBg/F6rOareps=
X-Google-Smtp-Source: AGHT+IG7B9QIHNCPW0oiA+I6ajVzIYVZWOIIvvoz5mac5vhllldMUr+wRDfdj7IWVlyWYwVezRdCUA==
X-Received: by 2002:a05:6402:1d55:b0:5d0:e522:9731 with SMTP id 4fb4d7f45d1cf-5d3be47d80bmr31759a12.0.1733421948119;
        Thu, 05 Dec 2024 10:05:48 -0800 (PST)
Received: from skbuf ([188.25.135.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d150f544e1sm1073330a12.89.2024.12.05.10.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:05:47 -0800 (PST)
Date: Thu, 5 Dec 2024 20:05:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
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
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20241205180539.6t5iz2m3wjjwyxp3@skbuf>
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_100550_701423_2EF055DF 
X-CRM114-Status: GOOD (  26.22  )
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

On Thu, Dec 05, 2024 at 06:17:18PM +0100, Christian Marangi wrote:
> I checked the examples and one problems that comes to me is how to model
> this if only MDIO is used as a comunication method. Ocelot have PCIE or
> SPI but this switch only comunicate with MDIO on his address.

I don't see why this matters. There will be a top-level device driver,
which in this case will be an mdio_driver and will use mdiobus_{read,write}
to physically access registers. This driver will create regmaps and add
them to devres using devm_regmap_init(). From devres, DSA and other child
drivers can use dev_get_regmap(dev->parent) and perform their I/O through
regmap.

This driver is already written for regmap, so part of the work can
already be reused.

> So where should I place the SoC or MFD node? In the switch root node?

The SoC should be placed on the host MDIO bus. And the Ethernet switch
component should be a child of the SoC. Ideally, so should be all other
switch peripherals: on the same level as the Ethernet switch.

> Also the big problem is how to model accessing the register with MDIO
> with an MFD implementation.
> 
> Anyway just to make sure the Switch SoC doesn't expose an actualy MDIO
> bus, that is just to solve the problem with the Switch Address shared
> with one of the port. (Switch Address can be accessed by every switch
> port with a specific page set)

Sorry, I don't understand this, can you explain more? "Switch Address
can be accessed by every switch port with a specific page set"

In the code, I see that the priv->bus and priv->phy_base are used to
perform MDIO accesses for anything related to the switch. That's perfect,
it means that all switch registers are concentrated on a single MDIO
address, behind a single mdio_device. If that weren't the case, things
would get messy, because the Linux device model associates an MDIO device
with a single address on its bus.

And then we have an8855_phy_read() and an8855_phy_write(), which in my
understanding are the ops of a fake MDIO controller, one which has no
registers or MDIO address space of its own, but is just a passthrough
towards the host MDIO bus's address space. I have no idea why you don't
just put a phy-handle from the switch user ports to PHYs located on the
host MDIO bus directly, and why you go through this middle entity, but I
expect you will clarify. Creating an MDIO bus from DSA for internal PHYs
is completely optional if no special handling is required.

To explain again: In the MFD proposal, there is only one driver who has
access to the mdio_device from the host bus: the MFD driver. Depending
on how it implements the regmaps it presents to the children, it can
control page switching, etc etc. The child devices only operate with
regmaps, and have no idea of the underlying hardware access method.

> But yes the problem is there... Function is not implemented but the
> switch have i2c interface, minimal CPU, GPIO and Timer in it.
> 
> Happy to make the required changes, just very confused on how the final
> DT node structure.
> 
> -- 
> 	Ansuel


