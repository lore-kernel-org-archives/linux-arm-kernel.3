Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81047C56206
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lH4duYsaZSQVbMs3WsjXwb9YxquF/KuGSsr/5eOxwGU=; b=woo9fV7d8+gjwvpsiRzVlk9OlY
	kCSgp14wV8IUOSZZ+/3oD67kUe+8LGH83fL9WHZIcV1vUMjcgdA6ylhBeBsP8agKKd37J/SuNTjsx
	VMD3yVhu3PzrzOq9EPq39/nFWMMv2qYLCtVBqUHI0IvM9cTE4nAzHiCpe+WWxsTMwwbpahHZtcfrj
	kBjGimXmy7+EIJpm+SN2nAJnKWgYuohCcuQit52qStW4786yNzxi+jnKdxHCXkdcfOPwcxJYCdF3L
	KVBD8EEEHy9YkZeBrbYfNhX8WP/hDnbyCHlkAqYTfdhEhGz1rBXG2z/nCp05NeME5GH+6sFkYIfV6
	EiLytDYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSGK-0000000EzDW-1xi1;
	Fri, 20 Feb 2026 15:17:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSGG-0000000EzBH-3BUA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:17:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lH4duYsaZSQVbMs3WsjXwb9YxquF/KuGSsr/5eOxwGU=; b=NJZqgZ8Ey8H+Fg/5D1Kp+ZXSIo
	uZ949lJLGr9R1H8rE/DDug+gFF9PeU38GX7xbRpz2XSNsuzh5Mc9frjeukUiY5wN9v8farbMwU7GB
	6vt/9+I2XGr4ZZQR7ZhiJZzFGXYoBbWzyUHsA/436hzdgFgbaSCni55/A6NG5jMcQFfc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtSG9-0085QI-2a; Fri, 20 Feb 2026 16:17:37 +0100
Date: Fri, 20 Feb 2026 16:17:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, git@amd.com
Subject: Re: [RFC PATCH 6/8] dt-bindings: net: Add PTP interrupt support
Message-ID: <c9d50d6d-2a3b-443d-94a7-d6930ff15316@lunn.ch>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
 <20260219054911.2017362-7-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219054911.2017362-7-srinivas.neeli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_071744_791960_5B30996A 
X-CRM114-Status: UNSURE (   6.65  )
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

> +      interrupts:
> +        minItems: 1
> +        maxItems: 4
> +        description:
> +          Interrupt specifiers for MAC interrupts. MAC 1 (with PTP support)
> +          requires 4 interrupts (ptp_rx, ptp_tx, mac_irq, ptp_timer).
> +          MAC 2 (without PTP support) requires 3 interrupts (ptp_rx, ptp_tx, mac_irq).

You say 3 or 4 are required, yet have minItems: 1? 3 seems more
appropriate.

You have restraints later, so i don't know if these are even needed
here? I will let the DT Maintainers comment about that.

	Andrew

