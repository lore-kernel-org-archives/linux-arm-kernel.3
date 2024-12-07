Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D567E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MORvaT+pWKtn1cwQqnuWOdhU3VjTsfcB27db/IuY4zk=; b=QSk0qbzek5fD6lPfqxnOzNd1ru
	A/v9RrITodAeq7++o0w/BN+WxDA3sEueuGpdAVHJze9Fpj/hJZElH8T4g4llWePv8j+dZi4G7JmSK
	p08ub+meacRqn42sG1Q1IzjHLroLfcT+tTwZyfGRLMNnsIl/Q3AjCT08TviXnYH647ed5ZJsG1kdl
	yzRq/9iRA/f1dzeNQt5bAoZCr8yVmkTVqjR/QfPQiPKOdJW+uTVIGhJbxEYYDHS5OwUP0enpBp30J
	PhKesGGXcxZvEdg9HUWqT5xAEBa56ELs0b45XuLnocHq2qiV8+y/ZP3cH1RC49G2PCXU/D5ZBMace
	IsSjlXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJtfl-00000003uJv-2nIM;
	Sat, 07 Dec 2024 12:12:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJtej-00000003uEW-3Cbl;
	Sat, 07 Dec 2024 12:11:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-385e0e224cbso1503593f8f.2;
        Sat, 07 Dec 2024 04:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733573488; x=1734178288; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MORvaT+pWKtn1cwQqnuWOdhU3VjTsfcB27db/IuY4zk=;
        b=VldUokEYQsoFBrhGJZ93fkRmigEawoeq3TWghKk/B3ytU0U2qnDeyGmwu/iQX8Yp7r
         4xLHBBByEVyOzLYNDOdzJ+jBIuBA9Jsr3/Q57SsvUHz18DaOcYqFXWoaHjCYtwUixTMe
         h7bkF07dxd6MIEDVwvvkkGlIm51J2xnh34J3hKq9d6EPSWj/P0m5xcaNvnypLIrJVket
         dVxd027M52/4WQUWBSt3iNxjSeMvMfax9rlTnQDLZq0TiWEzeBCC7Y9oekCIRp76L5WW
         vbcbno1VS/YLg1uzP/nCB9Lr8Ynt/HtcO6iOf/R28fExLeAjoed/ueht8kglXrtfWUaQ
         5G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733573488; x=1734178288;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MORvaT+pWKtn1cwQqnuWOdhU3VjTsfcB27db/IuY4zk=;
        b=lbJ0RoihUBnS1lbI/pl2mh9aj//olJY+bdYnyJg3jzZoj8FOseChd66AZ3pAGrAOy7
         BISkpIWEqY+qAVsysvcoLY05EzLgXhhLEa9mQ72cOY1JTQJMoFCKRJXSoRF/r0PzzZjV
         v5Q7+wGx1OD3+3pReXXbSEaC/62+R0SIi/Ke4No9owVJvgAf7pUTJq++L+DPceQMC0hE
         s0FP8S1gNFP1H1ERetH5rW/CXhtT9JsSceG7DPsLBL+axhTMZ88HvavBxrlGId5bQYXH
         zbmS9htOY3qJaQKMwEENScJk0gOnjLQp6qbsRIY0T/I2DgYUzKGt0w3/4MTZtfYrXggf
         02yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHtb4mcmNlxEqM+8/Xt48KPxPXTRG84FpYIoYPOo0W97U/0+ELmddady9BktcKO0bHgmGweGPnB8K14HyE+Ukj@lists.infradead.org, AJvYcCXc2R9dXZTXWRf6hzMDmY32O0ceB+BTvkBOjsvNJScYb/mx5257AVF7xHwMqha4gp7YLvdrFlHotj98ZdidOkc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvccFRWZSGCemoHD/NKKDT4NfwLJxQUiVe/fbwTFcf0kOuPIME
	6j6xFg2yNssyBCFZIlOw6PtDLtvDuuySXd6MMHd7DBLuzcAmX5se
X-Gm-Gg: ASbGncvEm1GLNlgPlyMHhXLn9jQxyvhrsDLHwbp+YnfNU/LLdHUQ8T4hk9hIdlgxfRR
	rG518pXEO3MPmbPgodBQmMapo4ADX7f5Qk1EhJM1Up1SnaIb/76RryNYT+a9t1X1gh9UWFcUKFS
	uiMq8CJMc0A0x8LFTMw+mDbVyouxEqH+lRUj8RpZqBmX0u8ixbj2u00RGmvKyLsgrdnS+F9p8I9
	9Y5Ya5K4cvtTW8FOmID787lFeiaKDbSy+UB7CVMOk5mJIbVSJ8yskFzeM/j/Glf4MTMTT+85RZE
	vr58yg==
X-Google-Smtp-Source: AGHT+IG33Fm+ZyGkThOkfC16QMazqsaLxNexJ9hkTK4zh70vD9SlLmtgBzspwk1FpP3/KlDXYVA1fg==
X-Received: by 2002:a5d:64a2:0:b0:385:df2c:91aa with SMTP id ffacd0b85a97d-3862b33504dmr4201986f8f.7.1733573487595;
        Sat, 07 Dec 2024 04:11:27 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861fc514fcsm7212695f8f.48.2024.12.07.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 04:11:27 -0800 (PST)
