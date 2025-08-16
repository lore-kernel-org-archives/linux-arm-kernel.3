Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2784CCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 01:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uL1GIBvtGp9qBxNEgGd9zVR3Ww4bteJizXBxx4LVKvs=; b=C8vUn1Vj4JaZa+6YujUR+S9dsK
	tXy6HuDnaH+yucPu7eu654kZDFrWVJq9D3TBiRPQga1u5G3wrRcW6CNnh/We5zxImoj9RUbeyfBxP
	KAo2JaFqSmTnBfJKZEMtby1nrSBYsJh2oOZKHUCUNLhZhGg/vg/HvIwwKlHjfBNf2Bps5lH/pGBOV
	gpHwnHKBykrLcuX1zauuwrWGCV9fpDNx43puGuiHzSKD9OLvJniYTf8gPK4RrbotAsJ3BITbL2Vkw
	q6Qirqx612ha5M5X5PJHaYR6G58fgyB0Lh7oA3DCuZitpaZGHsB4u9Wso0B8rb3iy9moZF4Pdy1lI
	2z/kACJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5MV-00000003qjK-1s0e;
	Sat, 16 Aug 2025 01:05:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un5Jt-00000003qYV-0Jw1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 01:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uL1GIBvtGp9qBxNEgGd9zVR3Ww4bteJizXBxx4LVKvs=; b=DtwVebt2cPukDWsmBxLRl1g78u
	DqhE4zATJgulz++m6XYvVtziVYvIva8IqXNIVL6e6nusqUoAoBwIoj/VEzHq9WN2Rva18nFtm3oTj
	n3MCpOlxE4z5lVZVRqcm/Y0gGM8bsjyo9Yr5/AbOcelka9ZkhUb1JFNC7PxJywNOKj44=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1un5Jf-004sU0-Qg; Sat, 16 Aug 2025 03:02:39 +0200
Date: Sat, 16 Aug 2025 03:02:39 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Marc Olberding <molberding@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: Add device tree for mgx4u BMC
Message-ID: <21ee5045-632f-486c-962e-9e2963f60ed4@lunn.ch>
References: <20250815-mgx4u_devicetree-v1-0-66db6fa5a7e4@nvidia.com>
 <20250815-mgx4u_devicetree-v1-3-66db6fa5a7e4@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815-mgx4u_devicetree-v1-3-66db6fa5a7e4@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_180253_116578_179928F7 
X-CRM114-Status: UNSURE (   6.12  )
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

> +&mac3 {
> +	phy-mode = "rgmii";

Does the PCB have extra long clock lines to impose the 2ns delay?

	Andrew

