Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CFBE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 23:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAo9cVc8wqzk5rP3Z3ruoyEUyVoOdbKhUC4uEqSh6TE=; b=cIc5sUMnbA6fFQHOgurQ9C3LI3
	+nbkKNLm6Cd0K71lYVGNyely6le2gNsQ7wdRBP9+gPyN+Ztq4yw1X3lFuBW5ZZAeOFuFAAWuyQpzm
	toLObXVBauPUYFoaLwP7APepDIJhrxwggmwSKpJCrAXVtAK8BK+LxEyu1HgG57Rk9K/tIfdPBCcoz
	WmFYupJTVOixH56ReVrO5gnrXm58HR1oNPz73iGz03m9+nl8ccRj73oF78VUkA3Q/Q+F/dZl9ImXi
	ule+Bvb1+8sj1I0C5+h+sT2fCWZJShFGTb0ajgYhb453ShKE3pyoynl4koqZEUUSQHxtpImWvcQbj
	cOzRFiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLjg-000000000kT-3Mfx;
	Thu, 05 Dec 2024 23:58:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJLie-000000000bw-3TIa;
	Thu, 05 Dec 2024 23:57:18 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa551d5dd72so24072166b.3;
        Thu, 05 Dec 2024 15:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733443035; x=1734047835; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MAo9cVc8wqzk5rP3Z3ruoyEUyVoOdbKhUC4uEqSh6TE=;
        b=ABEpTk7LEChfHha3BeTVuRdu2kRQFEeRZt+rBRbpzmns0r0N3dr2aUr7FocEtrtnyX
         HZ1kUfqCzOMduqvsUm54r19utmFC7MsS8lrstAMYjZOzjTKrgHYxWSU5futQsayQBHmo
         l6iP33OV0UzaLPGBVb4/dSTrLoCtAs9+lbkJPR2wLFPB70DumkskOw9SYB5cpVoGDqJF
         J03J0d6iOTp/exYEja5dYZc5PKoSq3K1MMIflJLlv5WzxhzqSU/FOY69GFB8FEQ5O/Ex
         wgemnQtwM7VhWvOxziWHIkrCRiYR3Mw6ixjIMX6pmflWhLKpev6C3OMk00CFSU68Atf5
         n0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733443035; x=1734047835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAo9cVc8wqzk5rP3Z3ruoyEUyVoOdbKhUC4uEqSh6TE=;
        b=NglHrLXKBNQZHxFl7Jwz+gc+LHiVNkBHhA+EzewaSMfOMzLKOGKp1gl+HH5FsXMryS
         zCMQdgZfLwMTiFHmYNjenreRcl1+jxlpAYC8XsjJHqvWzx1sx7l8afQ521dyQKbahgJe
         PSVF52KvuirB+H48KDAxxrMsiXxsHyPx93DuPRJJUoIiLnEpiXAqnIFC95rS4YFyK6q4
         JbNQzYmH6rTS+IJKQ/xSeIwm7GLLEjVY1/NU7LMMY1bXA+vQZ63b+eee7lfzsaeU2jMk
         aWsq6FNA3BQyrLC8ppvZYlQqmb37E2GCCnwPj/7pKDcFjU+3sMDYlgZEC7EfuKdQh92x
         SMJg==
X-Forwarded-Encrypted: i=1; AJvYcCXbkxzvBmI+iTAlWsash/dSWW153PWWXypnL4lcaPoy73Upq+y3pJ/tIuCsCnglc5sYzEG5QcaRP80jTEJwHYE=@lists.infradead.org, AJvYcCXnM3F96Etch9tBxA6RhvfLg2SaKkDSz/+maeq/Aw8S45L522YXS0tpFLKOZD2K571VhtFID5/tFSrOfdceNhcH@lists.infradead.org
X-Gm-Message-State: AOJu0YyFLwG6TVj0ByDH2FOMayXEVKZyMcmC/tCd8CzTrvtUlstHRZeS
	I4iUrVgCShjs6kZxOfiKF0TvHvvszEplnxHcP72uHpM42ulSvUbo
X-Gm-Gg: ASbGncvit6snT9uxrdqTWq9BIm8aJisgsics3lHqryKZqTuLOSEreCxbpz93/vsrBS0
	q0r2ynlo5HK6A3KWxKX1qo13xLwgTCAotJz4ligVgcdqu2Gc5+zE+HVVudeGlSd9/4dXkvzMOy8
	qOGB4OdwUjmgZHpJaEgMA0+25ePg+6G0Xy8IFFWGXjgux6I8Ll3ged53dJU8ylOZDBjG59/D+yx
	rDUp1vhzRRZl+t7ZdQHocDz1BEHB5ODY6/A9+o=
