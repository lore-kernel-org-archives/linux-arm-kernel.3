Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B65C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wtjRuAyC7vMRMx/UJSaY6ovJK30TPRL48z6eA243l8I=; b=tbegT60D0ZRFFuwSQQ/0jlFxoz
	74Z7Hsdk1OqO/DuiBp5KuwGq3/PWgz4W3h/MOBOKplHZoY8TYfgBpJJeXxAiYkEzY9CbymaLCGC0q
	Y7rnWFEZYcqoUenLR6BuxSZRFJPqN03PYpd3d0H+8URei66tDHOY7Odkdcfe9z2PcrObBz/zb/cJ3
	h74T+g16FgmOjiUiyf06mGIEfEDGq4Kc7FG6npMVv4cT4ps31C3XkTRUBOg8WJGE0LlraJmut7g7+
	Nc9KrYKitFYFPg9p7z5VYpB6s/I4EgXdkj4I8kPoFuS/6i7UdBMAS+LRSxQ3gZwiyzUMvPxNocHFT
	TzExglbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR15-0000000CVjw-0ybQ;
	Thu, 03 Jul 2025 20:58:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMP7-0000000BvbX-1oUl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wtjRuAyC7vMRMx/UJSaY6ovJK30TPRL48z6eA243l8I=; b=Ei9Kh3pVvB6iyQDYBACPJ3WWRB
	UA5sMKAdqAeWJyAzn7SUrmaE3ldJGc4cKGtebzXPpzC4fjdvwMYXw2r2JUheQZRFSonaYPrMsc1C3
	HCwKhbK8CGTH0i0eDzvU0g6Ajqhcu9b8WC+Z3GZkHBqUrndxlszGtilS9tvgQ+roZO8g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXMOe-0007HZ-Dn; Thu, 03 Jul 2025 18:02:48 +0200
Date: Thu, 3 Jul 2025 18:02:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: weishangjuan@eswincomputing.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
	vladimir.oltean@nxp.com, jszhang@kernel.org,
	jan.petrous@oss.nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	inochiama@gmail.com, boon.khai.ng@altera.com,
	dfustini@tenstorrent.com, 0x1207@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, lizhi2@eswincomputing.com
Subject: Re: [PATCH v3 1/2] dt-bindings: ethernet: eswin: Document for
 EIC7700 SoC
Message-ID: <3efddad3-87f7-4f4b-a406-a0c866ef5fd4@lunn.ch>
References: <20250703091808.1092-1-weishangjuan@eswincomputing.com>
 <20250703091947.1148-1-weishangjuan@eswincomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703091947.1148-1-weishangjuan@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_090317_477945_BF6F12A0 
X-CRM114-Status: UNSURE (   5.45  )
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

> +    ethernet@50400000 {
> +        compatible = "eswin,eic7700-qos-eth", "snps,dwmac-5.20";
> +        reg = <0x50400000 0x10000>;
> +        interrupt-parent = <&plic>;
> +        interrupt-names = "macirq";
> +        interrupts = <61>;
> +        phy-mode = "rgmii";

Please don't user 'rgmii' in examples. It is normally wrong, and we
don't want DT developers copying it into real DT binding, just for me
to tell them it is wrong.

	Andrew

