Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F1BC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 15:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuyUiiI7ZFuPPHGTzB32+a5/wwkD8Jfy7CZVbltjHtA=; b=GViD9zieZt7qf03rJmyW0+oHjc
	bwxrWbS7zbRNRrR3tUGc0Pc3NfoQ63riqi9ZTF4+epLDL78Jale+oaq3/C3GMukQ/A5J9dE/DRW3q
	Ju0OL1xIzXtlHdJ0vdHBSWjNc/igUjLPGaR2YwRCsVUqBdeVEmvpT+GTGArCeOom8CEgGGFFN9wb7
	VnWbXhD5B/7v25sRcZqPN3lKN3rxpgdcOltVk0Ml6ktTgmdfOCwF5CjtE/iIWHeb1Aysp4H/3Y1f+
	3B4tQeywfkXpXpjX6GqmPBX/8tc2zCW6EF5usJKiN70hao2oSYxnJqOH/7ge+1KgfKSr0j7vmgUWr
	UyFtmfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOM3-00000008vi2-3x6Z;
	Wed, 12 Mar 2025 15:50:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKwQ-00000008N1l-0HyO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 12:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YuyUiiI7ZFuPPHGTzB32+a5/wwkD8Jfy7CZVbltjHtA=; b=eMKAcuAn2Tef46O2sREbd5JusY
	LdZ7uMoXii7OgFq2XCG/PvANlVkUthXXopVpdbVF4KS1LzveZh1HFUpIPonEMVHBAg344Ko/Mq8We
	I1yJauwZk1lslPLU35cn7dyV4rPgR19UmaU5x8cvODdxJrSF4CQFX4jok7x3mDI8j0u4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tsKw8-004ebX-Q4; Wed, 12 Mar 2025 13:11:48 +0100
Date: Wed, 12 Mar 2025 13:11:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Willie Thai <wthai@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au, kees@kernel.org,
	tony.luck@intel.com, gpiccoli@igalia.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, openbmc@lists.ozlabs.org,
	leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com,
	maryang@nvidia.com, pmenzel@molgen.mpg.de,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200NVL BMC
Message-ID: <9ccc845b-9392-4a37-8bca-4f54997126ce@lunn.ch>
References: <20250312045802.4115029-1-wthai@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312045802.4115029-1-wthai@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_051206_111424_5EDCFAB9 
X-CRM114-Status: UNSURE (   6.95  )
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
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy3>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +};

Please read the discussion again. "rgmii" is probably equally wrong as
"rgmii-rxid" you had in v1.

Please talk with Aspeed and ask them the clean up the mess they made
with RGMII delays. Until that happens, adding this node should wait.

     Andrew

