Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE25C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQnvBKTkEiMX3rxlz+/DiIhL/4xHaH5LdGAIChHO01M=; b=ccBg3PjqsyT66JdX+gl+a+OyUP
	jIDVPnyjjtEaOfSL+rIqxFEz+TTXlXWhNisG0IyEjK+Z09qho54lBX2SimeaWD8l0yGSz9zcFy7Cy
	mcTkPAlDyqT+E2VXTVPCCkB2AaiF2oMk8N/qQB/p8XK8WwZbxmMWKwgnq8QywFq9g9SYqWkN5Ndp2
	pOQdHHsaEOajf0rzvdG2K7eLxcNfNF+Cfn9/gfkvCRnxS7Mx1JXmrGUBnO+k4CImjRKujlHDa4rHP
	KfWu8rILngoS5JY70drOhrRJKLkqZiw0pM+luvUATE4kGBThtQ0LcVi60bEms5EBE6sCPLTOJTnJN
	cq9lEzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt03v-0000000A9SY-3znD;
	Sun, 09 Aug 2026 09:43:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt03u-0000000A9Rm-1hxB;
	Sun, 09 Aug 2026 09:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=aQnvBKTkEiMX3rxlz+/DiIhL/4xHaH5LdGAIChHO01M=; b=1W7GFneyTR+K9iQbkgC9h9Ck0g
	fOZI14liwQ4hgLTWRSey8gFHN9sdlZswm3Ao9Hbvv5PD6n4WlIjbHs4u5VDyDytZ3SHgGnlW0IulS
	vqF1ZB2zJihz/WVGuTU4jtLhcag0Gi0wwBWMNI692R4v1j86hnk1bIk9oRThCT00FGjRW5AUYiMmp
	TJy7IS4UzJCHOesKOn1jo0dHN6pwg1rkLgyRI0ovrP6YX/W+P5gkC0TsqgE2zfWkC9Ugplo7bdzMG
	CHNHs79twMyMsB9V9tfHylPztJ/QK2ms+0uF3TEYYXa9WDt26whX0QHtWpHrKKasAMoe8YTKOvTd2
	G/nY2MIw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linusw@kernel.org>, Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Simon Glass <sjg@chromium.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Sun, 09 Aug 2026 11:43:17 +0200
Message-ID: <19061465.tv2OnDr8pf@diego>
In-Reply-To: <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
References: <20260729132736.3807082-1-sjg@chromium.org>
 <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_024322_447000_F8CEFB8D 
X-CRM114-Status: UNSURE (   7.20  )
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

Am Mittwoch, 29. Juli 2026, 15:27:27 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Simon Glass:
> Add the compatible for the pin controller of the Rockchip RV1106 and
> its RV1103 package variant.
>=20
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



