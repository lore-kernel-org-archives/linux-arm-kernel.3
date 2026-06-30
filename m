Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B7DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rjDgL/xt0149iiitUzxfV7EKlVMkvz0wclCPfWzM1I=; b=0XRVus6qw21VHdxum+vTjbPpJT
	eQ/TUYhYqQAvRX7k+vgT2fIpOEjDXnLxCWbTUoq4L9inNalGLatxOnjjARzzPy2z4G1ZpX2FnE4de
	szyqO6MtI4lmYsvZMuGbz/ozpbFRkVGVX6kScco1qYSTX28jSqpk6d77aMxsLJzU4TV97nOBSUKDi
	neYLI42LlqKtwstKx7XEJH4p4Mr8QC5g4MubXjj1WVMOoHlmAcNzr9xHfm7w41/zaKLrULh9CZpy3
	ITwBTWyGfaG+ObjSNFn23NO3BdbKiTF5SOtEnR8pc6VtABTj5CGTTacA85q/9IET5ZBg8taA4P1FE
	2NE+c2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ5C-0000000HFcr-1D0A;
	Tue, 30 Jun 2026 14:05:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ59-0000000HFaQ-1Q9f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 14:05:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B5B774E40BB1;
	Tue, 30 Jun 2026 14:04:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8597E6025A;
	Tue, 30 Jun 2026 14:04:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF050106F1F6A;
	Tue, 30 Jun 2026 16:04:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782828295; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6rjDgL/xt0149iiitUzxfV7EKlVMkvz0wclCPfWzM1I=;
	b=FUoLqOkrO8rzuA1Ak7mXnpNxg4VXWCHELhJxzYACKEQIbR7/J0Y/k2NsH6LM/o11J8uiH+
	fc2ZFO5jSm/ZRI0yP1GfBih4u9hwx7smvcu0Feb3NptqCaPiab3vhq3gJM+KJs29WW9W7N
	mVp3UV1RlIc+UbeyjNytz3lMquy1jvgjWgTT9fyvO19H7Mgcxxnf2v06+/SwXtoA3YpVfD
	0GSWcj92+nec0sTksyFKtyfZmSmfoc+zeK0vdAmf1Wmgu4iahdgX93SvdMA25FuopURWe2
	eAwXn4eO2DEv5MSnVLfy7+9iUBK9HvwT3al8E0EKvAY9/T8RrPSOYMM7dJ/BBA==
Message-ID: <7c57bb08-b72d-44bf-be44-f1bcb2aa9a84@bootlin.com>
Date: Tue, 30 Jun 2026 16:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: stmmac: dwmac-socfpga: Add mac-mode DT property
 support
To: Andrew Lunn <andrew@lunn.ch>,
 muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org,
 conor+dt@kernel.org, robh@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 andrew+netdev@lunn.ch, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-4-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <4c285993-978c-4d9e-a8c5-c3b36baa6840@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <4c285993-978c-4d9e-a8c5-c3b36baa6840@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_070459_563700_AF79266A 
X-CRM114-Status: UNSURE (   9.30  )
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

On 6/30/26 16:02, Andrew Lunn wrote:
> On Tue, Jun 30, 2026 at 06:31:08AM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
>> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
>>
>> Russell King's commit de696c63c1dc ("net: stmmac: socfpga: convert to
>> use phy_interface") replaced mac_interface with phy_interface in
>> socfpga_get_plat_phymode(), noting that no upstream DTS files set the
>> "mac-mode" property, making the two values identical.
>>
>> The Agilex5 SoCDK TSN Config2 board is an exception: its gmac1 TSN
>> port uses GMII internally in the MAC while the PHY-side interface is
>> RGMII, so mac-mode and phy-mode differ.
> 
> Maybe you need to represent the hardware block which magically
> converts GMII to RGMII in DT?

Yeah that's what we have on CycloneV, and we force the INTF_SEL to GMII if that
HW block is present. I wonder if there's the same on agileX5 ?

> 
> 	 Andrew


