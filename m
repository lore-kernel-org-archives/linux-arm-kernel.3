Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE32C79FA8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyCREwze6wuRU2UsbFO8TEdIlanzdvvtH1ABUGO9pDk=; b=3xG/nfOjRXbX5J+BYlrGNdge7p
	xqwqWxLKc2rycecrUDRqpvokqZ0PTxFvTYF3VByXOacipRwjGRgGWjycc2wECRcmLneKaWVkBVkAu
	A0Gso3DEgXciPzyHDkwZFI8zt0QZumDDbhB3hUQvhmRuRTHjqUPFphY1CzlLT7m87Xy2kqFJKpIwI
	K+Z+W7Hq5zLuTyYkR0qRLT0otQfB0dIIODPHGBIajStyik1LRWctTidhr/HCF8RF5Ft83ke0o2Wtw
	XCOsVAUZL0445N00hG32NZKx/2iNIRZowVYfUVGEfqdiTz3F04pdlMvH4f5VT2OXWPZ++AVhCYewL
	JlCg/mlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnf5-0000000BkGm-1C7i;
	Mon, 05 Jan 2026 16:42:31 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcnf1-0000000BkFd-29zz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 16:42:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-47a8195e515so977585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 08:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767631345; x=1768236145; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OyCREwze6wuRU2UsbFO8TEdIlanzdvvtH1ABUGO9pDk=;
        b=BeUbO8Jk6vWrPY8IoEb9sZtzyuT9e6qElyAoU5k6YYC/sc5v/hdZV1ayOwdw0/zcXl
         /bNw4VrwM8ius2e9qEAs36HCaxQZSe0SoyJwUOJLyfLdRW7Nj2LEvfh2hy7xHONKi3an
         xmHtk7Yrpqb3PLoVECiZHvr5PZmVPJ5Th8X11Uwwf1nymWFmRlW7vOkE8QeqNu4WtSf3
         wVDvg0LyZicZl5ABQqm/ZE3SYuIiyEim/1HpP7VeOS2IqKFUePF81ksN+Qsn/rUFB/sv
         yG+TUJaIgulglh9oLixtnr5w/lPxa0FK4Rgq45lEwlTGY5jEZq/YCviphbLrbmmYbZNg
         NT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767631345; x=1768236145;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OyCREwze6wuRU2UsbFO8TEdIlanzdvvtH1ABUGO9pDk=;
        b=Nmkdg9lY5bYimNh3Sha5MUVCaOCh0wtOyDqcytpDqaAjq4JX/p1qWCsOokyhMZ6BSU
         xxmB6kbG5iCzAan3fPUXdtdVRerUoVUzXS4AheuBqzAheOxOHVRiIGF/XT1HILqh1SCq
         GKjzazpEklmotuo/Wbt6ELxCWL8cNU0azE/0zWwhIT7FN5FIy44wZAwSbV+ZgjyOjyYh
         WttJ5mn5hUcnxE18EvQZt1uVNVY7eeYMPNqeq+7vR82aK1T+SJ9fETxfo6eOGR4XBmYX
         /d/jrvCzuTFEqxTk2nGv/SmRzqxVMObyRFKrfyABFOFaz265TesUGHlFqa4okPeqqKTk
         wsaA==
X-Forwarded-Encrypted: i=1; AJvYcCWAIibDHcG5H48IUx7kjYK1xe8gYuZV2YkBoMvpOdeRJM5Y8Xxowpil4/tnBvZklabivfQAS2+AQKEVZpSqMugK@lists.infradead.org
X-Gm-Message-State: AOJu0YxrWnHhIuPkT7p/LQd+a1Z+VH4lzkSpLFv6e1ZrH/ciTZvLuqWx
	vpBAd5PaofJU10Xt8DqfUwg8iqNwew0sUaeQzA0bvBhUjeYHRO5akKDc
