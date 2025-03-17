Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010A9C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 12:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNJJvO2bu+Nx0yChJk+GIzP3W85ueiBmXIziZPYbCvI=; b=zvQZojXv2jmE7iEgvL3CNLdYpD
	AEQHokD/SjPoBf2k4u5fHnMZX8UXSmRjzYEjMQOA9lBqhxBpSrldamhX4SVrzr3VXB1zwMwBMJU9A
	n/jYCBfGYSOlkMnHLdln5u4uNdQGlUosDDWho8aH8gQO0iHjyvoOs5W6oW/ai6kydkKM7N/L664UL
	IaquJROYERc9eRM19vgMXL3DddCdU3oyE/UpGrVz73TRC9V96NNBEQlBgXqjO/BumfPmMcQw46sqF
	aNxIY9ZqdfxugCGaQniE3QD6SdHQJqoagBwl6oQWW5jKub/pYp228k2DAoJNEZ6Ue9eacOJCwEPzG
	hlE4i0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuA2z-00000002eIS-2o6d;
	Mon, 17 Mar 2025 12:58:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu9sQ-00000002cXm-0EhR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 12:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iNJJvO2bu+Nx0yChJk+GIzP3W85ueiBmXIziZPYbCvI=; b=Wic+sbb/02D7n4JVfpFeqLE3P+
	pJCxgsOJ6q1oubgXB2N9KrMuybB2/ntIuk9/EJjFchfkwKbMrUbp4KIE0AcSdg2AAdT6RG4KINigM
	gQ+E6izf3ww2MqXiXoSl3Jk9LjpaF/LKWWSZJp9CQVDESAe0RJ4G1QfFqlIua3aGlPkw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tu9sC-00683V-Of; Mon, 17 Mar 2025 13:47:16 +0100
Date: Mon, 17 Mar 2025 13:47:16 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, ratbert@faraday-tech.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, BMC-SW@aspeedtech.com
Subject: Re: [net-next 1/4] ARM: dts: aspeed-g6:add scu to mac for RGMII delay
Message-ID: <be284777-978d-470a-b38c-2f79a1d76134@lunn.ch>
References: <20250317025922.1526937-1-jacky_chou@aspeedtech.com>
 <20250317025922.1526937-2-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317025922.1526937-2-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_054730_096107_E55B717E 
X-CRM114-Status: UNSURE (   6.01  )
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

On Mon, Mar 17, 2025 at 10:59:19AM +0800, Jacky Chou wrote:
> The RGMII delay of AST2600 MAC is configured in SCU
> register, so add scu regmap into mac node.

Don't you need to add the scu to the binding?

	Andrew

