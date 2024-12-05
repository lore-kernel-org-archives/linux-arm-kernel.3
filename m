Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAF0E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJgt0q1XFsdzcWEuTvfZzx/PS2Wvx0jTJ2onrpygoeo=; b=0q0HC64oF0JNvh2QFiYBB3zBBM
	eoo4DX3VoW2483h5zxgM1g/oeL+0rWyMqrxbFNd6IqLtd4iPW4OukHzuQg1OTODf3iDT2BFZ4N7Qq
	xG7aBfqQ5DUomRVrYSBiDVfaHlKH9cL0GTo12hBEiOKmVLquR36ejPFeVCcp6PNgmviO12Ed4CXa0
	8YpagzCFkNqu6jPUhMfLbO0bF1R9YHQg+ACeaFSugHYu9D6B75WMIW3jUu0pfT7rqLnvu2psYC+as
	qpaCWwQ6wQC0Sh0edT9IlJu7vRqCBzxVY/zGKV32f1XYnn74yFZim2DYyE2WeEXVY8wFDjcHxNHt4
	ncYex3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHkf-0000000HEgg-0Hnq;
	Thu, 05 Dec 2024 19:43:05 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJHeP-0000000HDbe-2Ewg;
	Thu, 05 Dec 2024 19:36:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43494a20379so12975395e9.0;
        Thu, 05 Dec 2024 11:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733427396; x=1734032196; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TJgt0q1XFsdzcWEuTvfZzx/PS2Wvx0jTJ2onrpygoeo=;
        b=TlodTTLYzI9Qm7+WPnEt239pdkld5zCR07mVGv6UISr+3ElXjOLA3FLeLblVr6LLQi
         FGCEwSUK4AX+bp5BLmXQMJCtMUpAkVksDydLxuGlV/+7XpYr0p6vHFRw0yBUVwa7ngfM
         FXKKx05OF/6pnYQSFJzk3Phdsgnw2wGen7JwirrJfPJxx67lweLtcHPrUDTJ+mzFH3XL
         4MBxC54p2pP/C5VJk9utUodblJCPhs/08ODXTg3mFUsdj6rqzu/W5rHbVQZU4se8dbOC
         D+YUSj9aBs3XCRZH6uw/gCSPYB44Qnwi3mKMMDGFlSFA0hkB0vCeXduIkDHdbm1YO27w
         KNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733427396; x=1734032196;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJgt0q1XFsdzcWEuTvfZzx/PS2Wvx0jTJ2onrpygoeo=;
        b=hIEQPrQ7j9vuAMIu84hNXcbz4sN7k1B01U2yFbhGn3ctpXk+gwb01tI3ljmgj9NqND
         t57em8zhIAKBYN+onxOzQuXP20wTcw9lr5ksdBz4E5aDhAq7W2ELocgbuzz52LLHiK9R
         d5VXH/Og8GdAXQl8IqOiD3w9LegsoKNi+puFaIdNZBAEzjdhKFpfHlfL8TdDeFGofr6B
         esYgOsv60JyzhE+Xo1lRipzJqIqZTERJhTzYEtpE5rt2lBbjiP2+49uHWfvl8MYe1xd4
         tiHvj3DRjYbjS3iPjj/LetB8jNtRFgWpaWj1j6pp1Tnef6+AWw22XnmODXBzz/Nxhk+R
         eRmA==
X-Forwarded-Encrypted: i=1; AJvYcCUVH574vN5L/44nEXic/spT+6jwKskpxNsCmvILgbgrvByk03CS+3XF6v10Fdh2DCTiHJJLMFGH+lFPyGRBZr0=@lists.infradead.org, AJvYcCXs8+rvPJtPwPOoPSWxSaLythZVIwd/enaBEKYSfJfawGcurlXq9blpG7xcqAADsnYv//wJHzcwR3s9t51wf2HV@lists.infradead.org
X-Gm-Message-State: AOJu0YyANNk7hlRuUUWBEL35V2EzxEWgFhD12PSvuSbi0V5yTeNXO0Vy
	amY0QoVIQ3yOb0z5VyZgytvrZTX2HFDoShIITZrMqmq/ZWc8R4E4
X-Gm-Gg: ASbGnctoogIhujtZ5nR5/s2yNPzZAxAYs4KOXYQ5m19P04sWL1qh4n3UNrHE25yZnHT
	b11bHZIyRO4Q4V1Su45ztAmiMTUAZa6EEqQIj9b1OCLINipKCqFchee85Z3maQMmSHJqjdo8dO2
	vU9STCPZ0fvlY2HF/f5DOUswjt3bNoT0ntzorTHe9NkMSFvz2fnnIA95hPVXwC+tLE40IjgE4jP
	DK4AbKO0Bwc9RooCfSWefmyDyJOMW5KBzevCVo72+a0JS6Nr6duYKkbEeKJlESkZXdfZ0Ju0TXa
	KZsXkg==