X-Google-Smtp-Source: AGHT+IE7dUzMRW5X7ylWUaAfuLQLWmAdBw9QHxuByRnp2/sHxsnIHbysm9CaN6DPwjMSUukK5qW3ng==
X-Received: by 2002:a17:907:1819:b0:aa5:a36c:88f3 with SMTP id a640c23a62f3a-aa63a20039cmr24798866b.10.1733443034766;
        Thu, 05 Dec 2024 15:57:14 -0800 (PST)
Received: from skbuf ([188.25.135.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4ed51sm155526866b.31.2024.12.05.15.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 15:57:13 -0800 (PST)
Date: Fri, 6 Dec 2024 01:57:09 +0200
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
Message-ID: <20241205235709.pa5shi7mh26cnjhn@skbuf>
References: <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <20241205180539.6t5iz2m3wjjwyxp3@skbuf>
 <6751f125.5d0a0220.255b79.7be0@mx.google.com>
 <20241205185037.g6cqejgad5jamj7r@skbuf>
 <675200c3.7b0a0220.236ac3.9edf@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <675200c3.7b0a0220.236ac3.9edf@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_155716_869565_6C4FD442 
X-CRM114-Status: GOOD (  24.96  )
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

On Thu, Dec 05, 2024 at 08:36:30PM +0100, Christian Marangi wrote:
> > I guess the non-hack solution would be to permit MDIO buses to have
> > #size-cells = 1, and MDIO devices to acquire a range of the address
> > space, rather than just one address. Though take this with a grain of
> > salt, I have a lot more to learn.
> 
> I remember this was an idea when PHY Package API were proposed and was
> rejected as we wanted PHY to be single reg.

Would that effort have helped with MDIO devices, in the way it was proposed?
Why did it die out?

> > If neither of those are options, in principle the hack with just
> > selecting, randomly, one of the N internal PHY addresses as the central
> > MDIO address should work equally fine regardless of whether we are
> > talking about the DSA switch's MDIO address here, or the MFD device's
> > MDIO address.
> > 
> > With MFD you still have the option of creating a fake MDIO controller
> > child device, which has mdio-parent-bus = <&host_bus>, and redirecting
> > all user port phy-handles to children of this bus. Since all regmap I/O
> > of this fake MDIO bus goes to the MFD driver, you can implement there
> > your hacks with page switching etc etc, and it should be equally
> > safe.
> 
> I wonder if a node like this would be more consistent and descriptive?
> 
> mdio_bus: mdio-bus {
>     #address-cells = <1>;
>     #size-cells = <0>;
> 
>     ...
> 
>     mfd@1 {
>             compatible = "airoha,an8855-mfd";
>             reg = <1>;
> 
>             nvmem_node {
>                     ...
>             };
> 
>             switch_node {
>                 ports {
>                         port@0 {
>                                 phy-handle = <&phy>;
>                         };
> 
>                         port@1 {
>                                 phy-handle = <&phy_2>;
>                         }
>                 };
>             };
> 
>             phy: phy_node {
> 
>             };
>     };
> 
>     phy_2: phy@2 {
>         reg = <2>;
>     }
> 
>     phy@3 {
>         reg = <3>;
>     }
> 
>     ..
> };
> 
> No idea how to register that single phy in mfd... I guess a fake mdio is
> needed anyway... What do you think of this node example? Or not worth it
> and better have the fake MDIO with all the switch PHY in it?

Could you work with something like this? dtc seems to swallow it without
any warnings...

mdio_bus: mdio {
        #address-cells = <1>;
        #size-cells = <0>;

        soc@1 {
                compatible = "airoha,an8855";
                reg = <1>, <2>, <3>, <4>;
                reg-names = "phy0", "phy1", "phy2", "phy3";

                nvmem {
                        compatible = "airoha,an8855-nvmem";
                };

                ethernet-switch {
                        compatible = "airoha,an8855-switch";

                        ethernet-ports {
                                #address-cells = <1>;
                                #size-cells = <0>;

                                ethernet-port@0 {
                                        reg = <0>;
                                        phy-handle = <&phy0>;
                                        phy-mode = "internal";
                                };

                                ethernet-port@1 {
                                        reg = <1>;
                                        phy-handle = <&phy1>;
                                        phy-mode = "internal";
                                };

                                ethernet-port@2 {
                                        reg = <2>;
                                        phy-handle = <&phy2>;
                                        phy-mode = "internal";
                                };

                                ethernet-port@3 {
                                        reg = <3>;
                                        phy-handle = <&phy3>;
                                        phy-mode = "internal";
                                };
                        };
                };

                mdio {
                        compatible = "airoha,an8855-mdio";
                        mdio-parent-bus = <&host_mdio>;
                        #address-cells = <1>;
                        #size-cells = <0>;

                        phy0: ethernet-phy@1 {
                                reg = <1>;
                        };

                        phy1: ethernet-phy@2 {
                                reg = <2>;
                        };

                        phy2: ethernet-phy@3 {
                                reg = <3>;
                        };

                        phy3: ethernet-phy@4 {
                                reg = <4>;
                        };
                };
        };
};

