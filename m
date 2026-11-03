Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7536082BFF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GnMZLzmF;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=MqjfaUek
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Shr2teq63V8P7ushHBYXKFTTJfhpOja4aluMgZ/Uw+A=; b=GnMZLzmFj1VArEuMpsId2vof8u
	9ocof+xVc/SfoqWKUuzwEIAXNf9rn4N8WRHC7bsNSMDuELdzA1bldFuSNvFbzNn4VGuyz14DUq5Td
	BsUzNTYDeBoGx/d9HLbzC4PZxZUD8WBhV4UjxvZWjw/SGN3+q1BAA/LwOgD3gkAf+Pu+2Af0jItSi
	i86XPoVbPpBWVhU98P0ISWALcktLXh4fi4k+L0Px1G90KVY2vvJMwh3V9t8nezLZ9EiAlfwfvAu9D
	7iwP4LPo4kiabmG2delDi83BlEGNnIewnqvX2GPjB1aU6sOrfk4Tk/9lyGWoZG1xb0xW24pJjHgfk
	Rwont9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHZF-00000003Bnz-2hdo;
	Tue, 03 Nov 2026 16:41:01 +0000
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHZB-00000003BjH-18Pd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:40:59 +0000
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4F8F4780395;
	Tue,  3 Nov 2026 17:40:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1793724051;
	bh=hIo5wKJPZnjho62FTKebqDa+KdYP3W8K2TKY9Ek4sYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqjfaUekQFvuCKTt/CUf1BBopp/kcg5M3iZ87uBtd/nRtKnBJfAp02aoxBl7fM2h3
	 S9tspLtn+2miYvL3O33DMvrKkdk3IixH/NZrAhZFJkJa9lEUDrc3klMlJ2Tu8fPrqP
	 hyG0EmOouYs6CWYUmATZ1eGbbTdIieM0rWBoegQDVorc8DPHVETgHgH1D832uj7jLv
	 4+JPhBMpxsfYp2j/i51/WozlNaSJVSJ3drk3wC3RGqqle3g35vXJCr+ux9j8XjEqzJ
	 eYK24F0ZHgsKICSoFTbPEbbj0DYsIkfrxmMu5K8DKbZ5z3NUcNUkluqP83Epb/BPzS
	 kEIgfY7oOzMvw==
Date: Tue, 3 Nov 2026 17:40:27 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: add the NXP LX2160A RCW pad mux
Message-ID: <auoOe2-9wZhAad87@L30177.local>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-1-0a61a9837744@free.fr>
 <aun5TzN6kWdkr5x-@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aun5TzN6kWdkr5x-@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_084057_728090_C399AEFD 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

> > +      groups:
> > +        items:
> > +          enum: [ iic1, iic2, iic3, iic4, iic5, iic6, xspi1-data74,
> > +                  xspi1-data30, xspi1-base, sdhc1-base, sdhc1-dir,
> > +                  sdhc2-data74, sdhc2-base, uart1-soutsin, uart1-rtscts,
> > +                  uart2-soutsin, uart2-rtscts, irq11-8, irq7-4, irq3-0,
> > +                  evt4-3, evt2-0, clk-out, asleep, reset-req ]
> 
> how to know which function belong to which group?

ok, I get the point, I'll spread those into their respective groups
per the CPU documentation.

For this v2, I'll try to be inspired by the
mediatek,mt7622-pinctrl.yaml and the airoha/ralink bindings:

    allOf:
      - if:
          properties:
            function:
              const: can
        then:
          properties:
            groups:
              items:
                enum: [ iic3, iic4 ]
      ...

best regards,
  Vincent

