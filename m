Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B70E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuL0vSwcp+HMpPwWDWVKgActioYscbfUsEOUicYp0kE=; b=Gz9AuuLvGy7AZ18/IBrZ8tx8NX
	83l/Ppz1LFwrJuC8f3PJSp31J14rxeyqTXSLGFQSMrMoylaxrzg24OzgqEkTC/trQ6UyfQx5FlB3i
	qBLetBy3tIwQGebznekQhzn27dCMRYoI4vYf5jM823FhuPX45gN+WSFSWPmotEH3bB224WX8yUUPa
	uvIIXZrlq/fAymHj/Z1bxpLVq9NzfGS+FFpFEyc95AArDxytKClAkYnUcV293a4QfY5NY2YBcwtLs
	p+adqCO8i1Gz6FrG1wTA4372nqn/qy75kwZm68XCwUF1AhEAFoMbeG7imC+1h7vZiT8ytX1ndED3J
	82ADd8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGxN-0000000H9Uk-0tz6;
	Thu, 05 Dec 2024 18:52:09 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGvy-0000000H9La-3FLS;
	Thu, 05 Dec 2024 18:50:43 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa63584e157so3295466b.1;
        Thu, 05 Dec 2024 10:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733424641; x=1734029441; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xuL0vSwcp+HMpPwWDWVKgActioYscbfUsEOUicYp0kE=;
        b=hTS8BSVjU2O3PLLIuu1oOt9Q4T7H3y7F5z7P4zZv+wz9IIAvLKNS7ymCHQdfmly6YE
         zs5Pyo9cI6UlKpVuggnqzN9ABLcuoviNLLsoYvKmozfCSWDJ07VIZCT29LyGlWjrm3w6
         v5F4mBLgCFXPYws/O2ygFM9gpqKHywIGFkdHK5WmdnLkywB89Z2glI5ywdtA1zu2CNPK
         9+wEtzI0569m4QABh4s6GiLsdP7lHMtuTH9xE3XxeF7jAmvuEgk5FnNWq+BKhNS66Ouz
         /U14v1WoDgrmdWI9K7bKTUePd7rpVw0ln7ItKeOrF2XPui8PFyWTnte+InyW8K71EVSx
         fWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733424641; x=1734029441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuL0vSwcp+HMpPwWDWVKgActioYscbfUsEOUicYp0kE=;
        b=vwvt0kHE35B1UzC3ZijADu4sviLbFYgdj5Te7nsSnQLx04z/uH7MXr+3IdfMLM7G+v
         Y9bAzT0Btj54nedoiZvbnC7XBFOeA7JlVPu4G6jBKQ6bV2Z6Gk0rxKRyrBov+NlJuSy3
         jNHxE6jfxrgBgUHrH1q2/JmI3k+9m2bON674XyZYOv8YDYCNJCHbT3DJR6W6Q6p3uVzJ
         q5UMTySVfvQnVbzAGuzCA2zbvXsmK78O143QIco+8PVeSaMJDTi5fPGOIU9DCKgrhAn8
         xBn4Yz8G5PXhbnNUc+mSXZcEVWSBoQkVnCcQEmgalXK8kUgqc3Ft3rr5U2RQ4IRT/jYD
         F5JA==
X-Forwarded-Encrypted: i=1; AJvYcCV+dPLUCKO5m4NZnTaTTKsYmnzGlPSVxlsVOc+dS9oUjA2cmE3+sr/R5XgKf274IZACEM0qsHtvFKuMhoutSj8=@lists.infradead.org, AJvYcCVd+xji7AIPwk02qXAb7xfldfHW3gscB/8cZSYRRSEjMqCJz3KAvyHXFQsOt2PBnSe3AOih3B6uoApcgyXAI7hr@lists.infradead.org
X-Gm-Message-State: AOJu0YxOf2saUdvyiGhUVmL6EuG7oJA2KCVwfpKlrmXCiqTmUY5tvKiH
	IGtAn1ye4uaE36LicfU22gRaTmN+75PZ8NCfRp0LPLZY1zTnKnSd
