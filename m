Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48328E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NJrbkQJkI1xv+OUVeGfrZiJ7cWmeqGSWJu7omnSgZA=; b=pILfdse2t25HYT0xNpkpZZH5P0
	QpD+Qrif5TSls44wd3yQwFacf3ODz9bNUJkHNTdF3lm6IFH8KgoNWbvaCWRmGMFqdAaA1pX+ZB4sO
	YrYIwWr5wNbp2U8sPX86cupzMZm2JdF+ZNYjDSlo/eAhvrHTNTmKxeNehwNARJdzLZ3PO0o/WRe5F
	KWBBkysNvxYx35YY6h/slRqAbD8ck/xHPjH1Qc90DEAAKH370WXaKvoyRgOzY5M2VobXGLw6M+W2G
	ygmEJBUySvRermdrpZV2dt0M597ymaXw5kDLhVDJw/7vx/fsyrJf24wq9GSgZwsOo83Un6ldvbcIF
	T9HW4tQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR6Od-0000000HSqL-3iVr;
	Fri, 27 Dec 2024 09:12:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR6NR-0000000HSgS-0i43;
	Fri, 27 Dec 2024 09:11:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B99D5C5A77;
	Fri, 27 Dec 2024 09:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819FDC4CED0;
	Fri, 27 Dec 2024 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735290684;
	bh=88ElJIqFyOFuJ3+w4V018XORRbvyV0TPA3MTIY3utmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rAQzgFZxDNdkx1KvuVMeKjmdRfubGJakH3dLvTMlIYyfkY2wGUfuLQXeYr1jFMYsx
	 TNgyRw2fVnLe+35Cj1qvwKPWMkidxFcIsdLFbFXlyxgbKwC5yUEPGTsPE2iBru+QaV
	 kPVTStjPVWctNmYZOADNERBQ3a3tpk/xfcfJzgu01bw13KHOYDoQLriEBgK7RwXIvb
	 zaFfiLS1mA5g/JXUQe9WfHZxckrQe/khdVsMGB4XTP8T3Xh69WJd3DXnQv2M0LM3jn
	 ejo5uD7/xNBANteVfgIIj1NPF+E4eC5vo0RJ5LmVAoaqCe4lUE9v2INEdLLr4V9KWZ
	 qlAIiGo7RUHHw==
Date: Fri, 27 Dec 2024 10:11:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>, 
	Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: add per-SoC compatibles for
 keypad nodes
Message-ID: <fvefi22ycl2tryz3hfkqp5ji4w75tdup235vdvbqs6b5uly2ia@i7efazaxu2eb>
References: <20241225192631.25017-1-val@packett.cool>
 <20241225192631.25017-3-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241225192631.25017-3-val@packett.cool>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_011125_258524_C9687E73 
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

On Wed, Dec 25, 2024 at 04:26:20PM -0300, Val Packett wrote:
> The mt6779-keypad binding specifies using a compatible for the
> actual SoC before the generic MT6779 one.
> 
> Fixes: a8013418d35c ("arm64: dts: mediatek: mt8183: add keyboard node")
> Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")

Not really a fix... or describe the bug.

Best regards,
Krzysztof


