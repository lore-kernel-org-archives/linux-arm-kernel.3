Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571E0EB4914
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 12:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kht88UPCcdjdbb6rQuHUzPbMAe23E6O8r/InhqpgmxU=; b=vSMe5rEVlMAbCx8nUWLKs7FktJ
	768INZdpIZJkek//5j2Omhxe4xQnF/+M8sOe/sgvf0nn3YwTu+6pcUUHRnhDOoSUIPXgdprUgiTZM
	KfVtTEsTqIgRdN1Gw2J7nHyoN+GbVxxi/tVoO/BD7CNqSshpWcR+QhI8qFD5rF5SCwR7ZQCo9Nlxs
	3qxqUwACAPJUE6tflo3RMqeBT88zj0K+SwLfFeFgheUTLtTQLvc6CmIXj8Srp/9owmB1neu9scEkY
	MzVDvAZwcB/pi+fOm4DEBgU7Z26/mtLGp2RmR10p+dTdM2xKcuUVe0kQCxxga8lv2TeyzMH25LOQH
	qrcoqLZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVRG-000000023CB-20zA;
	Thu, 12 Feb 2026 12:04:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqVRF-000000023Bw-38EL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 12:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3577F60010;
	Thu, 12 Feb 2026 12:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D37C4CEF7;
	Thu, 12 Feb 2026 12:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770897892;
	bh=kht88UPCcdjdbb6rQuHUzPbMAe23E6O8r/InhqpgmxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0PET97JMWnNsbWb8sMeIktf1PCJX/diLa57FzC0jnO4/BfMovkQu4BOxoSU3CkQj
	 RxT4IWzS+AM7DVAcdWc23j6ieZWkS58KsnK/YZfV6K5+3toQjQEFMc6tQGyfj8rHG/
	 A5egrQ+9x9EU0H8piDN/Q5UbGwrlXyszIdLMoSpi9JamfFDxaMygg9YcvOHDAKoCNb
	 9Z/In5/F7poyxSp2acmhPtZbBkoQ7RL/LtAANv7150gy8Dx3Oq96z2+FfyBjtRN7CK
	 scFf1WDRH7AYi4lvwGvt5U3/1c6BbFp7BRNA+nAtT+hnSTblVbyMdauRbnyfCYCfxb
	 FaeEqXLhZB3iQ==
Date: Thu, 12 Feb 2026 13:04:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, shengjiu.wang@gmail.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
Message-ID: <20260212-incredible-smart-honeybee-7203a8@quoll>
References: <20260212053036.2581083-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260212053036.2581083-1-chancel.liu@nxp.com>
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

On Thu, Feb 12, 2026 at 02:30:36PM +0900, Chancel Liu wrote:
> This machine driver can parse DAI format from format property. Add
> "dsp_a" because it's one of the DAI formats this driver can support.

Since when it can support it? Maybe driver is wrong? What are the
differences?

Maybe there was a reason this was rejected in the first place?

You have commit msg to explain all this.

Best regards,
Krzysztof


