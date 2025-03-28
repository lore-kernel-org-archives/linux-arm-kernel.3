Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B49C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KiZdMQWB/LsyZGPavTpYkl+cafFMzaAm8u3dZnX0TIg=; b=EpZ3Pjr9wZrPfjogER6dXdZhsE
	SEM+kyO0i4WPtX+3sKXLYxAGDTGsn7tun8XQ9rUjzkigbA8y/+U/a2YfxUMIoAkL5dN7Pg5P5V6k/
	BqJ1CSDH98XQmZsNaNZ7yM/AxWTsT3fq4DwucS6X4hAWVQvtuM/QtPZlS8WXaOqejYjBJ10Voo2Ru
	50uuG4+T5gyCEDR+xi8rJBpdzTGNBYPRMel8c2I7MXsu6dUz/7PeiWfJ3KPrbaGi2xCTZ4IYxa0vT
	/M0NRU/uTOy03VVCalhNBjFLKcAsU1biZbsQuzKJ7iKzcl13g9xgNrgsazM2VkKW/Y+53lEKNSMY1
	XRgQ4xjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyEVg-0000000E7Cu-2UnS;
	Fri, 28 Mar 2025 18:32:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyETu-0000000E6wh-3HPX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 18:31:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KiZdMQWB/LsyZGPavTpYkl+cafFMzaAm8u3dZnX0TIg=; b=voAhDDmFQUd7Im9imS7sFMtFb2
	gQicI5Us87m5OL3aZpSiJF7BQn3+6kS+M2bxrKbsje/yWRdIaH/Il/iEvnG8SW6kJzIE4t1tCSZIk
	qUliprkYscKX+kFLDyWxHNPmGi3F24FvEB38292R1tXrc2ciIsDBcioRKFg7Q1fvjwGk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tyETm-007Nvs-Im; Fri, 28 Mar 2025 19:30:54 +0100
Date: Fri, 28 Mar 2025 19:30:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add MTIP L2 switch description
Message-ID: <b187dd05-2d9d-45d0-81d4-fc619dbba1d9@lunn.ch>
References: <20250328133544.4149716-1-lukma@denx.de>
 <20250328133544.4149716-2-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328133544.4149716-2-lukma@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_113102_815869_44E5612E 
X-CRM114-Status: UNSURE (   7.68  )
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

> +                        /* Both PHYs (i.e. 0,1) have the same, single GPIO, */
> +                        /* line to handle both, their interrupts (AND'ed) */

ORed, not ANDed.

Often, the interrupt line has a weak pullup resistor, so by default it
is high. Either PHY can then pull it low, using an open collector,
which is HI-Z when not driving.

	Andrew

