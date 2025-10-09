Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D913CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6ACtx8K5ELfcY1TTxJGZIcOKwGynF4reWJYI1DQV6M=; b=Z7meYZZsHptxG0Mo8OTEFAH2YP
	FNKqp39eD5N6kEyXD/LJ5Xjt2QObP6Z9NSobs9DvQLJ2WL5l7JFmmBZpIPmPu5XbrPAQ3l+qHCNz2
	U69oDNHnElqhLlDobRInnCreN2C7QFPNWSwYkyEumhlSPCsWsmphrS57FLJ24uof0h6Uc5OwO5/vH
	Pawpl3GzjbRDV3sXk6vlBDxKe3ZDZ29H6+oR35Jap/23TK6MijuIfOSJ9alYHC3veh5mCehVD9/mS
	0Y76zWN2VImStlwYasMIbcMpNj39yUHeBRlOOEpQQbahCm20ucCPSDak+KKyjGDyYVeoH5nHaz+qE
	JNJUjAuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6v0N-00000006sKl-3Y4J;
	Thu, 09 Oct 2025 18:04:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6v0K-00000006sJy-3Niv;
	Thu, 09 Oct 2025 18:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C10240BC2;
	Thu,  9 Oct 2025 18:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEC8C4CEE7;
	Thu,  9 Oct 2025 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760033080;
	bh=pUktu/XMfXsy/eSkVcdI+gYii0wE1oveGYK2smdz49M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdLgH3BbksVEA9FZD0slE7fnR4aQ+SIahZQhyf/UBaMADqDNp4h217AYisXOEn1bo
	 pSXw2iwE5RNjnB6DYpBsvcA+RkB0OftqXrI8/M2hIs9XxBpln/URmbmAxFnFkD3tlc
	 WH0P0P7hUjDh6LRU6DQkJ4bzaMtdgJpphW+PAu1gN2ZzPE8CEb+df0ft+NMrYZlmT8
	 +cbcvv9nBM5Thy2QBSxnPRHg09/q+et2oJ0DvC9kqc+IOFm2AYhcxGG2MwVSE57+r5
	 HpGDAshhuWamgqbHIDKIf1nfy5qRXfGJCf11AmVu0GSE0SfDfYp6XdIQFAlz5NtzOx
	 lZt/cTrnJ3hMg==
Date: Thu, 9 Oct 2025 13:04:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 02/19] dt-bindings: clock: Add Amlogic A4 PLL clock
 controller
Message-ID: <176003307797.2941718.3816797856531029196.robh@kernel.org>
References: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
 <20250930-a4_a5_add_clock_driver-v1-2-a9acf7951589@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-a4_a5_add_clock_driver-v1-2-a9acf7951589@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_110440_863829_A0CA65C6 
X-CRM114-Status: UNSURE (   7.63  )
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


On Tue, 30 Sep 2025 17:37:15 +0800, Chuan Liu wrote:
> Add the PLL clock controller dt-bindings for Amlogic A4 SoC family.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,a4-pll-clkc.yaml        | 61 ++++++++++++++++++++++
>  include/dt-bindings/clock/amlogic,a4-pll-clkc.h    | 15 ++++++
>  2 files changed, 76 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


