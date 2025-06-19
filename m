Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE369C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 04:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fk4eKprQME0ysShGROXKcBb5kPJKh5RJXwot7YF45c=; b=ShW4TlyLWfNKSkbDsUoGxK7YPB
	ReWPMy6gKdjn68mvxvQrOpCFuzcUgAFxegOJAshv2ODntnD52xAphHg9mJeE+p00FAjwg+WbsATge
	A7j6LstPMcqYR1x3mxGGEns17iUzM8NvdKpUYZdcpruMtbjlYf0ubNQQVzdmoJuxlX5tPcE1ccfNu
	YirrYq5I1e9YgboFJFdwQOwYK6tt4DYa+M9TzINFfbr7OvxBUoIQCMwkeYYusQDdxJG5v9LBStvvJ
	nZX5LWzvV7ELo+capQs8Dja3CDNwoCsU7el8E0fz1wYKwqRLfeJoTvKdFBp9Unfs+fNteQYP7KT+c
	NOJSFaPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6X3-0000000BxkM-46rN;
	Thu, 19 Jun 2025 04:05:45 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6U9-0000000BxF9-2uCm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 04:02:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5fk4eKprQME0ysShGROXKcBb5kPJKh5RJXwot7YF45c=;
	b=GIoFFEYCbxt+94DCzf/RcjER+1ekHvOr01qXrgNZfnLtO+ZCxm0o0Y2JGyI85Z
	7MQOuUPtFIHf85X3Z/pIRRGp0WpjJ6Oa5rs2uBLoc0GhjKz7zX3vVlr0oveGjMCx
	wfkGvqp/cL9AKtmj9O27asFYT38OfdBQwIjAqiMlLKCJU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD33_TIi1NotZ38AA--.63985S3;
	Thu, 19 Jun 2025 12:02:18 +0800 (CST)
Date: Thu, 19 Jun 2025 12:02:16 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
Message-ID: <aFOLyCB5plPmrRyp@dragon>
References: <20250520-initial_display-v7-0-a8f0195420aa@gocontroll.com>
 <20250520-initial_display-v7-5-a8f0195420aa@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-initial_display-v7-5-a8f0195420aa@gocontroll.com>
X-CM-TRANSID: Ms8vCgD33_TIi1NotZ38AA--.63985S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUOpnQUUUUU
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQoEaWhTi8prIQAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_210246_040847_7DCB4D7B 
X-CRM114-Status: UNSURE (   7.80  )
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

On Tue, May 20, 2025 at 08:34:54AM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has
> 2 GB of ram and 8 GB of eMMC storage on board.
> 
> Add it to enable boards based on this Module
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

Applied, thanks!


