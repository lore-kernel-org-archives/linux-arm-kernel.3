Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884D3EB4913
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/53ajElvHc7vqbcskcCH2T2/52dFDfgSUodst1Vxxs=; b=mEH+UTZ7QS9DmxJPBwOSsSElFE
	FIFvKl7WkabWpj59225oWScImu99/5OX/PqRahbzL9PVuoq4P9T8FZra/4wWSZxqyxvg57rJD9k68
	q6E4QYSduDAc+R0cRdVBnA9DAonzHNB+8+V2YLEmV8yb0MjP6W1gBr87lw7Hair0rJ2zNiN3H+IPN
	MrOjACpwurIXSbHsna4IvYTUwgbEbCePAhkn0aLD1cdMNqz+9usN/k8lAcutT4nnWbCMOs+yKH3hD
	mH8IxuHVnDAsgHQk3rOLhj/eQXzPH1P4PBbHSYa2p2jBnuHrcTbYcjZXovoJ4EgEMFWDkysOlYtx/
	/0irEXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVA7-000000021ht-4AJH;
	Thu, 12 Feb 2026 11:47:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVA5-000000021gf-2thK;
	Thu, 12 Feb 2026 11:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6291C43B36;
	Thu, 12 Feb 2026 11:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5813C4CEF7;
	Thu, 12 Feb 2026 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770896828;
	bh=P/53ajElvHc7vqbcskcCH2T2/52dFDfgSUodst1Vxxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N1OegvXwl/1GZ0wUY3UWF/Y59BA1Nk1mXaiLYp1XBaVqKpSWmPkYaWRaIQbo1L/RD
	 ROgS+Nxt06ULAkacYYvUHV7Xhje6Hn8F9fogQ5i3bwaDQTlvTuAioVSmVOfrjsg8UQ
	 NXsuV9OZdH2sqxsYNuLwt456l1RWzwX6oqlazQ/KnYSB5wxcAQXNsQesBjgQ9kA0ee
	 kOB0+lXnt5DKycrx7QlGFdl0jCLNQ7GAPG8Z3YVNmbvjChasqWmHScJLbKUN/2bYGG
	 jc0kSpqkq4WN/dg5FiKMLZLhJuSTtiwifH/ImUIgPTXKys/YSgEcjxcMaJqtq/BMH7
	 c03WTuAfn9dIg==
Date: Thu, 12 Feb 2026 12:47:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27
 nand support
Message-ID: <20260212-sloppy-pygmy-ermine-1b2fd6@quoll>
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
 <20260211-imx25_nand_dtb_warnings-v1-1-2f06aaa1e3b9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-1-2f06aaa1e3b9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_034709_749220_4D18DEBF 
X-CRM114-Status: UNSURE (   6.55  )
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

On Wed, Feb 11, 2026 at 04:19:39PM -0500, Frank Li wrote:
> Add compatible string fsl,imx25-nand and fsl,imx27-nand (over 15 years
> chips). Add one optional clocks for it.

... because IMX25 upstream DTS defines them? Or according to manual the
hardware has clocks but they were missing?

Please extend the rationale. Assuming you will find one:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


