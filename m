Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB273E91294
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGfoS2SrOUSUcNbo4lzcjQ1KpCcVybs+F31qmzUiqIQ=; b=PKd7vdiQts20MeGWXkYtKFMbme
	pUMAppK1k6iCodxYqPSoW93ryi8NE9y+Ig/l3ewgqsgvVK4QrZ/0jHIsah2hMoX5adkKNxgKLTZLG
	i6r9UR6cOetK2El3dkcSaGmBgRXa5+xUgtK7sYJaMXd8H6i+z+2MFwqWjFMbMt5Hm6iMg35tjEO2d
	zjf3yZvxO+um1nznHvxwNRQi7HZrZ00i6rpotOSOwr/RoeW4S58FOK/Q3xB/OnmpfCebly8nsrN71
	nc+yn008noACr1QHspHoHQyEi8JOHAfoz6GmiLvPmK/0VtUc1Ah44l23tF7n87nGAuzLh6ehr1EJ5
	ZxJ2auNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnv7I-00000009dT4-0ZkU;
	Thu, 05 Feb 2026 08:53:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnv7F-00000009dSY-1hFe;
	Thu, 05 Feb 2026 08:53:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAD8743F57;
	Thu,  5 Feb 2026 08:53:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF4EC4CEF7;
	Thu,  5 Feb 2026 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770281612;
	bh=hGfoS2SrOUSUcNbo4lzcjQ1KpCcVybs+F31qmzUiqIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ph8JSWSrJDO/nNl/EDjq1HLoqZ7oqDk9ZkC8ZHgNJIoJYcGndSMn7dt+ixyyNs/NN
	 soxAKOh22cP02z6s2AiMyvZ1HbQWiajQRn61b20N8nZyffm45mcUB/DlaIr+me8aHW
	 N9+MwiMvy8w+Y6xebb5w93SOs6lMxfHP6pc9kbFdUJdOv81Rd2NcBfWIe6fmslQ/dK
	 ET4UPmOBMUrDRiwQ6kH0bSwxwmeLauLWbHrdYUMm+FCBnvB6MfqXaabQBmV8nKEerO
	 WblDJBfsDaJNAt1kqJP7j4vl8zUnVcnH7CF2+9aUpyJ3wVj/jN5QRZJ5o+xO4Rvx9I
	 NiWLf248P3bGQ==
Date: Thu, 5 Feb 2026 09:53:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: aspeed: Add
 ASPEED AST2700 INTC0/INTC1
Message-ID: <20260205-hysterical-crouching-beetle-e0d1b5@quoll>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
 <20260205-irqchip-v1-1-b0310e06c087@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205-irqchip-v1-1-b0310e06c087@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_005333_460442_ACE3F010 
X-CRM114-Status: UNSURE (   6.85  )
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

On Thu, Feb 05, 2026 at 02:07:19PM +0800, Ryan Chen wrote:
> INTC0 is used to assert GIC if interrupt in INTC1 asserted.
> INTC1 is used to assert INTC0 if interrupt of modules asserted.

What happened with 20 revisions of previous discussions?

Did you just ignore entire feedback?

Best regards,
Krzysztof


