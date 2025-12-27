Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA53AE8FDCC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMNcwU1XIRXwreJ3vQYYnf7jfKCD3a4layQ2kXpU6iU=; b=aOgvRe23X3dKd/kl+VFkQw9t4w
	48x9R8a10Z4g8vv5boK8a+8G6Hm0SXV3bKbC9dnmf27Yakk4ceoMGIULixVSXX63mtplk8/qD4BXj
	ZMau52JVfh1m1FkiMojZ7B4MB9s9stP1QbEpULXn6ZIm9FxI7RGgAq29+mv9QAXceD1nkIOvFKMkm
	B1qjZEbRfjG1H2kWUNOve7JgGM98ANBbmfS2931uZNSIvrK72Aqz4w8zEzoFDjW9OlJ1LzM0ChgXo
	8Pu77EJy7iiJ7d7ggxarpsO97Pcm07TFmOEVRAWi2OQthqKkOMtYqcd3JgbB9xi1fY8AjDU7awSWB
	G/6bjXCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTwN-00000001znw-1Q7A;
	Sat, 27 Dec 2025 13:02:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTwM-00000001zno-1ImO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 13:02:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53B756000A;
	Sat, 27 Dec 2025 13:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767F0C4CEF1;
	Sat, 27 Dec 2025 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840557;
	bh=eu9YmoAVPx9G2RqP7sOlI4dEJ+qLQ8lmQAKMzvDuWsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKlVrq2bOy4hP0YLqKJFavJ9XAk3qcaSNstmLmXaSWJTtmxvgzPfKCR5IxIyVfITO
	 BHCfndgnHaCAiiLY6ViRURNysOKKryRO5DDerfAl/YueantgNOHcfY9Zm+MPLTetHI
	 Ct0ddu5FJFkVvl6FG+g7aiJtQgLUqcVL9RArpt/UfbtVQGx4kcGM/x83SWxc/LHbBQ
	 WKgHwN3OAKiQcmCdUluDDGZLPS5aZyBE/n22kmidWFkxAUD680Ch/Zy1+BsbW5DsFp
	 Fwhwpydgle0/CKnQ77apLrYdLXD7VIdsUACW0oMikGZWCWcjVBa8giyQNdrxVu2WfH
	 4EzaW++2usE7w==
Date: Sat, 27 Dec 2025 14:02:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/4] dt-bindings: arm: fsl: Add Apalis iMX8QP
Message-ID: <20251227-polite-malachite-chameleon-f446cc@quoll>
References: <20251223162833.138286-1-francesco@dolcini.it>
 <20251223162833.138286-2-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223162833.138286-2-francesco@dolcini.it>
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

On Tue, Dec 23, 2025 at 05:28:27PM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add binding documentation for the Apalis iMX8QP SoM mated with Apalis
> Ixora and Apalis Evaluation board.
> 
> Apalis iMX8QP is a variant of the Apalis iMX8QM, using an NXP i.MX8QP
> SoC instead of the i.MX8QM. The two SoCs are pin to pin compatible, with
> the i.MX8QP being a lower end variant, with a slower GPU and one Cortex
> A72 core instead of two.
> 
> The two Apalis SoMs variants share the same schematics and PCB, and the
> iMX8QP variant exists only on revision V1.1 of board.
> 
> Link: https://www.nxp.com/products/i.MX8
> Link: https://www.toradex.com/computer-on-modules/apalis-arm-family/nxp-imx-8
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


