Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF84CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5aBzRy9SrXCcJ1rkx7TeZFNbpBmp0grZlwbuKu+WTg=; b=s89nsDiv+MXYF4xTp/iCks0J87
	UOzhdzSk8j6LFVpTithRuB4pg/4Ns9YxpJFGvH8WbXiGiuPfMXI6qKdfo07jtIa2UT2ticiJAqXtb
	TgAhwajlBrzrc+ydVXArQsxn6DXidFRrWfkPASml/Y8XcOL+gyGdtZpfxeC+UNLgELhPpdK6B3SHy
	C7PRJQqLJS+rGJNqJoCmqdAO8Tdn5TWlg6tgd0kVdHYOhprZV+5FTQdStazOSW/tJrp2N5j87gnai
	A7ARiwGlBMIXcl+ZLSVuInncj9DSzaIKsJYYUYCGTPROGx72nIOBJy/kizTcv+M/XAEBZj9pAKTFl
	RtKfLNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKPF-0000000EGGv-44C5;
	Wed, 10 Sep 2025 12:58:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKPD-0000000EGFF-1vQL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=z5aBzRy9SrXCcJ1rkx7TeZFNbpBmp0grZlwbuKu+WTg=; b=KlPcWQyMuHIw2RSFiHPkUTAg+i
	tWFfaCyb/S3jsoP37vt2y8BaMh65/Kb4eS0v1mMmNAn7c5Qh/YtyRQreMwwPk885AQsinLQSg3M/p
	CMXWeLiczT8ZLD7Yu90NNoFp+pbl/1i62enwSlxmX34MzJG6po0OP27saJNxncWOHiA0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uwKP6-007wTF-UL; Wed, 10 Sep 2025 14:58:28 +0200
Date: Wed, 10 Sep 2025 14:58:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Donald Shannon <donalds@nvidia.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, etanous@nvidia.com
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: Add NVIDIA GB200 UT3.0b board
Message-ID: <e51d1a9c-a54e-4fe4-9091-4f5ea29535ec@lunn.ch>
References: <20250910041736.245451-1-donalds@nvidia.com>
 <20250910041736.245451-3-donalds@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910041736.245451-3-donalds@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_055835_504500_B0FAB143 
X-CRM114-Status: UNSURE (   5.95  )
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
> +	pinctrl-names = "default";
> +	phy-handle = <&ethphy0>;
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +	status = "okay";
> +};

Same here. Please describe your PCB.

	Andrew

