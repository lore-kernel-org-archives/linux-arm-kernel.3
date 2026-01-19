Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159D0D29C33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2bBOzwMAYRPjjO4lNowgGiSlgdU4XZZkvdsScnElFg=; b=wfi9gcaykmoRsW2KbN1RQ6jyoH
	+vXjhExRlOX2BLS+cs10MxGpdT0WuZb5AlvQzF16flkFeBa42kiXBTVKlGcW6zX8lcjEs0FACsr7B
	FrK7wWbuL8hVSKdhnYRqu1BZVdcWr6bgj2h09cCCkEUEw0KUz1IA60pLZSpC2CF8ZjbVoibp0w0Ow
	DXCkHJr8HQkqwNBjwqdwdOtxS8hG8rOzgmNtXZVQCKHxxK//Q/kh/KHkW5YSyD7x6dSEpyT2uD/kD
	VQi9SX0QmH32AdF7mQva5xYYcSKuXIFso2Akj5fSy0aAPTd31Xdtae42C8AvN349b4+EYJcK7KCUj
	c+4Jfp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr5x-00000002LKu-2TSi;
	Mon, 19 Jan 2026 15:23:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhr5R-00000002LG2-2nWn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=t2bBOzwMAYRPjjO4lNowgGiSlgdU4XZZkvdsScnElFg=; b=O8wDb4mrkaMfRoOkguXYrBTU0J
	OesoB9GT+1MQrogutipTMxmJeZBU0K57dc43hHA9LAiPkGpuH13kbBK1T5gKort1JsDxQaJOTclsX
	wL5Ri+OMBYkuFiJJ9o14NQgVIAh7+o2Qk5yuVn1cdTzKZujgjP9nyJMWUycOZxill7VY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vhr5C-003WIK-Nn; Mon, 19 Jan 2026 16:22:22 +0100
Date: Mon, 19 Jan 2026 16:22:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, alexandre.torgue@foss.st.com,
	joabreu@synopsys.com, ychuang3@nuvoton.com, schung@nuvoton.com,
	yclu4@nuvoton.com, peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v8 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Message-ID: <04df4909-4fdb-4046-917f-2f2e47832c62@lunn.ch>
References: <20260119073342.3132502-1-a0987203069@gmail.com>
 <20260119073342.3132502-3-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119073342.3132502-3-a0987203069@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_072239_275672_2E02FD24 
X-CRM114-Status: GOOD (  10.51  )
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

On Mon, Jan 19, 2026 at 03:33:40PM +0800, Joey Lu wrote:
> Add GMAC nodes for our MA35D1 development boards:
> two RGMII interfaces for SOM board, and one RGMII
> and one RMII interface for IoT board.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
>  .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
>  arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++

I'm somewhat confused with your naming here.

A SoM generally needs a carrier board. So the SoM is described as a
.dtsi file, which the carrier board .dts file can then include.

Where are the PHYs? Sometimes the PHYs are on the SoM, sometimes they
are on the carrier board. If they are not actually on the SoM, the
PHYs should not be listed as part of the SoM.

     Andrew

