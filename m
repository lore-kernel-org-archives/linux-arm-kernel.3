Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35201C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 16:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nXjUxHvh2AKmCSXEKPK0rOosDRgT/rdBSCg1T+PDfU=; b=xtbqIMHN0C9hcW+3Yddl9Tw3fQ
	A0xypXs7StAinPO2K8LseCPJvd1Tln7keM/cjKtxdDKPRVkci7uE75CSUvj+RDkRnM/7RX6NNLA4A
	5uOGn18xbj1t8Owzrt4FHcmcnpLFXxIyjVmIaOTyHus6gkCVDsuTFxlThoY4bFfJ2isE7y5sGSv8Y
	/OCa0RMigFuX8Aala3Z7K0eMj63sd8rVK5E9mecndvZWxr40/9DJUCdznzE/hIk7ZyWUiw0YcvmSL
	RNHh7aDBEBkX0Ywyru3y6Tla9fLtC99BQ+L97RlUA87ceEX7OeUdYD0BCNm199sbna7QsxRCfuAyP
	6wfbhz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wial6-00000006hP2-0H0r;
	Sat, 11 Jul 2026 16:40:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wial2-00000006hOF-3uv9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 16:40:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 630956132C;
	Sat, 11 Jul 2026 16:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6081F00A3D;
	Sat, 11 Jul 2026 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783788052;
	bh=/nXjUxHvh2AKmCSXEKPK0rOosDRgT/rdBSCg1T+PDfU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=S2+CotMA0Bb7urH4A+ORnHE4LkYPwov2V6laV8UHYb1N9uNPxP7HdNXTM5aUVgY+d
	 UtOra0XEKshGE5Ol0aQ9g1Fu/TxeWnSqN9n1er4w068ga+vif/ML3kgCP/CzO73Nhx
	 le+LeefxYO1eUR0lZk/W8WRrI1pmW5W+HxiI6mgVLJkH03A87hxE20fDo6tqXwlqoT
	 i7OH1wLFKnAyHciXkS1AX9P/H68CwpE4kc1UjHiSAolCqUjk1fu6RI1p0K6zEoLjoF
	 tJypR6ICGXFdWE4nTFRYKeqm6L+dHoE9p3H1aq1aUXPidShRtsozvNLi8xsY/OWPWq
	 V0h0Gt+vwTp8w==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Barnabas Czeman <barnabas.czeman@mainlining.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: clock: Replace bouncing emails
Date: Sat, 11 Jul 2026 11:40:38 -0500
Message-ID: <178378800452.138068.4635491218835073358.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260623073050.36262-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Tue, 23 Jun 2026 09:30:51 +0200, Krzysztof Kozlowski wrote:
> Replace permanently bouncing email addresses (550 5.1.1 Recipient address
> rejected) of Adam Skladowski, Chanho Park, Anusha Rao and Sireesh
> Kodali.  There are no new messages from them via other email addresses,
> so drop them permanently.  Add Alim Akhtar to Samsung ExynosAutov9 SoC
> clocks, because he looks at other Samsung clock hardware and drivers.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: clock: Replace bouncing emails
      commit: 1aa4e2ed7caafbbbedff89fb226a982413469baf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

