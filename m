Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F32606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K8JWpWZo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AbWHoPwXUxv+0zxO3fNFnFkhWpGWb3Lui80zNc6p+r8=; b=K8JWpWZoBaNmCL
	4Vs8IHnZiIqcsQ1whBTY291bDle9x8e5TioQZael63JxbW2OaDIHyKV8EQC+sFDwDA4vnJfeSi1s6
	ZfXNhc9DMDo2cgNCrsyExwdmzlm1AFC2GInOMyJMyT03urDbqKJM1kC8HDnJnZG8PnRebw5VL1aK3
	NsyLIqGXYaN+BnVEE/FgJ/pNzqL1N9DA9E0YAdk8JpMpxTcloyrBbMHTAiiQrI10zNZ6HMMsSPRxz
	ba0ahV8vQN9csbEACDLef36VAtlGbpNI24jPTIW2jV/LE47e2EINAV7LSlikod8vvdPOeMtpaZe78
	J2kC3tjXi8DpRfue5YRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqJX-0000000CEEy-0mTF;
	Fri, 30 Oct 2026 17:22:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqJV-0000000CEEn-3Ldd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:22:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB09F40E81;
	Fri, 30 Oct 2026 17:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53A21F000C1;
	Fri, 30 Oct 2026 17:22:40 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] PCI: iproc-msi: Bound events handled per IRQ
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <309f6f13-b010-4818-936d-4b7b4b389239@kernel.org>
References: <20261016182124.GA1884550@bhelgaas>
 <309f6f13-b010-4818-936d-4b7b4b389239@kernel.org>
Date: Fri, 30 Oct 2026 22:52:19 +0530
Message-Id: <179338093960.40615.2809022600772649565.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2945;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=NhrgfYtWWMAeXIzEEs5sdas0i8AXhL3y5gJHreUA8i4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5NJaL0b7jZnx9aXTpdju9tpBVR/Vq5ouNes+V
 7Qh7Mmpd3GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauTSWgAKCRBVnxHm/pHO
 9UFRB/9buwBUUSMn0bkqgILUriwc0wnyczcrScnvOGS4kpDnEMN46fnOiIiBJiUTnTzZ7xM8xRO
 6BtufB6deKYUwrB7az34W5VDiN1qm+JOml/Lt4Rc1XX++szyeH/oUfH+XBMOMPANTQKahLi/IcN
 UoGbIteeaGTW0sWJ7959ZsFyycQ20LWs298/S7kj5N53Y6XHvgD9LaET5t3lJhLgv66IlS//eRx
 B1ayn0MsNWk7B0bDvGwZEKo4GlpNf3BbJS+SJOg1Cb6QotVMN3Ycxlr1aPXgtac0AV7m38fumKx
 Tt8AaEU6kglmDgorvqrPL5xn28SyjKYD4ANBGaSdCefaJRbK
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-16 23:10 +0300, Eugen Hristev wrote:
> On 10/16/26 21:21, Bjorn Helgaas wrote:
> > On Fri, Oct 16, 2026 at 03:18:53PM +0300, Eugen Hristev wrote:
> >> Limit each iProc MSI parent IRQ to 16 event-queue entries.
> >>
> >> A continuously fed queue could otherwise keep the chained handler running
> >> and starve other work. The budget still drains pending events and lets the
> >> next parent interrupt continue processing, improving fairness and bounding
> >> interrupt-handler latency.
> >>
> >> Without this starvation avoidance, one CPU can stall indefinitely
> >> in the loop and not serve other interrupts, timers, etc.
> >>
> >> While testing it with an Ethernet NIC,  when too many MSI interrupts
> >> come in, CPU might get starved:
> >>
> >> Connecting to host 192.168.30.1, port 5201
> >> [  5] local 192.168.30.2 port 52586 connected to 192.168.30.1 port 5201
> >> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> >> [  5]   0.00-1.00   sec   240 MBytes  2.01 Gbits/sec    2    334 KBytes
> >> [  5]   1.00-2.00   sec  63.2 MBytes   531 Mbits/sec    1   1.41 KBytes
> >> [  5]   2.00-3.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> >> [  5]   3.00-4.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> >> [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> >> [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> >> [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> >> [  5]   7.00-8.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> >> [  5]   8.00-9.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
> >> [  177.568497] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> >> [  177.568913] rcu:     0-...!: (1 GPs behind) idle=28ac/1/0x4000000000000002 softirq=28922/28930 fqs=1
> >> [  177.569457] rcu:     (detected by 1, t=5256 jiffies, g=21629, q=819 ncpus=4)
> >> [  177.569870] Sending NMI from CPU 1 to CPUs 0:
> >>
> >> With this bounded approach, IRQ handler will complete and continue
> >> to serve MSI events on the next handler invocation.
> > 
> > Is there something unique about iproc that makes this an issue, or do
> > we need to worry about this in every MSI interrupt handler?
> > 
> This is not specific to iPROC, so in theory it can happen to any other
> MSI interrupt handler. If the handler has no way to break the loop, and
> the condition that generates the MSI IRQ happens continuously, the same
> situation will happen.

> Some other drivers e.g. take the IRQ state into a local variable, do the
> task, clear it up, and don't care to read it again, like the iPROC is
> doing, unless another MSI fires.
> 

You should rework the iproc handler to read head and tail outside of the loop
and handle the recorded events inside the loop. This will avoid using any
arbitrary max event limit and allow other handlers to also run.

- Mani


