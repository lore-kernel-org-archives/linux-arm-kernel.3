Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9103FFC590E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeZEtAklIWicmGYDPDcp/xIW0sVKqom/JIuqIcBhqtw=; b=wQvwFKdi74b1oadT59Psy7qhda
	3BdBfsjztAdiAbpPR/MjWljjkAOigDn38tTcHx1+IFc8toL2spOapPB4nJnHYWDCfol962MOumgFU
	CwsGgvfkle+yxoyKXA5O4ce94ejLoTI7A1tF5SpxDJZXFCkIKOxuWcnfrVAOUfdXAevndcXqzVZdX
	QATRiNhVyVnDGLQXTOCvVl73qSU8gf1EOPgfgahRMBXAD1SEPYc3oq7zwJe4aLmGAN8hf/6iUqe7+
	daOuz4DDb8kgAYT6q1BSoFuhGmudNjis0VHISulIodG49XLV9MRgUNmXfly/UxQuwtzQbBaSmuwWh
	MkUKaSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX0u-00000005gwJ-3f3y;
	Thu, 26 Feb 2026 08:46:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX0t-00000005gwB-2tq5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:46:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2E1F600AE;
	Thu, 26 Feb 2026 08:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D389AC19424;
	Thu, 26 Feb 2026 08:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772095586;
	bh=vT4YZ8d8+umMLaENQR7603vntqtl8mUCTTz31FhwWJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZN9LZrH5lNH+uZ05yLMfBjmrU3hV9lzIb/FdgWw2O9GZ+LDzrW05X5X63TcOrLhGP
	 7NKKxnZ1yxM4OVCZL48FnubLVyTtvfyr+zGaKir1vvZZtn+v5oQqyqzcSWPKjVmP0y
	 w2sMZA4twrqW/NHFJ9B4SLaLYQtM08leZyTlGFLc44JLRNIrRuMN3gOiNjNSmgeTbO
	 ogySlpxvm62c9pmWBZhOI1AAbu0bm/48eXiMhjXN3zPIld5hnUdK4iNumlhO14TwBO
	 aWV3GUBWHeeWH7bpVVMwUoe+r7AI32aoEDCRhHUs7Q6aU1VM/uVSAqwXYBZ7n047Mk
	 lSMBWkunqaNwg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260205-clk-gs101-symbol-names-v1-1-a7d9a7a4d108@linaro.org>
References: <20260205-clk-gs101-symbol-names-v1-1-a7d9a7a4d108@linaro.org>
Subject: Re: [PATCH] clk: samsung: gs101: harmonise symbol names (clock
 arrays)
Message-Id: <177209558359.28320.7275620505231772879.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 09:46:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
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


On Thu, 05 Feb 2026 22:01:57 +0000, André Draszik wrote:
> Most symbols for the clock descriptions (arrays) don't have a cmu_
> prefix and all symbols have a _clks suffix where appropriate.
> 
> Update the few outliers to also fall into this same scheme for
> consistency.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: gs101: harmonise symbol names (clock arrays)
      https://git.kernel.org/krzk/linux/c/cdd94147fd72974eb1d118b1ba3b79e8df0ea716

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


