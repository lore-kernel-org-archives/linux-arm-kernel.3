Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110CFCDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 11:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soCCb/qqcor7YOsqcDgZpD4kqOQExcgQHIU/hxZoPnY=; b=o5JcCKbGZ/iDkDd5PaCbeM9/Mj
	TUfxElawu9mG2GxerG6F3qCpYfqTIbSZ9FnOkxHydvCvuBmhjVE+JR/0yLaS0MwA71dfdkuyfHEry
	AD0CqbyzqKeEvywsdHYPSnWs6HQVqEEQmVMnni0/nhRVqo517JvGN6XnKkh0ru5h9/WYa4DzQbpMR
	VEIRpNUknUWOIgo52PMPnb4pJ2NAkStx8Rd2igMp5hbtSsNDAYO0RisxI85NWeA4KTpDqK3Qes7tb
	NGsmZ2WmPNQ+tnfe+mxkWTSDUubUvKRnmW9cvd3axJ+Dwc8T5zQMDM02kJffdXrxtb2zyIU4ITJTW
	FyBLVSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcQi-00000004s4F-3LgK;
	Mon, 22 Jun 2026 11:03:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbcQh-00000004s3x-41Hw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 11:03:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1DCD6001A;
	Mon, 22 Jun 2026 11:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BBF1F000E9;
	Mon, 22 Jun 2026 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782126182;
	bh=soCCb/qqcor7YOsqcDgZpD4kqOQExcgQHIU/hxZoPnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cUuWXWvvFScX3vy2Lk1wKqpow2Zs9ZYXoikPy5C6W5tbFCu2SRdG3YnaiOsAKg//4
	 dFIXSXeDBzxwCXrwPWi3qwz6kSEubHpik5M5VKneb/zCcrPxN+TSkxFwQtyZDNKsm1
	 BjDXupe4EH+0dGL16Uswz8RZEhLUykLy2DZfzM8GOGO1H6vKgjLoI7ZYmdWteS91wU
	 ZMn+js6raYOT38MILewRnhqvRolEEx5pXyTFirmMo/7mz6q0BM7ozBTIfFSOvEjE2P
	 2gykRRSsR53SGY2kuppFumaSUUwwgA4KjBULaOjWk8EDiswboRD83xZa9moml+6dzs
	 NGtjRRVVjCyPA==
Date: Mon, 22 Jun 2026 13:02:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	jay.buddhabhatti@amd.com, harini.katakam@amd.com, m.tretter@pengutronix.de, 
	radhey.shyam.pandey@amd.com, abin.joseph@amd.com, kees@kernel.org, 
	sakari.ailus@linux.intel.com, git@amd.com, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/3] dt-bindings: dma: xilinx: Add optional resets
 property for ZDMA
Message-ID: <20260622-ubiquitous-emerald-manul-daa5bb@quoll>
References: <20260618071056.2024286-1-nagendra.golla@amd.com>
 <20260618071056.2024286-2-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260618071056.2024286-2-nagendra.golla@amd.com>
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

On Thu, Jun 18, 2026 at 12:40:54PM +0530, Golla Nagendra wrote:
> From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
>=20
> Newer SoCs such as Versal Gen2 and Versal=E2=80=91Net expose a reset line
> for ZDMA. Older SoCs do not have this provision. Add an optional
> resets property to describe this reset.

It should be then restricted further per each variant/device in
allOf:if:then: (see example-schema for syntax - ": false").

>=20
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> Co-developed-by: Golla Nagendra <nagendra.golla@amd.com>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>

Best regards,
Krzysztof


