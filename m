Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B946CD5B174
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 20:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MZtKP2RrIUXN9pyE62MBtmmVucdQ4kYHAvrSr+HDH0=; b=MRvNLSO3CXhf1yV1JLvZ/2bXOT
	a7xueSEp35Z/4y7VWYQHjzzc+/PujMeloMANqyujXTwoIevUwVDcSBH8a3gZiQGE4mDOhyOMzvkB6
	GygD6kx4AF/mbEwcKvxW31mf3OeVjoJJyXKP3SQJZ15NqFsz6RQsejxzd8W+WTNrIHMOp4m2x2LCN
	Se/jdMGY5DvDqheIPt3QHONUc1V4BExSz0EAMyEip6O5VH+YUnYkEK6Sqxf8m4v6+7tyj12Ylxexr
	VUFDo591ntL7kwEqrO8BjmFogHqoZ2KHb2t4V0bsVGFQAG6I0r6NtNzfQCf1GmaWJWlEzmLrx2m6P
	jrDyES4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVF82-00000004DyG-3eD5;
	Mon, 15 Dec 2025 20:25:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVF80-00000004Dxq-2k93
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 20:25:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D505140707
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 20:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A621FC4CEF5;
	Mon, 15 Dec 2025 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765830306;
	bh=jP5lpq2LOwmvTnRrKT+DTVLnvpu/X1E0EgAQfBfTPjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V3haMYzTwBediby/Zlpwk73gzH8c7YCuBsd+sjuPkmIE1HqQqMnVR9vx/R4CpthaV
	 4dbGA55/7yNth+KvT+zzkmCFk+3VajD697ZkE1kEsfNp1670sbotjoOEVUSTTre43a
	 /JZglQ3LC4kOnkg2s9Mm0r8AEWMg3hhJT/x+LxlOGFCHKMu9aIZVwr2jNxQ/NMZpxZ
	 ySk5U2fehv11Hnvy9CkPkMgGVVGddZRH/B84py0pnCtSarwzgjXAtmxprzMWL0It6R
	 V+a+tLqqFfDFWrwXQf1TL2YBacOuwzcVbgk+5TxYTJ1vR0bSnQO0IZ9xKoGz7fVnfH
	 bak50MNCNelWw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@kernel.org,
	Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
Date: Mon, 15 Dec 2025 21:25:01 +0100
Message-ID: <176583027654.110616.5692785131178789330.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251211-ixp4xx-actiontec-dts-fix-v1-1-97af8e79d474@kernel.org>
References: <20251211-ixp4xx-actiontec-dts-fix-v1-1-97af8e79d474@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=589; i=krzk@kernel.org; h=from:subject:message-id; bh=VNvTpX+IUbbw98YtQo9u9OYa7rAUIxvWwHWSIiGXWMY=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQG6dGZTh4EYSxcWG1fiiStGGW0Z4P53VixfgZ FFNEMwoAbmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUBunQAKCRDBN2bmhouD 1xbdD/93MMebgxboaOJNU1uqaz4LHEgiXi79N5FWPyR9ybg4CT/8ImF4vmVr63M1d/Lv47BNlF/ dNF6nP35kIRSCEBqWYJ5ZJwZAqyoOADHbbmN6l/iRO9g8TnZWR2TAFwSHxjJQ0yaCkWXnz1RzvY 8S4qXylPaf6tI88O/vFhoZ4cJOEvxIGXLTx75aYR+WZEBvo8mPHAw0yD6g+kyBtGVL2GHwVGi7I unFPuCeqqu8JdzE9dqqOtYTLTDJ/sQesNO8R856tSXBANRgjHPXR0dLHFmVMbaizsttAWISsNPy elYRuXk28IPKQZFgXju4m+9+vxhP5/GhC2VKvuqeE5EqpBylcy+csYZ2Fak57x0FWC1CEIz0J+w skfdMcR7w5i6ygtFk1jZ5K7c60XBhm+u3ldykVY1OLEVsVcTXlJRein44IG1sCUv+I9mbTDrfl4 QAriUvHX28hLnMd8xuszjKvEgPbXgORx7hmS3MVplCrQEdRG0EpunTv1CgXSP++ESuLerwfWae7 0ltJCVMe3vgGISjyASTBkxXGnd9hKH/1+uIsuda1ANIUQrsMcM8MO5s9xdzk1fQFQFwGaWNI2gy ZAgu/PV0wiGboDLhUyfGziUhSgEVaFcFl5CGX/anIvrQqHbtqfKox6ppA2rkIbyNSyQKqrg0sOj laePeDGTL9mGhG
 g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_122508_714422_BD68C8FA 
X-CRM114-Status: UNSURE (   9.92  )
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


On Thu, 11 Dec 2025 14:05:01 +0100, Linus Walleij wrote:
> The KS8995 switch was unconditionally wired to EthC (eth1)
> on both MI424WR variants, this is wrong: the D revision has
> the switch connected to EthB (eth0) so pull this assingment
> out of the generic MI424WR DTSI file and make it a property
> of the respective variants instead.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
      https://git.kernel.org/soc/soc/c/ececfba255bf3616301419e47a5c824e04b60ab8

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

