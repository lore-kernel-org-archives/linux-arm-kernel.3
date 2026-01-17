Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB079C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 01:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjdnOMYxgl/vjGXQ/n7IzHf/1ofnjBUGIsptN+NVRLI=; b=p1Y7XwYskPEi0Oxvx5wStf9rL9
	b1sdRwEhoNYrnAOwHEaeCNKkRB1eI9V28TQToZCS3RV7K0vcAk7Tge0/BZxitd+vuW/lqzcKcLZJn
	7ryWqzw6Trq3qCPMgUDObbIKB/nOhxZrOFuBO8IbZgZzPVDsQERNtMej1du0ElOW+c34tFFQZnbvn
	OaPTvFq3EbkDCEAVVcAEi/4rFk9mrBzEPYWBUPU1bVnd/WBUPRBIgEO7VGsqfsiS3EAve3cXCh6Cd
	qgg+5MjHytvxgQr0Pl5kejiCtTh6zWqfnnPobFt2PWvSLks8mNiD6VEVIrGE4Cr61BKoMebp/4drU
	ZTCTRSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgvXh-0000000F6sI-3VNO;
	Sat, 17 Jan 2026 01:55:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgvXf-0000000F6rz-1H1e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 01:55:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2652B43461;
	Sat, 17 Jan 2026 01:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5812EC116C6;
	Sat, 17 Jan 2026 01:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768614953;
	bh=/ndufQu+5ufz1nSWIQD0PSCXNtfxZ4UB7J4iOp1rMug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIF+kQRqUNRgSz3CUmtB4HrLAyXh0CrtZdIqpO2CaMoZVT+f975ZW5QOHy90xPQ3S
	 ly1eqMia8GAedMwQX3/9nW7RImllHgacShWL+fmAu1C4xgdYMsZB6zQCKO2wCfKzIN
	 T14lRFEwLsX/6lpsVtNjC0K6m28/jsgoiJzFlIs8r5OLYdczXAv0E+fHYWO2U7aMUf
	 k7Y2wTsj/Ah/HV334CTdejsRACZf8Isg20RGef9an8tilKsLjgGCIbN2gOBWTMS0a/
	 cqg0Ju+OZa+jQSQSRfoSjkt5mwhpc3/AaEi1TgpKgI6omPnmSfUP8v0I+yR6VTXsEn
	 OlcN5M1TqwkyQ==
Date: Sat, 17 Jan 2026 09:55:44 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengfei Li <pengfei.li_1@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ye.li@nxp.com, joy.zou@nxp.com
Subject: Re: [PATCH v7 3/3] arm64: dts: imx91: Add thermal-sensor and
 thermal-zone support
Message-ID: <aWrsIIAVgZrcSCtq@dragon>
References: <20251020-imx91tmu-v7-0-48d7d9f25055@nxp.com>
 <20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-imx91tmu-v7-3-48d7d9f25055@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_175555_382686_CF144A05 
X-CRM114-Status: UNSURE (   6.35  )
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

On Mon, Oct 20, 2025 at 03:00:42PM -0400, Frank Li wrote:
> Add thermal-sensor and thermal-zone support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

