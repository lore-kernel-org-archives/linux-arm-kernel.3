Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB6E7C708
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 07:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEJGW+J3YZ11YTu5qcHQ89JZnFkR0Re+fXy4kzvdwqw=; b=SHggr+gNlxWT8zA5ZQPl5F1CvU
	9yCf7ZwWarJPyF/n2zb/9QqyWKQxeSjhvisGLfGDVOrgrD7ArolpLwdvrEo9CedSmoxdcGRGQrdqY
	/K8OAhf0NRXF/g7k6N0avLDf6lDV0/nEl8VueRGN/f7ItZuR7PI5I0W6vh+RwzUZY0tDCZbWA7fTi
	1rm6sTftcWw9/9M10V7xz8ivid9rigVsK3jKE/tgIsHDRpwR9qzTxuG1BJhqajcA3bfHOJ1ACmAQs
	tCh4tUZld8cS4DJaDwTz5LcnM3SnOtYcaz3y0PEGB7AYz2wmAJtiw6qn75OBkdwMfReF0jNPC0kvr
	z6pqCNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpM2A-0000000ExyB-1ET0;
	Mon, 09 Feb 2026 07:50:14 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpM27-0000000ExxX-20pb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 07:50:12 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CD0741A28E0;
	Mon,  9 Feb 2026 08:50:09 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9EDBA1A0488;
	Mon,  9 Feb 2026 08:50:09 +0100 (CET)
Received: from lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com [10.52.9.11])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 49576180029D;
	Mon,  9 Feb 2026 15:50:07 +0800 (+08)
Date: Mon, 9 Feb 2026 16:50:06 +0900
From: Yanan Yang <yanan.yang@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com,
	justin.jiang@nxp.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Lei Xu <lei.xu@nxp.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH v4 0/2] Add NXP FRDM-IMX91S board support
Message-ID: <aYmRrjbvlrPylSei@lsvm11u0000554.swis.ap-northeast-2.aws.nxp.com>
References: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
 <CAEnQRZBBM6y9Ux8ytbYEY-hQ_D8t+aW1+8OczUpX4=p1gmxVQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZBBM6y9Ux8ytbYEY-hQ_D8t+aW1+8OczUpX4=p1gmxVQA@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_235011_656130_AF8B1B78 
X-CRM114-Status: GOOD (  17.64  )
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

On Thu, Feb 05, 2026 at 03:41:57PM +0200, Daniel Baluta wrote:
> On Fri, Jan 23, 2026 at 8:43 AM Yanan Yang <yanan.yang@nxp.com> wrote:
> >
> > This patch set introduces DeviceTree support for the NXP FRDM-IMX91S
> > development board based on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized
> > variant of FRDM-IMX91 and differs in several hardware aspects:
> >
> > - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> > - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> > - Single GbE port (FRDM-IMX91 has dual GbE)
> > - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> >
> > This patch has been tested on FRDM-IMX91S board and verified for basic
> > functionality.
> >
> > For more details about the FRDM-IMX91S board, see:
> > https://www.nxp.com/design/design-center/development-boards-and-designs/FRDM-IMX91S
> 
> 
> Hi Yanan,
> 
> Just got my imx91S frdm board and tried to test this but the patches
> failed to apply on linux-next.
> 
> Can you please try rebase and resend?
> 
> Thanks,
> Daniel.

Sure, will fix it in v5, thanks

