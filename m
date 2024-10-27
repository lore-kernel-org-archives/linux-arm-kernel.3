Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A78D13587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 21:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tvh7MXpq2diqVMM+WwX9hZxg8qmdZ4OMvEiW+hHaF8=; b=CgcLbfqAXlZRMTiwn+88FUASOL
	zyJL6tD2etHif8qlRN4ALTe0uovjKUYtrC3udxrnfvYnQTo+gl4ncWcXlh2igTcjUw4MT1wjrS/Xf
	Gr8xaX//vnBDWpp98rpQxJXSA40t/663wcq2x+sKYakfj/0UI12EcMxJgzXmBG1gRchUMAfmGpowC
	/XGoWVRXu7Qw5eaVDgxu+12e+iOx//NrNRO7ZH1b5BjEvODoWqR99Nlc8HBMrOnRcD/rNJChIFC4a
	5zuLyuV0PGbPkh9T/eRVIThuUWBGyHtXg3QMh9zfwyRRo/83662dGfOadpYfosMUbySoulWegOUFG
	r5nb7geQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5B41-00000008xiZ-0iCv;
	Sun, 27 Oct 2024 21:44:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5B2O-00000008xQn-3Sr1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 21:43:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57E395C589B;
	Sun, 27 Oct 2024 21:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7FAC4CEC3;
	Sun, 27 Oct 2024 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730065383;
	bh=95sirABf7ucaPkTuGsjWtpLdOArUZGImNoaA5WncnR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JGdct4LP6gtvYb/DAXYbq79Xua4YsVMkYPDKqy08AdyR0DiYxgiAgxvCqyFRLlvpV
	 qjiZmYsinCu/J+nnG3RLuPaEZVQ2YZEVLRbYIGBkn+5tmUQt/Ce2ExRcjP8R4BSUKf
	 Xb6XGURv7PvH9Dmo1JSUFaH5vLHWSG4oU5QMFlaGXVgO3b+XUC/UE5JhwADh4qXSSc
	 57X/mRi2kiDgEScx0NyNs/GngJjvX3cc38We/RC6I9vflYPtaYKch9M/xcQwJnDPPT
	 f/sL3/fawIoUb9+a7Kae2dZvLNuXUoGJ3bTTSn2SGqCBlP9PSBDND1WmeV5/zNO8CP
	 Wj1QJwvlOsSUQ==
Date: Sun, 27 Oct 2024 16:43:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>, shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: imx: fsl,imx-anatop: Fix the i.MX7
 irq number
Message-ID: <173006538122.121456.17477548569074643577.robh@kernel.org>
References: <20241025004159.1571782-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025004159.1571782-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_144304_932800_3565DECB 
X-CRM114-Status: UNSURE (   9.68  )
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


On Thu, 24 Oct 2024 21:41:58 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Unlike the other i.MX devices, i.MX7 has only two anatop interrupts.
> 
> Add logic that contemplates such case to fix the following
> dt-schema warning:
> 
> anatop@30360000: interrupts: [[0, 49, 4], [0, 51, 4]] is too short
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../bindings/soc/imx/fsl,imx-anatop.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


