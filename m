Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952A5E73174
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+W4ZDLYcf6XvV35qGRdJ2by5UrE788TXg75U8Ga6uE=; b=ksIAisJuHD2e0HSR7entR85mcB
	Y1WlCP4ZtiS9oIMT6WF4+H1wuNIPzDpmiXe9lbaXTghkAjHFozYCp8zC8DDva2H7wsFAmkAbESdZT
	LFPGljQFCi6/sYblCgje5gJhJV+WUZrOrAGXR5bI+5X9ztNVStFjPDsaWjoF7GKpH0sM+x2E2HuX7
	Eur0WjehLrDGNo2+M6Ji085XHQa3PXmfOGBShDElyh+MCgV1MSMLgNljJYfSGdhVylL5h7VqGg85J
	VsqqaXT8zHJGfPsII9kpqdgGHpbqutmy7LYXVGVhvow9WNJL7OMJuxSrOjEhPpr0J0fGKvce96Hoa
	qWNECehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuHl-000000051pU-3YHt;
	Mon, 02 Feb 2026 13:48:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuHi-000000051p0-2Gh7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X+W4ZDLYcf6XvV35qGRdJ2by5UrE788TXg75U8Ga6uE=; b=2QWGKoPJ2dAa9pW9Xt5Zq3fFv4
	SU7V+M0neu1dlyJhZWMRE4xDPaIh/aZieM5DZ5TdnLjo+dqGh2QhY/SwYQvTyaERz/U1kgOwM42BQ
	TfTp0li/Sx+zhZR2MDB0zTSBjDXhMmsL264ogvK4/XI/45oPqoSzxCT56vNFCe9Bf5wM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vmuHR-005pVE-A3; Mon, 02 Feb 2026 14:47:53 +0100
Date: Mon, 2 Feb 2026 14:47:53 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Patrick Williams <patrick@stwcx.xyz>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
	Mike Hsieh <Mike_Hsieh@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>,
	Roger Kan <Roger.Kan@quantatw.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: add Meta SanMiguel BMC
Message-ID: <902ccda3-d5a0-4a8b-8bf0-afda3a2cb1af@lunn.ch>
References: <20260202-sanmiguel_init_dts-v1-0-c0023ae41899@gmail.com>
 <20260202-sanmiguel_init_dts-v1-2-c0023ae41899@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-sanmiguel_init_dts-v1-2-c0023ae41899@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_054810_581648_CBBC8563 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-rxid";

That is an odd PCB design, with an extra long TX clock line, but a
short RX clock line. Please check the schematics to make sure this is
correct.

> +	max-speed = <1000>;

Can this device do faster than 1G?

> +	phy-handle = <&ethphy0>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};

	Andrew

