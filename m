Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB4BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=es7niYB2+IhqqCx9+g38agFwRtbyIo/hZ/LZ4TFZjRc=; b=tmxuZN4A4U4ivu+LAUsXPIiIeU
	S0rUL57PIXy5Xz21dX54NsAcnoM2vOrzPD39LTL9vHAT+g22hmSZjJ7629VBTCmH07TeFVI5AzRJz
	PynADllDfsSgO9qEezU8QeJci0hhH2HgPYQBW6SdgPtfsEjwOSSx5LkIDWZictwWGHKPM8T73+WBv
	khwf7B6l2l7ghOos8DBF+weondyj5fiuYwuDMmRJUy9osjV5JOdfSUopaNt9/6ioLyLTQs2Py1OZx
	m3hDE5533QaQIKoXYkr6T3EdlVsnxsr9Z1V0ZkMDsg3zSSeqzW+Q80t1Io6JEvw9z7YYwiILc7FPy
	EhAd2XnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzs94-00000005J5w-1ZRS;
	Wed, 02 Apr 2025 07:04:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzs7J-00000005Iwe-0kKy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 669AB5C6592;
	Wed,  2 Apr 2025 07:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3940BC4CEDD;
	Wed,  2 Apr 2025 07:02:26 +0000 (UTC)
Date: Wed, 2 Apr 2025 09:02:23 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	thomas.fossati@linaro.org, Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com, S32@nxp.com, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: Add NXP System Timer Module
Message-ID: <20250402-omniscient-quick-gibbon-bcea3a@krzk-bin>
References: <20250401224644.3389181-1-daniel.lezcano@linaro.org>
 <20250401224644.3389181-2-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250401224644.3389181-2-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_000229_310418_65D6C561 
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

On Wed, Apr 02, 2025 at 12:46:41AM +0200, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,s32g2-stm.yaml         | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,s32g2-stm.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


