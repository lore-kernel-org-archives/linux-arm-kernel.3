Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3AFCD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CABNKAmPtFLSQ1IP5qwO/hTftEIR8AHWbuY7esmAI9Y=; b=fr6+NvWP9WzPpyFaGLuDDw9X/o
	2E9+FFvhb4dfMPTHi1pFPNcXFA0ACy+0d3b5eQDILRXHhbMIXJP4VLovvTEHbdDEj1ChYM6VBqlIp
	KmkYZuM3trRmBteZnSIg3s8Dz0dwzUTzmQ0aFS8JxAGzP+QDWXMxzF3TKAKHeApcZ+o3+38QzO34d
	Pa4WdBq496IDbnB5usCkeVTkVVnF+9zvjFuwJMi3DWQerxeyLIJf3F5Jl1c2SLicGpqXTh4kQELZ6
	i+w1uUv213TmEWldhaC8VMF5tt3bfYkailTU1Z73QyCRYsgjHHNQCMWj+zveavDRrgGqqcYWFPVka
	HFZ+owQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTIi-0000000EAeU-0plH;
	Mon, 11 May 2026 16:16:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTIc-0000000EAdK-0Glu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:16:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFA32438BA;
	Mon, 11 May 2026 16:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BBDC2BCB0;
	Mon, 11 May 2026 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516164;
	bh=Tkh+jKJ/HyweWFm1kgLTPcevVPY1FTld3W69DkR2W2Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tjopzip28MhLehp4hRjx8JUwAh0/SjqSTki7LJO54v/RDR/zr+Eaoc4MfPhed7fTb
	 toGS4r/1B6F8q6TYuVhUX8O00py1jeUNL4P5J1SnoU9qM6R6JaNnaqnz915YRs0L2V
	 2PsKi0vPkWB6R8XL22wod7E3nZG/Z+/YFpJy+ZnIVBKlu5edcYe6KRz10GUUw/62sO
	 qnp3qpaw9jIULRLilyB8Y3S1aVvy6Hic+gv+nOfyHC6Eq1POmaJO21R+SobBtUB3tz
	 W20wx10pOfViwgw538xxLRGWPAJ/+ScZwOFxTIySBipX6R6eo43xqE6zKdKHF3ooUJ
	 euUacNRwuQ6tQ==
Date: Mon, 11 May 2026 17:15:54 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Lars-Peter
 Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: iio: adc: Convert xilinx-xadc bindings
 to YAML schema
Message-ID: <20260511171554.6541042b@jic23-huawei>
In-Reply-To: <20260510120141.118057-1-pramod.nexgen@gmail.com>
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
	<20260510120141.118057-1-pramod.nexgen@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_091606_151589_4BC41EFA 
X-CRM114-Status: UNSURE (   9.88  )
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

On Sun, 10 May 2026 08:01:36 -0400
Pramod Maurya <pramod.nexgen@gmail.com> wrote:

> Convert the Xilinx XADC and UltraScale System Monitor device tree binding
> from the legacy plain-text format to a YAML schema, enabling automated
> validation with dt-schema.
> 
> The new binding covers the same hardware and compatible strings:
>   - xlnx,zynq-xadc-1.00.a (ZYNQ hardmacro)
>   - xlnx,axi-xadc-1.00.a  (AXI softmacro)
>   - xlnx,system-management-wiz-1.3 (UltraScale System Management Wizard)
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
Hi Pramod,

Something went wrong with your sending of v3. I have two versions sent
half a day apart and no idea how they are related.

Anyhow one of them got feedback from Rob's bot so I'll assume we are
getting a v4 and wait for that.

Jonathan

