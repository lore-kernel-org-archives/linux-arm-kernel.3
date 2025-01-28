Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5337DC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 17:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KuTFPn3BWudhk89I6Q5e7sp5NTwdicXotg+TALDJneg=; b=p64ZiIRa+SBuXUHK5qggHyH4fI
	w7hetmyQ8OZwJEIaAGZG8lRw94jpq64qY6bSdaM+G6nUMbIBc+9xVqY0QZ2VKkCqBntqA8b/v7YVc
	5lGBBs3k68iR1wKanmoNeldrwqnOFEb7iJBR2DXGXql5IKIs82Pi+h5WoqZ9HA2fyColxzMypyfGg
	UJML6jVVWuG+0/T8qb2LryL4NH+UXg93IAyA4sTZ4AtcvTInIWzLg15VSYKa4cN5RUyBqQGOdKjEB
	Wrv8wmnE2IOCpOa2HSunkXYfO0gJzxqplFZet31ZwerRi99lGkjDnnU6GsqRcqTz7HvoiZIqnNt7S
	tsXJsoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpeu-00000005SjJ-0Fh6;
	Tue, 28 Jan 2025 17:45:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpdZ-00000005Sbd-0qnA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 17:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KuTFPn3BWudhk89I6Q5e7sp5NTwdicXotg+TALDJneg=; b=ISJqIALJ3dEvTVp9ptojRhD3gA
	KY5uM7hwlAsZgW2gPQACqTxgSx+JyYYQmyOt9djHAw+F83Xid6U+Wy4tzPOWFdvAIGHxLVH5rRyXx
	7O9Ofrh6S/Gtt/CQJvtVrsd1q0kZSFGoyf6OqLZ+KwMA5A/ayqxek5+Qw9Qle2Z5pv+k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tcpdS-008uZO-Ig; Tue, 28 Jan 2025 18:44:26 +0100
Date: Tue, 28 Jan 2025 18:44:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
Message-ID: <f9aad21c-64f9-413b-a3ea-18825515944c@lunn.ch>
References: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128172917.4565-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_094433_243184_5F17BCB3 
X-CRM114-Status: UNSURE (   8.68  )
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

> +&gmac1 {
> +	/* Uses a KSZ9031RNX phy */
> +	status = "okay";
> +	phy-mode = "rgmii";
> +
> +	rxd0-skew-ps = <420>;
> +	rxd1-skew-ps = <420>;
> +	rxd2-skew-ps = <420>;
> +	rxd3-skew-ps = <420>;
> +	txen-skew-ps = <0>;
> +	txc-skew-ps = <1860>;
> +	rxdv-skew-ps = <420>;
> +	rxc-skew-ps = <1680>;
> +};

Hi Uwe

The convectional meaning of phy-mode 'rgmii' is that the PCB provides
the 2ns delay. Here you are abusing the

> +	txc-skew-ps = <1860>;
> +	rxc-skew-ps = <1680>;

To add these delays.

Please test without these two lines, and change phy-mode to
'rgmii-id'. 1680 is rather low, so it might not work. Look for CRC
errors for received packets.

	Andrew


