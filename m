Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F68CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 18:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gaZVoYZh/DeywsMdRAGvKGBBjxuFtSLH97k3RMBvBnw=; b=NqkvpaF9VLuydklf8L4YiIuBAw
	W8UIghgZZeSGaPAcuOWUEmIYo7gpt13MotMt3mD65CrfB5MdJRj78yInWx8ifQkXy408/7fZAoBfH
	wYdcxuY4KaS9ZkTdNH5holD1U9YdkD+POqA+k/0s32sOkQHBzKwGTIrhzNyiqrEapyBCkVbTflntF
	Qm2BlnV+RCd9ZWXBopLQXOZr7qSoi4Q6scFQzruP/YZjxRr7oQKm1gfvt/+U2zYdSZPpsz2Qc9zl1
	l9scuOOfzIkdmDYZy5VxcQFSl4jJSq2/CgUNg0oSa2kkvmx8D6wLsOYGrXua/LRZQKH4yx4cKALwd
	RD6AePCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQI-0000000H8uj-0gUH;
	Tue, 14 Oct 2025 18:06:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jQF-0000000H8sM-3mL0;
	Tue, 14 Oct 2025 18:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gaZVoYZh/DeywsMdRAGvKGBBjxuFtSLH97k3RMBvBnw=; b=vHauQUbQQaphdvNiOk1IoaB9P+
	83Q2gMIGw2vLjQMIj/Mj6PYxeP3CbcoPAJYlNkEa1yRF6hE3BORFsUzPKp6sKm5f3IAV+k0d0Lw6u
	zJYw2oyM98Fbo0YZ8eUfwPsn47BOAIGtmWdcA278NBr8LG6N3R2IyIR2jTpMYVBIj/gyIZLUaGKGT
	6GFehC6zmjj1rB8CGffFmiasATUCLKu8D59nrlWpSTUD/CToe5ZaREE8GPpaFtksCQnzqK6wcYiHx
	gg4hPc9e+Ncol2m2s7AOxLOsCzfSJybaX3s4jAbJaYQqI0nnV6e30sMIaDITBy5ytNCcfJL7+YUUo
	3Rz9kdhg==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8jQ8-0001Gj-C7; Tue, 14 Oct 2025 20:06:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yifeng Zhao <yifeng.zhao@rock-chips.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Remove non-functioning CPU OPPs from RK3576
Date: Tue, 14 Oct 2025 20:06:30 +0200
Message-ID: <176046473174.1662867.8203194428926902068.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009-rk3576_opp-v1-1-67f073a7323f@gmail.com>
References: <20251009-rk3576_opp-v1-1-67f073a7323f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_110655_961276_E16B285F 
X-CRM114-Status: GOOD (  12.19  )
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


On Thu, 09 Oct 2025 16:34:01 +0400, Alexey Charkov wrote:
> Drop the top-frequency OPPs from both the LITTLE and big CPU clusters on
> RK3576, as neither the opensource TF-A [1] nor the recent (after v1.08)
> binary BL31 images provided by Rockchip expose those.
> 
> This fixes the problem [2] when the cpufreq governor tries to jump
> directly to the highest-frequency OPP, which results in a failed SCMI call
> leaving the system stuck at the previous OPP before the attempted change.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Remove non-functioning CPU OPPs from RK3576
      commit: 05b80cd1f37db042e074ecc7ee0d39869fed2f52

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

