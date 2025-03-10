Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CE8C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2/foQcyGg17zdbQh7oHp2efHSIFYAn/SlsZpuP7wXc=; b=2gvq+hYZ+pKwpKcfRI4toPYnQW
	u1V7nhbd079BFZPv73oYtLfdWHpV+hkE8a1eFQC7JeMQ6tQeaYKRNuXjlnR58wOXfQFjiBSimfB6o
	vcWgu1o2WdFAfHsuV/ebWEC0BZny0q6GvsfFJTD3KPsavZamXw0IoeWGhYujzQed0HmcNvXRlX1xm
	XjxGY2wWeBJCse3TN5xWntbxyRhevy2Vp2noWkaKHup2tL8LdHp24MGWijwBfZ/fbEGAFok7fM1vL
	BjTgj3xzEzNQExg6G7H/OziqbO17bVKHVzN2DG2kQxI4C5ql3RVn5+ONMXPdyCSHTVwOM5etaidML
	HWnZfs7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXzV-00000001ozj-0ujD;
	Mon, 10 Mar 2025 07:56:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXxq-00000001oOh-3IUs;
	Mon, 10 Mar 2025 07:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 477045C5945;
	Mon, 10 Mar 2025 07:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0263C4CEE5;
	Mon, 10 Mar 2025 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741593257;
	bh=IxPWphu3F+xLc4GiSypSOK76zaVHnRzhR45Z6VPd2NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQkIKmyFW93JJq+SgIA7Kse9XO9YgQMLKEKIqMmNnJSQgaZQ3nXDievCakMRQjSg4
	 z3hShvH+sQJGvYnAmuIrM1a3q6k2kop5itpDaYBvhABLaKfd4LXUaGU6UEiZf8uWIn
	 18W+/DjHirhmrCHl6zXDOZpoRmWfC1Tx4bgobW2s9J+04wO6DR6aztFTpOxOyTMpVf
	 KP2OQLwmA8Flik0e5pfZZj/QkkZ+v4XkeHamrJJupxPXofgO1Kkt0IRTnXpk4pZUUF
	 Ti4HK/VcgbT9uKGsxiFGRrwIRmzxZetqXTWEKsDBQatp+DDi4SNgEssK5pJf8FTZ+D
	 Vx+Zxv1IOq4rw==
Date: Mon, 10 Mar 2025 08:54:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 03/13] dt-bindings: soc: airoha: add SCU SSR Serdes port
 binding
Message-ID: <20250310-ultraviolet-earthworm-of-honor-df114b@krzk-bin>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250309132959.19045-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_005418_886102_94C9AC70 
X-CRM114-Status: GOOD (  11.79  )
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

On Sun, Mar 09, 2025 at 02:29:34PM +0100, Christian Marangi wrote:
> Add Airoha AN7581 SCU SSR Serdes port binding to define what mode is
> supported by each Serdes port. These special binding are needed to
> identify and provide the port mode from any user driver.
> 
> These modes are mutually exclusive and driver needs to correctly
> validate the current mode for the Serdes port in use.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  MAINTAINERS                              |  6 ++++++
>  include/dt-bindings/soc/airoha,scu-ssr.h | 24 ++++++++++++++++++++++++

This should be squashed with the binding for the device.

Best regards,
Krzysztof


