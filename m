Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6144FC5908
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z1g4wqLyTQS3xuFSlY18fCh3hd3kKpbAyjhSueHM6bQ=; b=0s1dKVIVA2TTU0Pw1qLrcEwQIk
	dkZpY0f7y6/YNZ6MYeH80bvRySO1KCnSRCLFhFfBEFY9SCr2tY+JsXpyyOoT5/qGodx4Iv07sdO7h
	2giIKIPpfwBjoQZveQKXECEUDWJkkZm+njx5vPTIss6JKN3NlX67AfjFKS5w1YUS24ixiYjbaaIL5
	IvEl5fXTKsb1N5mzSwwXscS3uO9aGv31uMHhURM4y7nOzWSoTdDYNwUUtUcdtLCciv6Pl4bd/Yr6o
	DLtYLzUw43oL7mUxtEWi2UEMII7SEu+nF9T3ciQi8KX7Iq4KkF5nF/UT5pwrEoLhceFB1SZQfKszR
	BaA+VEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW3I-00000005asf-1VlH;
	Thu, 26 Feb 2026 07:44:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW3F-00000005asJ-2hac
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 07:44:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A9ABC44589;
	Thu, 26 Feb 2026 07:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01532C19425;
	Thu, 26 Feb 2026 07:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772091888;
	bh=BAJW1pkkJkdB9Hftla0w6vh2oS0fQJVtk41GNO1eC+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1s/ljrs45DZiI2VP2FWaQts6aCnHBhP6Sa9eMSEZFRXZAsYUe+Bk3zDrug1APmk6
	 YU8xdtEC08g5oZ6/Tw62ML+PbHooL00yMLMBKhJ6pvcQEguuB6d/iLiRJVNNpKMWuu
	 wPhLSZK/btLv4ewrhOiN+JYkSZi/4jX+emH2AV7GCwoPGh94KWa/vhqEdMuWR+511M
	 y0w4eWqmnNgFrIj5Vsj3qdKl6WrVZm1foJWKPXj6gq6Af4bSsLLnHu3UYXR5jH6Kya
	 a4g4XEE1C8H0rRPFJUy1QqeAtrQU2pTmXn8GLFWBsL56juoZox9V0DUNPzJE0VJXob
	 /zxKAAvZCAB9Q==
Date: Thu, 26 Feb 2026 08:44:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
	linux@armlinux.org.uk, ebiggers@google.com, martin.petersen@oracle.com, ardb@kernel.org, 
	tytso@mit.edu, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] dt-bindings: display: bridge:
 microchip,sam9x75-lvds: document SAMA7D65 binding
Message-ID: <20260226-lean-elk-of-excellence-9b95c9@quoll>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-3-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225085430.480052-3-manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234449_752754_E1FA736A 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Wed, Feb 25, 2026 at 02:24:26PM +0530, Manikandan Muralidharan wrote:
> Update the microchip LVDS bridge device tree bindings to support the
> SAMA7D65 SoC LVDS controller
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../bindings/display/bridge/microchip,sam9x75-lvds.yaml     | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>

A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


