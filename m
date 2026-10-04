Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D50CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 21:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YodB7Djkxkxsr6YA3Pc28UrEIZmZxedLSYMQiXw1jHw=; b=4H+p/9g8VFKiPu920vhyB1+CpU
	y7Z8k868yT+DatJ1wXEWDq6u70/rO5XmDqWJUAThArm3BuLch2zbmx6Ff7YPdl7ingMT6DCIDTJR3
	+vo/gK8RfZYzwc4VEea9G2fzMKAx6QDb5ncfldnTQ1IWLajJOQIPox0na6Sfg/ZzXkO6kWvp3U89I
	XC1VYrpCr490r8jqN051cRnoaN23nj8g09UWcQ8XK2cuQfURzOWpvBBmV2oSxRPQaTiZ3tAkzA6q2
	gvctI0pQk/mCmmzJ/HmAS0KKdwCaoNrMyUa92a6mSSrgIXH4fNgmQ7/U6fe0SvecZfj0ay6C4P9Vt
	f74T0pAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTmJ-0000000FML5-0uyz;
	Sun, 04 Oct 2026 21:29:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTmH-0000000FMKc-1783
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 21:29:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YodB7Djkxkxsr6YA3Pc28UrEIZmZxedLSYMQiXw1jHw=; b=jdBvLkheJCjQHxedaKjTcsbT0U
	RQSYlVyl7JVVq1OIUY0LwRal1qRyHtvkJE8DEXyL+XRuaIv4k4ffzjCYjEkqgnDQJamDCvlS/HU4s
	pZQoSFX9saFWVJMROoXQw+uIJrBbLqpS3GR1h9kjrDWivFPWCnSwedidqFbk2ASYVm2k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xDTmB-008wcB-Nh; Sun, 04 Oct 2026 23:29:43 +0200
Date: Sun, 4 Oct 2026 23:29:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <2254650260@qq.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: zynqmp: Add support for EBDEE EdgeBoard FZ3A
Message-ID: <f1e7750f-7057-4430-9783-83dc8a8a2e23@lunn.ch>
References: <tencent_E9086080313181C5F806E5543C9638DC270A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_E9086080313181C5F806E5543C9638DC270A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_142949_308464_26A72E34 
X-CRM114-Status: UNSURE (   8.30  )
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

On Sun, Oct 04, 2026 at 03:46:22AM +0800, Pufan Jin wrote:
> The EBDEE EdgeBoard FZ3A is a development board built around the MYIR
> MYS-CZU3EG SoM, based on the Xilinx Zynq UltraScale+ XCZU3EG.

What exactly are you describing here. The SoM or the carrier board?

Generally, there is a dtsi for the SoM, and a dts for the carrier
board which includes the SoM .dtsi file.

      Andrew

