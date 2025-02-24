Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0F9C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XnmD8NZ76hN2TD62f1RhP9wc/6o9wFnAA4l3dnD7Z3g=; b=KF2QxY3dpUI5JWr0gnV98dyiav
	USdxaX/TBXoe6gqlGn+iLUAkK7rsKIlIWu/F/8d4UoyJuWFQKaO4rNAhR5RFN2IfWhUCkto4XL4e6
	m/8emXRXNvo9psS5xrsSPMYHZ3n0MQrZZNrq7ACYC9NxznyyZBQuHYU59maLQbmk96hOxNhqH82AO
	C0EjKQO2RkEQVSGYpVCpC5bX4qRmBrKIvPsUB2iiKXrK7R2VsfZb/mEHUTV/SGf4tZQZTuetIzLd5
	QLz4eY9hiKxAlkJjC+/6fO2YBnM4HslAh6quDPcBG/GbZHdUO8qPfWC4FtxnF0jwGUXZMqwG9k4Q5
	PfBrrWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmetD-0000000F4Ac-2KDQ;
	Mon, 24 Feb 2025 20:17:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmemJ-0000000F35z-1jwb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 20:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD9385C4B84;
	Mon, 24 Feb 2025 20:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAFFC4CED6;
	Mon, 24 Feb 2025 20:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740427810;
	bh=oMyxUXCNCt5QbA9y/tZas4vEAJMKHD5JIO/9lW44SUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sbzk8jyJ0X2AqiIspNONwXAgICaK46vYrAEvI8ULM4VFS5Jc3VelDL/Kxn7Sk+dkv
	 4NHwKBtu08YVyezofQpAQ2wirDnS+/llCLYOtML9P6iQ011S4YvfpEG27A9OK8zcGC
	 F/lStpEFZU6nv2ahrVqTrsL8bw8Wij0YPWkBDj+5CDginuNIdRNSJcPQWf7J5M+k3M
	 LJdznxaoray8yz2g/StcHrwsyJeUOCypO6FOR3F5EpBgcjGiCHcflPyTLDfBTrrHF2
	 8f/G5PHUgK5QG7nyQdUWTEl4AhSWJ3bAEtoVuER/w61oDDL41STFBHaACNg4ZTANHk
	 jtYZtlisSskbQ==
Date: Mon, 24 Feb 2025 14:10:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: festevam@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
	broonie@kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,easrc: Reference common DAI
 properties
Message-ID: <174042780757.4022495.9496011863536978047.robh@kernel.org>
References: <20250224090413.727911-1-shengjiu.wang@nxp.com>
 <20250224090413.727911-2-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224090413.727911-2-shengjiu.wang@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_121011_504977_7A846371 
X-CRM114-Status: UNSURE (   9.77  )
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


On Mon, 24 Feb 2025 17:04:12 +0800, Shengjiu Wang wrote:
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
> "sound-name-prefix' to be used.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,easrc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


