Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D04AFA3751
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 22:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZBOWvDx/6HZEwz83icnllSXTETOBGGFJ8TG0RS6EK/0=; b=ZYaY76bH3MpJlPJdhaUd5S9DwS
	lfTTnHTxykjY7iNbJP/nwAJrxn8IwinNQSJ1GgQbL5yCt44swxq7iDHBe3uOiq16O01olDRk1X7oq
	BAQqqzyq++Ruhihppl612GFJYv/QsgD4tyvlcIyywLcEHKTIB1IMG3iQ7as7nNtCEL0eL7k8v7NOG
	KZV38I9+tYb1+S4Sjm4CxCsX0RFrZMgyu/LCQBBEQXLeuUBx2CgPYPQ0bFGbjDWmR9gOSUEhzamD9
	scs6FOfsg9UmtJQertM7pj+ZDbtFzeUx2SmpLWw0YFdP9LoZuwB4YvJuNCVXKye03xVYqeClKLYgv
	lXJaGJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbnWt-00000008kjp-3t4R;
	Fri, 02 Jan 2026 22:21:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbnWs-00000008kji-3LbJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 22:21:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 36F536013C;
	Fri,  2 Jan 2026 22:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5462C116B1;
	Fri,  2 Jan 2026 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767392513;
	bh=EuNLzlV8r8Dinon10Riipi7R88Xe9qFlOj4ZVceZa/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWZIKhNzEB80owCh/NWA4FrrPhPUfGz+puZjrw8cTOivwCmVTN7FiN1qN2uq3tGLD
	 BU+ZidiHrcuNI0SXFvSXTlaHrn3H7r6ulyI4j/xdxZ3bOQf6LVzB8AnzSLwMIyVsL/
	 deUWsv25lpeSkvqG+qAPpFMio3XMsSYZUXjp9C5Gyw0vdoaggt3Hmz3BiXJX0Sf+k3
	 L9lo3f95n4SO3vkg7iOITUpU9aENXWUHriiiJm0Tgnub1b9y4PQKO/D8dXUGXQ7j7Q
	 F9B3Btu6p87Jw4d8lMSVhSfXB3WFuNtJ64IkbUbq3SvD5c358O7KzYGYIpUlvVuj3P
	 5A/4M+uKOfrFg==
Date: Fri, 2 Jan 2026 16:21:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: pinctrl: sunxi: Allow pinmux
 sub-pattern with leading numbers
Message-ID: <176739251233.279904.10109675432814007356.robh@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-3-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225103616.3203473-3-wens@kernel.org>
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


On Thu, 25 Dec 2025 18:36:13 +0800, Chen-Yu Tsai wrote:
> The pattern for pinmux node names is typically the peripheral name and
> instance number, followed by pingroup name if there are multiple options.
> 
> Normally the instance number is directly appended to the peripheral
> name, like "mmc0" or "i2c2". But if the peripheral name ends with a
> number, then it becomes confusing.
> 
> On the A20, the PS2 interface controller has two instances. This
> produces pinmux node names like "ps2-0-pins". Make the sub-pattern
> "[0-9]-" valid to fit this pattern. Avoid having to confusing "ps20-pins"
> name.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


