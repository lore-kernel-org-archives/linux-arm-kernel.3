Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BC7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUQc63ZSqLYqu5x+OVH4DZV+PY3biEigmwd9eR3q1gE=; b=26KbF6A7TVjE1Zs5KiMWUpNIz2
	vhb2PG1HDi//tWH3tCfyE/HJzwZNjfNYMaCcOorIno6EeqsS3GvOssnVgAOHycxWM0ACbfy3MNz5G
	JkUxes3lLmacJFwNK04YLoIS2ziRvZJx6AmA5VJoTgcEYxDjpKWtxOjYE2bcK4FSh7cbhzNWqAigc
	nTUg30Or4T9QwdtcnfZkDI+qZ5olYRRxYfgxGselAYS29z6VB22t3Hj+iH+5PHbUn81NamDjEpG2Z
	NBIUksHTi6omlAN3wa5xjrdzvASdUbqkbzELXMjvmIVOSIPCQPpWkl1ddDHuqmozdmLoPGHtb6Y0w
	6V5NWyIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGdF-0000000FqyJ-2VHu;
	Fri, 27 Jun 2025 21:29:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGWz-0000000FqCe-1rK8;
	Fri, 27 Jun 2025 21:22:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88B5961435;
	Fri, 27 Jun 2025 21:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24855C4CEE3;
	Fri, 27 Jun 2025 21:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059364;
	bh=f/Hjt44z5eQtUir5T1oW77jFYNUvVS0e+aUkWqb1azU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcBllNNALh/S23+GMaSDwmJr3LC2G/WQrNYvN2TZ9DuEQ3WU3uGjD1MP5+GwVvhP9
	 Qi0IK9xq81jM1WJoA+xKJQGG2gPJZzz7gfanv99rv7smAQzg3os9J3y/Ccaf7w+eKq
	 vnKJWTf/nxT9R5g6va1mhj+8WdoqItsn2lUTIPjmiOTZkai2H7/bCFu9cEx2ah2QQh
	 NEj0p+B3E/i41U4JQ6ihAAuDQ7w9S3kXo0vApRZxq8s/8+4+PBPtf6LCN+sD1XjgQA
	 DSMx0jCwiPzWFM6ZukJbNYR8xygxZwSZixb8+VbqGbLfhRzrd9MqYOUnBwTZc+knc7
	 eb0Vii0FyvAmg==
Date: Fri, 27 Jun 2025 16:22:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: Russell King <linux@armlinux.org.uk>, linux-serial@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 02/11] dt-bindings: interrupt-controller:
 mediatek,mt6577-sysirq: add MT6572
Message-ID: <175105936297.165672.12493055283897899399.robh@kernel.org>
References: <20250626-mt6572-v2-0-f7f842196986@proton.me>
 <20250626-mt6572-v2-2-f7f842196986@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-mt6572-v2-2-f7f842196986@proton.me>
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


On Thu, 26 Jun 2025 11:53:55 +0300, Max Shevchenko wrote:
> Add a compatible string for sysirq on the MT6572 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  .../devicetree/bindings/interrupt-controller/mediatek,mt6577-sysirq.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


