Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5664AD58CD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 05:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6K2uMlwdA0abghu8MqcrivTleBIcvizA9okA+4Axro=; b=NNb6hcX3nEpGS5ViIbjmc4TspU
	DqglDoYq32Yke8YGi4FOelBnEIYqRDBbL6EJ0IfTrSLltGN2dQrKVHL+9nYR7XFkNjC4JkeW0NfGY
	72aK/ei1h9V28eWSCg40qh3065ekBWeXKRwuGP1rDoqBlSDk1ZYO8E0di7YoXji1wz8M48ST9PDDh
	0rqbVR/k1Z4TPu4tmaLWzLwOmA1sjqFnIiKBO6K8n1OYg0H4X1+UGDkmTwN4+qDR506/Jze1scGZs
	m5AcHYU0E+JSja65+5e2v238rAr47OkCfbcpMHp01ppHg31McP3O3FMgPRyCVMrJqao/3/k3pzNhm
	4rT8SsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Xc6-0000000G3A3-0uRk;
	Mon, 23 Mar 2026 05:14:06 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4Xc2-0000000G38z-3gU8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 05:14:04 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b0554888cfso54870125ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 22:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774242841; x=1774847641; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6K2uMlwdA0abghu8MqcrivTleBIcvizA9okA+4Axro=;
        b=VKGp35O8q/0ZJCxmV8WuqlHocMY55LdYS8nDQpaufv001nG2rOCK/nMUSGrBdPZ25P
         yP6UWoA2PKVo+VT+CVOhlqmZpoGYXuk15aIGKH5PGoc0vI+DqYsqxzL8ZPeuF9AnGgmv
         8hpONYt0fBJcGmH8yHyMvVVQfyQ43ZLPf1+BCNq34yYpF8mVxZF3Gz4aG1s3u/4CiRnE
         xUReXpsnODw0Ds5GyC/pLcPZPHcosjNyS2U4xAcUlgEd8jgixqirAsu2jMQUIRA1ryxv
         cGUYLe8XIYz3Osknzr7yRjZ9WC2DD1XETe7FQNp0pqPbw3KBrcAzehrK04soOH8C1UhN
         ViDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774242841; x=1774847641;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6K2uMlwdA0abghu8MqcrivTleBIcvizA9okA+4Axro=;
        b=fUx7CF/nRoXgClKqa46txdrC2PW13EHygH38IN3agBLjWVqM6I4uSI36VMYslkoxMP
         MTnIcFAr83RvkabtUbbKrnnpL3ZYH39VIgwPn5U7Q8jAvrnrEwyUouQYqSZU38Yn5vEK
         hwhV6lsvzlFdMmR49eeovlHdvem4aHZcav4aCAXPG/iGtvJZd0eyZtG1unCPLjdJLjvr
         W8muRhu5eIeOhFZlDYO7gogUCKhpNWkCIWxgNY0V79oy13fCyRdfhHm7ArdIzrl6RJs9
         ezZsqbnZYtTttt4lSPUBIqasx86x4qQCqvLp0WhW4jehsKpDdalWB8UsRI1AtQpvxHS9
         GiHg==
X-Forwarded-Encrypted: i=1; AJvYcCVgaF/odvnvy8EkNqbMe5gOC9sxZ7WDsOI87QXZLAFiteeSha8SinZADXHiQLSJu/Z5Iey+Dgks8WJPYKr+od/S@lists.infradead.org
X-Gm-Message-State: AOJu0YxRLt6oYrNaxC4ZAABS/l3n9qR1sq1fOQ9ftO09wZZe+j2OV9iG
	/5frARXtYMX6GnGJXKUODtPTBIEtbcisa2I47oe665gmoWfObP0PmK8R6A1mb4J6gurYx30K0IU
	5tBqtbnhaGj/qgFTj95LCfq4Uiw==
