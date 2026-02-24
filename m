Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D822E9B258
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNefhq/AKTgtMfrNHXPTBrOGoNcHgT6U2PmNSIxggQM=; b=A5w9vopTPGO/PyfYiiMw8XGmgM
	Xsfsm8pLCRAjRu9r2zVS/Czu0LbAnIeU2FVgAhatyzcU4WaEgsyIgtlw6kYROQuEJa0ttff3RXOhs
	7KdWmGj+PWQ9ucoQN//cN35/3PJ3S2tRjvy7vKRNCV8vzHRNMaR9ExH+8uPfEyII9YF8yxY6yhkSR
	heRyIi/cOlLMdzt2Npbu82Shg0GHRqVlFskoXfxbPppY7JnwdV8jKLIaC+f8Yv2nozbKMu3q4esrg
	b2fo6flnOGUX12HHAuJcYs2jZHWNNExG2HgbQ1Z/tD+osoYVNoNTHl2CFo/MmbnBda0pxJOyX/tvc
	DMBUkeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurYQ-0000000232i-3PnB;
	Tue, 24 Feb 2026 12:30:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vurYO-0000000232M-0d7p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 12:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9D38406B6;
	Tue, 24 Feb 2026 12:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3D5C116D0;
	Tue, 24 Feb 2026 12:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771936215;
	bh=Yl/VGytIieGwM0BISDEWxFLX3fzNIgNPNqKISwqD1cU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KXFUzSfl7z91kCddmEqg8BKAbBUJTInPx66AUTW/oiNKBJIDGElE8t3hMDkBaStrx
	 TsBfGUVG0/wY9JeHjk390d+qELNxsbGrZD0rtLQWiKeglDhtPmHqf3WTGH9w+RviLs
	 U2HM/ahri0SRYwgjNOHcibUhJdvfbXHmmOhlpbnQHmH3QZ2D7nTe9d7anp499GktH+
	 DHf+gFi/+/6KHwXITcKaRojh3AKa4AL0hJ8rnmIXEwciNzX9CnYTTbFIDlA2tvW5OJ
	 fItBHlXv2anrgHQHQOldHk5MS+sA39R4Usum7MEt5Zr21iPYB82/YhJVZ0doP1/NOi
	 7nOQcs44hOHuQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@axis.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260224122739.95168-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260224122739.95168-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: axis: artpec9: Fix missing soc unit
 address
Message-Id: <177193621300.95965.15818734205475984010.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 13:30:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_043016_222430_4C87E7DC 
X-CRM114-Status: UNSURE (   5.50  )
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


On Tue, 24 Feb 2026 13:27:40 +0100, Krzysztof Kozlowski wrote:
> Fix W=1 build warning to comply with Samsuung SoC maintainer profile:
> 
>   artpec9.dtsi:121.11-268.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> 
> 

Applied, thanks!

[1/1] arm64: dts: axis: artpec9: Fix missing soc unit address
      https://git.kernel.org/krzk/linux/c/1f8fb2a87b58c2d12b7a9c817b8e781be90fe37d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


