Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB9B606A336
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r+Xxmb7F;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gmz3iq3U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=U4tKXObhoI+fdUM+1l8D4TYSSuaXMy7Ud+cPi9l7w0w=; b=r+Xxmb7F2E5kA4UFNvv0Ad6RJX
	ZtwgZ78qOiBcQ4Zevn3uSWIymWMR/S9HFS4HIfl3pszM3TO//cTNk0rmZG08Fn16KEIZw+7I8yEZU
	s6PV65OKSqk2QzU9f5NOJ3j+7t0pX8mJqELgx4yj7Xuno5t/afyTu2ilPqL4gJjXwSV2m1lsYmDZX
	85WqrARWz8CFw4hXLDmoIgjv/VSHmEK0sXTs8ZQFcvRplEqg2+bUix2p3PfJyxbndEwG7YvQakTtZ
	MhRDorZilK+av2xnM6sxA9mYH8PSjbCSAa0SpYsoOt16e0M1grgugdHktM1aPso1XWplcrrh/o0AI
	EcYhd7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAB6-00000001cqh-1FxP;
	Tue, 03 Nov 2026 08:47:36 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAB2-00000001cqD-4140
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:47:34 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1861486a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 00:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695652; x=1794300452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4tKXObhoI+fdUM+1l8D4TYSSuaXMy7Ud+cPi9l7w0w=;
        b=Gmz3iq3UGlcZ9ZP3ckZKyjowXJihR7LZOzz5xj5DIDgYWiJeITCrwKT1oSHfZbTnAK
         M7kVhFxB8nq12sKTaKZ4gnms2NEFS2SedvcbgN+MxT4NXtZUeSaUZZJbFx31VsTR9+q4
         hW1R647qmt/H7XANs0f8PQVLY6mRNui7NXT8x7B2vVxMozNXn/uBCBM+Rvy2gyKboRd4
         vpyMwkgp71Q4YxLo3xjystbufk58u8KNoEdcDZQXQ+1Kq99ORez93cbDJq61ZLYQNkrI
         kadhji6Mk9I9cmZSfolUCkKnWd0NIH924nXu2/BM7mHkbOtKCpkmznuoXF0hsmsBak2L
         /TwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695652; x=1794300452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4tKXObhoI+fdUM+1l8D4TYSSuaXMy7Ud+cPi9l7w0w=;
        b=JYhzeo/mEYCjxazVkTDPrWFCNT+0pB5xruK9j1euK0zahePlEmlDzHtg02k2/LGc9t
         PnspPoHfG39pCNuQ4NScEHrhQfJY1Sqf7bf5fNo+2hkxQU1YkWCrJzq2OmWn/yLddP0k
         RxFSNGMApMQ1V5PTlXfTDhp5xgybIgkUcq9ce9gaQ7m6Flh1yVuGe/0BrmzqQPj4TSWx
         3DYqmC0gd56ilI2dWXP1gvrJUe5GXmgiO8gRJZ/DymFqLfW8iSln/1GCgSLca55rdQKA
         xwxpPp18Soo4pZ/la6jegOSkFqxhvkx6ukEpZik+aQ/8GGLtbSIXER6UFKRDKMv4WzZN
         v7AA==
X-Forwarded-Encrypted: i=1; AKwUvBw0+Yt2JV0MBWTpKT9CKX1bla49Efvm7rLiWa+sz909WIHf8UrPoxhNerIQruATR0ZjPTno46yHMfjXlla0gvST@lists.infradead.org
X-Gm-Message-State: APuU4Z9qxCeHIa++tZPqvCk0np9yueoryaFFMAT/Lsc5c+JKp+lDMDGp
	INb31kwFD/MHHwuQs9no34eSr8UXJjBwV57coeRXhxrDMLO7uipk05tZ
X-Gm-Gg: AYBFou2LGlNrAjdDSPATZyDASOjnym/JBFU48802+87rcY8u+0XljoWnkFDY1L8dBut
	KSGfMO002qxChl4tXmFHqyjeHhEwAGT33pNkQdS+B+IvL77odKda7ChlU+01P5MMS1z34mXcHUz
	7gYB44FFEtbqV5LzATt0J/nEYKjKBhoU2yY1/oMFenXRLAhcxghRKVyjEmNOuxmdw3q7EO0c0uB
	JqPmuvntgSrOAXtq3/1cpA5StRBndZcrPtVBKKVrnBaUg6ttKTTNasixWrzHe1mx20xdVTbBWUi
	iX2FSeJ0ltLgzbH+jpL2mKZQ86Dlc4IVwHdcZkIUoIYqQ/TQYN91d15yluB+ld75e53++qPay4p
	UM9sT6iQ4ir4hYiAcWKM1SjulQIH6dzeXtStcWKFR9h1S5Ds2Vd74/5R7+nM+2uAwzYD8MfICP5
	7xQAQRoWepARKpqL2Huh7Icl+mle68onR/CXqbJebC0MzyPacvMUUwKMe9gZaCP5+2nkSY1loY1
	IS20xO3TCGYje+lHo7MDh6qpvAvyCaJ5gOJMFtHRfAa7nsXWERw0e9bzFECakytOmxv/xsHyJUP
	+TQRgDJbi1OoU1qO2JDI6W4EadDoAPKh9gtkbNd8RvOdx/kO
X-Received: by 2002:a17:90b:2fd0:b0:3ac:af8b:6f3 with SMTP id 98e67ed59e1d1-3ae898149e2mr9319285a91.52.1793695651757;
        Tue, 03 Nov 2026 00:47:31 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3294725a91.10.2026.11.03.00.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:47:31 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>
Cc: "S M, Suhan" <Suhan.SM@amd.com>,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] usb: gadget: udc-xilinx: guard EP0 dequeue against empty queue
Date: Tue,  3 Nov 2026 16:47:22 +0800
Message-Id: <20261103084722.1821982-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_004733_017515_4617A2F8 
X-CRM114-Status: GOOD (  13.25  )
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

The EP0 dequeue side, xudc_ep0_out() and xudc_ep0_in(), calls
list_first_entry() on ep0->queue without checking whether a request is
queued, while the enqueue side __xudc_ep0_queue() already guards the
same queue with list_empty() and the non-control endpoint handler
performs the same check before its own list_first_entry().

list_first_entry() never returns NULL on an empty list; it returns the
container_of() of the list head, i.e. a non-NULL wild pointer into the
enclosing struct xusb_ep. Switch both functions to
list_first_entry_or_null() and return early when no request is queued,
making the dequeue side consistent with the rest of the driver.

This is a defensive consistency fix found by static analysis.

Fixes: 1f7c51660034 ("usb: gadget: Add xilinx usb2 device support")
Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023073131.637062-1-lixicaicai@gmail.com
v2: refactor the commit description as a defensive consistency fix per
Suhan's review (the originally described bus-timing trigger is not
reachable without software first arming a buffer), and add the Fixes
tag. Carry Aldo's Reviewed-by. No code change.

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

