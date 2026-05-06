Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEF4CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F75doG2AVgpG4HeACKqqKwUCIbiK8dceUZGKreJew5U=; b=ZLAYQDKInYu94SWrSx3nICnfdV
	vPzoaNEocPAXq2DUdgzGKgyLO7ZSJfd9h9lmS5ze6PmHQwaQCFZXZM2YJYsajzY3lf1fv9UDpB166
	F9nZJv3cE9j9pixcxYjrhEPKYZ/U4lEDK52LUVqUk2g2lRVrrDSu3oc4/JtL0vUfYG+JymAAkgLZ+
	qn4PNEmyYUfNA8cdwUlooDRZroncaiw38Q68JuS3oE+1IT05fJZMrPV9x6DGQyUcUmtqld/wSM8/p
	JLN9nnC/7gTr/bOdH84Wq4hTcw1mIjGi3jtA36fgJLeX5f+wz1TNycLVmmL37Bd6UUuRYKHBuKNqP
	2KcCeRew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd8R-000000013qq-2srP;
	Wed, 06 May 2026 14:21:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd8Q-000000013q9-10nr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:21:58 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64FFE63D;
	Wed,  6 May 2026 16:21:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778077313;
	bh=0Uq1YugYUXzi8pj8HXdSH3+9q4grpd3YGFD2ihnyGEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWFsteE5Yud9FRc62Ue8FUO1vdIwK1vF//+75iUC2X7IJ1qEGI5wf7uLMVSqUixQL
	 CYkQY5kk6D7xRaLVAInGyyQB7WpzGQiea6RSDdQasbUA8cRbp62zKd8B/r+vafVkbC
	 XaHtZPTfgKXiZBHn4Bu0KHJZEpO9vq4rEUHNlxPM=
Date: Wed, 6 May 2026 17:21:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robby Cai <robby.cai@nxp.com>, Frank.Li@nxp.com, martink@posteo.de,
	rmfrfs@gmail.com, kernel@puri.sm, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	martin.kepplinger@puri.sm, imx@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example
 endpoint label typo
Message-ID: <20260506142155.GR1598374@killaraus.ideasonboard.com>
References: <20260506090124.2960477-1-robby.cai@nxp.com>
 <5ad1e2df-85f3-4f9a-ab9d-b6ae34eebed3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5ad1e2df-85f3-4f9a-ab9d-b6ae34eebed3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_072158_418016_C4B3AD07 
X-CRM114-Status: GOOD (  18.77  )
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

On Wed, May 06, 2026 at 03:33:57PM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2026 11:01, Robby Cai wrote:
> > The example in imx8mq-mipi-csi2.yaml uses imx8mm_mipi_csi_{in,out} endpoint
> > labels, which is confusing for an i.MX8MQ binding. Rename the labels to
> > imx8mq_mipi_csi_{in,out} for consistency.
> > 
> > Fixes: 37255747ecbd ("media: dt-bindings: media: document the nxp,imx8mq-mipi-csi2 receiver phy and controller")
> 
> Nothing to fix here. Otherwise explain the bug.
> 
> > Signed-off-by: Robby Cai <robby.cai@nxp.com>
> > ---
> >  .../devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > index 4fcfc4fd3565..71f79651dd96 100644
> > --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
> > @@ -220,7 +220,7 @@ examples:
> >              port@0 {
> >                  reg = <0>;
> >  
> > -                imx8mm_mipi_csi_in: endpoint {
> > +                imx8mq_mipi_csi_in: endpoint {
> 
> Drop the labels instead - they are not used.

I think the label has value, it improves readability of the example by
making the purpose of the endpoints more explicit. I won't fight for it
though, I know it's hard to change your mind.

> This is just churn and for sure not a fix.
> 
> NAK

-- 
Regards,

Laurent Pinchart

