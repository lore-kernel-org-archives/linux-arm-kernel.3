Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE41C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mn4Pc50e7tXmnLGnOXIk9B2CNBd9PxUIgSRsaBSDbnI=; b=MEQlxCZShC+B5ZAJfHLltU3y/y
	r9RkF4ZEQciY1GIDaK46Jv5LdNZDDQaK65xfDa0CqlixS1RUarUnU63tMMRRtri/ZjOMeb90Pq9fB
	WBfVmI91bcyoPU1NaDv6gvQUK7Pw12RDi8CJwBcTKb8ycJf1BErCzgFPHhgaMpSestCkKQ//NPjNT
	1lGv1TX+6hiR71VrQ8m2PpYePucwbN1rycTHIzNTsSHHXIKAzK5tiI87YwsFFJ27GhSu2LvkuNHx8
	tmfTIlYG5qSdagbUqwUaZMHPG9b5xBEZLKHZ/tvRbW7j8z+rJSx2XM/Uj6ua8UUqfWwOuoH3LRueD
	EvlL+7Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK00q-0000000BR7B-0dDK;
	Tue, 27 May 2025 19:31:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzwh-0000000BQWZ-3kgd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 19:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 53595614B3;
	Tue, 27 May 2025 19:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B6EC4CEE9;
	Tue, 27 May 2025 19:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748374003;
	bh=H6haHA7oSNBrFCJ0OSt8DikUNfMFd/tbzmvR4IC+64E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trX4qoiF9C8t5p/j4u4YcLYkYnL27yW/TI0AqPQ9GaRcP+aNjqsPLtFuMgaYRmdv6
	 nfwl9k/ej8PF2kVo6WsC1ftd9fSmVE9tyrdCCfXxROGYqaZ1YtWQnR0QKpTxNOfjfP
	 fdI46iWQ/IKyJG8MkJpujd5I/UF5L4W61SsCKXZQSn+p2MziyIimuKiOfvMzOeaF/M
	 ygCjYrXzs7etE1yZEU1KFO70Bwe1Sjq5WmRGU7yGTPTx/XQrTYeIR5qbhBOI/zv0LI
	 1bdDPZl+CI5mEfgMByClEPxBtSGdCi+yg8f84hYt1Jrv7E2sNF9arDpcT+O55gURNZ
	 EWAxLLxvFaO6A==
Date: Tue, 27 May 2025 14:26:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	michal.simek@amd.com, git@amd.com,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	gregkh@linuxfoundation.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: dwc3-xilinx: allow dma-coherent
Message-ID: <174837399989.1087595.10398541718787330529.robh@kernel.org>
References: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1747401516-286356-1-git-send-email-radhey.shyam.pandey@amd.com>
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


On Fri, 16 May 2025 18:48:36 +0530, Radhey Shyam Pandey wrote:
> On Versal Gen 2 SoC the LPD USB DMA controller is coherent with the CPU
> so allow specifying the information.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!


