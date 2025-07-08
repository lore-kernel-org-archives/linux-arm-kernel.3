Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADB1C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyXS9M/fAZHQcRokoMR/G61/cwt9nzmHIW6p1L73nGU=; b=XslIx6Z3PqIO6VmDDF8w4X5dob
	e5PXg9+U9hEIu1XsflOzmqSO+rXyNUFC/8fssvBPqYA73Dex2SMaEb3emfblHMgRHX8i9AubyY10R
	I2DyjcZ1Bci/m87JeEA4DYumuH7r11/PYySb0Gl/Xs2SqL/5aqAyAxav3Op2Lk5Wnq14WcQJxM+JB
	QKmfPo26QGOfZbz3iti3bFtISZ5l2RQ72sBeuJRAdKhU3IwqlsfFmZ7xFfSjU9c6CIcJtzvyQaBqt
	seHtKbOtpzrfxypJsm8flxZnFCZr3gxPWmWk3k3Qv2xdCph/V0gj7ZYB+67htgb0y/PgE9j2osW75
	dOH+n5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFt8-00000006fXo-1KvP;
	Tue, 08 Jul 2025 21:30:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFa9-00000006bxb-38eY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 21:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yyXS9M/fAZHQcRokoMR/G61/cwt9nzmHIW6p1L73nGU=; b=zsHWz4PDhBM7nWWUmeaUFSsXTw
	oidB8Sl/Ghp4W9JCXAunn+v+jyjg7TOI39kBBcLRhZShcTxR3N032jjPrshIVl2U8TQoSKUL3slWT
	d/v+V8riXUj5TFfc2rYtqTXYndpGsOP93jqMw7fHB+xE/2TDFgAsPRGq/d6y4e2q/Mp0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZFZy-000ruN-NQ; Tue, 08 Jul 2025 23:10:18 +0200
Date: Tue, 8 Jul 2025 23:10:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 3/3] arm64: dts: ti: Add support for Variscite
 VAR-SOM-AM62P Symphony Board
Message-ID: <64ee1121-40af-4863-aece-381dd15fa678@lunn.ch>
References: <20250708184841.72933-1-stefano.radaelli21@gmail.com>
 <20250708184841.72933-4-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708184841.72933-4-stefano.radaelli21@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_141029_787442_0B697C44 
X-CRM114-Status: UNSURE (   8.55  )
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

> +&cpsw_port2 {
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the Symphony PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	phy-handle = <&cpsw3g_phy1>;
> +	status = "okay";
> +};

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

