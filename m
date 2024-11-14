Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4886CD6A22C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4CuMeBuFl8hY3128pbc9WW5lE8Q2llRmDotkDlHzho=; b=F1UY2/nCgwgq+0bvm2SyC/pKoX
	0gOhlHf42j2hBnK52GdJb9FRg/lSilaGrdqBCggBzkOwAVQV8BFoNRP9qynsEptk/6zs+S+bZmPFM
	6V8BwBDT/dd6VqshuMwOSrhCwBzCEyTLV8FXEhIP++FHA+HOY9ktLxAQizxodLq6ygUjVECY9j1Ou
	JMEqJ2r1zYzfGBSFCTMBwRxDhyqnmre9q/lkpBOcp/Q4SrdIz8mO4s3/m4Or3hEoxl9F5aB0PfPBW
	EzF5sIySwB6nVbxbkiihA+LRAAYkW0MHOKrtGmUmZCNM2W7fxQ8iUjccfSN1Sdaeuv120N/3E/Mia
	XeCs5DyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgaS-00000000m7Y-2O90;
	Thu, 14 Nov 2024 20:37:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgZW-00000000lzU-1kd7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 20:36:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97E275C5DB2;
	Thu, 14 Nov 2024 20:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71522C4CECF;
	Thu, 14 Nov 2024 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731616569;
	bh=e4CuMeBuFl8hY3128pbc9WW5lE8Q2llRmDotkDlHzho=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Vt0jn7J65ZBeZSkFV7IzswP1sljgEdr+7BjB+hi68CTHdbYGpfvrbf7LrMmq69fYO
	 g37fBDpL+1g2sHXr3V+8LgMvGk2Jt3WZAthQafLnnoYkvPoWGUzPxIJT1/Fyz7hh5x
	 jLLSN0ALORwjHKypfzTvc6htO/0DhiYL3eH8CnoGJyZuBU1hh1ugH7v7dKdjXYNfw0
	 pHV122hsY3PLrJLDqA138iaM8Uz60wHZgrysQ71vxSJ9ecgcAdKnvuKlr1xHmUcqJX
	 RKgszYaG8hQuETL2uGETmUI0BjCY1nDw4n5LrLFmiMt86rnaN1rY5N1TE+DMZCQJHK
	 bbu+v+wQroScQ==
Message-ID: <35463049ef7cc47172ccfbec487166ec.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241108112355.20251-1-robert.marko@sartura.hr>
References: <20241108112355.20251-1-robert.marko@sartura.hr>
Subject: Re: [PATCH 1/3] clk: lan966x: make it selectable for ARCH_LAN969X
From: Stephen Boyd <sboyd@kernel.org>
Cc: luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
To: Robert Marko <robert.marko@sartura.hr>, gregkh@linuxfoundation.org, jirislaby@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, mturquette@baylibre.com
Date: Thu, 14 Nov 2024 12:36:07 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_123610_500660_EC70DA99 
X-CRM114-Status: UNSURE (   5.87  )
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

Quoting Robert Marko (2024-11-08 03:22:34)
> LAN969x uses the same LAN966x clock driver so make it selectable for
> ARCH_LAN969X.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---

Applied to clk-next

