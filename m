Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC72F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7wkVZ1Bo7lhBsl16bopYNjIwYG+VnaoOeZZghkb8Oo=; b=ukc3p7TVycAvJsAnrdpfWtVWfL
	GZ7yHiAcuWJso6nIdvPH23+fkg0SB2D9e8g4gD04pBye6cAKhefcP5RE42priaXrAw83myVIjdvQK
	doIpvCf5xDZAu/bW7Xwg6bVs4PwUWiRhU9Zp/Bbh5clTSPt0zZmz0JnqBw7O7yuFOc9n2BSq/NU3Y
	u+CoQPO53yqUtuVUB9sshYg/RMuzDW4f2tNAKr+606pGGqhe+YkZPfN8vjtwqV+J6piSjAaFkGV/6
	haMNHBfLnS5qUcMelCqqqHzj5ShK2Za7noqEjAhm45KiAeY2z/8r/2w5+nbuLdlkOid/uj5egHNBa
	S96yaF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJNm-00000002nuS-1bkU;
	Fri, 06 Mar 2026 00:49:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJNl-00000002nuK-05kK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:49:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3615E60128;
	Fri,  6 Mar 2026 00:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AC6C116C6;
	Fri,  6 Mar 2026 00:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772758171;
	bh=5A5Yia5OYLhpJCA/C/eC/7f0iO9+TomhzVwGDZoNhvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VmSIkcp9pf7hAh8fBXfNRO7uexpwCS64qEGv0cm98HL9jgdIhv9xNJWjQfrd4ETP+
	 oKLDoHF048TPDfPcbo8Xqo9iswfY0FoShoZwkckBGrvGFbJ4bRUNHqsGl4d7xr3Wtg
	 qzm8i9uDBrGuZJuK7jxrO5z+lVsjzDi5wI1V7K1cv3MIVuwp062t8JSdldb8Xv1tSN
	 tbp8THxPkjm0RX/0yhSA5wRsBVFN/M0/m8G79RwMSRYbwVS19yd5kCmSqttwb3l5PP
	 H+bVoWHhppHRQbvrsqp6PWhJh3PdDhogL9qX481F0M7yMvUuV1o3EDuu6BP3v1dg5J
	 boZ2MPVR9FYBA==
Date: Thu, 5 Mar 2026 18:49:31 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Herve Codina <herve.codina@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] dt-bindings: usb: atmel,at91sam9rl-udc: convert
 to DT schema
Message-ID: <20260306004931.GA875708-robh@kernel.org>
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-4-6d6a615c9c47@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224-atmel-usb-v2-4-6d6a615c9c47@gmail.com>
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

On Tue, Feb 24, 2026 at 01:13:01PM +0000, Charan Pedumuru wrote:
> Convert Atmel High-Speed USB Device Controller (USBA) binding to DT schema.
> Changes during conversion:
> - Include "#address-cells" and "#size-cells" in the properties since they
>   are required by existing in-tree DTS definitions.

The DTS files are wrong unless there are child nodes and there aren't. 
Drop those.

