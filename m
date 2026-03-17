Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32C79F33809
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nl0pqemJvo3Er4isuze0tL6iYHBAFTWkuKSYVi6LmaU=; b=mng1kq5k1BnvF2m15d4pVdXGaw
	O3JFcCfVT8xpReC5vi7GSc2OU5J3KfNpd09L2xsJBLRYkK9wmgzXyFqcqvoiBz5pxzbtlDm40nozz
	GbBmsVe06gF5KcaztWx2+d91p3buTN4y3QBPg7+iOtorcubwgBZhcnqj2goF6lRRr6Ns/GgQAiTRa
	9TXfveXwhWovyytMqRj81zbGR1FKOrvOY1WU1Kebxcc74x+NlveSrkLYgdQLbX5y4iP74haAVuTPc
	W9OP4vJFhAVXz8w90SURfF/kLGp79eRvdJBpkxCU6mqP7RlPAa0k3wJ1iycmTDXxaHfxZLKCHBOJh
	IyeLpJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PA0-00000005f0B-0pPZ;
	Tue, 17 Mar 2026 07:48:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P9y-00000005f00-2oSi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B53660018;
	Tue, 17 Mar 2026 07:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2159C19424;
	Tue, 17 Mar 2026 07:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773733693;
	bh=azG9yf+rqDVRcCgN41tgr864FUR7sxO4tFc1Tow86m0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGsDgrDhfEU/tOIVK2bJzaX9vtMCDRASm14jgp30vStaRs4t9qV5Vumo8vq9K6u+m
	 V44WzpMSV9iqkxHtMD3NoN3L6HhuvhxUQHJtwhkoKNJrDG0MTY++y5ro8t5bbmjHgt
	 CrhOaRFUp9LbO+VwB4uV6bdZqJDwWx8xvoo5tio6zBP/tdlXGkUkWVgImeydLTRigP
	 qcySAK4DVnPNO7g6G0RP9eVNjSZ0O6JZ8cgR9b1jQlVnve5K1Uh5fQk33XdOLG8Osc
	 gaDRMvMtRP6SNboFjGi0egdczVxtFWPjryCutfmJ1VMenIsIcJHmgyMYp+IKYsKsgh
	 liyf3DaauKgZA==
Date: Tue, 17 Mar 2026 08:48:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] dt: bindings: arm: add bindings for TQMa95xxLA
Message-ID: <20260317-fair-cocky-centipede-aac1c7@quoll>
References: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316150535.786122-1-alexander.stein@ew.tq-group.com>
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

On Mon, Mar 16, 2026 at 04:04:51PM +0100, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> TQMa95xxLA is a SOM using NXP i.MX95 CPU. MBa95xxCA is a carrier
> reference design / starter kit board.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxla/
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


