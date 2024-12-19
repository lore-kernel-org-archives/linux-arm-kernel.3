Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57E8E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 10:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7OWD7G4boWy2ErgVPO27g1mKyci+92KVlSybLwmP7k=; b=QA1fGba6kbDaTSeQTnql3rJE7q
	Pr/94bjY+5iT43xDmuNdQXZp6GQI/9xrnPEN8H7FPrZqWf4erbpLdg05G+k9byzDA8ocCgRQjjyjR
	0cSlC6XJN8k/lpU0lXH37dPG+tkrrA+lG5P0kRaVIx8uPdczerj8DyCUQc3xmXOdMUiyrkuV0K5Xa
	Md9fLShrDpWPGKi7GEwa9e5zy9fqz8AUxZW+o9d+KDefr3NV0PPNT1ir9KestZGDIYdRGs1gSh+YF
	oMgqLlKYTtDNFCTBALkRzfmV15XaPOsaYTaZZtr2eDuxVVroD9kq+RPy4ryeDBCEDceF8fVAPS634
	Td6zdNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOE8S-00000001a6e-29pE;
	Thu, 19 Dec 2024 10:52:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOE7L-00000001Zwy-2SE1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 10:50:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25D74A42068;
	Thu, 19 Dec 2024 10:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EC8C4CECE;
	Thu, 19 Dec 2024 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734605454;
	bh=+jKPb1DiLgdqyf0yAd9cWxMvSxidTaZJTgk8dWiYFWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgKWfre8ohxoaSA8FjHZFHHyo488aiCRBfOalWy9qXW/zBWa7o3iAi0HuXaHSQZY2
	 Kc5HAloqnZbcC71lMV40hSBGilOZLxwmMPpi5dla7bv4VaHvDpREYrFzlLAyz7bxXQ
	 3bTyYOLMgcR2mZW+T4QZURFeCyPnE652xr4P/XkJ8o2blSKKiYpF/+om0gwaraI/OG
	 PsYd+YAPD2zyUHKFZXynzvHJAvMPhNLotj+fGnmsmDkcGHDfVNKQqfmBOuVQYbNQy2
	 D6Om+/FVZ6EHmpIl+cx4qUzAQgKHRxvPDJlTCpwUhI9lVn/6NrbIIdKcC02gZg3Bqi
	 T7XW7XgxQrcog==
Date: Thu, 19 Dec 2024 11:50:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: frank.li@nxp.com, o.rempel@pengutronix.de, kernel@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Haibo Chen <haibo.chen@nxp.com>
Subject: Re: [PATCH v3] i2c: imx: add imx7d compatible string for applying
 errata ERR007805
Message-ID: <zhl7dmzfvoizotjb567psnvyu34vee3hlrbsgb6uchshrj7bti@touezue3vqwe>
References: <20241218044238.143414-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218044238.143414-1-carlos.song@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_025055_691991_ADF04EA9 
X-CRM114-Status: GOOD (  12.44  )
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

Hi Carlos,

On Wed, Dec 18, 2024 at 12:42:38PM +0800, Carlos Song wrote:
> Compatible string "fsl,imx7d-i2c" is not exited at i2c-imx driver
> compatible string table, at the result, "fsl,imx21-i2c" will be
> matched, but it will cause errata ERR007805 not be applied in fact.
> 
> So Add "fsl,imx7d-i2c" compatible string in i2c-imx driver to apply
> the errata ERR007805(https://www.nxp.com/webapp/Download?colCode=
> IMX7DS_2N09P).
> 
> "fsl,imx7d-i2c" already is documented in binding doc. This errata
> fix has been included in imx6_i2c_hwdata and it is the same in all
> I.MX6/7/8, so just reuse it.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

with the commit log changes, merged to i2c/i2c-host-fixes.

Thanks,
Andi

