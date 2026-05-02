Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64DBCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 23:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfILjtLnryyVkFeL+4YyfSAyo9v1cIId1IUMbHc/7qg=; b=C3+KdgKsNooua4tROuQpO5Abxe
	I6ZfnlMQlx+Vnkv1TErhjx3S5FmzM77ZVblyViewFTfApIJS49ocpb3vZoiGCsH3dkwRPylD51uRI
	Dov9PhD75SjRXTTvJDpLc1bFQLBI+O0TSh9dlLDhf6gkwFGukjtiugyb6a+VYdE0l10uQh+txXksC
	yDORlIIwP0deT8JcG62i/I8A03ug9COHSZfW7NVIvpo9kpRCHhqH56H9+O+YmIpj+2xeJYuVCPmzt
	YlTd42ZpJJSxgE7v530fiAOwNhzdeLYj3nWm+t89N5R+ddXzaRNPT54kvcFb0NQcds0u2esvOeFW1
	vYQn/+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJJvx-00000009uML-38yM;
	Sat, 02 May 2026 23:39:41 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJJvu-00000009uLX-3amY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 23:39:40 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g7PWn37rZz9t65;
	Sun,  3 May 2026 01:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777765173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pfILjtLnryyVkFeL+4YyfSAyo9v1cIId1IUMbHc/7qg=;
	b=d9HOVMyV+ERwC0R89d4h1I+F8HG5GYp0N9FSJCr2qXU/85Mb48wp+DZY6TjAd/2swt5u5C
	tVJH8rRunB3zDWvh6WFYsLGlR5//5UycBAO8mb6rUH5l3diyGRU9V/hymox+LdbP4PpGSd
	1yhmMEJMi3hIsmC1Ec6dPh/Z3eAu572dnzoJDF5tW9ML6Y644St7vPz7cOnhR6up7AyX65
	TXTz5na3KrzEAk/1WFVpJUKWgMFX1ZqZsiQDuB9MHQwydulYZjh8OWUhHRkboMHuaOP1Cb
	Taxgx3XRXrpP+BhbCMSLGqL6APU2oYlKF5XY+kCKLC+23+K8JabFMNBeIX48YQ==
Message-ID: <380861ce-b832-4789-93fa-c2340ce487e6@mailbox.org>
Date: Sun, 3 May 2026 01:39:27 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 6/7] arm64: dts: renesas: r8a779md: Add Renesas R-Car
 R8A779MD M3Le DTs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-7-marek.vasut+renesas@mailbox.org>
 <20260429221153.GD132396@killaraus.ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260429221153.GD132396@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: rcrxobjd51jeq56ffsfaa15qkptt7r43
X-MBO-RS-ID: 3e84285b24ac2565bce
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_163939_056289_219D65F0 
X-CRM114-Status: GOOD (  12.23  )
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

On 4/30/26 12:11 AM, Laurent Pinchart wrote:

Hello Laurent,

>> +/delete-node/ &vin4csi20;
>> +/delete-node/ &vin5csi20;
>> +/delete-node/ &vin6csi20;
>> +/delete-node/ &vin7csi20;
>> +/delete-node/ &xhci0;
>> +
>> +&du {
>> +	compatible = "renesas,du-r8a779md";
>> +	renesas,cmms = <&cmm0>, <&cmm3>;
> 
> Shouldn't you then also delete the cmm1 node ?

Please see my reply to [PATCH 1/7] dt-bindings: display: renesas,du: 
Document Renesas R-Car R8A779MD M3Le , the CMM0,1,3 all seems to be on 
the chip and accessible. I think the CMM driver should be aware of the 
IP, even if it is unused, e.g. to bring it into low power state if needed.

> And does the DU still need three clocks and three interrupts ?
The Geist board schematic indicates that DU_DOTCLKIN1 is present on the 
SoC package and is supplied by Xtal X22 on the board, so I think the 
answer is "yes" for the first clock part of your question.

As for the interrupt part, it seems DU1 is present, but not connected. 
That means the DU1 interrupt does exist, but is not going to be used. Do 
you prefer to describe it or leave it out ?

