Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD96CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6bxtzQsXU5V2ZLqW/tYugnU81O7/hqnwZwvA1uMdL8=; b=yUtfuglySqTQA+C7DxETg0swSm
	VHvD7QCb3qg4GC58eJXeAevdv6JglhANzV4NVNH0P8CFx7rPuSrU10PW5nPLKs9EOxpDquLysZkAq
	HGmIWYPv+ArV6h+VWU0CN8QfRpeBa2R351wsMYk+6ZYRsq8wEwc0tKi/d9LewM8IiTNUZs4QVIrym
	z8Dt9bixT/ZNwI279qSEUMQTUEiAVvjYwL1OeuU1QSbuWXZI9ye6FG4s6rpCZIuWx6TuDP0WFwJY9
	uSVB3HzuipQEi88l7RlZffzWakkdqe/j4FGyDOBgm8l2iAkgkuCvrKNqW42XDSV9hbNy6cQh6/N3O
	kqsCI4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG5C-00000007O2a-2dcr;
	Wed, 10 Jun 2026 10:22:50 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXG59-00000007O1w-41B8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 10:22:49 +0000
Received: from gaggiata.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9D78522715;
	Wed, 10 Jun 2026 12:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1781086964;
	bh=L6bxtzQsXU5V2ZLqW/tYugnU81O7/hqnwZwvA1uMdL8=;
	h=Received:From:To:Subject;
	b=pC8mYV7Xz1TRYqsof6BGWIwTZf7J6GAzFKMNJBiXoNGclnIzszxJMfPsQ4lVyEWlp
	 id8MqVeYdb09FIworIJ+W+/Aqa8ttaP4qtih5Tu15BX3wTxoLrlh3qhQYMpID2lfaW
	 3bU8F0kg2Wetv3NlsovGSYAVGOfxlksDwSvweQ8K1EORX5undFEnvo5HA43fcZA2WD
	 g1zIwMfeW57yfstKt99jOXwQ5/j9SItqXODr80EFXHiSLekrerHOwYY2W51DPQHpPF
	 /touJX3xeB6F20k2DaDBufw4DkU8LQHwXj2BsdBXZ0KFXanZRKBy703fDUwSrFrFym
	 aLbhV50d4xpqA==
Received: by gaggiata.pivistrello.it (Postfix, from userid 1000)
	id 540DA7FD97; Wed, 10 Jun 2026 12:22:44 +0200 (CEST)
Date: Wed, 10 Jun 2026 12:22:44 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <aik69L0xCW13TCZE@gaggiata.pivistrello.it>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
 <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
 <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fc48536-5af9-419e-b4df-746b678cb6ab@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_032248_182655_78999CF0 
X-CRM114-Status: GOOD (  17.10  )
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

On Wed, Jun 10, 2026 at 02:10:37AM -0700, Laurentiu Mihalcea wrote:
> 
> 
> On 6/10/2026 12:37 AM, Krzysztof Kozlowski wrote:
> > On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> The names of the carveout regions are derived using the names of the
> >> reserved memory devicetree nodes, which are referenced using the
> >> "memory-region" property. This adds a restriction on the names of said
> >> devicetree nodes, often bearing specific names such as: "vdevbuffer",
> >> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> >> specification's recommendation, which states that the devicetree node
> >> names should be generic.
> > 
> > No, it does not. Names like rsc-table feels exactly like DT spec is
> > asking - for a name matching purpose. Are you sure you read the spec?
> 
> Quoting from the spec:
> 
> "The name of a node should be somewhat generic, reflecting the function of the
> device and not its precise programming model"
> 
> and looking at the examples provided in "2.2.2 Generic Names Recommendation",
> wouldn't "memory" be a more appropriate choice for the DT node name instead of
> "rsc-table" since it's more generic, while still matching the purpose
> of the device? Or perhaps I'm interpreting this the wrong way?

Please see
https://lore.kernel.org/all/CAL_JsqKRW-=er+DCTob0HmQv9OyVt7yiej-Yht6UR-mcW=LHUg@mail.gmail.com/

Francesco


