Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933B6606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WO80hcx8;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zm9qlG7A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZOywiX5vpz/9Vgi/VZ95rgQ3MSCKGsbX1Q854mIZ2y0=; b=WO80hcx8tR48ePIAnWX/Q8a5Un
	vU8Asi8EHiqN8ljb13CdB+QEc1lqCEuFI6kknqmaj+Lr2GqawXa4HTx+9hYk76UDkGVQ9ybRKiHjt
	xCJW9fTmsha+TP1UzVOUHbJnE87/DfxwO0L+f65VHyXP68l92y5gBY5oKacn9HjS7BGQb3khZVuKp
	zs//j5yWy0ZOCdMqUKJ55U7r6/Py9Bhs4gdMLJieVvOy8IdmhHPJLtvKSFyDZv0wH5leEB8BcXz03
	1DmuyppXNsz4kKcakqzKD/1FmJbvIZ6B83bisi0dJLH97FIlI318UlfMjO0ReuSOZQwOQRxWoYAWJ
	fWgFa+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNp6o-0000000G8z4-2Nrw;
	Mon, 02 Nov 2026 10:17:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNp6m-0000000G8yx-2rha
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:17:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D51F660F1F;
	Mon,  2 Nov 2026 10:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC34B1F00919;
	Mon,  2 Nov 2026 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614663;
	bh=ZOywiX5vpz/9Vgi/VZ95rgQ3MSCKGsbX1Q854mIZ2y0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Zm9qlG7ApWRNOEArVSRiymIwIZuyctseHPwOsfkpKF+7z61/onmtRhN0xCACQKdap
	 1VKmFJ5xkP905Ul1navWQXMt5ak9NPLoGhwZ4xfZaZmHVaCSymM/rcecTsvctDGdT5
	 s2ugYropnuxjqnWgIjWzbe1iP61d6NMFjVNBQ73JlbMW0P8nIWKURIiKyd8TPA2Rcj
	 Jg+sQpKYk9PDQafQhs6ZwC3JMVcMuawV4SqSwGpVNC1KipFBSn6v50lnGfEtlusyY3
	 fkvnAAJFsCsAwbk/2hh7jyia0eN52OvSQReunIandJ0RPszFOwFd2o9pFVYj+l8/LN
	 iJgXTLcSQG2aQ==
Date: Mon, 2 Nov 2026 11:17:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tim Michals <tcmichals@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: mailbox: Add Allwinner A523 message
 box
Message-ID: <20261102-hot-glistening-cassowary-c1da4e@quoll>
References: <20261101185735.762559-1-tcmichals@gmail.com>
 <20261101185735.762559-2-tcmichals@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101185735.762559-2-tcmichals@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 12:57:29PM -0600, Tim Michals wrote:
> The Allwinner A523, A527 and T527 (sun55i) message box connects the
> Cortex-A55 host with the HiFi4 DSP, the CPUS power management core and
> the XuanTie E906 RISC-V core. Each processor has its own register bank.
> A sender writes a message into the receiving processor's bank, and a
> channel has an 8-entry FIFO in each direction.
> 
> The host bank has 12 channels, four for each remote processor. The
> binding lists all four banks, since the host writes to and reads the
> FIFO status of the remote banks, and lists the bank interrupts in the
> same order: the host bank read interrupt and the write interrupts of
> the three remote banks, which every A523 has. Each bank has its own bus
> clock and reset, and an unclocked bank drops writes, so all four are
> described. The optional allwinner,tx-done-irq property selects TX
> completion by the receiver bank's write interrupt instead of polling.
>

Sashiko comment looks valid, rest seems ok.

Best regards,
Krzysztof


