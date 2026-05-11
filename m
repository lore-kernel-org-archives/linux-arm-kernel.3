Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3428BCD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=einb+LGW29zvKkRAbk+nPhb1KojYNvAwOrPEsK42Qx8=; b=HzT+9CtyC/I6+6MLSOSKzPxxr1
	r17m4vRR9gl+VB+DcF1rhGD1Rz9qE3K3+oNbXPor8U0OSHlcGY59dHIQYQaxqdJHBTbwa3sxVjvb4
	ZzU7Vu0//Vgnx/dnyn69ILvbFP4pyBV0y0djMdMQdbs5UikePnKujCYSlAC6/5Uy2FLjDpF17gUXO
	WFfd6XFnvS5n7dev1k4VIvndrMEOPgft1Ti5aN1+dKkLldomJaRCK5Czv+UzXZNW4vjWuv9lrlpVL
	h0/84JZrV0l77nRcH6jWFAJj8dYZfuXyqynnKMzfU7lOTQ86Oq/fpyevqdhCszrzbAEivZQdscJSV
	mIuK4X3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTKj-0000000EB3t-1BLx;
	Mon, 11 May 2026 16:18:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTKc-0000000EB2k-2khv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3575B43E56;
	Mon, 11 May 2026 16:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D5CC2BCB0;
	Mon, 11 May 2026 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516290;
	bh=YxvORiIZBfulrMnrmjoNFiu0qMUXNTX2BFKfPnRUsNc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AJR4Hyjsk4FhXdj2HAqhzZ+l93E+n6xFXon4ZLKmdNtt+WHm72+lo2v7QAb83evev
	 4RJLqH2QIofV0dZ9x/zFWr0iEDCB3IiFXX+zJJU4o+6B0uKziqmnqAXyvkXGIfsuvf
	 YTgA9wjg4hVFnSDZ7tO/pTxWIUQVv8tFAF2tkF5ekXyz8/S+LWJyPLpceFy6jYJ5ru
	 UJMBFl44AEM9RF96zUf5qjCQSd82zBi2KbOo5wrspD5vukEwpJRHgqJ7GnSDyPjjAk
	 OX7Fs1HsIhBAy735SxPKnV+suhmGaml/Q8kL1jlg/SIepZ/ZwikGFq2Ccp//4+uvTj
	 0Fcg7cB5f2A3g==
Date: Mon, 11 May 2026 17:17:59 +0100
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
Message-ID: <20260511171759.46a95f8d@jic23-huawei>
In-Reply-To: <20260510120141.118057-1-pramod.nexgen@gmail.com>
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
	<20260510120141.118057-1-pramod.nexgen@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_091810_761601_68B40123 
X-CRM114-Status: GOOD (  11.36  )
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
On another note - please slow down.  I now see that v1-3 all came in less
than 2 days.   Typically wait around a week for a significant patch like
this - that gives time for multiple reviewers to take a look.

Maybe we can relax that given the v3 many versions confusion - but I would
still wait a day or so before sending a v4

Thanks,

Jonathan