X-Received: from plha16.prod.google.com ([2002:a17:902:ecd0:b0:2b0:5538:b55d])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e5ce:b0:2b0:59c4:e9dc with SMTP id d9443c01a7336-2b08271d4ecmr101423305ad.22.1774242840657;
 Sun, 22 Mar 2026 22:14:00 -0700 (PDT)
Date: Mon, 23 Mar 2026 05:13:59 +0000
In-Reply-To: <20260322171752.608486-1-jassisinghbrar@gmail.com>
Mime-Version: 1.0
References: <20260322171752.608486-1-jassisinghbrar@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260323051359.3167665-1-joonwonkang@google.com>
Subject: Re: [PATCH] mailbox: Fix NULL message support in mbox_send_message()
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: andersson@kernel.org, dianders@chromium.org, joonwonkang@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	maz@kernel.org, shawn.guo@linaro.org, stable@vger.kernel.org, tglx@kernel.org, 
	akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_221402_937697_6205E305 
X-CRM114-Status: GOOD (  25.03  )
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

> The active_req field serves double duty as both the "is a TX in
> flight" flag (NULL means idle) and the storage for the in-flight
> message pointer. When a client sends NULL via mbox_send_message(),
> active_req is set to NULL, which the framework misinterprets as
> "no active request". This breaks the TX state machine by:
> 
>  - tx_tick() short-circuits on (!mssg), skipping the tx_done
>    callback and the tx_complete completion
>  - txdone_hrtimer() skips the channel entirely since active_req
>    is NULL, so poll-based TX-done detection never fires.
> 
> Fix this by introducing a MBOX_NO_MSG sentinel value that means
> "no active request," freeing NULL to be valid message data. The
> sentinel is defined in the subsystem-internal mailbox.h so that
> controller drivers within drivers/mailbox/ can reference it, but
> it is not exposed to clients outside the subsystem.

It sounds that it allows future controller drivers also to refer to the
new sentinel pointer value.

> 
> Fifteen in-tree callers send NULL (doorbell-style IPCs on Qualcomm,
> Tegra, TI, Xilinx, i.MX, SCMI, and PCC platforms). All were
> audited for regression:
> 
>  - Most already work around the bug via knows_txdone=true with a
>    manual mbox_client_txdone() call, making the framework's
>    tracking irrelevant. These are unaffected.
> 
>  - Poll-based callers (Xilinx zynqmp/r5) are strictly better off:
>    the poll timer now correctly detects NULL-active channels
>    instead of silently skipping them.
> 
>  - irq-qcom-mpm.c was a pre-existing bug -- the only Qualcomm
>    caller that omitted the knows_txdone + mbox_client_txdone()
>    pattern. Fixed in a companion commit ("irqchip/qcom-mpm: Fix
>    missing mailbox TX done acknowledgment").
> 
>  - No caller sets both a tx_done callback and sends NULL, nor
>    combines tx_block=true with NULL sends, so the newly reachable
>    callback/completion paths are never exercised.
> 
> Also update tegra-hsp's flush callback, which directly inspects
> active_req to wait for the channel to drain: the old "!= NULL"
> check becomes "!= MBOX_NO_MSG", otherwise flush spins until
> timeout since the sentinel is non-NULL.
> 
> The only tradeoff is that 'MBOX_NO_MSG' can not be used as a message
> by clients.

The other, but I guess more important, tradeoff is that future controller
driver developers should now know that the pointer value of `->active->req`
could be -1(== MBOX_NO_MSG) other than conventional pointer value(memory
address, NULL, or error-encoded pointer value). Although I am still not
sure if this is better than changing the type from pointer to integer
index to make the intention clearer, could you add API doc for
`->active_req` that it may become MBOX_NO_MSG when no active request
exists? Otherwise, it is likely that the future driver developers just use
NULL to check the channel emptiness and also are not aware that this
pointer could be assigned the unconventional value -1. Just like this
mis-use case of `->active_req` was not caught in tegra-hsp.c in the first
attempt of this patch, it could be hard the same way for controller driver
developers to avoid/prevent the mis-use without proper API doc.

Thanks.

