Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8EAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 06:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RI+Bcbtp+L0lptpp/ZEocQcR61FttKONsA5FcfRE/MI=; b=G8xS8XpWuAJ2AGB3qczHIdozzZ
	vG8BlCOjMOfND8CTRy7Q0txICyM4Rvd9gXQTuIMQo7soYqp7lpGFulKJjeilrNERU/wyZBx95D93j
	7eDuUs53knRNp3T3HyHYmnP+fTXsjFuBqljAx0UCus4WPHE7F0AWGNHB1kEXDI4dOHFXo7SXM90lK
	mYkD4m4T9FJ+Bnsr7trsSR1hyKR06uV17Pu68w43Lx1BAeGjNDWbtM+rugc/vRzkR+PJfQdWYxBOs
	v77lotUfcFhUv9TgKSu/ceHIktzRd48q+KZbcI/ZF1n3fXOnli9PdZ62TLyp0YuYPMAI2RbcWle7S
	uti+KcvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta7qB-000000070ef-1dU0;
	Tue, 21 Jan 2025 06:34:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta7he-00000006zPk-2Zr9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:25:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21680814d42so85029565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 22:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737440733; x=1738045533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI+Bcbtp+L0lptpp/ZEocQcR61FttKONsA5FcfRE/MI=;
        b=ITtA87P8TCuAjzzND2qsmi4yidcawKcCGh8P9VqJx+BgfMqFFw9HePj36AubDbYSeS
         zG3io3HM9WwfGcFLFnH3klybO8mIXcpwQRWayen7+9IFWhsFz80r3qdI/FWls6tZs13s
         VZVrixmyckku0BpFUD8LJ2q2q9rNTcO0yNbxvVqfWv4jfh+zEuq74qaTzcvgSos6H8+4
         eYHAxtl06bxfHyQP/IeEEGx2np862kP2q72ZvSEpj345A1u+PyQjETeXizU0dfInG1fh
         FT/C4xtmYAsdt1THqTtai7VeW1NGxa4+ZbfE6bVfQvcLCWWD+NGJgwoOAvkiq+wMN3vd
         c1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737440733; x=1738045533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RI+Bcbtp+L0lptpp/ZEocQcR61FttKONsA5FcfRE/MI=;
        b=YlcGzlN+Ua4PrkFnkZc0QaLyYf5wwECTWBB9vK4/nwINvKEp79ebMebkE8Hu+VYvVw
         MVpRrYp2puonKfPBWwunNCUUlOsW38s3Lb33A8BqO37IP+mvHp3KGOou3pYj+ks8ce5Z
         goSPrsY2YOIh/mjq56DK9D7TQJQsHkVCCyeCpEDhRiaP43EBj5yQGUIG/UmNE9D0i3CZ
         UgspW75Ks/BuqAPMNudkgOtAam0EiP3oi53YqUtjfekISH4OwlFU4V5PtC7EbL50/rzi
         Qe5rzYlWy6Z7dLIbocySAiW0z78ggywciNAMpGHRwHE8wiezIQQdIUWWXAafC7kHIdy5
         dFcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU+ylUPLSaz1df+e1kpIVL1jO34Tnk7MpfuFDzy2UUIpED2DJqJMKvj4hT2y763YFt3hzQIsWnHf0w4WO+b1TU@lists.infradead.org
X-Gm-Message-State: AOJu0YzxuC0uRnlhktxi/TSjOy7oEHmn4Q3eERHTF/JVIvXa7xwcWIaU
	p3q6Gui7GpwA/vmYLoUbkVsliTdtGDCQSZgjfTntl8zG34QrHhzsy4ADUQ==
X-Gm-Gg: ASbGncuJLiiO4Oun07FEBigMNfDrX37lXnX7421ohG3cRvyX78pPw7YcK3Ri3gUvmrm
	oGhrEWKbm8lMtm9KZ7z/ADeEE5uxq5/9NYNIX5aasHPSwAMVvMsCPlqCTUi5QsU2VnuTBVUNArr
	Vb/LakwkKAB5Kg9GTbVAavsh2FAxxWtjw7ufofl3QtrqjTbizmDdeiDFviBCFchM3mXqS8Zy02H
	XcMjeCvch42iC1AAEv07eh4YU1e2dnj81j+laaVhYz44etf86RpxQRhqj8tRPbsU2o=
X-Google-Smtp-Source: AGHT+IGEqFFcFptOhYieThLnVRw8v/b9RJDK9OgDpEyPyoFWeg55gV+CqOjA626TahjU8BmR0AsirQ==
X-Received: by 2002:a05:6a00:4c94:b0:724:e75b:22d1 with SMTP id d2e1a72fcca58-72dafa800c4mr23351770b3a.16.1737440732288;
        Mon, 20 Jan 2025 22:25:32 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabacdbd5sm8280003b3a.180.2025.01.20.22.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 22:25:32 -0800 (PST)
Date: Tue, 21 Jan 2025 14:25:20 +0800
From: Furong Xu <0x1207@gmail.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Vince Bridgers <vbridger@opensource.altera.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] net: stmmac: Limit the number of MTL queues
 to hardware capability
Message-ID: <20250121142520.0000702e@gmail.com>
In-Reply-To: <20250121044138.2883912-2-hayashi.kunihiko@socionext.com>
References: <20250121044138.2883912-1-hayashi.kunihiko@socionext.com>
	<20250121044138.2883912-2-hayashi.kunihiko@socionext.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_222534_661722_0038C266 
X-CRM114-Status: GOOD (  20.15  )
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

On Tue, 21 Jan 2025 13:41:36 +0900, Kunihiko Hayashi <hayashi.kunihiko@socionext.com> wrote:

> The number of MTL queues to use is specified by the parameter
> "snps,{tx,rx}-queues-to-use" from stmmac_platform layer.
> 
> However, the maximum numbers of queues are constrained by upper limits
> determined by the capability of each hardware feature. It's appropriate
> to limit the values not to exceed the upper limit values and display
> a warning message.
> 
> Fixes: d976a525c371 ("net: stmmac: multiple queues dt configuration")
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7bf275f127c9..251a8c15637f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7232,6 +7232,19 @@ static int stmmac_hw_init(struct stmmac_priv *priv)
>  	if (priv->dma_cap.tsoen)
>  		dev_info(priv->device, "TSO supported\n");
>  
> +	if (priv->plat->rx_queues_to_use > priv->dma_cap.number_rx_queues) {
> +		dev_warn(priv->device,
> +			 "Number of Rx queues exceeds dma capability (%d)\n",
> +			 priv->plat->rx_queues_to_use);
> +		priv->plat->rx_queues_to_use = priv->dma_cap.number_rx_queues;
> +	}
> +	if (priv->plat->tx_queues_to_use > priv->dma_cap.number_tx_queues) {
> +		dev_warn(priv->device,
> +			 "Number of Tx queues exceeds dma capability (%d)\n",
> +			 priv->plat->tx_queues_to_use);

I would prefer print these warnings like this:

dev_warn(priv->device, "Number of Tx queues (%u) exceeds dma capability (%u)\n",
priv->plat->tx_queues_to_use, priv->dma_cap.number_tx_queues);

And number_tx_queues, number_rx_queues are u32, so %u would be better.

This print format change is quite minor. Probably not worth a re-roll since one
can always view DMA capabilities by reading a debugfs entry.

