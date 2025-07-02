Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F86C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 08:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt7kRNitnRRomL12XcgnkgtBgNnfGJgLPobysScsIdU=; b=Nsp7P3gNpOgd88cohzafurASr9
	aOvKpzafxfatAGHkJjw6RzFgWKxCx6QY+fctEv8ok9hbd8VCMzQ9TfkLJ7vnY8Vr0Gp1Vu0PSGHhC
	YcIXVxlgSYQpAVzgoaCf0PydZS+VtaZTWJjul0PLoAvKL6qHW/iw6g/DsLaN39T3lDOY++SQh15Nc
	uRq7Uwn11S6lyDpzKkUDO5wykH8TGzcbzMlk6BAK77jKsYV5NqHBc1rEa8zzJi5mVWxUfHw3icFf3
	g20XU1vbTe95X09uUxiUWLrm8lFpoYv1NAO4ugcAsBSS2+z9bh81xZieBDUcNXEeqOESRkFp/a3T9
	WgVvSL4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWt2G-00000007dYE-0Nug;
	Wed, 02 Jul 2025 08:41:44 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWszu-00000007dQ9-19ab
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 08:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bt7kRNitnRRomL12XcgnkgtBgNnfGJgLPobysScsIdU=;
	b=eNEcCmTpKvsNznW2z72kTSHm/x8r/H5RnC6X9E5eszrzz7BzwCkQIwRnQpc3Jt
	sZ+HdxhwUSfJxnvSLSoOfV8LGZMtn3nzjbvIH6KEQwsiDvY6LfbWnPITx1ypNfea
	LEYanzNaQGBqt9UBxlWwfbKTKjx5MxMQu/cHIUBuSL/Es=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHz8oW8GRohq0NAA--.9535S3;
	Wed, 02 Jul 2025 16:38:49 +0800 (CST)
Date: Wed, 2 Jul 2025 16:38:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: John Ernberg <john.ernberg@actia.se>
Cc: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 4/4] arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM
 support
Message-ID: <aGTwFl911B0W6PKu@dragon>
References: <20250611113748.2986988-1-john.ernberg@actia.se>
 <20250611113748.2986988-5-john.ernberg@actia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611113748.2986988-5-john.ernberg@actia.se>
X-CM-TRANSID: M88vCgDHz8oW8GRohq0NAA--.9535S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw4fJw4xJrykWFyDAryfCrg_yoWxCwc_Z3
	WxJw10vw4rGFWxJa15Ga1fXr1rKay5Gr45WrZ0vwsxGas0vFWxKrykJrZaq3y09wsFvF9x
	AF18t3yUu343ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjX18PUUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwF+ZWhk3sY-3gAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_013918_691795_43888D4B 
X-CRM114-Status: GOOD (  11.68  )
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

On Wed, Jun 11, 2025 at 11:38:09AM +0000, John Ernberg wrote:
> From: Horia Geantă <horia.geanta@nxp.com>
> 
> The iMX8QXP and iMX8QM have a CAAM (Cryptographic Acceleration and
> Assurance Module) like many other iMXs.
> 
> Add the definitions for it.
> 
> Job Rings 0 and 1 are bound to the SECO (Security Controller) ARM core
> and are not exposed outside it. There's no point to define them in the
> bindings as they cannot be used outside the SECO.
> 
> Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!


