Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A042E9B250
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gwFRH1gFdIUq41yq9cBVoAk9nzKeFtvkVkYMAu1Oo8=; b=GSza3Sbl3ju/mDaPfVUxLD6ehi
	fb+ol3sLzBBsOB+ILtWFj4AmdTdEwU/uu0Zo1s1aHKV7VlCrgT/GEjN8fhLmvBfEvT9w9ae2hvbHZ
	+mOikvCdnzAmcOU4PA0ztRSLrmQMZzfiV52o25Y5VatMAtGOfuRb7HyJm7Zeg3hiYHwgwa9qBVXTN
	hfYxFYp3bUCtef8Fh/gitA7vZRX74Wv2OSks9l1rPFK0zgQBEOw5buuwsULCuu9StYu6Ia9NSARHZ
	T3G/as41zVEBYZqphJ5G+jgzK8JMjTINP3pmA9E3v2p7oOX1shT20zCqgZ/dUHUaJdHHm3YuyMPFz
	DMSYZnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqpi-0000000203v-1GEI;
	Tue, 24 Feb 2026 11:44:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqpg-0000000203b-0FgF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:44:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5021C44385;
	Tue, 24 Feb 2026 11:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3F0C19424;
	Tue, 24 Feb 2026 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771933443;
	bh=VWMbw5u8A4droiuhmQwd+aULLH4cHJyizo2SxbHh2R4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=luKvveXDX54Jxe+c+E6c9rdADIpUOmKyPtDlnqPh+8EH7sw9zOH1xxU1Q+rxdcgvB
	 o4Lbp/JZg9Tgb8A1S3E67Lt8D5pGrDyje4k6TC1AvmwDGHtH1GzLY0mUQFCd/PWvJP
	 wezb3VVbE3OlT1tHBCzKKQ5Ju3f/fy9RBqxE8BmhV1h+XoskuRDdISafIXvNVl2ZOn
	 ftIU9kRlvXZQUNRW7e9nw6bON5qvYFgwLm2NV1luDyMjCh9UGLrDG0/Xe1wBRNViVH
	 G3uo+ZKKnXtzLM7sVV/hDcUJZrFMLHEvsVmjnzm1j+iRlRPixuMzVujflTmhh8pEX4
	 ZvtgWPt0wbbcA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, 
 Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 pjsin865@coasia.com, gwk1013@coasia.com, bread@coasia.com, 
 jspark@coasia.com, limjh0823@coasia.com, lightwise@coasia.com, 
 hgkim05@coasia.com, mingyoungbo@coasia.com, shradha.t@samsung.com, 
 swathi.ks@samsung.com, kenkim@coasia.com, kitak81.kim@samsung.com
In-Reply-To: <20251119131302.79088-1-ravi.patel@samsung.com>
References: <CGME20251119131424epcas5p44eb0d15d8ba28d94152dbbea23e32714@epcas5p4.samsung.com>
 <20251119131302.79088-1-ravi.patel@samsung.com>
Subject: Re: [PATCH v2 0/3] Add basic device tree support for the Axis
 ARTPEC-9 SoC
Message-Id: <177193343795.72471.8737899847600826075.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:43:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_034404_134834_157B7662 
X-CRM114-Status: UNSURE (   8.23  )
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


On Wed, 19 Nov 2025 18:42:59 +0530, Ravi Patel wrote:
> Add basic device tree support for the Axis ARTPEC-9 SoC
> which contains 6-core Cortex-A55 CPU and other several IPs.
> This SoC is an Axis-designed chipset used in surveillance camera products.
> 
> This ARTPEC-9 SoC has a variety of Samsung-specific IP blocks and
> Axis-specific IP blocks and SoC is manufactured by Samsung Foundry.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: axis: Add ARTPEC-9 alfred board
      https://git.kernel.org/krzk/linux/c/7b43a16c48fe761480ddb0312e6727d0f5fb0b4a
[2/3] arm64: dts: exynos: axis: Add initial ARTPEC-9 SoC support
      https://git.kernel.org/krzk/linux/c/3ae2b7442cb878c8b38fc39855f89e47ba43c405
[3/3] arm64: dts: axis: Add ARTPEC-9 Alfred board support
      https://git.kernel.org/krzk/linux/c/b567d42112a2b38c186b37f7ffb2e36fc567e442

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


