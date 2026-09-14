Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B99C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q7477PwCU16Z9IZb4Mk21gV/8d3FRlMM3zaJG7AjG+M=; b=tWBht5Z9zj2LSDnWr9zUrQ7TMC
	erljHtTHOKKhrKJ7Jgm+z9rqGGFGmgoEwzFmKHgx1A6HVptLSpd6oTMEJBCT48zsbgRy1kNOSMJpF
	pQn/78KHDWFyS1CiapIVIxdp3x3ZJPidA/h9Y3D+h+BStJSjuS9xFqZIw8hhci6PVjfHn0w5IG/wQ
	y8NAgxNojN46eGfqEQqKtZRx4r+XE3cNeu8GRUyUnNASUXJfWhmXnnu8eHSv+8Ad/9vi7vdk84xjZ
	nM7VKGDKGJpLDyqyK4IHFXk/mMmVJnOUKYaXOi5p0HvCLLQNJXgnSCJV4pvY52H0SQdx8suvWwrfQ
	rJBtii9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62Sa-00000002pxI-1MoR;
	Mon, 14 Sep 2026 08:54:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62SZ-00000002px0-0cPu;
	Mon, 14 Sep 2026 08:54:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F9CC601DE;
	Mon, 14 Sep 2026 08:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B2A1F000FF;
	Mon, 14 Sep 2026 08:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789376082;
	bh=Q7477PwCU16Z9IZb4Mk21gV/8d3FRlMM3zaJG7AjG+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=l5D9arEDmX3lxn0IIAq08RnanpvPAdGwM6Ohxa6FLbp3dGLISLUB5LDnhff7LoWPE
	 u9nKrtxtbvvu8hzQ6tWh/W56gjFRFpHy0rsrfVmMcl2b7R3hNxc6U16XKkKZu1wQG4
	 rL4GneZB/7NaEyejm/7HCe/pMTvpGVohkQc6/e+0EYdvHz7Qfu3XKGmBXjaoHnW91n
	 vH6X/opDPEuKN23CDjY6CRp4B5tAZsWCXIxXGOh/A5dWlilNnYxShoPny4w2ZJAy6Q
	 nJYvTfWdWWHo0Dd/mmcuqUM1vkQIIYJ1OAmqWYwsqw466aanskEo9BnJQODzyv2PkW
	 uBKgFW3Se1+rQ==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yassine Oudjana <y.oudjana@protonmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Artur Rojek
 <contact@artur-rojek.eu>, Frank Li <Frank.Li@nxp.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: input: Use consistent indentation in the
 example
In-Reply-To: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 10:54:38 +0200
Message-ID: <xhkdbecew1acx.fsf@mkorpers-koolstof.csb>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Krzysztof,

Thank you for the patch.

On Sun, Sep 13, 2026 at 14:33, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

For mediatek,mt6779-keypad.yaml,

Reviewed-by: Mattijs Korpershoek <mkorpershoek@kernel.org>


