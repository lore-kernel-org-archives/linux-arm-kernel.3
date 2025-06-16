Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAD9C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 23:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nx2VXidiB5UsT2nnGwnvJjTlLUfXLsHpiKrWVggKhyM=; b=snX0/HgGmvW2s8vjPWu6cQhNFL
	mi88/WcASCzkr+nA8kTJ3d9UxrfM5nrkypzD7r8uDdg9KkeQ57ykE6ZTClMYTXxFevJ4BG3a7x4S8
	oyQRqhZJd5az7Z/Ak6XZCK5gipv8s6g/F15dhsoIuukuJEMqOwOny+JrjPSntXGDWnwVXdkwkrSLu
	pHwE9NdXUpDaHQeTVIu2tSJPEFaYT++w9Co8rUKk5ekUzivEcrQO0RlWE0xfW5So9/It8UOwukth3
	gYLBtL8dtcEwPEniE1H8QElL6ZbvYeoCFM4Cjy9XGz9iG7t7K2Chtd3gpc4IKGJUlxoHKM+fdo2i3
	6c3ZJK6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJfF-00000005qzA-0jwH;
	Mon, 16 Jun 2025 23:54:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJd0-00000005qjQ-03Gk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 23:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Nx2VXidiB5UsT2nnGwnvJjTlLUfXLsHpiKrWVggKhyM=; b=oAeIQ271lYVhYBQevrGYAx60dK
	aMJQ5JVPKwVEyOWyncFuLKaa0JHTZ98Ge2aK4dPo4TZ3Cw0nB45mojyvV9K6xU1QOrbLhJMv4xLlL
	KCysaQDLjz40DQBjvJyoYTenAAyXY0f7V+8AB0UOx0QMRU3o5KwYhpNVtMfYF/MdvnJ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uRJcq-00G6c1-5V; Tue, 17 Jun 2025 01:52:28 +0200
Date: Tue, 17 Jun 2025 01:52:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: aspeed: Add device tree for Nvidia's GB200
 UT3.0b platform BMC
Message-ID: <34be8ac4-8414-423e-a6e3-a566ad1e9f11@lunn.ch>
References: <20250603203241.727401-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603203241.727401-1-donalds@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_165238_055038_7ADEB7AA 
X-CRM114-Status: UNSURE (   7.03  )
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

> +&mac0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	phy-mode = "rgmii-rxid";
> +	max-speed = <1000>;

Yet more broken aspeed DT. Don't you monitor other patches sent to for
aspeed BMCs, see what has been rejects as wrong and avoid the same
mistake yourself?

Please search the list for why these last two lines are wrong.

	Andrew

