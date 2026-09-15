Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FA6C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peUB3B18l4lyQfhHuicbvVQNXVBg/C0FGCKWZf1/1fc=; b=w4UrFLsARqmsZ6gAVUP5uif33d
	KAkg1DlLxutsm0/vtUscyGDYZi2n+iSXNh0pbxCSSh1GyVdHrt2wiOHfwArO/lNC8YgIC73jCfL+y
	4k59RRCAzxCj7TVev5qhEqFjE0ZVKia2vThRQ7MeIF+L8KXA8yXwpTpTZ1eE11k5pdzlgJCvu1o1o
	IwF93oTRe3Cva9bYdIFFLA1Z5a1frAIlQVecuCQiLgR3kbdCY7RHF2Ez2vdCdkh4sDG7N826PDCw+
	x8puM9AIgedHYFIPNvA01eJBsq+ZBqxqzN3rpvZqaFZ425s+Ottw7x3twVrZWWcVv/mVI2coDIg3m
	CGs89q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qo0-000000061Q0-4BEf;
	Tue, 15 Sep 2026 10:54:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qny-000000061PZ-1KX5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 10:54:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E08B600D1;
	Tue, 15 Sep 2026 10:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281E01F000FF;
	Tue, 15 Sep 2026 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469665;
	bh=peUB3B18l4lyQfhHuicbvVQNXVBg/C0FGCKWZf1/1fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X5zNmVnRQSsJBTqjsAW5rxsQrHPW2u1QYsGy4AyDpJlfAMRBXhngQQ85zedqvmxAN
	 GlQ5NZUmPHa8jLgIVWNTYDrIOraP5vQ9Mr3bQrDmWroQ3sbIqzpF/w0oguGSZGVdCM
	 h6HvSSZ2X/NBq41PW9pluJr2lnSiiYup2tpM8+BPtm9Gdn+GYIVjkinpnhzh/uiM7n
	 eWlARKgtK8fveRNglaKbZg15TtDoVyUJfnT36QtKn0gbRvs6VvR0QSKEi6wEDI9JsK
	 JoAESWILugur//jnbbsocwKrDana2fB2fu5JK6pNNKyBpTXB4aafmLXrVdBOjcIHfr
	 cWHxOSPpPRNSA==
Date: Tue, 15 Sep 2026 12:54:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, 
	Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add parsing of hogs
Message-ID: <20260915-tactful-nano-gerbil-b58a82@quoll>
References: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
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

On Mon, Sep 14, 2026 at 10:51:54AM +0200, Michal Simek wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs the same way
> it is done by commit 545908a9fb9c ("dt-bindings: gpio-mmio: Support
> hogs") and commit e8f2ca6be61f ("dt-bindings: gpio: ast2400-gpio: Add
> hogs parsing").
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


