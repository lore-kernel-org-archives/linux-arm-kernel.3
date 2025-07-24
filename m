Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD3DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MRFZSKKh935OBJE8qpoSceVGNtpTGpXTpzGaVT80ID0=; b=UYQLSAg7aldIMveweg6CTe67zw
	BQ5Dzbf4xzM62MNGTCBqRWwPaEsxJFVhc+ZWRaulPkn04r8HVTvf3BZBeKvxn8dcOM9y7MLD8tom/
	iAT0WyuQ3A+sX+HIqbMYJ4Tjgq7UsyJrQuuBs1EKW1CvURSikyGR86ZvQYaJUgDVJPg1HeCoOG6+B
	QbQ6wZ+rD21Hm/RXPAMcainiO5E4o2trPytzpQE+NrYlAVJTsBcojks31b5JnsXTFUxrY+fE+KVk2
	MFZqyRuM0ZP/u2Ned9Re+SJYx5Zi+u142XH5+jDStIfhv/G0h1PG0JMrE/35yfvuul86WEZGiWl0R
	t17UvsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueroF-00000006y11-167T;
	Thu, 24 Jul 2025 09:00:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqxT-00000006nNp-1fDx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 08:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1166D460C5;
	Thu, 24 Jul 2025 08:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D984C4CEED;
	Thu, 24 Jul 2025 08:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753344342;
	bh=QQ/KUR9EUnReinV6lJwLLr0fnjQkBu0aezOtyeBubts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jMwAL61fiSNB5XAz4p2SUVMSHj4GsnjdjPunEMS0CWrz2TCLkANqT1xzJUjRcvNQQ
	 cQkv0TRaEDZPgtV/oigHfWj/+Jg0O8D5V60g8GM+VKvxpZK10wM07tYX4W/VwSBTqP
	 J3/eb9Y/iVNqRoXHHTxLaDbJ5VCPFP+zuW42sBCSWPEXyX2sTINfI2n2fLboGF12S1
	 VYeXT5EmMHp8MMMSjmlnRfkxU9GgHbBpivtR0cZ5vqAIkkuheWdCZ8gZWKkFpUOZK7
	 dYImub39SSfDGHOv3KPnDJYEr79kUA+uz9E/gc4E0EJdR+yIPYh+tbtO49si0YyCJ5
	 4yQkyHskw5vqg==
Date: Thu, 24 Jul 2025 10:05:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: rentao.bupt@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v3 07/13] ARM: dts: aspeed: Add Facebook Wedge400-data64
 (AST2500) BMC
Message-ID: <20250724-overjoyed-panther-from-camelot-f2ff4f@kuoka>
References: <20250723233013.142337-1-rentao.bupt@gmail.com>
 <20250723233013.142337-8-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250723233013.142337-8-rentao.bupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_010543_460437_9AF269C6 
X-CRM114-Status: UNSURE (   8.55  )
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

On Wed, Jul 23, 2025 at 04:30:03PM -0700, rentao.bupt@gmail.com wrote:
> +		/*
> +		 * PCA9548 (11-0076) provides 8 channels connecting to
> +		 * FCM (Fan Controller Module).
> +		 */
> +		i2c32 = &imux32;
> +		i2c33 = &imux33;
> +		i2c34 = &imux34;
> +		i2c35 = &imux35;
> +		i2c36 = &imux36;
> +		i2c37 = &imux37;
> +		i2c38 = &imux38;
> +		i2c39 = &imux39;
> +
> +		spi2 = &spi_gpio;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart1;
> +		bootargs = "console=ttyS0,9600n8 root=/dev/ram rw";

Drop bootargs. You are duplicating stdout path and choice of root is
definitely not a mainline user friendly.

Best regards,
Krzysztof