X-Google-Smtp-Source: AGHT+IHCdi5TBjn3C2Fzikl0DE71EaVKFu10wCMrtdjXfxVyz+eSoEPxb+E0BJhugPJeysqSonLogA==
X-Received: by 2002:a05:600c:4686:b0:434:a7e3:db56 with SMTP id 5b1f17b1804b1-434ddeae575mr4123485e9.6.1733427395743;
        Thu, 05 Dec 2024 11:36:35 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da461sm33743535e9.20.2024.12.05.11.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 11:36:35 -0800 (PST)
Message-ID: <675200c3.7b0a0220.236ac3.9edf@mx.google.com>
X-Google-Original-Message-ID: <Z1IAvoenir8XRMuU@Ansuel-XPS.>
Date: Thu, 5 Dec 2024 20:36:30 +0100
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
References: <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <20241205180539.6t5iz2m3wjjwyxp3@skbuf>
 <6751f125.5d0a0220.255b79.7be0@mx.google.com>
 <20241205185037.g6cqejgad5jamj7r@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205185037.g6cqejgad5jamj7r@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_113637_573086_E324D588 
X-CRM114-Status: GOOD (  32.25  )
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

On Thu, Dec 05, 2024 at 08:50:37PM +0200, Vladimir Oltean wrote:
> On Thu, Dec 05, 2024 at 07:29:53PM +0100, Christian Marangi wrote:
> > Ohhhh ok, wasn't clear to me the MFD driver had to be placed in the mdio
> > node.
> > 
> > To make it clear this would be an implementation.
> > 
> > mdio_bus: mdio-bus {
> > 	#address-cells = <1>;
> > 	#size-cells = <0>;
> > 
> > 	...
> > 
> > 	mfd@1 {
> > 		compatible = "airoha,an8855-mfd";
> > 		reg = <1>;
> > 
> > 		nvmem_node {
> > 			...
> > 		};
> > 
> > 		switch_node {
> > 			...
> > 		};
> > 	};
> > };
> 
> I mean, I did mention Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
> in my initial reply, which has an example with exactly this layout...
> 
> > The difficulties I found (and maybe is very easy to solve and I'm
> > missing something here) is that switch and internal PHY port have the
> > same address and conflicts.
> > 
> > Switch will be at address 1 (or 2 3 4 5... every port can access switch
> > register with page 0x4)
> > 
> > DSA port 0 will be at address 1, that is already occupied by the switch.
> > 
> > Defining the DSA port node on the host MDIO bus works correctly for
> > every port but for port 0 (the one at address 1), the kernel complains
> > and is not init. (as it does conflict with the switch that is at the
> > same address) (can't remember the exact warning)
> 
> Can any of these MDIO addresses (switch or ports) be changed through registers?

No, it can only be changed the BASE address that change the address of
each port.

port 0 is base address
port 1 is base address + 1
port 2 is base address + 2...

> 
> I guess the non-hack solution would be to permit MDIO buses to have
> #size-cells = 1, and MDIO devices to acquire a range of the address
> space, rather than just one address. Though take this with a grain of
> salt, I have a lot more to learn.

I remember this was an idea when PHY Package API were proposed and was
rejected as we wanted PHY to be single reg.

> 
> If neither of those are options, in principle the hack with just
> selecting, randomly, one of the N internal PHY addresses as the central
> MDIO address should work equally fine regardless of whether we are
> talking about the DSA switch's MDIO address here, or the MFD device's
> MDIO address.
> 
> With MFD you still have the option of creating a fake MDIO controller
> child device, which has mdio-parent-bus = <&host_bus>, and redirecting
> all user port phy-handles to children of this bus. Since all regmap I/O
> of this fake MDIO bus goes to the MFD driver, you can implement there
> your hacks with page switching etc etc, and it should be equally
> safe.

I wonder if a node like this would be more consistent and descriptive?

mdio_bus: mdio-bus {
    #address-cells = <1>;
    #size-cells = <0>;

    ...

    mfd@1 {
            compatible = "airoha,an8855-mfd";
            reg = <1>;

            nvmem_node {
                    ...
            };

            switch_node {
                ports {
                        port@0 {
                                phy-handle = <&phy>;
                        };

                        port@1 {
                                phy-handle = <&phy_2>;
                        }
                };
            };

            phy: phy_node {

            };
    };

    phy_2: phy@2 {
        reg = <2>;
    }

    phy@3 {
        reg = <3>;
    }

    ..
};

No idea how to register that single phy in mfd... I guess a fake mdio is
needed anyway... What do you think of this node example? Or not worth it
and better have the fake MDIO with all the switch PHY in it?

-- 
	Ansuel

