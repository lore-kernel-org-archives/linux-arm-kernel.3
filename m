Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D734E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 18:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgg4uRmGvd3cscRaJo4y1OaNX99vVpuyCndXXqKw5v0=; b=4jkBGnU/aEoKowt+rJRhflV5s2
	Qsb8wRcgVdJO4cXcMPE8j6ltpAzg7QI1D/dkX++0J+ZQVbu3kGM8OpmE4/DyLx7miwg463RZz6BIZ
	wP1Yd/Rpq+0QaiAjuXE45BTVxZvHSZ4AjFFldHTRGH0uAIXJOF8k7VuAlAhcXMxZrQAuSqHXr+EqB
	UyfOsE/usFFMPtxvjFUvPQjOP0UxMPoaDVrREzqxVtKiAuvldRkrOEIFnprMuqST3X+k9crjfawPW
	/zrF/I9bXKPdYzrsk4g7NFxM+hlwW4HRW8Bp+NQ3a0u7vIw8f5ka47MgdidmmTsKteX8PUsZSRL3h
	VsOj7b5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhzs-00000005qFf-0A6P;
	Fri, 20 Dec 2024 18:45:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhxr-00000005q2J-38F5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 18:43:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27ABAA420B8;
	Fri, 20 Dec 2024 18:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 215F1C4CECD;
	Fri, 20 Dec 2024 18:43:06 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id B587C5FB8F;
	Sat, 21 Dec 2024 02:43:03 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
In-Reply-To: <20241215212533.12707-1-andre.przywara@arm.com>
References: <20241215212533.12707-1-andre.przywara@arm.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h313: enable DVFS for Tanix TX1
Message-Id: <173472018373.189342.9184547368106297153.b4-ty@csie.org>
Date: Sat, 21 Dec 2024 02:43:03 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_104307_858063_FA21A60A 
X-CRM114-Status: UNSURE (   9.28  )
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

On Sun, 15 Dec 2024 21:25:33 +0000, Andre Przywara wrote:
> The merging of the Tanix TX1 .dts file overlapped with the introduction
> of the CPU OPP .dtsi file, so the TX1 wasn't covered by the patch
> enabling DVFS for all boards.
> 
> Add the missing include of that OPP .dtsi file, to allow the box to run
> at up to 1.3GHz, and enable power saving by using lower OPPs.
> 
> [...]

Applied to dt-for-6.14 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] arm64: dts: allwinner: h313: enable DVFS for Tanix TX1
      commit: 300d7208ed783df828d26196f0105853811f4af1

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


