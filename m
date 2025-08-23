Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAA2CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vPg8Yp55skELPQqk0ONljyGDglcrGmLyaj/ALQM2wA=; b=v426OM7h0yO4qL3/ISQTZ2A8+k
	fS26QX+TnCcsH99OPX7POi/PX7XeypMK4s0QgaQ1suWHTES7sLQ6HroIqExNDNy/2vJ2zZrl+OzWJ
	76W1AEUE325MOmih2ZH+6xJ6xok1ii7r5fRzKRZpNhYMHITIde31MZvA7TZnNn376zz0shwcqhF1G
	wCkYj+GdMOICT9m1240o7qI47IAL3fDYeLBw97YogPF7AeD2AUcCnWKxdCQcQ4DlYm5OIxyN19ngN
	edSaaIpxD4vfb5LQUDEnnD2AmtLLwRcBDm3BR1V4oCtlSJd35oIc1dgyRaDJnYRqsxZIXKdVddLNC
	fsmvm6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkhD-00000004Xwc-0T7y;
	Sat, 23 Aug 2025 09:37:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrk-00000004762-00Uw
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 23 Aug 2025 06:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6vPg8Yp55skELPQqk0ONljyGDglcrGmLyaj/ALQM2wA=; b=Lg+oUJqQZONqMKDDdWxDSCQNbh
	02RorgBfHvELPn2mKrIDxOOqrGFvtqUAit98LH/UvTLBypMUpr+pNSRY8cfd7qQXS0N2WrpBY2A6F
	1koQ/Q4XfQapG8b4GGNk+BtXACrKDapsMw9iMUas3/hjTivICYUh1mRbAB1w0kX5gko6T3sBtJsuX
	7l1eX9x6DjH0/yxwF3xSSxkLODFc074B3UJwD6aGz3QekQeXwBR1Nf9SvQyxiH4vO/rGYm/tqQm8g
	oJph6cQ+yBZjd2I6aluPxE3DIYNU6vkD43sBTnaGpb9dZudCN2vou2PN4DZiJM/upWbGapgyrm6um
	6gtr0q6Q==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphrg-00000001IAs-2dTS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 06:36:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FC895C4328;
	Sat, 23 Aug 2025 06:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944E8C113CF;
	Sat, 23 Aug 2025 06:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755930994;
	bh=JmNf+0AG97IGYu8B7L1j0V46DCFU5/ljdv2ZVFoAVRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qji+1rXN9OIXfa1Z5HHnBCjZi9aYqDpsTOzT+G6SgOLe6hLfFrWSfXuyKJGwVUGWq
	 KhzXOf0FFXFVDhOFdhoJ3qsfnvB8yYOnExcZ7tn28GY2Y4NLNZJ+15/ebQX1dnBR2l
	 bZQ3+AUeijjqg4dVWImEEoQ3qxNhx3/+H2Wcw4UA=
Date: Sat, 23 Aug 2025 08:36:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Harshit Shah <hshah@axiado.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] serial: xilinx_uartps: read reg size from DTS
Message-ID: <2025082322-speech-blaming-b075@gregkh>
References: <20250822-xilinx-uartps-reg-size-v1-1-78a5c63cb6df@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-xilinx-uartps-reg-size-v1-1-78a5c63cb6df@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_073636_935781_F3AB5ED7 
X-CRM114-Status: GOOD (  14.71  )
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

On Fri, Aug 22, 2025 at 11:58:14AM -0700, Harshit Shah wrote:
> Current implementation uses `CDNS_UART_REGISTER_SPACE(0x1000)`
> for request_mem_region() and ioremap() in cdns_uart_request_port() API.
> 
> The cadence/xilinx IP has register space defined from offset 0x0 to 0x48.
> It also mentions that the register map is defined as [6:0]. So, the upper
> region may/maynot be used based on the IP integration.
> 
> Fixes: 1f7055779001 ("arm64: dts: axiado: Add initial support for AX3000 SoC and eval board")
> In Axiado AX3000 SoC two UART instances are defined
> 0x100 apart. That is creating issue in some other instance due to overlap
> with addresses.
> 
> Since, this address space is already being defined in the
> devicetree, use the same when requesting the register space.
> 
> Acked-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Harshit Shah <hshah@axiado.com>
> ---
> - Add fixes tag in commit msg

That fixes tag needs to go where the signed-off-by area is.  See the
many examples on the lists and in the tree itself for specifics.

> - Link to v1: https://lore.kernel.org/r/20250819-xilinx-uartps-reg-size-v1-1-0fb7341023fb@axiado.com

Then why is this one not marked "v2"?

Can you fix this all up and send a v3?

thanks,

greg k-h

