Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE41606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W8wfwBMA;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j9iyRC+o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vqy5QIw1/kas6DX7rXU+qCiDfbpbyVW/9On/rw4UvY0=; b=W8wfwBMAdCOKDjndhGUP4fj1ZP
	SVY+PYh5XmPW+1/KN2F+OM0HYlcPSBToQNr+H4qmfIxPa/7MTCWeHMJiSBF1EI9kEC08WkuA8FfiJ
	PqbgPPB4JWIF9a2JN8cnvCz5U34S5BBzCl21aNzKrqeaGefWu2S17gr09zprQg3hEwaS85GIukcRi
	Hf2TWdM2sPyZnvyVhOdKlvh4luQOn41uuw0s4Dm6X9BbYzsemYsdS6rqem0WTNzq5Xrm4BwRmOyiB
	hdPKdhPpFQv9CuFHHPHcxPZJE4Xwp4XWAh1l1TT7JMlv5os2pkTDcpoMkCNe/x1jSMwy525GBgO/l
	FLc9qtSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9ke-0000000Fko6-24pn;
	Fri, 23 Oct 2026 07:31:44 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9kb-0000000Fkng-2iL0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:31:42 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e98798cbddso2136155ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740701; x=1793345501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqy5QIw1/kas6DX7rXU+qCiDfbpbyVW/9On/rw4UvY0=;
        b=j9iyRC+oO+76ndGR8TLfti6qZwU+Mba0ynjzrAY4qdDrDFdfb9WSsPFFzDe7S1nUP5
         NQz5zlA5HraM9GnP2WMx9rLm8b3HT/XWDGEq618T8uANgugay8iHw/k8a9e2EaiLdzZa
         J1hNDpq14Fos6p4lFW5xLMvIcvchP9x2Q+j1iYG78XxB6mDhWd0Gjrw1ZJuEVsyU5Dh5
         TK6J0bMG7dzufCrWde0YOh+V+babWh5umfBgsYjDnSnpInHbj+qwZSWay7kO5l3GosBv
         KhX7/Qgj9Zs9aIf9Y94lyld/X69COh/MNmNd+63/LVnWfidbmNE7pDP+SZahC1/fEm7T
         lrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740701; x=1793345501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqy5QIw1/kas6DX7rXU+qCiDfbpbyVW/9On/rw4UvY0=;
        b=QPj+GYhgQMEhp36WjJhMPBFrB+Q4mLFkJFuhwXk0y+nybjE8RjVpLoZcfDe0T+o2EV
         94rCxJq6iwzwDrJiepXd7KGRIgN9Tt/EWVoQA8EaAqc0vSVpG4ahwJl1BV2xBk5qeOx8
         1bYDrLSELH5Vv6tZO6JLY8apMdPSrmysrWL7ZEUk8bYgk6fSrREQAuPpUe76MUbSbr5k
         RiYOZ2mW4x9uBnS60C2hXGH8vahEriB4yqWGnWLgEZOOnYviPYR+OLOsXdP8jwkWo/ko
         SW7CS+7Rr7eFCbqSIdO40rTVr99xqcTV4sRnXDNFPJ3SUCYdU/D5rOH7wTaFL9Mz97Hz
         AgJg==
X-Forwarded-Encrypted: i=1; AKwUvBxsKim2db4maJMdJNOWin2+/jlVJ54b2876XNPl0niX98k+vKMq2m86q/gj5ZxeX0oD0SZidZNdegHhHhKuLytQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJ83TE3BeurgEaAT+bSNo/HSXT2rJ9dQ1Vc9I06WJuHKQhFlC5V
	2isIMqB1sZ95ZjIUZ5UzuV5BlLBkTm4h9vFCi/GvODsXSt/W966CGhABoKVN2bYM
