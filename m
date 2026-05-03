Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD24FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 17:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5Y4TqVr1qa0LJO4yqFYciZH0TI7JzPAx3H6ugU+JDI=; b=3j2zDYlvZCavyq/EsR/rlKRWXh
	sPB4RV0r0exLKokljinlUgYDL/PUu8X3V10QEKJbOYXi+Bz4lXEPVG/CML4G1ud93YU4wgcmLiOOU
	jXrAmMs0Ggtt7QDob1JBD2UWevDrZlkBe97H0qUSwJjCXa01+bUBTfcXWY9BPClt0q5jk2B+9ND0u
	QhPJdvNJylYDC1rf1QOrCajeEWkCd/1UY61QIB+TxDkWgxgQiHnFvZxDXEVn4BTwM7+Mez5Yne0Tg
	LfoIn9s2OzuZmEG3HY0Cuosg08SP9Dfno6rBz/LITz+LdmWEs0Z7B6TzTW7M1eM5CiwhsSy3nrHg0
	w0+C5x1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJaQo-0000000BNfB-0LXE;
	Sun, 03 May 2026 17:16:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJaQm-0000000BNex-3LMr;
	Sun, 03 May 2026 17:16:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DED9660008;
	Sun,  3 May 2026 17:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64866C2BCB4;
	Sun,  3 May 2026 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777828595;
	bh=xt4m6IIiEWQScT982aoYUfG4aqztOk+QWMb0fwwhLV0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ojQ8ECNEqdV0tPx12W1h05+xlBUWUCmLfMz2rgTaE1s2W7rAkjjpkJ0u5Vm8n9njJ
	 1WRrBLPoM7RimYqy8dLFnH3BIXEg859o0ljDcG2a8+Q0iE7JcPZGLqOnV0ZB0AvP7z
	 9txhEvvsjZOeehCmuiLAjPkQlpqu6zjOYpkKDsDkX0TojgYCyPbLRkaEok4p+FN0D0
	 KVF86Tq4E4ThDcJfWPjTNC/tlwXDqPUMhHa9ksIfFaEyNU4byiWtMSuduDRQfSDTzb
	 o8FoTZ7yvP4Y22/tosnqABjCdS6Y8vPqnRoUkdiqLzK7Fau/ggMM41qzZRoedmQx0m
	 9opuR8V/fldVA==
From: Vinod Koul <vkoul@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Aditya Dabhade <aditya.dabhade066@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260428193459.5865-1-aditya.dabhade066@gmail.com>
References: <20260428193459.5865-1-aditya.dabhade066@gmail.com>
Subject: Re: [PATCH] phy: airoha: use C-style SPDX comment for header file
Message-Id: <177782859303.133776.12955045250669984440.b4-ty@kernel.org>
Date: Sun, 03 May 2026 22:46:33 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 29 Apr 2026 01:04:59 +0530, Aditya Dabhade wrote:
> checkpatch reports an improper SPDX comment style for this header:
> 
>     WARNING: Improper SPDX comment style for
>     'drivers/phy/phy-airoha-pcie-regs.h', please use '/*' instead
> 
> Per Documentation/process/license-rules.rst, C header files must use the
> '/* SPDX-License-Identifier: ...  */' form instead of the '// ....' form
> used in C source files. Fix it.
> 
> [...]

Applied, thanks!

[1/1] phy: airoha: use C-style SPDX comment for header file
      commit: 0bd448b5467b7ead268bc3a946c1deabbda70fe0

Best regards,
-- 
~Vinod