X-Gm-Gg: ASbGncu4hgxOdlNjjSuzjYp9sggZ7firk88Xa9js7l+VnA5aYBXHhgaFlz8vuflIKIe
	N0bRh0E0a43NsGyjrS/BcuiWlTqhIKZXTCDyxQfAFnNDBTpi2+P+5yvxZDHN9yhfVq+Jr9/2Lu8
	skRaOEltV1MC64gPSR1R/fZ216ej5taPYzy21osCmVNF47rHHm9KJL7aisW/TuNj5QI+0pfRDlc
	1TwqYSleMD2QUyIwid9k/UIS6CBO6spVRjcSso=
X-Google-Smtp-Source: AGHT+IHXBo4XbdE1KRXT45i7tcr0tQbymXLsF4fYU2CO5TAKnlDgiYLqOd3ZY8+xqizacESzgmiQQg==
X-Received: by 2002:a17:906:db03:b0:aa5:3b5c:f638 with SMTP id a640c23a62f3a-aa5f7ccc944mr453434466b.1.1733424640392;
        Thu, 05 Dec 2024 10:50:40 -0800 (PST)
Received: from skbuf ([188.25.135.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e972c1sm126626266b.76.2024.12.05.10.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:50:39 -0800 (PST)
Date: Thu, 5 Dec 2024 20:50:37 +0200
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
Message-ID: <20241205185037.g6cqejgad5jamj7r@skbuf>
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
 <20241205162759.pm3iz42bhdsvukfm@skbuf>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <6751e023.5d0a0220.394b90.7bc9@mx.google.com>
 <20241205180539.6t5iz2m3wjjwyxp3@skbuf>
 <6751f125.5d0a0220.255b79.7be0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6751f125.5d0a0220.255b79.7be0@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_105042_811542_27B527C6 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, Dec 05, 2024 at 07:29:53PM +0100, Christian Marangi wrote:
> Ohhhh ok, wasn't clear to me the MFD driver had to be placed in the mdio
> node.
> 
> To make it clear this would be an implementation.
> 
> mdio_bus: mdio-bus {
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> 	...
> 
> 	mfd@1 {
> 		compatible = "airoha,an8855-mfd";
> 		reg = <1>;
> 
> 		nvmem_node {
> 			...
> 		};
> 
> 		switch_node {
> 			...
> 		};
> 	};
> };

I mean, I did mention Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
in my initial reply, which has an example with exactly this layout...

> The difficulties I found (and maybe is very easy to solve and I'm
> missing something here) is that switch and internal PHY port have the
> same address and conflicts.
> 
> Switch will be at address 1 (or 2 3 4 5... every port can access switch
> register with page 0x4)
> 
> DSA port 0 will be at address 1, that is already occupied by the switch.
> 
> Defining the DSA port node on the host MDIO bus works correctly for
> every port but for port 0 (the one at address 1), the kernel complains
> and is not init. (as it does conflict with the switch that is at the
> same address) (can't remember the exact warning)

Can any of these MDIO addresses (switch or ports) be changed through registers?

I guess the non-hack solution would be to permit MDIO buses to have
#size-cells = 1, and MDIO devices to acquire a range of the address
space, rather than just one address. Though take this with a grain of
salt, I have a lot more to learn.

If neither of those are options, in principle the hack with just
selecting, randomly, one of the N internal PHY addresses as the central
MDIO address should work equally fine regardless of whether we are
talking about the DSA switch's MDIO address here, or the MFD device's
MDIO address.

With MFD you still have the option of creating a fake MDIO controller
child device, which has mdio-parent-bus = <&host_bus>, and redirecting
all user port phy-handles to children of this bus. Since all regmap I/O
of this fake MDIO bus goes to the MFD driver, you can implement there
your hacks with page switching etc etc, and it should be equally safe.

