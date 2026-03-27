Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E238810BA431
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 07:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKr2IzbjiKI3yxuMvr7bVfdUhNVShva7yDC+0SDm91U=; b=mj0sKafBTHzdUGjNnu9Xh4OLLJ
	cYsQsUbTl7MbamEthG5UNoaVggXX/0k5yNw8hfFitw/l0Na5+3YFEpPOkfeYHBQJ+nsgwDdFSaEJB
	Iqdc9/FJAFj4EegQhQRqGDDP2K7kSR0atasj/rESX1eLJJoGz1QcIlycCyN0vLczgrI/gnR63zivU
	R5H9oSS7JxV+fN00Eq6qd8mNb+76EANx5HkflkYcolzY2zxKElIflWHdmV+ysGb1DjsMYRt6q2o8L
	rzUbwzKb/fivI1QpDbdbkoA71Owy1oe/TfUCr4UiIrLVnSZ31wr5Q0iAhPcYWg9evHh5zZzbbJ+xi
	8P+wdnOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61Xc-00000006saj-0xPZ;
	Fri, 27 Mar 2026 07:23:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w61Xa-00000006saF-2t0S;
	Fri, 27 Mar 2026 07:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9148560133;
	Fri, 27 Mar 2026 07:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9153C19423;
	Fri, 27 Mar 2026 07:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774596213;
	bh=ja5349iSeyxrcoK4nJXfVc7CxqPLaewDf9iCFYSJO5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJnIR+zSXK0lGsOYpLSm72CuPXrG2OTH3SP0aF00TgqJLs4cloPSNql0l1feHQZNL
	 a/wrPu4diJXCFDB2+kHfd64BPxh15TR1wt/hy1j2oHvLpR8MaHk/P1Ar6JEpyveATX
	 WSuSiLAcbDPwwSr4J0w0U4mPRB9sGmQnhrMlrTjp72ASCUbeM8Avc5Z4yjPMdvb87N
	 mtx1QvYBWBwv0HyBzcJtzJjZ9F/4kA37zJorbG0VebfTbp1fa17Lx/poQ01kXCnF52
	 Z+tVC2VBK1TB4Kt30xiNQv5nBBtpnS6MvyrYD8chZPP2z7NglJQMIXgvFBS6zL4skF
	 rL4EqEAr1Z2mQ==
Date: Fri, 27 Mar 2026 08:23:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ronald Claveau <linux-kernel-dev@aliel.fr>, devicetree <devicetree@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic <linux-amlogic@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Ferass El Hafidi <funderscore@postmarketos.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: amlogic: Fix redundant hyphen
 in "amlogic,t7-gp1--pll" string.
Message-ID: <20260327-rough-spry-hyrax-8236de@quoll>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
 <20260326092645.1053261-2-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326092645.1053261-2-jian.hu@amlogic.com>
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

On Thu, Mar 26, 2026 at 05:26:43PM +0800, Jian Hu wrote:
> Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
> 
> Fixes: 5437753728ac ("dt-bindings: clock: add Amlogic T7 PLL clock controller")

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>

Best regards,
Krzysztof