Message-ID: <67543b6f.df0a0220.3bd32.6d5d@mx.google.com>
X-Google-Original-Message-ID: <Z1Q7ay_pKE16yj-L@Ansuel-XPS.>
Date: Sat, 7 Dec 2024 13:11:23 +0100
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
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <20241205180539.6t5iz2m3wjjwyxp3@skbuf>
 <6751f125.5d0a0220.255b79.7be0@mx.google.com>
 <20241205185037.g6cqejgad5jamj7r@skbuf>
 <675200c3.7b0a0220.236ac3.9edf@mx.google.com>
 <20241205235709.pa5shi7mh26cnjhn@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205235709.pa5shi7mh26cnjhn@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_041129_802166_49731CA8 
X-CRM114-Status: GOOD (  31.56  )
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

On Fri, Dec 06, 2024 at 01:57:09AM +0200, Vladimir Oltean wrote:
> On Thu, Dec 05, 2024 at 08:36:30PM +0100, Christian Marangi wrote:
> > > I guess the non-hack solution would be to permit MDIO buses to have
> > > #size-cells = 1, and MDIO devices to acquire a range of the address
> > > space, rather than just one address. Though take this with a grain of
> > > salt, I have a lot more to learn.
> > 
> > I remember this was an idea when PHY Package API were proposed and was
> > rejected as we wanted PHY to be single reg.
> 
> Would that effort have helped with MDIO devices, in the way it was proposed?
> Why did it die out?
> 
> > > If neither of those are options, in principle the hack with just
> > > selecting, randomly, one of the N internal PHY addresses as the central
> > > MDIO address should work equally fine regardless of whether we are
> > > talking about the DSA switch's MDIO address here, or the MFD device's
> > > MDIO address.
> > > 
> > > With MFD you still have the option of creating a fake MDIO controller
> > > child device, which has mdio-parent-bus = <&host_bus>, and redirecting
> > > all user port phy-handles to children of this bus. Since all regmap I/O
> > > of this fake MDIO bus goes to the MFD driver, you can implement there
> > > your hacks with page switching etc etc, and it should be equally
> > > safe.
> > 
> > I wonder if a node like this would be more consistent and descriptive?
> > 
> > mdio_bus: mdio-bus {
> >     #address-cells = <1>;
> >     #size-cells = <0>;
> > 
> >     ...
> > 
> >     mfd@1 {
> >             compatible = "airoha,an8855-mfd";
> >             reg = <1>;
> > 
> >             nvmem_node {
> >                     ...
> >             };
> > 
> >             switch_node {
> >                 ports {
> >                         port@0 {
> >                                 phy-handle = <&phy>;
> >                         };
> > 
> >                         port@1 {
> >                                 phy-handle = <&phy_2>;
> >                         }
> >                 };
> >             };
> > 
> >             phy: phy_node {
> > 
> >             };
> >     };
> > 
> >     phy_2: phy@2 {
> >         reg = <2>;
> >     }
> > 
> >     phy@3 {
> >         reg = <3>;
> >     }
> > 
> >     ..
> > };
> > 
> > No idea how to register that single phy in mfd... I guess a fake mdio is
> > needed anyway... What do you think of this node example? Or not worth it
> > and better have the fake MDIO with all the switch PHY in it?
> 
> Could you work with something like this? dtc seems to swallow it without
> any warnings...
> 
> mdio_bus: mdio {
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         soc@1 {
>                 compatible = "airoha,an8855";
>                 reg = <1>, <2>, <3>, <4>;
>                 reg-names = "phy0", "phy1", "phy2", "phy3";
> 
>                 nvmem {
>                         compatible = "airoha,an8855-nvmem";
>                 };
> 
>                 ethernet-switch {
>                         compatible = "airoha,an8855-switch";
> 
>                         ethernet-ports {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> 
>                                 ethernet-port@0 {
>                                         reg = <0>;
>                                         phy-handle = <&phy0>;
>                                         phy-mode = "internal";
>                                 };
> 
>                                 ethernet-port@1 {
>                                         reg = <1>;
>                                         phy-handle = <&phy1>;
>                                         phy-mode = "internal";
>                                 };
> 
>                                 ethernet-port@2 {
>                                         reg = <2>;
>                                         phy-handle = <&phy2>;
>                                         phy-mode = "internal";
>                                 };
> 
>                                 ethernet-port@3 {
>                                         reg = <3>;
>                                         phy-handle = <&phy3>;
>                                         phy-mode = "internal";
>                                 };
>                         };
>                 };
> 
>                 mdio {
>                         compatible = "airoha,an8855-mdio";
>                         mdio-parent-bus = <&host_mdio>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> 
>                         phy0: ethernet-phy@1 {
>                                 reg = <1>;
>                         };
> 
>                         phy1: ethernet-phy@2 {
>                                 reg = <2>;
>                         };
> 
>                         phy2: ethernet-phy@3 {
>                                 reg = <3>;
>                         };
> 
>                         phy3: ethernet-phy@4 {
>                                 reg = <4>;
>                         };
>                 };
>         };
> };

I finished testing and this works, I'm not using mdio-parent-bus tho as
the mdio-mux driver seems overkill for the task and problematic for PAGE
handling. (mdio-mux doesn't provide a way to give the current addr that
is being accessed)

My big concern is dt_binding_check and how Rob might take this
implementation. We recently had another case with a MFD node and Rob
found some problems in having subnode with compatible but maybe for this
particular complex case it will be O.K.

Still have to check if it's ok to have multiple reg in the mfd root node
(for mdio schema)

-- 
	Ansuel