X-Gm-Gg: AY/fxX61Vp/oXnZOcJBWedBNoLfKfmGXp45yXKw4tr1VZ+nAvJcMb1c0TOhr3PpOyGo
	sSwiXMYEpWuM5hQfSBZPkBK6qvyrBlK4NVh/sJwt1t6Eu5sDjxVuy7mcAB16SiVyrLmpkoffMCY
	3wAGSkJT7YZmOIk4pS2OPoQDULBHgU/tgTo2yuk27pO8px1Z7chHqs7oEO+ZFaXRIWFvd25rLud
	o0Ghrdknww+uuxd3BQb795n6IpPAI9eYVRaTA1ufPC9XfGgtX6ptIXw0DIEJAheUAzY+sAuIfYq
	mu3qokYMIKo8JmGURgHLMTnprNJOruayN3OLNEH7XwBZ7pXab/QlEMiAkLV0vot+nB4Eww7p5kc
	FSJ4N2iYAIa1N7YqrsKbwq1sztFM4IuF5h9Bbr2T826Mjpkv2quT8/1odzobBaIOCxRuaFk3iwp
	1CPn5zgty8+ok=
X-Google-Smtp-Source: AGHT+IE/JjorzXLwwkJgsbApvm+a3QMCRUUp3o9LGdUjHP2iI1zq9V8yb9BydDK6HAKwFcoQXH8UFg==
X-Received: by 2002:a05:600c:1c29:b0:46e:37a7:48d1 with SMTP id 5b1f17b1804b1-47d1959d4bamr704429525e9.34.1767631345377;
        Mon, 05 Jan 2026 08:42:25 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:20bb:19ed:fbb2:7e2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bca532c6sm442805f8f.27.2026.01.05.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 08:42:24 -0800 (PST)
Date: Mon, 5 Jan 2026 17:42:23 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, francesco.dolcini@toradex.com,
	robh@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH RESEND net-next v2] net: stmmac: dwmac: Add a fixup for
 the Micrel KSZ9131 PHY
Message-ID: <aVvp70S2Lr3o_jyB@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_084227_569321_653C6FBC 
X-CRM114-Status: GOOD (  19.03  )
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

Hi Andrew,

On Mon, Jan 05, 2026 at 04:26:40PM +0100, Andrew Lunn wrote:
> > Unfortunately, I'm afraid of breaking something on the platforms
> > that are already working, as this is an Ethernet controller
> > issue. As I understand it, the PHY works according to the standard.
> 
> What is the exact wording of the standard? I'm assuming this is IEEE
> 802.3?  Please could you quote the relevant part.

Yes this is correct. ERR050694 from NXP states:
The IEEE 802.3 standard states that, in MII/GMII modes, the byte
preceding the SFD (0xD5), SMD-S (0xE6,0x4C, 0x7F, or 0xB3), or SMD-C
(0x61, 0x52, 0x9E, or 0x2A) byte can be a non-PREAMBLE byte or there can
be no preceding preamble byte. The MAC receiver must successfully
receive a packet without any preamble(0x55) byte preceding the SFD,
SMD-S, or SMD-C byte.
However due to the defect, in configurations where frame preemption is
enabled, when preamble byte does not precede the SFD, SMD-S, or SMD-C
byte, the received packet is discarded by the MAC receiver. This is
because, the start-of-packet detection logic of the MAC receiver
incorrectly checks for a preamble byte.

NXP refers to IEEE 802.3 where in clause 35.2.3.2.2 Receive case (GMII)
they show two tables one where the preamble is preceding the SFD and one
where it is not. The text says:
The operation of 1000 Mb/s PHYs can result in shrinkage of the preamble
between transmission at the source GMII and reception at the destination
GMII. Table 35–3 depicts the case where no preamble bytes are conveyed
across the GMII. This case may not be possible with a specific PHY, but
illustrates the minimum preamble with which MAC shall be able to
operate. Table 35–4 depicts the case where the entire preamble is
conveyed across the GMII.

We would change the behavior from "no preamble is preceding SFD" to "the
enitre preamble is preceding SFD". Both are listed in the standard and
shall be supported by the MAC.

I hope this helps.

Regards,
Stefan

