Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCECC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 14:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaRdUsCqaO2uAd088jfh+UPpUOgEEGgnOs3e0EtfwWk=; b=nU1Qzyy0pjpdG8ycTV/2wyue9O
	xzLwyB1A90odyJLUxCHxMxlqnvM4/5kck9f0M0E0pnAZ87tRpsY0KfYyAU6RBmzBKm+4CeuST4/LT
	5bBPW4tIWsOdkTEcw92oWgixNIpeRCWkmmkT68g2kP1n6VwaUt/HC1w/nk9vOHebLvnuXSKeHEZLO
	C4huaxuFgVR/xOrO1YBBG6GHdG/txpjqAgOWGVxLjgpT7QCcPDTdiruRWnhdsq+SMD3bBgVqr2xb+
	yCsXxLL6s21NgezX9vf/8brEyrfeL7chd696vW2SbMV0Su3ynuqSE09dFW6t+Q7lIkg5xOrvY6ils
	s4yo4E0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuHy-00000009Bef-2LyB;
	Wed, 19 Mar 2025 14:20:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuuGG-00000009BMY-39TB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 14:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9785CA48C0D;
	Wed, 19 Mar 2025 14:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33884C4CEE4;
	Wed, 19 Mar 2025 14:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742393951;
	bh=9ApM2Yr8qFcdHesbkDhT7WqN3ZLUjNfLaL0DDOHFqo8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H5iwi2OqONoPlsDTIcFW1OC2i4YYHy4xn6Qgg6U1RTQeaeR8d50ntRfwQD6GmXWMx
	 Kk9+trbXHFshZXeeNLPertcklC/nJxwfaWGdLxuP5zeRDTx8lPu1xuiBYZuCeZ6VSL
	 leJWDwfzJZhg2/bWD4aHrrEueiNLhO5iZZpBia/3DWtFYURiWVy6fMhH9J06HVkK51
	 ozo/rzwkrb5fp/xIdkvIrwSNuEmlF02xHAeLpusjKYEFnejn07uRmz22sBDlUbtB6H
	 WbLxEblsI+YknKb/nmM46/brPUZGeTd2wzmxhi58S42SbFg1bQC73excr2y0t8Zfu2
	 WW8jGuIiSu9/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable USB retimer and redriver
Date: Wed, 19 Mar 2025 09:19:08 -0500
Message-ID: <174239394606.2278051.11144638961266854595.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318-xelite-retimer-redriver-v1-1-b3e85a37d294@oss.qualcomm.com>
References: <20250318-xelite-retimer-redriver-v1-1-b3e85a37d294@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_071912_853525_16BF8720 
X-CRM114-Status: UNSURE (   8.58  )
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


On Tue, 18 Mar 2025 22:11:37 -0500, Bjorn Andersson wrote:
> Several boards based on the Qualcomm X Elite platform uses the NXP
> PTN3222 USB redriver and the Parade PS883x USB Type-C retimer. Without
> these USB, and in some cases display, doesn't probe successfully, so
> enable them.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable USB retimer and redriver
      commit: dd20903cc09ac40e71096370a9564e6523e87c22

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

