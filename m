Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA723C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 22:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42065gDk70xhkMp6A8E1OZfXBoIID+AiNJjSOToPxwE=; b=457y99+T+jK2aK/5nVmwRgdany
	4beBuD7L4NdajoMb4323B7qIyErxqf1yqV1zgIKRf+LXP8QsOSfPwIR5ZQXmycnlp6+fEI+CFiH6b
	BM0vqrHly6T+YmTXYuHTVlaxns/g/jbq1QZJjA2/SJuCMMgIwn75uWMN/1pIvjbKaRiAnIdPU1Adn
	5jBbLhgWV81sjFj2S9GduUq57tLnjHFucfz/C5+sduwe6d4kvxvUbVO+hAvChJamothFGgcL/q87V
	wJKrWlm8p3t232t9TbyZzmstPUZibp9wDAA1aurVDjU6uiAEtZrYk9E5cJn6Pq67gixGO6SsY1noo
	8zKo0/mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugsv4-00000000CHG-04Ds;
	Tue, 29 Jul 2025 22:35:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugssa-00000000C78-2dzA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7FB395C6418;
	Tue, 29 Jul 2025 22:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F63CC4CEEF;
	Tue, 29 Jul 2025 22:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753828382;
	bh=WaeVTukSS1L5gqdvUBuqMfwo95AwKoyLXHK6FYRKhEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EG8CkcAZflQ5UKTilOC3qgbe/N63nlo3M389nB5QMS/j7q4BMHPnJQNK6+7IaeopX
	 oGFhvfp61MkSoJFMASRgeSPU8tPkZZVWJiaY3hkWqcHa7HIMLAY3AECuGWZKqMNAAa
	 /euTcHEIQD52ExFBCRjYXW2DKzhr0EI1QApCFuarJ67jR4Qtyx/rTmTeXbVZDx0dPY
	 g98HOkM4FTMfRxnwHDaNDc0IoquI0H/u/SGvyKWljortgOIXUokRRHJgn/+Ydw2DqK
	 VEAQNB9TIo0R0yXFn9AoCs+tws9gfYyQvS01UX1wSF9/dRb/jIAvEvM1YXILgDNYoK
	 SoleSr5s11OcA==
Date: Wed, 30 Jul 2025 00:32:57 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple
 A7-A11, T2 compatibles
Message-ID: <4dbhhssnqe4wh5h2n5k5y5bweb3hhdv2tn6ejmw35gvvdo76zv@lgmwb74hb5wo>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
 <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_153304_713859_08038606 
X-CRM114-Status: UNSURE (   8.20  )
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

Hi Nick,

On Tue, Jun 10, 2025 at 09:45:20PM +0800, Nick Chan wrote:
> The I2C controllers found on Apple A7-A11, T2 SoCs are compatible with
> the existing driver so add their per-SoC compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Just this one, merged to i2c/i2c-host.

Thanks,
Andi

