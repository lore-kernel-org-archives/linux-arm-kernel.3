Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDE5CA5FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 01:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otSGC1NbT4lpD0YXFnJQnyST9MeX9IHnqJKr6J2X5EY=; b=FVybExF/GrIupi5IrNLaOhT/m/
	wG79E+J3k3fA0QXktcOz5sLEP+oGkPNqnzhk2eH0kEST6JnrD/Vv+lFLLXwhDJx/n6jJNpYrJFRaz
	etPQElKp4urXuYTqyBnFkpAmcGncejxTpQlKVjjgXCITzE3edTPyDR0pFFvcrCNk9S5pUFAU0Gf6t
	6AXaCLI2Sd8zrVTa9AShMhxDHi4K1Q7Y859372rQlh4QUhoKZDLiEXZhRx1dkfDUQOYRm6m9Stsqk
	9EAuMxkePt23LXJWpt54W53VZ2wtA9xj8e5aBSt40TWeGkQAU+N6HjCv12LThqUH3rYCJMMjwhTfD
	TtQ5HyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhdxN-00000001E9K-1eu4;
	Mon, 19 Jan 2026 01:21:26 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhdxI-00000001E89-3f99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 01:21:22 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EA269201E9F;
	Mon, 19 Jan 2026 02:21:16 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A3D1620138A;
	Mon, 19 Jan 2026 02:21:16 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7FD341800096;
	Mon, 19 Jan 2026 09:21:14 +0800 (+08)
Date: Mon, 19 Jan 2026 10:21:13 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <aW2HCTuwNEQkG8UC@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20260116-imx91s-frdm-v3-0-98671de64925@nxp.com>
 <20260116-imx91s-frdm-v3-2-98671de64925@nxp.com>
 <CAEnQRZDtE+0gDxAnu9vWGhj3rYEv6CmMNjQLWnKu=ud9Yo9XcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZDtE+0gDxAnu9vWGhj3rYEv6CmMNjQLWnKu=ud9Yo9XcQ@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_172121_044246_A2853443 
X-CRM114-Status: GOOD (  12.72  )
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

On Fri, Jan 16, 2026 at 11:33:59AM +0200, Daniel Baluta wrote:
> On Fri, Jan 16, 2026 at 5:45 AM Yanan Yang <yanan.yang@nxp.com> wrote:
> >
> > Add DeviceTree support for the NXP FRDM-IMX91S development board based
> > on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized variant of FRDM-IMX91
> > and differs in memory, storage, Ethernet, and PMIC configuration:
> >
> > - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> > - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> > - Single GbE port (FRDM-IMX91 has dual GbE)
> > - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> >
> 
> <snip>
> 
> 
> > +       sound-mqs {
> > +               compatible = "fsl,imx6sx-sdb-mqs", "fsl,imx-audio-mqs";
> 
> There is little sense to have compatible = ""fsl,imx6sx-sdb-mqs". Just
> use
> 
> compatible = "fsl,imx-audio-mqs";
> 
> Move model property after compatible as per already existing code practice.

I will fix it in v4. Thanks

