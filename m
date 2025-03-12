Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7417C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gO+URnsQQ7ytYQbborbvXI40PBwXJiX1pwI38d3wI8=; b=krQ3Kf/8X0RRjXy00IPGbQxwkc
	lmbNtAEVx4k+v67Z18lp3Hpo2kw6PyL7g5vIKJG77r04t8BtOPzdQnjbCQMtORDVT8KqCybt6/6XT
	gnYdzTJqjxAa4IYf3litcTr07IbKbjsw4TKBaKlQHtKjeyaGp18NtspqlFuAwN8LkT1THYYyFkO9g
	qQEyqFaDwkoecoD82ZRRlRaaGeCPv/NfbVugmWl7NSNHVvhwFrVKGYFZi2eKdLXKH4m3pa0PBe5E1
	jXIZn+cNBuU6bMdHzC7X5NUDjkF/xHa4Rj13iNde1xceONvJnen9YVmV+3Ar4JAvmHXryZ2X6QHfF
	2TCS3b4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMUG-00000008cVS-3A0U;
	Wed, 12 Mar 2025 13:51:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsM5W-00000008Z2Y-1NZb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 13:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4gO+URnsQQ7ytYQbborbvXI40PBwXJiX1pwI38d3wI8=; b=bYtfIQCpfh6upACEiKQBnm2fs5
	Fqq1bTrOCNhzTh/e00oyD1XeftmKbWLXGXC3O3X/LASJT6TMYK3D8/UUnt8oX7oji+I5AR29MmdhV
	/1XJhJI/0A+dSe9RWwCdqGweaTjOLU613LbaSpbXiKXebqk1oySBf7EKCvbvalKu9/pI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tsM5P-004fuS-BF; Wed, 12 Mar 2025 14:25:27 +0100
Date: Wed, 12 Mar 2025 14:25:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: radhey.shyam.pandey@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	michal.simek@amd.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, git@amd.com,
	harini.katakam@amd.com
Subject: Re: [PATCH net-next V2 2/2] net: axienet: Add support for 2500base-X
 only configuration.
Message-ID: <ad1e81b5-1596-4d94-a0fa-1828d667b7a2@lunn.ch>
References: <20250312095411.1392379-1-suraj.gupta2@amd.com>
 <20250312095411.1392379-3-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312095411.1392379-3-suraj.gupta2@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_062534_365244_9658B4A3 
X-CRM114-Status: UNSURE (   9.43  )
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

> +	/* AXI 1G/2.5G ethernet IP has following synthesis options:
> +	 * 1) SGMII/1000base-X only.
> +	 * 2) 2500base-X only.
> +	 * 3) Dynamically switching between (1) and (2), and is not
> +	 * implemented in driver.
> +	 */
> +
> +	if (axienet_ior(lp, XAE_ABILITY_OFFSET) & XAE_ABILITY_2_5G)

How can we tell if the synthesis allows 3)?

Don't we have a backwards compatibility issue here? Maybe there are
systems which have been synthesised with 3), but are currently limited
to 1) due to the driver. If you don't differentiate between 2 and 3,
such systems are going to swap to 2) and regress.

	Andrew

