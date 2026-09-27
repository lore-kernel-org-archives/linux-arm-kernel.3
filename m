Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAD7C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oMeoZ4pGEsBia+lJYpRLMOIzaRZRIDGRSGowGGDiv0=; b=U8odThUr1bsZnG1aBguXLTLMgZ
	Vj2mLJpf/MI+WiargH/YU4YHNJEF5MtTLohN9vs8sNEkuOVfFhbkbgi5TG5h2VvEODKIvfL03ivs/
	1pSKE0sxPRdyxMehNay2jnJ1kFYhMn2DnJSTwESRSdak4Fpl3oBGxQJPHmhcgwbZ5GrRJQ7wtPINO
	lMcnEaM6JqFL0/s8TtmKTUVzL7ODXWz00HG+xhZz0SsSXj5hJJm4oIhSGzcZrkHs4eD3fjt2J4VxQ
	+x0pQlDMsiOwfLDnSH7vCkp6W9Lt6DVX5hCOLGKdR6vHcqyNcc8BOLALqtvE+ljwyuzhX2fzAZcJu
	X9DhVRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArPD-0000000GY1g-0b7r;
	Sun, 27 Sep 2026 16:07:11 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArPA-0000000GY14-1fYz;
	Sun, 27 Sep 2026 16:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+oMeoZ4pGEsBia+lJYpRLMOIzaRZRIDGRSGowGGDiv0=; b=ygKYUhErkjokFDjmsL3hU3RSsU
	SpM9nL/uVB5J5zwuyqTNQI3AHDGE41RqsI65O/FkM+cZAWxH5Ep7WAu4VtblAqpuI0anUL/Jk/pNl
	61CuC6DFHZndKNr3B1Rp83apg17/rhmquKp6VMptUxdBN6QuMx+uafyfcNvuDtLmXWs4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xArP3-007XMX-3k; Sun, 27 Sep 2026 18:07:01 +0200
Date: Sun, 27 Sep 2026 18:07:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: BG9OXA <bg9oxa@163.com>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Message-ID: <89731a27-4d5f-4a01-88b1-26c2e0d65ef9@lunn.ch>
References: <179051260955.4055.15953866975694461812@163.com>
 <179051262683.4055.12205303753370851498@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179051262683.4055.12205303753370851498@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_090708_439737_3D64C769 
X-CRM114-Status: UNSURE (   8.80  )
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
> +	/* Use rgmii-rxid mode to disable rx delay inside Soc */
> +	phy-mode = "rgmii-rxid";

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

phy-mode describes the PCB. Does the PCB have an extra long clock line
for RX?

If the MAC has a delay which cannot be disabled, the MAC driver needs
to handle this and mask the value passed to the PHY.

Rockchip DTs are often messed up in this respect, but i've not seen
any indication the MAC really does have delay which cannot be
disabled. So this seems double wrong.

    Andrew

