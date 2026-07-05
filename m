Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F43AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 20:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt3Qq+H8uaYIqm5V40DzeXFpBOHpi7xmdNGZHdJuHUg=; b=zgEmyD3ZFF55NTM/AcxODEMNAB
	0q3E4SKhTJyuK/lThc7SkL3Fn1X8i/z74CI6MCFnNAUYwRePzD2l3NYIIJuh8VBnaAyZEatU0kmjd
	/66CLjxbW07r/PYXx1nFHUrIS//AcyNoeSHD8yY/kOKd53iXYFvP5Ih8mKnl+jg71Xrags/uuLCAb
	5ivFyyXr6oyPik95eTKL8+SzDnOs5yWDatMXp7iyftvcjW6R91hzg01J94TJxnyQxpDGliuwH8zDG
	HLo8gTVpW6fw3cLXdOH/rGJQjeToJ/bfkGYGY5p5ms5p6qjrLf7GxCtMEZ4qlplqtcSRHa2oUVd0k
	FvVqLxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTuo-00000009ix0-0WHo;
	Sun, 05 Jul 2026 20:58:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgTun-00000009iws-0N7G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 20:58:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05C2E600DA;
	Sun,  5 Jul 2026 20:58:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968E81F00A3A;
	Sun,  5 Jul 2026 20:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783285091;
	bh=bt3Qq+H8uaYIqm5V40DzeXFpBOHpi7xmdNGZHdJuHUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LRi1Owkn0mw/4PFM1S+RyPv8Wm+vBTfqw3RKki6DMEMhcdMNeh8bb6cabdQRlmPw9
	 R12FDSJvUOKg+LmrVGs/5cx3CnGMdKWGUqdLvgIytkNR80GdmhcPl01JG7AwUHtmPj
	 0fqRmaip9/2R2iR5g4gwG+o/IXovdZPV8p8nWRAJojFksOT8QaCEEkBnWJSkf03Q+j
	 zftgYbiOOdYfoy77CQPnD24qx+wk+YPWaY+8xR+aMixgT0B/gzKdhcbIoEI2Kxbu0t
	 VNdOkbNcLFFqtII0RW7fhgp1wVxfE7EsyKoWMZOO4MX1cTnQvFj/KgQSTonYv1UOC2
	 ZTa3FzfXFwR2Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Messier <alex@me.ssier.org>
Cc: Luca Weiss <luca@lucaweiss.eu>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Describe more hardware of the HTC One (M8)
Date: Sun,  5 Jul 2026 15:57:50 -0500
Message-ID: <178328508264.1157743.6203884354809743670.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
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


On Mon, 06 Apr 2026 01:16:56 -0400, Alexandre Messier wrote:
> Add hardware description for these parts of the HTC One (M8):
> 
>  - Notification LEDs
>  - Bluetooth
>  - NFC
>  - Touchscreen
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
      commit: c11865aa07e8a1b1b3c50b995f7175312a4045a8
[2/4] ARM: dts: qcom: msm8974pro-htc-m8: add NFC support
      commit: 858e8a50ba0c0c9caa45f25dfbbb8b6bb26154b0
[3/4] ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth pins
      commit: 132a69d4092737d35470adc0f9c89fc68caf6288
[4/4] ARM: dts: qcom: msm8974pro-htc-m8: add touchscreen
      commit: 811a24b0ec0c3ec74dbe324c390b75a2b92571ea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

