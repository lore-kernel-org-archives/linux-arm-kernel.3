Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50338E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PyjGKLKAJTf6S3Uc9h3ViuxcDS+9AJHuIPpv0ED+JI=; b=UvksIVmuL4rFEtiK4DiAam+5T+
	Hv7Lo1pdwo6FAL85tD93wc8buEHUkKg+pLy1LDBeXHdw81HrIBO2t+IdRlTE/CS7jCcyLvsvHxqpe
	c2bGJb1RGFhf+ARu4w3X1+NtxTRk7NXwfm0rrT+9syp3cVKtbVZY6s92MOiruP8r2O4GT4beY5bM5
	3L/NdjKU2Y2PY8dT/dptpkgIqRyfNPsE5PQuAozl8wOzF16HxbbLUBrUeXvFH1qcfXbMIJ7KVkm9P
	Hw2VBgAQRA5puGAyjgPIAu+qad7AUBAXhb034cuOqpUuHH5+aQrgK2nzmzI5UyQsAmTjP2Wqq+tWs
	M04mz+pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5Bj-0000000HJjY-0m4L;
	Fri, 27 Dec 2024 07:55:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5AY-0000000HJYm-0Y6V;
	Fri, 27 Dec 2024 07:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91FEFA41239;
	Fri, 27 Dec 2024 07:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C94FC4CED0;
	Fri, 27 Dec 2024 07:54:00 +0000 (UTC)
Date: Fri, 27 Dec 2024 08:53:57 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 10/17] dt-bindings: display: rockchip: analogix-dp:
 Add support to get panel from the DP AUX bus
Message-ID: <uwzrv4jgqqx6ge3lh3if37qvb6w7ubkusohunbn7ukmq5tt6du@e5fwoik4tex2>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-11-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_235402_239766_777B873E 
X-CRM114-Status: UNSURE (   9.37  )
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

On Thu, Dec 26, 2024 at 02:33:06PM +0800, Damon Ding wrote:
> According to Documentation/devicetree/bindings/display/dp-aux-bus.yaml,
> it is a good way to get panel through the DP AUX bus.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> Changes in v4:
> - Move the dt-bindings commit before related driver commits


Changelog does not go to commit msg.

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also and (probably) fix more warnings. Some warnings can be
ignored, especially from --strict run, but the code here looks like it
needs a fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


