Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52C7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OV5vokNxg0blL37suXlq+pnS8+wa1U1T+EP+IjunwO8=; b=Brkr8e8NQ3q5a4yN27ulAsJ2d1
	zQQXow6Gc7qS66nR32pp5MfAkqU8VXee199d+XqaxJv82EZisFAMV9jlAZu/3ELZpyYYYZwiSFCVN
	muOY/s28SYtkAWlraSOj/ghJMveFpm4b9S/YQ3zUbM/dJQ0IvOZgw3rEBFPrnD/E4YgljXLdp0gt8
	oengFIgAGjk9urfmGOUq2ZIzjZDj01M1edJwlgKEKjdmiJCrbfYEqAFvQQKHZqd1Pb0gQoat/S9Xa
	GXwnqdQUvHlDHCmOXW6mCn877v03TBiGphza8STQdiJNtzgBn+fhl13+Y+IdUxLzn9KcDRYkIXb3u
	FOhTTFXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCjF-0000000HCmo-2sqP;
	Tue, 21 Oct 2025 13:48:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCjD-0000000HCm3-2dLE;
	Tue, 21 Oct 2025 13:48:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=OV5vokNxg0blL37suXlq+pnS8+wa1U1T+EP+IjunwO8=; b=viqO8nEJsR2dnoqQ3yy40W5YJl
	fQPaH0avx6D9pZGte/+v0/qL88fiddfjMlSb0jOSR7NWLOZN3bNbz6pCf8aQ0WtGZsjS7xZXyzM6m
	KW9/Bmo/RnhsGKdt66tsjrpRAKydOktAk7DKIE5DY97anYkYfFNWvSzuSR6WnfD7/9l5F1ggMizIr
	ZvVrihP0tbG2nYws3v67xbCL6tbBz09N7tqeNT/kRvPWEUR8t/mxWAiyJ8N9oI6Putl9eqPX4Dzul
	RTXonT1BVGLVeRRzGccpX270sSAKcQC/hPhu/uiHrNxlY1r//Tg9o8OvdycNSs9/ZNmmow3g9mTOd
	J9SrNpjg==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBCjB-0003ae-81; Tue, 21 Oct 2025 15:48:41 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 zhangqing@rock-chips.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 finley.xiao@rock-chips.com
Subject: Re: [PATCH v4 4/7] dt-bindings: clock: Add support for rockchip pvtpll
Date: Tue, 21 Oct 2025 15:48:40 +0200
Message-ID: <2168478.KlZ2vcFHjT@phil>
In-Reply-To: <20251021065232.2201500-5-zhangqing@rock-chips.com>
References: <20251021065232.2201500-1-zhangqing@rock-chips.com>
 <20251021065232.2201500-5-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_064843_707534_109473E9 
X-CRM114-Status: GOOD (  10.67  )
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

Am Dienstag, 21. Oktober 2025, 08:52:29 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Elaine Zhang:

> +  rockchip,cru:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      Phandle to the main Clock and Reset Unit (CRU) controller.
> +      Required for PVTPLLs that need to interact with the main CRU
> +      for clock management operations.
> +

I don't think we want a whole syscon exposing the whole CRU unit to the
whole world, see comments in the pvtpll driver patch.

Thanks
Heiko



