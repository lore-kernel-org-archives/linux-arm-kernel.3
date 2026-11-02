Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE476072EC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gtasahqm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kZS8CW7y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=; b=GtasahqmqLotS5tm/KZ4TzeuLv
	J5D/Um8cwGISnRER1gyYBvnQrGJ9o4p+S/KrPzYlU4Vjj0kGxEhyDjTmYHpK96pJzAU8xh4mOzcCv
	sGyqJFf1d/pYlCEktk0ICWvFWs6YmaQFUa5owaZDAzjfwcEnodAWZSXVODkvEtfroxiZ+aA1nAJPb
	VBHbmS+CGhsE2Lr2xUgfWhk6v4Y4Cl4zD/aEY5lHPSl5SKSCRcZBE+tmJ+RZu4GkBr4k107C3mGUx
	wUO3bwL2yeoP9g6BfjAVwb7fPn0mTiOmJpEFecC08FJiT4a5E5t6/0cnylZRR/oLTSw0YU/NI9v+x
	Oc/SDLBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuus-0000000HIov-2D7a;
	Mon, 02 Nov 2026 16:29:50 +0000
Received: from mail-oa1-x42.google.com ([2001:4860:4864:20::42])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuup-0000000HImy-2hCa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:29:49 +0000
Received: by mail-oa1-x42.google.com with SMTP id 586e51a60fabf-4a755bbe158so2271077fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636986; x=1794241786; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=kZS8CW7yCDuqtlqcXau66B3TjhOBJhUOpMGp7Y4d7sXw0QmzzDsfQAAnmcQHWCy3Fd
         JMBpz5HhgrivpAfOt+wGsJwJIUXcXJtNNQWxZgzar0rCtkvdmZcZa+h4glCLTg2oqEIB
         ffx5/AlXHI1/vg9gvTbZ04XMfvPZUlmSq/KSiPwo42RxLfys3+j0qzqTk2iCXVIiuYMb
         Ynhenr6zXjaX3ka+oysDtlJ6+26aquPbJDyXqIwm/m/H2/A1iYdUao1pdyN8FIxbGyWZ
         ta31wUcZSQHPrds5sMPJX5yQ+6yWT+65HMwCAQ+71bg4ScXPvi5LAzIdUpYqMJWSKyJx
         ljYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636986; x=1794241786;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=jrRT7OWbBNvjh9es3xJOOKsNSgMPeygG6gdtZAoo+UoKG1utYlRnKSXtSwDE8TkhA6
         NSaY7eS5Uu5kpwAJkljkvCe5WV7lJUzrDOYyl0x6F9AzSMqS0kRAyWkcRg4/Vdl1THMc
         iwRWa1tnvsM7R1lR/D/DQ8gjKMtf0RLztIsc19GAgH1QyQ/GUawypaZUCgkHRvChfgxv
         tIbZfP/8bAEEDseXxVVngDChpAH83spZZjfz4uo8VC0+0wuvEV9b14PH06P5hcrdndcD
         nLnVU9WmIncgDkGQeoHJKKnBbtLvMf/IOHCnPdO+nnadT1E2y5tgoNZ+3hIiXyeZeqHF
         saIw==
X-Forwarded-Encrypted: i=1; AKwUvByTNA8MUIYeU7Q9MO+Cnjqo//Pq1nPSptkTTxQz+NdKGSKndeDOP0MnQCBdUxe82xTxyvNY6FG3HRNq6/quuQPo@lists.infradead.org
X-Gm-Message-State: APuU4Z9vOR4ro8k+hfpDyvITivlF287eIL4UxQSnn+NXB4CytLN2lo7m
	E7BN4RF8xmSRlcLvuIzO1MGhb1Gs6eWR3i6zI0Lmt9r2YkFwfd/eby7Z
X-Gm-Gg: AYBFou0OmY4BHkey8OeFfbN1RribE8b7Ec7SEYdeBFVAfcOpkiumLL88M6NyWz+z+EE
	YFV4LSfnh+KW+herkijFuLGuRFVYHstR+dbLnRFEeKLJ29fMDijskquGOKgaBlqRCqc3EIBA6S0
	psULmhC6ZmeemIql4O1nbjZ5XiR5A66woNpMbiMgKDdIL2NL+b57v2wrEAN9SIjPeYmB5/P7zG7
	c9Y3D0zPVirFIrL+u/4hZ9TBw5cRLk/pRyN+y4bt1UYGEbQ1O03F+PYStQpSKsmiKQC83T54ofU
	3L3onTc9jDfDSvjHrSXfDR3+5bnftv7lL20GvBODmO3TxlcPVN5OXZaPupns6Iwgnh6EaOH6PFk
	NEceivBF7/9NYjyqCpmRML8a0sDQ2QrBBEjdPrVZ0Wfdx0zxqrmpcUa04hiWlOTM8sfNnBBGeLv
	2pcp9Zzsg2sHe5UwsMnHtEwNXGuqp6YLvrNYnkm9hzE4VQepClf6Iwc8X++fB9Ofq84W22q79rx
	ahdqMaCHKx6MeKhhwCz4R6BbU7ayxwlDD3Vr19zVxtYDsvY5l8uFMR0kaK7vWFD0vJVvEETkEpG
	aeZX8dZpIGgMAgVVW/IHhC1xz8FRTSzdrmpyDqOBqTQDPTICAwhPyvnB2FCpteY2r86q9sc05jX
	RUFvi6lohvkZurYf3QxY4kVdE5ZZXgZObnysT2Bvg
