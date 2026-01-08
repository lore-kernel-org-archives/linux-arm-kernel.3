Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E83D1D486
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 18:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IUwrWUOIpMj5TVaHyA5w/9OjOinSfTYecOzgun1vdNk=; b=F59BMzw84eHzVIyZOKN1Cyo6WF
	xv3bAfLkZeKzah7OSlOxMnviFvZ/whu3DZmEHQWM/hfko/DexqGStQFyPxZp89JEuozHUQ+obTm1N
	QsKzBU0JnH8Fzc64kwENMJACz4LupNOnUGpUwhPstLiiXWWmZMJCfeN+LZBQizWMA1fuYvzlRIzZQ
	B0P0MkFPwqecr2e7i3jR7GTs7MugSnTX9RZ7aSYlkRo9Fz8UbZcLIWEnRJ3yZnLcbm1oaitUHxFFP
	Tu2155IcUUmWZga9QRJkLVFlLmbA5aK+U9gmlncHeFOMFHvrCp2gfgKVJdQh+VVRJdNjjr7GBPvXh
	r0qEOzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdugf-00000000bVe-1Nfb;
	Thu, 08 Jan 2026 18:24:45 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdugb-00000000bU0-3pJG;
	Thu, 08 Jan 2026 18:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=IUwrWUOIpMj5TVaHyA5w/9OjOinSfTYecOzgun1vdNk=; b=nG
	KcLUILiB/z36vV4/ZAd41y9YeZ/Rnb53VPkMfS0BFeXE2axRKFffQ59bQfpPmdZKGJ8SgJVYlGrlu
	S6pSkCwFSYfZmHsctmkWQcfmd8WSNjbDP2go2kTczdXVNnT/DlDyTozsMFu8igt78DLAlMAer9AYC
	W1LoSctomNwqT78=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdugR-00205J-PQ; Thu, 08 Jan 2026 19:24:31 +0100
Date: Thu, 8 Jan 2026 19:24:31 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	Frank.Li@nxp.com, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <c1425564-9dca-45dc-ac5e-093150a3ff01@lunn.ch>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108083641.2119616-1-xu.yang_2@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_102441_968962_EFC8D43A 
X-CRM114-Status: GOOD (  15.37  )
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

On Thu, Jan 08, 2026 at 04:36:41PM +0800, Xu Yang wrote:
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY[1]. While access to these registers is not required
> for normal PHY operation, this interface enables you to access
> some of the PHY’s diagnostic features during normal operation or
> to override some basic PHY control signals.
> 
> 3 debugfs files are created to read and write control registers,
> all use hexadecimal format:
> ctrl_reg_base: the register offset to write, or the start offset
>                to read.
> ctrl_reg_count: how many continuous registers to be read.
> ctrl_reg_value: read to show the continuous registers value from
>                 the offset in ctrl_reg_base, to ctrl_reg_base
>                 + ctrl_reg_count - 1, one line for one register.
>                 when write, override the register at ctrl_reg_base,
>                 one time can only change one 16bits register.
> 
> Link[1]: https://www.synopsys.com/dw/doc.php/phy/usb3.0/femto/phy/x652_usb3_ss14lpp_18_ns/4.07a/dwc_usb3.0_femtophy_ss14lpp_08V18V_x1_databook.pdf

Please don't ignore my comments to V2. Think about the code split
between the generic IP licensed from Synopsys and the vendor specific
code used for integration into the SoC. You want to avoid making a
mess you later need to cleanup because somebody else licensed the same
IP core from Synopsys, and need to put their own vendor specific
integration code around the generic code.

    Andrew

