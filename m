Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF35D2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 13:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nk/jil5P9bd18lXGzo7iKVLteI4PK9x59aS/JMtc4go=; b=iuqkSqpCOLBNXn1JO2uNPbIO+Q
	S9+wkYnRfdIUln4gbw8NlbXZvvhB5I4K/moF4dRXhD87wlyjx1ONhx4NAplzMD0DxvZC4W4EOFfUo
	qohqKSotFPGY+MZKUhb0IURD/pFxfpqinZx+rj2CXEyWSlPc/rD8imh6S00JKIOb8v4sf8W3a+RHy
	HWDtWvfX/OLDBxXlvnfdfkg3Fb3OM5o0fKF+CNr0TP3iNqiO2nyfWD6qA7SMaBBZVbXH0Bf7RiilK
	hJiqUeN1fFgIJewHzb/lxRaMLqokg1CQdflQwNdleeS0UUZkAVKCv2LXmB4ltdDzfpHKVZSGncRKu
	g0lrEA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBqe-00000003v15-0Vpk;
	Tue, 20 Jan 2026 13:32:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBqb-00000003v0U-0r7Y;
	Tue, 20 Jan 2026 13:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nk/jil5P9bd18lXGzo7iKVLteI4PK9x59aS/JMtc4go=; b=J9vkQPaCXohOKQwicpD9vyG5hZ
	0RSc6vxzfIcNiZd5vB75M42d1j9XHPwD8LcQPkXxJyAAyxtlTa6y3iJKfVo1gEH0MOENlVDXIZzLh
	7aU0YslQ3Ie7T9DAgiZahEolidw9rmhERlqFY1UZPb+KxkSsCwW6RRN4cQDDX7kslWJo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1viBqQ-003gLQ-8O; Tue, 20 Jan 2026 14:32:30 +0100
Date: Tue, 20 Jan 2026 14:32:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org,
	neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <06ae1272-9874-4ce7-9e4f-01d521a5f27f@lunn.ch>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <aV/Qha0CQ+LJHo76@lizhi-Precision-Tower-5810>
 <das6ud7gep5hrcdn4bnmoyl2pb7okbxslpnawch2osaezd6xm5@psbizlufjec4>
 <6d27a8b1-1407-40ff-945b-927ef0a39eb1@lunn.ch>
 <fmdje7ftwna5vv5xrzt5e7hpv4juzwjurhvdzzrfeifaeyyblj@givopw2u7vmn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fmdje7ftwna5vv5xrzt5e7hpv4juzwjurhvdzzrfeifaeyyblj@givopw2u7vmn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_053241_251514_7E2A4AA7 
X-CRM114-Status: GOOD (  22.41  )
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

> > Rather than reinvent the wheel, could you use regmap?
> > 
> > https://elixir.bootlin.com/linux/v6.12.1/source/drivers/base/regmap/regmap-debugfs.c#L546
> > 
> > Regmap should be able to provide a debugfs interface for you, no
> > driver code needed.
> > 
> > This will also help you with the abstraction between the core generic
> > part of the PHY driver and the SoC integration glue. You pass the
> > regmap to the core driver, and the funny muxing through two registers
> > is hidden away from the core. If the next SoC integrated uses plan
> > MMIO, that SoC glue driver can instantiate an MMIO regmap.
> > 
> > Using regmap is a good idea for core generic drivers which can be
> > integrated into SoCs in different ways. It hides the SoC details
> > behind a well known API.
> 
> Thanks for your suggestion.
> 
> Using regmap is generally a good fit for reusable driver and I aggre it
> helps abstract Soc-specific details.
> 
> However, the regmap defbugfs has its own limitations:
> 1. By default the register is read-only, add write operation require rebuild
>    the kernel which make it inconvenient to debug the issue on the spot.

That is somewhat deliberate. We don't want a nice API which can be
used for user space binary blob drivers. In networking, which is my
more normal area, we pretty much reject any sort of write interface,
other than official kernel APIs.

>    Refer to: "09c6ecd39410 regmap: Add support for writing to regmap registers
>               via debugfs"
> 
>     # ls /sys/kernel/debug/regmap/2-0050/ -l
>     total 0
>     -r-------- 1 root root 0 Jan 20 07:45 access
>     -r-------- 1 root root 0 Jan 20 07:45 name
>     -r-------- 1 root root 0 Jan 20 07:45 range
>     -r-------- 1 root root 0 Jan 20 07:45 registers
> 
> 2. It can't randomly read specific one register with common linux commands. Besides,
>    the read operation is inefficient especially when the range is a bit large because
>    when you cat the register it always read and output all the registers. 

You are debugging. Do you need efficient output?

If you have a specific debug tasks in mind, maybe you should be
thinking of an official kernel API? In the past, there has been
interest in getting SERDES eye information out of PHYs, and being able
to change the configuration parameters of the eye. Could a generic API
be added for that? Some of these PHYs also support pseudo random bit
sequence generators, and there has been interest in adding APIs for
configuring them.

	    Andrew

