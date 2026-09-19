Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF67C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 06:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Yw21yZ8D/9ecQCkrAtDEhtb41K+5SSxoiOSXowuv4g=; b=aiWErRZli5s6qQBJh1kDRLLCq+
	DfN1GXS/dSUAzG2OY+r1tKjGFWQmOpLLcOkJlZaLuW96vwuwImSaKSGc0EbTdykLbSjmyOryPbH9k
	hsPvcE15mABsw0YSJ9bxv9t73qRhurxSNkAKsyrNaN7zpIdbUw1298LFDMXuS8c89OSe8aPDRbNz0
	4S7h3ApHxGwNwmJbo3+OKrsHmcNwdNHCpyAIeF6416/5GU0gqLkj6v38TLCZ+/kC0t4A5Drk3dcsm
	lHiPuAGSJWfRhrsE6KyUTiWwEQ1OHqBkZOFuJ79R/Qu8T9w4646K+0CzG+xE/g08DDPuvS/EnDJm7
	Gz3uPDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ooN-0000000FzTW-24E6;
	Sat, 19 Sep 2026 06:44:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7onz-0000000FzOr-042L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 06:44:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BDD1344797;
	Sat, 19 Sep 2026 06:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B7E1F00898;
	Sat, 19 Sep 2026 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789800249;
	bh=7Yw21yZ8D/9ecQCkrAtDEhtb41K+5SSxoiOSXowuv4g=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=gFKLIB+irqMjLjlmfa8rzqJxJssGG1LQ9ighYsOpL57ot8FVVd5KKoqyjVT17DNXY
	 VtYfIKDz46SwvLEjZf2FSmeKEJxpPR0XqdwHKRA5StkovQm9q1VidEdyNgy6Vu1vgd
	 aXpzb/nbBQstiyiHdGnVmo3mcXyxLNw2V23RQy12St9FmIFAGTeU6vTgRfaKuqSo4j
	 GfJT25MAvbUDillf+YxCS9GXGdsN8UwNzHFNhPSSZU8JOVKWN+CMyY6Du3RY3tUvsI
	 jMbXRq7euyt5b0SDUTu+b/BxVOj/fam7i8wTovCPdncs3W5kopl4+pznri+10+sxkx
	 kGwrE3dtbmBeA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194121.107988-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194121.107988-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: vexpress-v2p-ca5s: Replace spaces
 indentation with tabs
Message-Id: <178980024687.89886.10945292395712232240.b4-ty@b4>
Date: Sat, 19 Sep 2026 08:44:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Sat, 29 Aug 2026 21:41:22 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/1] ARM: dts: vexpress-v2p-ca5s: Replace spaces indentation with tabs
      https://git.kernel.org/krzk/linux-dt/c/cbdbed966ca04daa3ce50a629711660bd451ee2e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


