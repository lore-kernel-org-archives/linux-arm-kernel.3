Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDD8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 22:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TefGM+AnOaFsEdCrnZ8RzOkBu0WZlOZ3JcZFXOBkyk=; b=HQlraSeK/IZnx5dglUWaBiSmeL
	4Th4H+rl7s/MsVUQ+8uiseEhvpQ3iFR4jhn/4T5vfuqci7mxjPQyt8N9cbkuWSaqeRk4dfk+keaTu
	9vgCZzxrTC1oLA3F2vGO8GHXcT/vjkklAxaqeES0bAaCXtN62n7LBIFQuruX2hfDcQG8fwCYZiDcX
	cL4yiLA/AqQ//648aN7Xcd8Vi01n35txqcSd3S1nJjpSDqlccvD+N+YOciOub5Vi3+kM74xRS8iuf
	zYSRWF4HqIqBQrLpPjWcQsYZGFmdI6DuSJr2UabF5BSAvbz8oYs/eAM9zh8Qd0t2iWfF3VbiZFeAS
	3m4lKCpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQwY8-0000000GZbw-3nBg;
	Thu, 26 Dec 2024 22:41:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQwVt-0000000GZ7U-0yws
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 22:39:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4CB35C5D5B;
	Thu, 26 Dec 2024 22:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E21C4CED1;
	Thu, 26 Dec 2024 22:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735252767;
	bh=Qvt+JRi2cmq9zeXEcN2nuq+Pll/fyw7lZBjrwZqzSnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A6V8iJyTp9Iv3AazXYuVamYSZMgtjZGx9U+o5dC8rHRI7aBkysBi5qk1jOVlPgjho
	 MKq9sFZeOYEiHnvFDFNUqIJX1ZJODGCC36kXh57nm3WbUbFzTDTstRNPfI4EaI8Yxr
	 3fCnmm69IBdIQxKJ0vwbfwnzuoGNkA9lkAu7CXfLihWafyO7DpmNsWX2887p9Lbgb2
	 RcZFdM+SOERJ2Gs+yRk3ifxsxi0b6kM4vMLQQinnc/8TucWluTt8rTJ1g6udkArAOm
	 gasvuHShSEUDuO3wvIBnGGkuBB33BPDdKsdEF8+eRIKouVdhNkzvUBY/1DkUfRx7eV
	 b/kPZ8+zr9ADw==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ross Burton <ross.burton@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650
Date: Thu, 26 Dec 2024 16:38:51 -0600
Message-ID: <173525273242.1449028.12041677894641370182.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241213-clkmaster-v1-1-dcbf7fad37b1@arm.com>
References: <20241213-clkmaster-v1-1-dcbf7fad37b1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_143929_315703_DA7F1DD6 
X-CRM114-Status: UNSURE (   8.11  )
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


On Fri, 13 Dec 2024 16:12:58 +0000, Ross Burton wrote:
> This option was removed from the Kconfig in commit 802b83205519 ("clk:
> qcom: fold dispcc-sm8650 info dispcc-sm8550") but it was not removed
> from the defconfig.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650
      commit: 9be2923ff9641d6491b8ea43791382966505435f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

