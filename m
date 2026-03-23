Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EA0F483E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGA4ln/qmpjwGjHWwIIdmEIZo0vlBTtfWZFXiL/qqbE=; b=xneK41SrOVifFvhselWBtAbjyQ
	/wznUerRr9lHjUU4Gn+AxqcR+m43FhRjPgppLJ6vFkb4eR/GkiWY/yPoNf7CVu5bbZyUnRqXb+B4D
	9DUkzoZImxcHePqPVENsZG9969joT7/SRn5eoTaDbIWruvuN/bjj4BtgZtGhb8OS4MO7+sIyw69QW
	vUtM9ofu8JkQFO5EPVnlO6Qyx9tHgKzHgqz98y4LRSU/DmwGYfp0q1y0npJA5FSNq3pqIbMMeXNci
	b7ctq8euOD0qvmaZTIzm/HLospU9x7ik3j/28ewIfTYokyf9zrUs0PEuPc2b6ktAtbCZlNubgPANL
	Qq+4weDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kkP-0000000HR5v-1fJs;
	Mon, 23 Mar 2026 19:15:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4kkO-0000000HR3x-188Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71051600C4;
	Mon, 23 Mar 2026 19:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96595C4CEF7;
	Mon, 23 Mar 2026 19:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774293330;
	bh=WVQEv5BiSE1a5SJvjjKjBtJ6Twe7PvX4G5/XVYbMPAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I8EhqmVmj3xABQ8clRhtrD1H52IQfgrIsylyU4Hklz9rT+RqAOnzs8YtYywuYwMgb
	 LzNMnKUSBqVo36PV0TkwGEcwKvlilYt3ev7y82SUQBOzdsNMIsTsyVa7tFU0Y1or2C
	 FNn/r++z5wOMLtXXW7Ot9HZnQqxHpjdgNZfefoycJHtvfcYGuNx3cP01pa6Q5x3u7a
	 dSDsCrmF75ZfMJu4pa43e8EturFh2VSrvtbN7JqDQqitk8lfabK2YmhgSYPc5ATww2
	 ubW+HdZ+fV2MHUXJKDhh3Glm1M48M4E8ifKBcBzGWv4mVw/B4VrBhgNRPWClQEMpKU
	 atouRt3wP1qRw==
Date: Mon, 23 Mar 2026 14:15:29 -0500
From: Rob Herring <robh@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: imx-rproc: Introduce
 fsl,reset-vector-mask
Message-ID: <20260323191529.GA1054724-robh@kernel.org>
References: <20260312-imx943-rproc-v1-0-3e66596592a8@nxp.com>
 <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260312-imx943-rproc-v1-1-3e66596592a8@nxp.com>
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

On Thu, Mar 12, 2026 at 08:36:56PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Cortex-M[7,33] processors use a fixed reset vector table format:
> 
>   0x00  Initial SP value
>   0x04  Reset vector
>   0x08  NMI
>   0x0C  ...
>   ...
>   IRQ[n]
> 
> In ELF images, the corresponding layout is:
> 
> reset_vectors:  --> hardware reset address
>         .word __stack_end__
>         .word Reset_Handler
>         .word NMI_Handler
>         .word HardFault_Handler
>         ...
>         .word UART_IRQHandler
>         .word SPI_IRQHandler
>         ...
> 
> Reset_Handler:  --> ELF entry point address
>         ...
> 
> The hardware fetches the first two words from reset_vectors and populates
> SP with __stack_end__ and PC with Reset_Handler. Execution proceeds from
> Reset_Handler.
> 
> However, the ELF entry point does not always match the hardware reset
> address. For example, on i.MX94 CM33S:
> 
>   ELF entry point:           0x0ffc211d
>   CM33S hardware reset base: 0x0ffc0000
> 
> To derive the correct hardware reset address, the unused lower bits must
> be masked off. The boot code should apply a SoC‑specific mask before
> programming the reset address registers, e.g.:
> 
>   reset_address = entry & reset-vector-mask
> 
> This reset address derivation method is also applicable to i.MX8M
> Cortex-M7/4 cores.
> 
> Introduces the optional DT property `fsl,reset-vector-mask` to specify the
> mask used for deriving the hardware reset address from
> the ELF entry point.

Why can't you fix the ELF image to have the right address?

Or just imply the reset address from the compatible? It's fixed per SoC, 
right?

Rob

