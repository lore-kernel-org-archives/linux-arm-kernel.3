Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052B4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 07:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gv1HUJnOqcclkZ4FplUtalCiTMkMRTJ+aR4w+vz1yg0=; b=p/mAOWVPWTvBCRCOfM+MGIZTFd
	r/nkZmjlbyOX+thXrrZ+pOEy3VRh/ckxlDXS9d3j8/8+m3coycBauPc6ZK/blhh/oTN6bUnQE6y3c
	/impKkhOFTCuGYpoLrHsO8RR/Jy3QEtWDwI/8zhV+xnak3nuYQcD3RjOH3DZxhAqFmTNHOt3FEyel
	hjLR5zUeNUbSZQcLXvCXQeH+Db3puoQsULJPh7i3KFrKFTky6ym5gS0bIQ/Fprrx7gOPkY1qDg5ZT
	vNRG7IZDCir/9MIcrYOwEusHFcC36CH1NXh48lak6WjmIxZoOvfUx4rOtMrfFiIpiU+6c6wb+G+oh
	1T1f/Jkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYJxS-0000000HVff-1SdW;
	Sun, 06 Jul 2025 07:38:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYJuM-0000000HVRm-2lpP;
	Sun, 06 Jul 2025 07:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gv1HUJnOqcclkZ4FplUtalCiTMkMRTJ+aR4w+vz1yg0=; b=V2voYMJUWgVyz6eS4ODSlICWyG
	Pez+lVqti34ZammDtip+NLzyhbMzOY5ls7FHEAGVlLdkv3qtyCxTAOUx49Rwcvy5S1TU7+lyLqhJb
	R6R777wfhYLIfgxJrEl4W/r6Bhk54kqp5/evaY5l1zo0yW0DrzAVnQ09HCuqspM+tcnk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYJty-000WvW-OW; Sun, 06 Jul 2025 09:35:06 +0200
Date: Sun, 6 Jul 2025 09:35:06 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 5/7] ARM: dts: sunxi: add support for NetCube Systems
 Nagami SoM
Message-ID: <4ffe4afd-6162-4756-b473-8ad0c10bb59a@lunn.ch>
References: <20250705213900.3614963-1-lukas.schmid@netcube.li>
 <20250705213900.3614963-6-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705213900.3614963-6-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_003530_694404_73843B64 
X-CRM114-Status: UNSURE (   5.80  )
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

> +&mdio {
> +	lan8720a: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +	};

Indentation looks a bit odd. Too many tabs?

	    Andrew

