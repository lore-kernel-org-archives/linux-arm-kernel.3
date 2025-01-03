Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24CBE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euKQv8+qLLAglA2nxjWTRO4cSqgxw8gfNLiNQS7D87I=; b=oG3ephghXECJsqiPRu/kylRAok
	z5s96Vydv5OLxTmdpgKqLqhihDgVSGkRSKdjD4gNg5tQSTY2AOq5FzjDxW6m3Sh142JWmuz/E8fWy
	06NPzplBxqPt+0XMpmk+cpSv8o5v8UaAbxsetO2gTRhd+4erRAJWCSd3Sh+b7XNxoagFChmRQmE9V
	3zPEePJ9bslNBa+Q2rCsXCtoHtFPgOseGgozilPw6ERaXXo1afg33Ha1Xbc/q6hy79zIuModP+RlJ
	GFnXipRJms7adaDvJGvEtGgPUas/4h8FKq4k0AuP67MhJLCQyb+pt7OX92EyFpcmUd71bQUcVBgHh
	8Gk8VUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkBr-0000000DNs5-36MB;
	Fri, 03 Jan 2025 16:06:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkAd-0000000DNgu-1oK9;
	Fri, 03 Jan 2025 16:05:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=euKQv8+qLLAglA2nxjWTRO4cSqgxw8gfNLiNQS7D87I=; b=G/rXWzC1EPtUX9suhRFYwTZz43
	DQgHcKa0CHDONit0ayHI6R7vHtpUHqndnWo/VMxvl6sSzrOmfknUDAbyRP02WnSK3eRWTy4H8V+K/
	ABR2aF01Zd9a2CAIGQOGeBs6E0IcQufO/lwgI7nMuzKgZI5jHwKfwwDt56UTmC2buEls=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tTkAR-00154Q-Ao; Fri, 03 Jan 2025 17:04:55 +0100
Date: Fri, 3 Jan 2025 17:04:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Niklas Cassel <cassel@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <5a3e8fda-f9e4-4c2f-847b-93f521b8313b@lunn.ch>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
 <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_080507_472449_ADB66A92 
X-CRM114-Status: UNSURE (   5.93  )
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
> +       clock_in_out = "output";
> +       phy-handle = <&rgmii_phy1>;
> +       phy-mode = "rgmii";

rgmii is wrong. Please search the archives about this topic, it comes
up every month. You need to remove the tx_delay and rx_delay
properties, and use rgmii-id.

	Andrew

