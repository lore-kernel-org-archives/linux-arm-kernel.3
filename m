Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D32E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TXfosdHxWzZaEypjWPpipb8hgGL4yAgVGrh6Eaaxrc=; b=w+/64knL4BedHgP5l5sSDs+ZGj
	1Bgu7WKxu/BxF4uDssIU18RToMh8p+Bp7/+0x+BJrb0b/qSYyP6mgjwybAlyqLAOV9B16RxtFXzUd
	JYByag3tQmrvYOvJKpvfJMy4y8rOKh6BI46RLw7TRNK7BVf5NK7gqXYYv/uXEtu8mPucY9oF5FS2B
	LlqoEuhxPyyUEiAzTgoG23V8bD27AUz/MQ0fWsxdCh/ETeOWmBO2YjUSWaOjoSREBmQ1l3g28LdEI
	m+aDcdR6w2T6Seqqdbt7+5CbXZAuvj6LhUalKfs35PuRbSBeERAHxds5Yk+AC4ZvCzijq75cSkcsa
	EXCuqHKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIiY-0000000ELqj-0A9h;
	Wed, 11 Dec 2024 09:09:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLIh1-0000000ELPy-2TDx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 09:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85B545C66A4;
	Wed, 11 Dec 2024 09:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A093C4CED2;
	Wed, 11 Dec 2024 09:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733908058;
	bh=kdr44ZFWALRmzKhMErBMYbgtszA9aLiO1WmwzyljX3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uI/kqwyG+FFyXV+CgtZw1SWrkPw34oK5VtLRyCuT8SoaGPshxdbxzYtjJwPY7V3Xg
	 gUPcrXVrJspTB48Beev7OGYq3+Rr2giH2z2P57WG8xBnt8J1goTqC2wo/0rUar82fI
	 P9ldaJhmDXutm0RMgsJxqGAuhWrxrnlBai5HC1Cq6XNWsXePtSbw8uDk0asBiDgeHP
	 krU2f+cilkMNqRQzPVRdHeJSI0IZhorJKRo4py1C/Sj2yrY+EH4HH4dJgy9d7ZCse4
	 XlMkzGyX38Og3BPuw+iZIQNnWq1lXJT4S1EpSnm6Q0c9RTFCv8zDR7KWJyNhKPxZfx
	 GIIMHJH4GmY0w==
Date: Wed, 11 Dec 2024 10:07:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, festevam@gmail.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, frank.li@nxp.com, aisheng.dong@nxp.com, daniel.baluta@gmail.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, 
	a.fatoum@pengutronix.de
Subject: Re: [PATCH v3 4/6] dt-bindings: clock: imx8mp: Add syscon compatible
Message-ID: <247owlllg4dzqdk2sead5xb33x5pclkrhuvnthdepem3dwrecf@xauk2um726he>
References: <20241210125338.104959-1-daniel.baluta@nxp.com>
 <20241210125338.104959-5-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210125338.104959-5-daniel.baluta@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_010739_667448_5C37BC06 
X-CRM114-Status: UNSURE (   8.20  )
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

On Tue, Dec 10, 2024 at 02:53:36PM +0200, Daniel Baluta wrote:
> imx8mp audiomix contains a set of registers used to control
> the DSP.
> 
> The dsp will use this to acquire o reference to audiomix registers
> and handle the registers to control the dsp.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


