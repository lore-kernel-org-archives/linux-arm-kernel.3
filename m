Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86FCC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 17:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlhDt/yC1Egn2eN7Q2hGVZpFuOehwTKgrlJxgj4jP+0=; b=hmC3QuDnO98mVUHCnYy/ow8f8B
	Exdn/zlPkpeafb5qZkUbpi2A+54binF9cMEUN/ryXaYUTFDr+3CjEpXGFDgAKikq/Pi+Hz13nLMI+
	OetNyV32vA3RKjo2RteDZDhlXLzMzmdOG5qNRw0PuNa/6i/AnoIUm7YtJ5q9UbrGwxFt0ZShKTYjp
	wkRscbMu2w6UsUIuUMPJnPuwKCI/Z5V/2Vqa7OMf5YTXSqmkqdQWosQW5qDUexCk6pQzCQB1LFTHZ
	C1dQrk59po8/VDRNGoZpNDeocLanM4Pj7TXW/BGHdzggK/FzB+VrgyCaYP6DgMhgojdkxZ0wokalr
	SyjA9GYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm9Z-0000000ByfR-2p8R;
	Thu, 13 Mar 2025 17:15:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslr0-0000000BtgU-30IP;
	Thu, 13 Mar 2025 16:56:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E0B65C6054;
	Thu, 13 Mar 2025 16:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2B1C4CEDD;
	Thu, 13 Mar 2025 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741884977;
	bh=AOqMFoSF7wMysKxflwNKrdVJb6TkuN/Bi0bZXKPBIh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ukcXNXJLHYRqcpTN+7GEvlB0tlcsMOtTkmRUmB1pLqLoD8psS4WALY6g24l08QA+R
	 jn0qfvPXOnMOVAP0B4h0iuk8doOWpACR61KEJx0ek1FUIhMxYijGqq5JN4Gdy1JPCC
	 /VBJCOoEttl1XOaQLfuKvVzwdDwqh9ptGxHvg5CFyECteetU3TI92+ZbgPJR7uGP2/
	 DlXyPAgnDcM8/YbkUUxp3WlNCyid6t29oLLRvlXT7dX5deilt0FWxmHvNkhlXgVLWo
	 EA8zUDgg/apH6bCsV7nMEOs/esKmfX7Py1b7ws1yY1k1cnTmDCu80wyRv1Y3Yl6/rU
	 c/H61qRSciuyA==
From: Lee Jones <lee@kernel.org>
To: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250306123809.273655-2-amadeus@jmu.edu.cn>
References: <20250306123809.273655-1-amadeus@jmu.edu.cn>
 <20250306123809.273655-2-amadeus@jmu.edu.cn>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: mfd: syscon: Add rk3528
 QoS register compatible
Message-Id: <174188497549.3792331.5613971273362591228.b4-ty@kernel.org>
Date: Thu, 13 Mar 2025 16:56:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_095618_793515_BA9DD1A1 
X-CRM114-Status: UNSURE (   4.44  )
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

On Thu, 06 Mar 2025 20:38:08 +0800, Chukun Pan wrote:
> Document rk3528 compatible for QoS registers.
> 
> 

Applied, thanks!

[1/2] dt-bindings: mfd: syscon: Add rk3528 QoS register compatible
      commit: 1c313607416052414ce94bc9bb27b688741cb30d

--
Lee Jones [李琼斯]


