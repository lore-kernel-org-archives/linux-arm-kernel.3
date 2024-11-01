Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D46E6F085
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 19:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+yll8vhX8eukdewOiBUMmQwNxsn3Tci+yR2muwoC6w=; b=ibYKasQjPQlWJBNdtz7QWm25TA
	G/JrnQt0o/OZkAmw6s9il2zg7BxLJ68eAggLuciZDwmPi7p1WsnvNXUJv0yq5PK11aFA2GRRTopUC
	S2yquW3+nlr4Z0TkKNbX+oI4ORNtVJe0fN4CoYBCYh3Ocv1rcwrpc23Cy6tf7Kifu85pDraQSwi4z
	MN/eROxNqC4hPWmpYcvP6qkiykinRyAWoizdH2YuaMV6SNX9D+oEG2JiXSIHhJPo3b5xIxmASzf0R
	gZmmbVaiPXYj4r9qjYRoe1L4DkYipNmqZfQkARpx6l1hVj/mvDx9tNZfwMDStFe8q7FrEjZinD9rK
	tPXxvI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xe2-00000008BAJ-3cJr;
	Fri, 01 Nov 2024 19:49:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6xcN-00000008Au2-08BZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 19:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C82BBA44C55;
	Fri,  1 Nov 2024 19:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0571C4CECD;
	Fri,  1 Nov 2024 19:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730490454;
	bh=B+lUXNUnGKnkUkqXfymc/e9SpMpB4y1++c6mOoxHc8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6AqLWWWGWwkE6bYBR7023sarjXeRnXyjJwR+sQ3ZR0nLHXlhrEDaN+DxTV2BgPPB
	 LhwBtrFV84d/SvuHpp5NlZOTc88jQVYTW1nYgjdKdCPnnA6FjZUCMh1ZJ2L3Ct/VFu
	 jcxmC2gy9bRwjgjppVxnkd/61YMKDwHA5r3HwD2pQ9tMoDKx/l3NzUcypt2SPqYK81
	 c6qwSPk30U+nBHtOkJCk47eYR5h8IzaGdYaBQR8u8Ka+rOF/mkZZEVEwzLZDotTddn
	 rJ8D6CEukxNJYjjYBFt/cPGCNIPJf8Pt28xWnX5ZjTjhZbLR7lFak3mj/qHAWmn2Q1
	 vz4/gBYYasoIg==
Date: Fri, 1 Nov 2024 14:47:32 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl-esai: allow fsl,imx8qm-esai
 fallback to fsl,imx6ull-esai
Message-ID: <20241101194732.GA4088016-robh@kernel.org>
References: <20241028-esai_fix-v1-0-3c1432a5613c@nxp.com>
 <20241028-esai_fix-v1-1-3c1432a5613c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-esai_fix-v1-1-3c1432a5613c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_124735_154462_216D25B1 
X-CRM114-Status: GOOD (  11.29  )
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

On Mon, Oct 28, 2024 at 03:49:31PM -0400, Frank Li wrote:
> The ESAI of i.MX8QM is the same as i.MX6ULL. So allow fsl,imx8qm-esai
> fallback to fsl,imx6ull-esai.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,esai.yaml | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

