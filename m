Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7EFCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/TJbkbNcIP+34h6WKZ3j067D2LMEqHDkJ6A2IJsxBc=; b=EKuECh9XOWaCmh/lBcbhmttaAr
	p1L1XnSZFQiaZVB1/iwJ9meWR5S2dSc8RL6c+gO9mTNhOtV1vxvyBLDa7y7Jp1HB7zHUoP+q+rFGh
	vrdK98dmv+4TJsCjqQ//xDB9C7xy6T1BM28PZAAaEhh6j0ZiRh0OGRgFIWFEA+/BGPyLGGN5njkp9
	H+7Vya4VJWBwISVQ3njew9u2JbMPLteXSb2JC5EZ+bXws8iMZcp3N45o8HsYQZUvVlg3KfLXQ2Arv
	syDnejP3RPBn10YGUtjy2/rAumvDbxbmMhwaavrYyums4j2+yN2Vt5k+xFb3AQReZH7AzYmBQz8pR
	fdV16VcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yUy-00000001FIS-3n77;
	Wed, 15 Oct 2025 10:12:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8yUw-00000001FHZ-0lk5;
	Wed, 15 Oct 2025 10:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4/TJbkbNcIP+34h6WKZ3j067D2LMEqHDkJ6A2IJsxBc=; b=eug41aCqDldzaScKOKUV7/Rg7w
	0jrGwAyMIwFTW+Pp5kT0s6W8hF+GGtIt90EQet9buCCBjTxxFXSlsjINvcNxi3p6xjlMZHXn032X7
	BVuXphfzbqNfasqNrYKg0R2s6amdN2HFT3HFzqsSGgdnnBLhGz4gR+3lfVSizOL0mpoUliiX62otZ
	VUw8JJGsBAmBVlWsMMBSqG0JOeriBCB4hIntoSja8AWu9XzpC5ZbhhLkLF3AQOWWwvZLvfi7hfUjO
	Q6jEAxUjpSCgQ8gbVQXf5OLOljoQVZ800r1IVjSIKekoRgSrDyIXKiQph84jhlQl489vMdzZrQ/q0
	1jQi9Wpw==;
Received: from i53875a40.versanet.de ([83.135.90.64] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8yUt-0006Sa-Uf; Wed, 15 Oct 2025 12:12:43 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 zhangqing@rock-chips.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com
Subject: Re: [PATCH v1 4/5] dt-bindings: clock: Add support for rockchip pvtpll
Date: Wed, 15 Oct 2025 12:12:42 +0200
Message-ID: <15582760.tv2OnDr8pf@diego>
In-Reply-To: <20251015091325.71333-5-zhangqing@rock-chips.com>
References: <20251015091325.71333-1-zhangqing@rock-chips.com>
 <20251015091325.71333-5-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_031246_225939_B29D4C22 
X-CRM114-Status: UNSURE (   7.96  )
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

Hi Elaine,

Am Mittwoch, 15. Oktober 2025, 11:13:24 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Elaine Zhang:
> Add pvtpll documentation for rockchip.

as in patch1, please provide more information, especially when introducing
new concepts (the pvtpll here)

> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>


Thanks
Heiko



