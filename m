Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C02C83038
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQsBems/5hWpNTZ33ynORtbz6w1hlK70oYohoU/mIwA=; b=XC9nTISjD/BeFiTPr0gCzmd30u
	sFm8PYxiUx1ziAvGsI+CTG/MhF4TPD4f4dA7HV+20NushNnHamvUzmySsbKdYq+IrGBUxfiHh/TIx
	zqe8DLoRuTh1XbkNdjKWRcDYTd25ZweBNVdbEDzii8k0hwb12YtqJSaNBXzEXYgXLuheLWdQS55lg
	w0htAMMChk9+3TNcnhN5Ok683sZBfcbmoibHslYu8Yp5wglmPgx1Wf/w8MN5IfYODHzJj+O/nwh2W
	SxTenfFDp6n6fTNER1KvTHSXWE39ic3dedRBHnr7X8AHz+IqstvHzqffY9DiCfJjZECxeydOacrja
	rEBVbKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Y6-00000009K7H-2p5z;
	Wed, 02 Jul 2025 18:51:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxwY-00000008YE5-08vO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:56:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41D77A536D4;
	Wed,  2 Jul 2025 13:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A3EC4CEE7;
	Wed,  2 Jul 2025 13:56:08 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id DE7D75F949;
	Wed,  2 Jul 2025 21:56:05 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Paul Kocialkowski <paulk@sys-base.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
In-Reply-To: <20250701201534.815513-1-paulk@sys-base.io>
References: <20250701201534.815513-1-paulk@sys-base.io>
Subject: Re: [PATCH 1/2] ARM: dts: sun8i: v3s: Add RGB666 LCD PE pins
 definition
Message-Id: <175146456585.641360.7859504612515623199.b4-ty@csie.org>
Date: Wed, 02 Jul 2025 21:56:05 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_065610_143899_625124BB 
X-CRM114-Status: UNSURE (   7.44  )
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

On Tue, 01 Jul 2025 22:15:33 +0200, Paul Kocialkowski wrote:
> The V3s (and other packages) supports RGB666 LCD output on PE pins.
> 
> 

Applied to sunxi/dt-for-6.17 in local tree, thanks!

[1/2] ARM: dts: sun8i: v3s: Add RGB666 LCD PE pins definition
      commit: fdc0682e1153a6180eaab35033b05ad4ce35b6a5
[2/2] ARM: dts: sun8i: v3: Add RGB666 LCD PD pins definition
      commit: 62ac3b380334ca0be4f7b2b1bfb3dbbaf2efcfa7

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


