Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72A5FD4F31
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZN1VPCNDJBnyVae1JXlGP3zwuJgIv7U5JmcIu6+2aQ=; b=s0BUbtJ6XBhxFZ+pucagSim9/a
	QrJDPKEcAuTbLcgyIr0NPnaCDOYMefrJGpToO6VtsKCTuT8r9u5DuFEDt/sj2MMG/3+2d+GrQxDYP
	a6oILLFdGB4Mt7/p+NKL5bIYU82WD0B2QzF2mBpt9FkK/+NHLMBTIIlxjfHDbga/6vUZdn607iowp
	xzG8BLkmbpjbNUaWF51HQYQPhjTBD/W88Vz9QtEGpBwa39wLa2iZtJVFSzvE8BPQ263LfkBC3644/
	dZGVNCMTrL5+EvIwpvQRrcdr3F0yZE2xJaMsao5oT0zw17yLE2Jqt89XfBdiC++cOIKpDk19cVDYD
	L+Iq6DzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02x6-0000000ABbI-3W2R;
	Tue, 10 Mar 2026 19:41:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w02x2-0000000ABZa-1YRF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07680445A1;
	Tue, 10 Mar 2026 19:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A799C2BCB0;
	Tue, 10 Mar 2026 19:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773171666;
	bh=VHLDxVEfpFap8ExrVtZQHAWAnOhE6qoyz8I5ymlzcVA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ffs/zfmyAb/NGz+7KkRXysxhmryLJTWI+lj0cyr0TBPbJVJq/swryCAYnI1Kl3xzy
	 juULVsbdf+tYbC4wJDO27DFEWHFGytLAAKz3/kp5kZWd/WewGjOtrY2HOsQM+nTyKi
	 Bqcj2gx+NO7RLGI7vvkzoVA9VeICAPpsTQSmsqHOSGXAxYrpsYd/VAj6FljxhkZSRN
	 PLyrweThdivoH9954OI/e4yGqzmWWlP7QqEq8obQOgKQQCnDWDAkgGFmC60z9ji0ZW
	 WCQy6sLWGIS4qk+ZsTkAUEz6KlRe46k6thEOFZOf6Vpw1d7wSobgNUBJ/yz1KqFUmi
	 O9bzqg+pFu1XQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260302152724.3197587-1-wens@kernel.org>
References: <20260302152724.3197587-1-wens@kernel.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: allwinner: sun55i-t527: avaota-a1:
 Enable LEDs
Message-Id: <177317166417.379398.16412478026363950825.b4-ty@kernel.org>
Date: Wed, 11 Mar 2026 03:41:04 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_124108_459390_824F3CB4 
X-CRM114-Status: UNSURE (   7.25  )
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

On Mon, 02 Mar 2026 23:27:19 +0800, Chen-Yu Tsai wrote:
> This is v2 of my A523 LED controller enablement series.
> 
> Changes since v1:
> - Rebased onto next-20260226 to get rid of unmerged context
> - Collected tags
> - Link to v1:
>   https://lore.kernel.org/linux-sunxi/20260225160828.1687643-1-wens@kernel.org/
> 
> [...]

Applied to sunxi/dt-for-7.1 in local tree, thanks!

[1/3] dt-bindings: leds: sun50i-a100: Add compatible for Allwinner A523 SoC
      commit: 7cb259eacc08df8e5d1b17e6a75a19518e5de7ca
[2/3] arm64: dts: allwinner: sun55i-a523: Add LED controller
      commit: 24cd5a81771d8213abb7494245a7f320a6e75e52
[3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Enable LEDs
      commit: cc68a8a3f89c18bdbce33a449c31e6467a3cbcfa

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