X-Gm-Gg: AYBFou2OCOP+eIl6orRJa0crnrruONblcTa21AmssK/bBgpWfpVfC5R7JUwzOO3mCLe
	hktZRJ8zJid4pPZnmmwrTrc16dbEtHay+ozm2EPdykNbfm4RO4zk09reQsMIv0ITD+E87Q00kqi
	BAzv+BcGndqXLaPR0Pw84Y6rKZhwJNNTPJN0NBVPuuHk4fGWDl38u7tt7+hPC1jIKPpqgaCYtJw
	XM06v9v9xgpVnxSuYMNMtJnUBwt5EpS6AkGodKYCgs9faSF8mWSA/9UYMRLXig/qejJhVGlYuuR
	4hsrrryg+fQ0t7VDWtQqwdbtkNX+lIfp2BWDAfxS3tMyTPHljRQ0hqeS8N43MUa2sgW1tjjPEmY
	+ohh65ZmnJZ9eIOJl++kAb4In0KQADUNnFElgFt3x9IhQfOEIi2M1bTlFQIf8jIPARtTyg0yxhF
	gFrizZboKdFWGgSYuTpBHaw1GkXCfCL625yJkUNytQ53KfEqyBL14y/P9Q5OfJVFznNXRRGkG79
	35skz+l4qtImpFPVrvjGaJgbra4Pppr3mVG5/VZtJM+NjLNQ7dJ3sJwMIt/Z666/RPp6ZSApx6O
X-Received: by 2002:a17:903:190d:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2ea7c33245emr14654155ad.40.1792740700661;
        Fri, 23 Oct 2026 00:31:40 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6eed2sm6766545ad.7.2026.10.23.00.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:31:40 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] usb: gadget: udc-xilinx: Fix wild pointer dereference on empty EP0 queue
Date: Fri, 23 Oct 2026 15:31:31 +0800
Message-Id: <20261023073131.637062-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_003141_694260_6A9796F6 
X-CRM114-Status: GOOD (  14.17  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL when the list is empty; it
returns the result of container_of() on the list head, i.e. a non-NULL
wild pointer pointing into the enclosing struct xusb_ep rather than to
a valid request. This was found by code audit.

xudc_ep0_out() and xudc_ep0_in() are reached from the endpoint 0
interrupt handler xudc_ctrl_ep_handler() purely based on the hardware
FIFO status bits, without checking whether ep0->queue actually holds a
request. The queue can be empty at that point: the gadget driver's
setup() callback may not queue a request for every control transfer
stage, and xudc_done() removes the request once it completes, after
which bus timing can raise another FIFO ready/free interrupt. The
unconditional list_first_entry() then yields a wild pointer, and the
subsequent accesses to req->usb_req.actual, req->usb_req.buf and
req->usb_req.length read or write unrelated kernel memory, leading to
memory corruption or a crash. On real hardware this is triggerable by
an external USB host controlling the token timing. Note that the
enqueue side __xudc_ep0_queue() already guards the same queue with
list_empty(), which shows the queue can legitimately be empty; the
dequeue side was simply missing the symmetric check.

Switch both functions to list_first_entry_or_null() and return early
when no request is queued, mirroring the existing list_empty() guard
on the enqueue side.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index bef06fe75..032d9f04f 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -1822,7 +1822,9 @@ static void xudc_ep0_out(struct xusb_udc *udc)
 	unsigned int bytes_to_rx;
 	void *buffer;
 
-	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
+	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
+	if (!req)
+		return;
 
 	switch (udc->setupseqrx) {
 	case STATUS_PHASE:
@@ -1875,7 +1877,10 @@ static void xudc_ep0_in(struct xusb_udc *udc)
 	u8 *ep0rambase;
 	u8 test_mode = le16_to_cpu(udc->setup.wIndex) >> 8;
 
-	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
+	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
+	if (!req)
+		return;
+
 	bytes_to_tx = req->usb_req.length - req->usb_req.actual;
 
 	switch (udc->setupseqtx) {
-- 
2.30.2


