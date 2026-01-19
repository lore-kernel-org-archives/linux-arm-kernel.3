Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAFBD4A5EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 05:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJ3WxmRstAbYMUHRJ8BK/ls6w2Xc8kClbBlzp8K7yZE=; b=k6KHfb2Pi9sxaFHpIjw0snsPeh
	BUniSFGUR4/0K6iZJUFqc0E3kaQKwFMtUG3s8s00+ZrHNYtN/mCKKnGwUjj/zyxP2PKbQRZ/IM0Jv
	ZtBxONJMj+0OhpEuWyIfWDq9qAcBN8n5ZpW4gZ1W9KHnJXNC6KheEFri9ofUR2tatM/iECT5/IV1R
	IcR5tFeSLvsV85JANS+Ha5BOQ0jGxP9gOh2sH1MkKfGDgJTbMxVraXILsnAyZ462mNFu9KvNowEfE
	mat3h9qWBarSPAq+bLTsOlVMrxN65NOQCYyHUJoMbv2TtCNspAuVXhJws3pKxmGhR7QRzIySgyVyb
	yQPEC5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhiGv-00000001Nwq-3EHN;
	Mon, 19 Jan 2026 05:57:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhiGt-00000001NwO-4Bor
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 05:57:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A7DE4449A;
	Mon, 19 Jan 2026 05:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 362D0C116C6;
	Mon, 19 Jan 2026 05:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768802270;
	bh=jVBPHEfVtiYGVPijhkgf1PAt71FDsL0qQxTsv/v3amU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QRmvEyVvlb3QjbD+KPP23fPL7E47MSqRmLwW3/BtqbqlpQ54u/3aHqidz84NnRYOg
	 p6ANvLr43yxf5TftcCF8bS528AmB6aySEsF+DXT54LyGHAeiXcROiO8pqW/NloW6vJ
	 q6lJqzbvfgMTbW8KxM/2YePu2BtBbiMe/yQNs7dzm9Uz6cKjFFdF6+H9Tp2SkYyZwO
	 jQJpkPM3m8Lv4Rax3Oli1JR1vMVG89+XGbE2FC6I8c23Blc7rMGEyTpFLJPgsuKEHO
	 vrRft+LGCALbtXsXzVmOQKlQxxUuDhA1B5nY0I/5Cr+4Yw/xEmDwuyweQRj2Xl79JX
	 dOVhNIbHzdpuw==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B9BDA5FA46;
	Mon, 19 Jan 2026 13:57:47 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Linus Walleij <linusw@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251225103616.3203473-1-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/4] ARM: dts: allwinner: Fix remaining DT
 validation errors
Message-Id: <176880226773.2263817.6938241387406748242.b4-ty@kernel.org>
Date: Mon, 19 Jan 2026 13:57:47 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_215752_062294_CEA8596F 
X-CRM114-Status: UNSURE (   8.70  )
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

On Thu, 25 Dec 2025 18:36:11 +0800, Chen-Yu Tsai wrote:
> This series gets rid of the remaining DT validation errors for Allwinner
> (sunxi) ARM 32-bit device trees. The patches are self explaining.
> 
> I plan to take all four patches through the sunxi tree.
> 
> 
> ChenYu
> 
> [...]

Applied to sunxi/dt-for-6.20 in local tree, thanks!

[4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
      commit: db5e9260be8d3437222df74b5074359b22f1f029

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


