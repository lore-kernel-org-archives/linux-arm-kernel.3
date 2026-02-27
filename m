Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7A7FEFB5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t1Hf6lOuL/RzLUoGC5aThpJ+W9Ml69mlfHZtXwUlafo=; b=TyZhFgWIP1mls1hwHygVHsKfpa
	hqzQozgz5cFFaUHQ7TCsT9KkWq8LVfr1iSSQmY6MWQBnHUZLU0l+K2pIudkrPuHPfkieq+7OK05+o
	xIYB4JF/MMEowg9J4usbzztEXfc8iBvUVMwFP2WQcm8B0sHqTylga0lqnef78w4jX4uSAs1e4ZnZY
	wRuj6MU0xxnS2nAAWLNylh8qWLsRG14PBmr1sUVACIjD4+s9cHGHmQKBecNqFP/TuLKCd7PB3y1kn
	r3rXrpWcq/17eWaLEgwlY5sbpmi1p/c3GzBDppISsilKeRRBmmjPxMhfYCqERb06+hqe5AX6m9wG0
	ec/V7Edw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzbz-00000008aVX-20o3;
	Fri, 27 Feb 2026 15:18:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzby-00000008aV0-3LTe
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=t1Hf6lOuL/RzLUoGC5aThpJ+W9Ml69mlfHZtXwUlafo=; b=DEJUy4t822H9RX4RZ3mTijJSJx
	IXRMnJFila8MGrlHTWKKOQJZsiuRwqgINkmYNvLsZAhk3bDPWjX8xs3VYXQgnPR3TNfxqG7xwv+J0
	TQluXho20efIiTGNlZiASaQ7sG5H1eBzDc315Q6ej52hRvZQHs7IIbw0r1/14WYLVn4kwsnQqrAFd
	TiZIRI6eM2Q9id6TcRXkXmG488wMDzdfc5tN5dZutDDaHsTaRrMszfRKOLDPdP38c97jULPC3rR1f
	ss/CzcGDTc4GwGFxVB6FNgxX4IfnVnUYce+drkhniYoXHnP629CG6syNXMrFsHSb3cOpTdm7ONVZe
	73Ic5Tgg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzbu-0000000DKw9-3JBX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t1Hf6lOuL/RzLUoGC5aThpJ+W9Ml69mlfHZtXwUlafo=; b=c19yThi8C41VK49OhNEt4zZh2t
	gxjN48N5E77P5B0WUpt/kXA/oU2L9FgMFGF+vARxd88aQW0SpWbOmDY1m0dYLcrj59RohjCHTZtsV
	TDplukBgAlv2a5RFBjwxOaqpfva+CQPCDYKzSCgp86CUEr5Y2IwbqJHFG8CrObN6S7TuGwZOKHkhe
	2M/JBUhMesJR+dptfKUoO9E8a+9MElu8OPrhUiD9NKZ8Wk80TqZNTfwHZKOGwqU8XkyEBxEH8J+RL
	kjCO/uud8t29J8n38FRXKTHrDm+N0KQkJmt/SaIde/ipFC/KFd7VE5T/+PJHuLlagylNO5YGS/Yys
	H0GhWMRg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42646)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvzbo-000000000xd-2JuX;
	Fri, 27 Feb 2026 15:18:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvzbm-000000003Av-0msw;
	Fri, 27 Feb 2026 15:18:26 +0000
Date: Fri, 27 Feb 2026 15:18:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: linux-arm-kernel@lists.infradead.org
Cc: Clark Williams <clrkwllms@kernel.org>, linux-rt-devel@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/6] ARM: cleanup fault handling
Message-ID: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_151834_950253_ABF0CFFC 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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

Hi,

This series cleans up the 32-bit ARM fault handling:

1. ensure a consistent IRQ state in the user fault processing path.
2. split vmalloc fault processing in a similar way to x86
3. move is_..._fault() to the local fault.h header file
4. update the FSR deifnitions using BIT() and GENMASK()
5. move LPAE/non-LPAE specific FSR bits/masks along side users
6. get rid of #ifdefs within is_..._fault() by providing a LPAE
   and non-LPAE versions.

 arch/arm/mm/fault.c | 158 ++++++++++++++++++++++++----------------------------
 arch/arm/mm/fault.h |  42 ++++++++++++--
 2 files changed, 109 insertions(+), 91 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

