Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3CFF8FA87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 11:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cxVjnXVnQ4o2Yj0yc0TUJWtP9ZwdF5obJ1mgQ3ITq3w=; b=aB9YhNCfsE83hixgAetkvWkSbN
	pHFAV7togD3Vr6akLuffwNQ+tbGkKPm/yei2K+uuzJRK5Q2tn47G+xb48g0e0LRXhSzt0YDAI+7bK
	RJqVLoFBL7gbvAMgDwHQEZ/Y/GYvyzwmA3xxH6p4oIzJnY/pQmsFNmhN0BdWmfXlXhDWmFmvcl6Vz
	5faezW9ihkiKZg07APzRxwdXho3hVPtly80/oIwX+nEE6fDWpDDnMK7d658EUyCAOhMkbp8k0MIPf
	cZcOfckcIwXwvOLdIBWy8pVuHmmr2PO1E9xlPOBmpbvvnhtSJ5duy3PoKJpjiZN5YSy6V+czKHG1T
	1NvSWJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVyP-0000000A0WQ-1e1C;
	Wed, 22 Apr 2026 11:42:29 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVyL-0000000A0W1-1Otg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 11:42:28 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8D08F1F95F;
	Wed, 22 Apr 2026 13:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1776858138;
	bh=cxVjnXVnQ4o2Yj0yc0TUJWtP9ZwdF5obJ1mgQ3ITq3w=; h=From:To:Subject;
	b=IyHByBoZ0yua7HveDK5Qz7y0M2k8bOkuJLUBq6ifP2jQWQkjbp9HeS6V/FozP0lnr
	 4lS+SjUB0cyT/6/jyyXYGr8SiQx+/eHIuIGSBI8nd2orIY8P6rdgNdYkE05sBHxX4Y
	 bC/ZfvVQbvfZouBaymcebs0Mns++XxuQghc6RvCnoQ959cM/VXa+VtitYunfO7mGxj
	 UtAsh6towM0vAiJ66ZDjkDROIAxDee6oVMMkDflO1EqDE9aoRl36xXS5yo+S4QPmPZ
	 rwIVwdc2dfGIuKJrSuS591FC33hMBt4RsqabHzn19LkGbYYTCai8Xy46c/lDscddfe
	 15Ovc8Ugs+3OA==
Date: Wed, 22 Apr 2026 13:42:13 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <20260422114213.GA68897@francesco-nb>
References: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
 <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
 <5988897.DvuYhMxLoT@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5988897.DvuYhMxLoT@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_044226_269034_49D408DA 
X-CRM114-Status: GOOD (  10.21  )
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

On Wed, Apr 22, 2026 at 07:58:11AM +0200, Alexander Stein wrote:
> Am Dienstag, 21. April 2026, 16:48:25 CEST schrieb Daniel Baluta:
> > [..]
> > 
> > > +
> > > +	reserved-memory {
> > > +		#address-cells = <2>;
> > > +		#size-cells = <2>;
> > > +		ranges;
> > > +
> > > +		linux_cma: linux,cma {
> > > +			compatible = "shared-dma-pool";
> > > +			reusable;
> > > +			size = <0 0x28000000>;
> > > +			alloc-ranges = <0 0x80000000 0 0x80000000>;
> > > +			linux,cma-default;
> > > +		};
> > > +
> > > +		vpu_boot: vpu_boot@a0000000 {
> > 
> > Should this be memory@a0000000 ?
> 
> According to schema in dt-schema repository [1] the node name should
> describe the purpose, so I would keep that.

See this question on the topic, and the related answer from Rob,
https://lore.kernel.org/all/88456d17c91737cfc09af46673b49bb9a9d36dc0.camel@gmail.com/

Francesco


