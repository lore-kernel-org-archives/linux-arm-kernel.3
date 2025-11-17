Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DC6CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 07:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOKJQ8JatjeRW06h90E4OMHQznLX3AwvG8sU+u8Odmo=; b=k/UytCdohX0JiQo0Ot95tMVK64
	je+vdC5aeXfrXTE/ir9yOzy6jRTpYtNnH2o951bPpzNTV5jw7s9lduSpqxpJPLo47UEvUDZD0SwEI
	pPJJlLXY2IS4vGoJ4CWF3lXtiN/5ZMUc1shdyXZ1nbvz13qHGcQE/JXPK4hs+nqy/FAb1/V1O7lce
	7jdL4/jmSlD7ScG+GshXEm9rYRNerwjauXZG2mS2baU0RUWUPRrxpXg+TkBbeI/FlkTznmi4SzbT9
	eAU90mW43KrVP2ycfgKYvj4iuX6MpABuk2SxUPGo/sV2s27MqeUEhN4YOXhQmDi99EC52ZHuOdZ1O
	MnB0nN3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKu9H-0000000FedL-0z84;
	Mon, 17 Nov 2025 07:59:43 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKu9D-0000000Feci-2C9e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 07:59:42 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 5E1961F916;
	Mon, 17 Nov 2025 08:59:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1763366369;
	bh=JOKJQ8JatjeRW06h90E4OMHQznLX3AwvG8sU+u8Odmo=; h=From:To:Subject;
	b=Dz4vBZcHiEHd9qMtWxfe1G8UEIUDIq4UEnTiHIx4DCzC5pEn9YGLaFymFI2BTPqHD
	 +GljSZ5JiDvk1meIcOJjajYVbpKOhEjTtN/omwQJIogNzlGgbmFAqvDf9afXx/QeIO
	 DCpxf1OPtdA24FwaM10h+NjDSSAatb5icHCBQpZAHkHlWHEOvyTCDQc6gXB0td2q/U
	 3xvGR0BeGEa9gxRy5+vPkuH32HybuPG6mfx9zTqvOsBUBpEizcTzuwrIppLSBUAtDm
	 ty7oI9mC7doDJrC6AmV35cnzhH8akbU7Qx/0LEHYC8Us04kORpyYQ/8hpPoM6Xj8kT
	 OwMdhXTwJPjGA==
Date: Mon, 17 Nov 2025 08:59:25 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] arm64: dts: freescale: add Toradex SMARC iMX95
Message-ID: <20251117075925.GA13021@francesco-nb>
References: <20251111151618.70132-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111151618.70132-1-francesco@dolcini.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_235940_602833_DE713E05 
X-CRM114-Status: UNSURE (   9.91  )
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

Hello Shawn,

On Tue, Nov 11, 2025 at 04:16:12PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Toradex SMARC iMX95 SoM and the
> Toradex SMARC Development Board.

I noticed you have not picked up this series, please let me know if you
expect any change on this.

Thanks,
Francesco


