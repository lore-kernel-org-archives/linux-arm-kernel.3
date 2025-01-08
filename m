Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295E9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 17:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wElwbqEqYtg6N83+A08t0RJt17oPW/Yout1Z5OV7l2E=; b=prE6cS0xgC42bVQLm7PmHBI4Dh
	51qM5Tvp6BSnmUWzv0zVK7TkBgMhV9nVxeAIfdgVBr+5IF90N8KZKTV2oohfb9CKhkaK269M9/lTU
	uHiAwKnSgkT48ZBmbz16l7a9pkY0PV/eIQDh3aonZ4f9AKCXXvhA4ODrUQiPgFLX+79lLG7CW7F00
	LxIQdv6ELE09y8xKAhsKsfsvePsyhJ+KagRNMIXm2kZ3dxHg5PqUJUcADeSWyp4Xx6z0m2ZePpFiK
	jkrLVbECEdqSoAKtS6/zJhmVLcLPzJ2Lu40ARI4qTIuJhqHES8Qe1ykZ4/gWMKdA1t9/n6xJGH4x+
	Y87WOw1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZxs-00000009P55-0do8;
	Wed, 08 Jan 2025 17:35:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVZTJ-00000009JBE-2FA1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 17:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wElwbqEqYtg6N83+A08t0RJt17oPW/Yout1Z5OV7l2E=; b=LiqIKbvF79gNnpe3mR8Pb6mhfW
	UUg2iHN3dn42PtoqQBxZLoknQuanz+p4cGI5ayiWZyNkAc2QBgNVh4tOsa0myHvQBxlYLd8yceTB9
	jpwfOz3xVK4dFJmDKSYzOwFtbFpKbQ9kkM+luWpmwlg41K2n0H7QiL1FgN7tkAf9DF7A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVZSj-002dOZ-NO; Wed, 08 Jan 2025 18:03:21 +0100
Date: Wed, 8 Jan 2025 18:03:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: minyard@acm.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	ratbert@faraday-tech.com, openipmi-developer@lists.sourceforge.net,
	netdev@vger.kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/10] ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <1dd0165b-22ff-4354-bfcb-85027e787830@lunn.ch>
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <20250108163640.1374680-6-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108163640.1374680-6-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_090357_571787_23BCA262 
X-CRM114-Status: UNSURE (   8.43  )
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

On Wed, Jan 08, 2025 at 10:36:33AM -0600, Ninad Palsule wrote:
> system1 has 2 transceiver connected through the RGMII interfaces. Added
> device tree entry to enable RGMII support.
> 
> ASPEED AST2600 documentation recommends using 'rgmii-rxid' as a
> 'phy-mode' for mac0 and mac1 to enable the RX interface delay from the
> PHY chip.

You appear to if ignored my comment. Please don't do that. If you have
no idea about RGMII delays, please say so, so i can help you debug
what is wrong.

NACK

	Andrew

