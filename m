Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F67DFEC109
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 19:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwAvfPXDMCt8ja7d0m26VFGYqgx0OqUwBSdIzTBeCyw=; b=1Hsq0WmEesSEXuCkReRGKNbDJi
	gom4NSVt+cNs1v9QnZQkD++orovC7q2IWz0+k/s/8d0qN5XwndRTz4iIuBnRU4dmxzR0XpQ8sgzr7
	KQbEKBpL6pjzSeUVQ+lMYzvKZURa6cBjKfE4lu2VdltBUwfHl93q/DSvmWlVveHdmzgSczqZSEeE1
	4tdTY96ehTeuXiai1Tt1CB8n/vLZyx9MPVoenRQTC01LDpNYw7sSRQO6uhU2VbZnji3eRhBpx2jrw
	Xk5AF8Rez4n2MoSJQVq3zdW4/igAR44RzmzkniHZBSvLODFTwm+46W6EE+kQ9JY9n08hPEKg1E2PS
	c0PmQu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pG-00000002B2s-3TxL;
	Tue, 24 Mar 2026 19:54:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w57pE-00000002B0h-0RJE;
	Tue, 24 Mar 2026 19:54:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=kwAvfPXDMCt8ja7d0m26VFGYqgx0OqUwBSdIzTBeCyw=; b=mjnJS0w+A4dDz4hN1NUYQvOTv1
	xM+THQX74LUp1Q90uDyIvDEmHn3znGStftrRLDknGHMqOHRu3SAY+++EErekmTrhPBuLqSFqRRpAY
	Av2WWnYSqId3gQdFaPEpWQP5smma3gPJIV/ulwgjGzMvblvFcJJLWLlzThpX8ydwh0qU2qDsUMWAZ
	62GfAleTpGqsS+fxX9q3EyEPOTKRvxFave6DsQV5o53lMfpmj73Y1+dad6VsrpjpCgVYyoZPOSIcy
	1niq9APKDHTsDk69rJQvrccIIgre/0K3anCIcGJRiwgWTFfnRFG6rd4avWYXtcrFM52lj9kpGQ03z
	QBQNJO7w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kever.yang@rock-chips.com,
	finley.xiao@rock-chips.com,
	w@1wt.eu,
	jonas@kwiboo.se
Subject: Re: [PATCH v2 0/3] Add devicetree nodes for RK3528, RK3562 and RK356x
Date: Tue, 24 Mar 2026 20:53:53 +0100
Message-ID: <177438200690.818857.10167261530248902171.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312213019.13965-1-heiko@sntech.de>
References: <20260312213019.13965-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_125404_191464_690EC256 
X-CRM114-Status: GOOD (  11.02  )
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


On Thu, 12 Mar 2026 22:30:16 +0100, Heiko Stuebner wrote:
> This is a companion series to the binding+driver changes [0], that adds
> the relevant OTP controller nodes to the core SoC devicetrees.
> 
> [0] https://lore.kernel.org/linux-rockchip/20260205211901.490181-1-heiko@sntech.de/T/#t
> 
> changes in v2:
> - rename node-names to be efuse@... following the dt-specfication
>   2.2.2. Generic Names Recommendation
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: rockchip: Enable OTP controller for RK3562
      commit: d7a73e63b9c4c1e31bf7898d45418eaa69790057
[2/3] arm64: dts: rockchip: Enable OTP controller for RK356x
      commit: 2d7b5e1c962158833ef778a09d9293ed710fcc84
[3/3] arm64: dts: rockchip: Enable OTP controller for RK3528
      commit: a956b54f33de96e0d879e679c22a717d390e1afa

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

