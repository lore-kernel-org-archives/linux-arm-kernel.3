Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A379CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaR2pMkofUaXwToBuMFZelsw4okDIao8pYKTRC82PQc=; b=Op+Y5i+qElmBVykZBi3uMZ46QH
	eqRkI61v1DwtB6qxh6jS6MHAFDDiJftoFHZfAXf81pzHU27ZpQP/mSeT4f1sbTrRHqQKOixLdZZE9
	yTbxy/D8x8+74Stktfvug51Y/erjMQCd6TGPMyiob6dTl7x6hZt21iXpbS/GT4YLUPlhi9NziExRq
	RTrtCAB7aAAGwvpMyzhVokytnz1RX9K4Ni8b0yCEH51/+MrXk+pwdN5pJ3Pd5Gyg/p9YuzW/2LsbG
	jNrHQRlTzJop8npKZz2SsE6JEoj8xY1Zxodvqpl4U2H0W8iMem2ZLiaU6wucKYQT2qS6UQwbtSkJo
	ocuEiFAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJU-000000021aV-0op8;
	Tue, 19 May 2026 15:24:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIe-000000020sf-227s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6E4760231;
	Tue, 19 May 2026 15:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67300C2BCB3;
	Tue, 19 May 2026 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204243;
	bh=ef0V2qYtMoTZ4ao0OA/ZUH8o36Z4suzNSkCZvD+JjiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MHKx/dRcVU1ErmNRFu+mNLcqMBYsntNVurMdQbJapJq3gfUpXv1UQ0Lq2JYpxqY24
	 kPx2PcjzhB5NYuxX7p5dsx+CTYxLnQ3koGMFOiFtNLNeY7IkJU8URxsDVkhk8Rlc3g
	 U6kN2PBa3jeCW2QnA0aVCdsSd1f8sWZK/WqkY6j+/fphWVM2POwxdFHbGjbqE/PoGV
	 X4KduLkmIfTkhz3JfJh3e67kdmzExX5oPkuKIr8wJQt3sfshBbcUKQFSZyc8g77ulz
	 Xl7I6mZK6S9kikz7jWOqyNj5wK3DoNZ2l00gW305woJjWDpRVKWnZCOk3hsR26Kqv9
	 2Vb2jstowzFdQ==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	=Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] perf: qcom: Unify user-visible "Qualcomm" name
Date: Tue, 19 May 2026 16:23:02 +0100
Message-ID: <177918680676.737622.2620851169920682514.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427070056.18140-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260427070056.18140-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 27 Apr 2026 09:00:57 +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf: qcom: Unify user-visible "Qualcomm" name
      https://git.kernel.org/will/c/3ef020a3c9eb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

