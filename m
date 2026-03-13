Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D26105F7AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 14:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7POakg6MHw4p3kkkpZq3wQJX3ZeI1Cv6TvYeJ0K1Vs4=; b=FEH6zAxj2rZrWCA0MAI9kPBTyv
	0cQjL3URPZcYb34wHbSKykim0zTrxYV1n2Q20+QxWV+Xkrs8q8OUntzBPM6/yObinMAxp7OFjKsKn
	nR6E17vYQx0VzJt2/UfVJgJlSxhy+ngNckjRr3gB1iTOqB40T5ZcsjUxbnQsp3pht31eoa0QWUXdQ
	z6P5P//zdG/bfmWtpDtA/J3I9WGLUn6tKIB2bKty9cZ5cQuK8iW/UCLJKWwxEwR1Gr78oLa6Dzd8E
	8bpOsS0P7/9/ahAfrE0eosQXfy+loMsIjVUjAusTu8TcuwCskSu07eSPEMx8UuKhANJ8rnWYPmvEt
	dUDs10Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13FR-00000000LM2-3FjH;
	Fri, 13 Mar 2026 14:12:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13FP-00000000LLe-1wnU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 14:12:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A22DF4073B;
	Fri, 13 Mar 2026 14:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3528BC2BC87;
	Fri, 13 Mar 2026 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773411133;
	bh=fCDSGdh45iA1riKZcxhhDtMhhbaysPCQejZ0j7VYQ/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uR/8lat9dmWVqSArt2oms9SCCRV1D7aER4Ee/1m8itl5hzbSrC9MkLTHho6AeHWuJ
	 sqXUKFedbkly9Fc/cosYvvLRAFzLZ6vxjz1cMrnbto3KK2BWcu3fXQsj0I/ROkL8Nm
	 fNl5+tXIntQhNtU+MiZ0Owh1zzHsSqrtUjg4JYVmDPPErwhS802P+Ocb/WXozR65IS
	 QVQeQs4Fl7e1MwUTS7dxKlzuhs2wllwvPmYJVof3coDX10aYfP9YXJgB1P+ugwvuct
	 7sdnDCcOkVO9iCWy/BKspaZSOQM9L85s0nVn3Ne5W9tVdC6IpeAWz9Ygu8rfB5dL5y
	 OWXcdjIZFQbSg==
Date: Fri, 13 Mar 2026 09:12:12 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: input: touchscreen: convert
 fsl-mx25-tcq.txt to yaml
Message-ID: <20260313141212.GA1847704-robh@kernel.org>
References: <20260211-yaml_mfd-v1-0-05cb48bc6f09@nxp.com>
 <20260211-yaml_mfd-v1-1-05cb48bc6f09@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-yaml_mfd-v1-1-05cb48bc6f09@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_071215_524018_23E781C6 
X-CRM114-Status: GOOD (  10.63  )
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

On Wed, Feb 11, 2026 at 04:41:04PM -0500, Frank Li wrote:
> Convert fsl-mx25-tcq.txt to yaml.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/input/touchscreen/fsl,imx25-tcq.yaml  | 69 ++++++++++++++++++++++
>  .../bindings/input/touchscreen/fsl-mx25-tcq.txt    | 34 -----------
>  2 files changed, 69 insertions(+), 34 deletions(-)

Linux-next is broken as the MFD binding has been picked up without this 
one, so I've applied it.

Rob