X-Received: by 2002:a05:6870:169a:b0:470:e97e:8f88 with SMTP id 586e51a60fabf-4a8e099f2c1mr6622916fac.24.1793636986507;
        Mon, 02 Nov 2026 08:29:46 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167984dsm7251024fac.1.2026.11.02.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:29:46 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:29:45 -0600
Subject: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793636985; l=3859;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ctXSxhL8cB96oM2LlBR4kk7hbE12PJXfiPWlYJLZFo0=;
 b=S9dPlOrGvAhCl5WVQYdsJfPpa5BoiRYpZW64kvQU0m9zClp2Ht7qcVyfHxTiljy/6ZkSqDgd9
 C0E4bVjxXGFAHGsSwhRgWmeoEriZ/yCXt7Q3nhq0zbb8GwVF2AQUwWm
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_082947_700928_1BAB8E90 
X-CRM114-Status: GOOD (  18.05  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtu3_irq() is a threaded handler, so it runs in process context, but it
takes mtu->lock with spin_lock_irqsave(). mtu3_req_complete() then drops
the lock with a plain spin_unlock() around
usb_gadget_giveback_request(), which leaves hardware interrupts disabled
across the gadget function's completion callback.

That breaks any callback that reaches netif_rx(). Since the threaded
handler is in neither hardirq nor softirq context, netif_rx() takes its
local_bh_disable()/local_bh_enable() path, and enabling softirqs with
interrupts disabled is not allowed:

  WARNING: kernel/softirq.c:430 at __local_bh_enable_ip+0x17c/0x188
    __local_bh_enable_ip
    netif_rx
    rx_complete [u_ether]
    usb_gadget_giveback_request
    mtu3_req_complete
    mtu3_qmu_isr
    mtu3_irq
    irq_thread_fn

With CONFIG_TRACE_IRQFLAGS, __local_bh_enable_ip() ends with an
unconditional local_irq_enable(), so the plain spin_lock() re-taking
mtu->lock afterwards runs with interrupts on and is recorded
SOFTIRQ-ON-W, while mtu3_gadget_queue() takes the same lock from a
softirq (ncm's tx hrtimer), and lockdep follows up with an inconsistent
lock state report naming mtu->lock.

The locking was right when mtu3_irq() was a hardirq handler. It stopped
being right when the handler became threaded without a primary handler;
dwc3 hit the same thing the same way and fixed it in the controller
driver, in commit 84918a89d6ef ("usb: dwc3: gadget: Let the interrupt
handler disable bottom halves.").

mtu->lock is never taken in hardirq context: the only handler is
threaded and has no primary handler, so disabling softirqs is enough.
Take it with spin_lock_bh() in mtu3_irq(). The completion callback then
runs with interrupts enabled and softirqs disabled, which is the context
netif_rx() expects. The other sites keep spin_lock_irqsave(), which is
strictly stronger and still correct; several of them really can be
reached from softirq context.

Both reports need lockdep to be seen, but the context violation is real:
netif_rx() wants either hardirq/softirq context or interrupts enabled,
and mtu3 gives it neither. The fallout on a PROVE_LOCKING kernel is not
cosmetic either - copying a 21 MB file over USB ethernet hung and reset
this board repeatedly before this change. Once interrupts have been
left enabled while the thread holds mtu->lock, the tx hrtimer softirq on
the same CPU spins on it forever, which is the "CPU0: lock(&mtu->lock);
<Interrupt> lock(&mtu->lock);" scenario lockdep names. The same copy is
reliable after it.

Fixes: 13118959cb1a ("usb: mtu3: register mtu3_irq by threaded irq")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..ed0e426645fd 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -790,10 +790,9 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
 static irqreturn_t mtu3_irq(int irq, void *data)
 {
 	struct mtu3 *mtu = (struct mtu3 *)data;
-	unsigned long flags;
 	u32 level1;
 
-	spin_lock_irqsave(&mtu->lock, flags);
+	spin_lock_bh(&mtu->lock);
 
 	/* U3D_LV1ISR is RU */
 	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
@@ -814,7 +813,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	if (level1 & QMU_INTR)
 		mtu3_qmu_isr(mtu);
 
-	spin_unlock_irqrestore(&mtu->lock, flags);
+	spin_unlock_bh(&mtu->lock);
 
 	return IRQ_HANDLED;
 }

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


