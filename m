Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0DD606A334
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GFFAYjqt;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=O73OPijI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=orrpCKDFSt9gDgtM7J88eOaGMeMvBiiqJpohCbwRqEw=; b=GFFAYjqthDUipEExGGUq0GJ6lr
	FicUJFOUCSKkrsmVfcFllgMy4iEpSsPzTfB8ofxcBCV0GM46w7LIBtlVyhi9qqG+F61rZrTT3tTHE
	xQC+WW9lrPhgBN95BW9dzVXrgkkG+HuwJe14Cq1KhMXCYmyHdLhB+RdKgU/qfcUBgdFY5QmXeRuWa
	G0ES68SJq+HiBULByB9bQZ/1yTzyls+fcoE+KxRwiMrTHEUyC0HlwxfOgbhGQFuzC3tSslaJ4Ggs+
	kVoMxiPDq9F6fTVZSH+jkzfdzpM6vfOqxpnBkmzjolrYKRh6euWdyPwEyOYQj25o52Us2vk/nnutf
	CNsngLGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODac-00000002NGV-2NPe;
	Tue, 03 Nov 2026 12:26:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODaX-00000002NEl-0TuH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793708765; x=1825244765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w0Lxn/wh2HtjjqJ/6yq2K0YWFQ62cFd+21xnLqoOMw0=;
  b=O73OPijI3udVg0frefL0urhuN7E+4xWO3+7RRz+EAcxz5ZjlmGtqOQJI
   412z++CCDi0Hq/m2O57X3qpL48vYQTJrz5Ye/OkN+m4/vdQYUPa6UME/9
   kFxLXj5jVnALlVYr9bWU0QkCj60IPCCTXcFQvyfyfqehC/5G1s2JXf/y/
   /G7D1cedHtznMyysHTTRgtw97CnGCDgu6RTxsq6Jwox0ySHDWkJ4rZpKR
   SOHr+90DEbCK93o3QjiGtXJXqkwlno9/v9tMThuOW3padRzyREFWGt+56
   vw/ck1/uFdLkgkC189BrwknVDc4wL7zcyjJkY5kD4xdlh3EWJSTNGjxgQ
   Q==;
X-CSE-ConnectionGUID: pEFwRhSlTGmrax0Bq44i/g==
X-CSE-MsgGUID: Fls9AbYkSxaHozdYSpUTww==
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="66194078"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Nov 2026 05:26:04 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 3 Nov 2026 05:26:03 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 3 Nov 2026 05:26:01 -0700
Date: Tue, 3 Nov 2026 13:26:00 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Wentao Liang <vulab@iscas.ac.cn>
CC: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Steen
 Hegelund" <Steen.Hegelund@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH] net: lan969x: fix page pool leak when RX DMA allocation
 fails
Message-ID: <20261103122600.5tk7iirkrrvesfgz@DEN-DL-M70577.microsemi.net>
References: <20261103102854.1340615-1-vulab@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261103102854.1340615-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_042605_408926_7F7263FC 
X-CRM114-Status: GOOD (  21.32  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Wentao,

> lan969x_fdma_rx_alloc() creates the RX page pool and then allocates the
> FDMA coherent memory. If fdma_alloc_coherent() fails, the function
> returns without destroying the page pool.
> 
> The failure propagates out of lan969x_fdma_init(), and
> sparx5_frame_io_init() then marks the FDMA IRQ as unavailable, so
> lan969x_fdma_deinit() is never called on teardown and the page pool is
> never released. Destroy it before returning the error.
> 
> Fixes: d84ad2c0d80c ("net: lan969x: add FDMA implementation")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> index 053d125eda65..bc293ba1707d 100644
> --- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> +++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
> @@ -169,8 +169,10 @@ static int lan969x_fdma_rx_alloc(struct sparx5 *sparx5)
>                 return PTR_ERR(rx->page_pool);
> 
>         err = fdma_alloc_coherent(sparx5->dev, fdma);
> -       if (err)
> +       if (err) {
> +               page_pool_destroy(rx->page_pool);
>                 return err;
> +       }
> 
>         fdma_dcbs_init(fdma,
>                        FDMA_DCB_INFO_DATAL(fdma->db_size),
> --
> 2.34.1
>

Thanks. The leak is real, but this init path has another problem
of the same kind:

  - If lan969x_fdma_tx_alloc() fails, lan969x_fdma_init() only frees
    the RX coherent memory. The page pool and the RX pages that
    fdma_dcbs_init() already took from it are leaked, for the same
    reason you describe.

All of this has been there since the FDMA implementation was added, and only
triggers on allocation failures at probe. I have a net-next series for
MTU-dependent RX buffer sizes coming up (very soon, within days) that reworks
this exact code and its error unwind, so I'll fix this (and other related
issues) there.

I'd suggest dropping this one.

pw-bot: rejected

/Daniel


