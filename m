Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4D3C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 22:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xNGrSrGdqxp3UY9qmo66lnh4aiBXJRBCvD3RNBR26ck=; b=XVKQqZuZYl+uJ5qCqD5BA4x1VS
	NaeML2w5ZVGJAidU1plB6VBCxY6UQKy2wsjaQKnhytpvhhQC8UYSiDou+70klmmHodLlRmGrXowdo
	VgQNlKdvbVkI0p2rrMFBAkakm23KAUDSxSoTu+xfTlK1IEdQgllVLsQOWZmI13s2E+UZG3CSnF7+O
	25wUk5MenylbHP1IJ8n0Ipp3wqd0jPP+kWnyRccAfm7aW63p8gZkzEJBADd/37QTvVO1dSJDep6Yl
	YIMR/yxzT+tHJ6qBoHMqKFu+Z0cBySmUyms2jzx1e/yJ6JKqt9zIobm/+2804lwfnwhF60kijegNs
	lmq+wPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbW5-0000000711T-1JoR;
	Fri, 21 Feb 2025 22:29:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbUb-000000070lx-1FQV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 22:27:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A0545C6DF5;
	Fri, 21 Feb 2025 22:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26611C4CED6;
	Fri, 21 Feb 2025 22:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740176852;
	bh=hpLg+CyS426GDFDENnCL8gdyjYb+/S5yY656wfIhHiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huOgWP+PCPcfLJpAoFlO5hbj1FIFE76X+pvJi72UUCMegtDrYOXxSt8uMWZNFJw5V
	 n0ZlBHuM7ajDdnLywJ4LdwTHowmbl9fZ7X53nYCnc+zYD1HGSFwUDJ+JW5yF09Ugjy
	 RcCPfHkItxWOdXuzrr1IUx06t+orVTBsgo6qDzMvmgGvt3GfKI9GQng5BR9WpFTTSN
	 NJ3GV5bnoCnZJRj5+lnsCH4V+fsk/V9ay58H4KdLB35BrTD66tEnSdCgTMGeITpQ0K
	 RgZzSAnv5aB5/v9QlDr33qJ1etUSw+FDDCztXJlobOOaskf1tQ90l3BXKxRTEYhZcx
	 gp4ID8FbhRrfw==
Date: Fri, 21 Feb 2025 16:27:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: Frank.Li@nxp.com, festevam@gmail.com, p.zabel@pengutronix.de,
	shengjiu.wang@nxp.com, devicetree@vger.kernel.org,
	kernel@pengutronix.de, mathieu.poirier@linaro.org,
	krzk+dt@kernel.org, imx@lists.linux.dev, shawnguo@kernel.org,
	iuliana.prodan@nxp.com, peng.fan@nxp.com, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	laurentiu.mihalcea@nxp.com, s.hauer@pengutronix.de
Subject: Re: [PATCH v2 1/8] dt-bindings: reset: audiomix: Add reset ids for
 EARC and DSP
Message-ID: <174017684977.188535.2655294580002590894.robh@kernel.org>
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-2-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219192102.423850-2-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_142733_391947_B453F554 
X-CRM114-Status: UNSURE (   9.99  )
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


On Wed, 19 Feb 2025 21:20:55 +0200, Daniel Baluta wrote:
> Add reset ids used for EARC and DSP on i.MX8MP platform.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  include/dt-bindings/reset/imx8mp-reset-audiomix.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 include/dt-bindings/reset/imx8mp-reset-audiomix.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


