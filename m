Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9BCC44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Mime-Version:References:Date:To:Message-Id:Cc:
	Subject:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7x6aERVipVHaG0xRD6KC0RgCFBCYOOqTbyO/Xpmab5Y=; b=qn29vzHW+s+w6YhgBomOUTX3gm
	IRkexVnsc9Gris/IVP4NpwegWFANW1eN3Z4655QqvrjNWXhZ85lERNiBqwZ7jCGoryWb8VvkIdKyU
	KSqtEHXZZMILlqwlt/pLzXgpedtjMXsBO6ww42+euBVcx4y8Xh+H6/7Boia7oSsg9nGq3vuhBaYm6
	TFvu5Z6mq+2kWDjjBTQzKsmm26uJeTi745JVuejPM/CUtSlJQ2ecdA7dHl1r+c5jP6WP/e/fxdihH
	WiXP/b00Mx0HDsIhu9ykCUiLiQ4lCuD2YWtRt9uyz+t2jXMWaw9CGIVRwfjkqJcEU39xKbW3vJk4M
	PZ7Bzkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG0d-0000000GaQJ-3DPe;
	Thu, 16 Jul 2026 06:55:51 +0000
Received: from gy.d.sender-sib.com ([77.32.148.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG0a-0000000GaP2-3HV5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 06:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
 q=dns/txt; s=brevo2; bh=7x6aERVipVHaG0xRD6KC0RgCFBCYOOqTbyO/Xpmab5Y=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=Td/T9xQl/LneR6wLTV3srYvldTsgyfdcbL+4j969/XiWckpgPfMYCuIOyVE+s72HLdW/bo3+oMBa
        jkZzHS8ccH8B9q1KoamhhO8XUwuEzjCnYe7UrLaIJAhacrXGFBovUTO3zZsiBrb+M8t2rdnm99i7
        uqNqowYZU2ScbEiQNWb3EmgVEpTUZ7eudrBq6mx2UmE0Qit2Sup3EH/RSkrJK89JBp+yzrYNXwHl
        rj6zI+g8KbTYt3wys1pczmzmYpzPBoWxUmbnUBrTPja6ZN/+PbtEBMUcUWnNcEfEXcZpc3kXrZ5i
        +xtXuouMTX2yd81NnA6atSlK2M4GTWdHU/0GKA==
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: "Jiaxing Hu" <gahing@gahingwoo.com>
X-Mailin-EID: NDg1NjE3NDAyfmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZ348MjAyNjA3MTYwNjU1MzcuMjQ2NjE1MS0xLWdhaGluZ0BnYWhpbmd3b28uY29tPn5neS5kLnNlbmRlci1zaWIuY29t
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
X-sib-id: TAyBYJ-z8VPZsuT03-bxvgsLUJgTYRFiWrS6Et31f3FanO-1OsqTrDSW2aUmCZr8qNazQs2ko0_e9Wn9wN0GSpo5lR26Qx1JunBGkpN1jzmZEHJkBLrrH7DO-zPFTRl15bjudx6RDmpnTcHZ5A7Ponh0TKp4u3minrnYLxG7OKAI6y28pEc7zKkHhCTJdQfyMH-N
Cc: <heiko@sntech.de>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,  <devicetree@vger.kernel.org>,  <linux-rockchip@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Message-Id: <faf9554a-38cd-4544-8e25-1214adba7a80@smtp-relay.sendinblue.com>
Origin-messageId: <20260716065537.2466151-1-gahing@gahingwoo.com>
Feedback-ID: 77.32.148.25:11677070_-1:11677070:Sendinblue
X-CSA-Complaints: csa-complaints@eco.de
To: <sashiko-bot@kernel.org>
Date: Thu, 16 Jul 2026 18:55:37 +1200
References: <20260716012838.2353939-1-huhuvmb88@gmail.com> <20260716012838.2353939-3-huhuvmb88@gmail.com> <20260716014059.1966E1F000E9@smtp.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260716014059.1966E1F000E9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_235548_987828_3F2208BD 
X-CRM114-Status: UNSURE (   9.67  )
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


(Replying from my own domain; v1 went out as huhuvmb88@gmail.com. Same
person, I will use this address from v2 on.)

Thanks. Most of this is valid, v2 coming. I ran dtbs_check too; it agrees
and finds more.

> [High] Type-C DP Altmode configuration errors (SVID format, missing
> mode-switch, and misplaced SVID)

Correct, and worse. dtbs_check rejects the node: the altmodes child must be
named "displayport", not altmode@0 with a reg, and svid must be /bits/ 16.
The svid I put on &usbdp_phy is not in that binding at all (it has
additionalProperties: false), and mode-switch is missing.

> [High] Wireless (SYN43752 WiFi/BT) missing child nodes and unreferenced
> pinctrls
> [Low] The gmac0_rst pinctrl is defined but omitted from &gmac0

Correct. bt_reg_on, wifi_host_wake_irq and gmac0_rst are all unreferenced.
I will drop them rather than guess at wifi/bt child nodes, and drop the
WiFi/BT claim from the commit message.

> [Medium] ES8388 audio is advertised in the commit message but
> functionally missing

Correct. The node is disabled and its compatible is wrong too (the binding
wants everest,es8328). Dropping the node and the claim.

> [Medium] Missing vmmc-supply and vqmmc-supply for the eMMC

This one I do not think holds. Every rk3576 board upstream (sige5,
evb1/evb2, roc-pc, nanopi-r76s, dshanpi-a1) uses full-pwr-cycle-in-suspend
without supplies, and dtbs_check does not flag it.

Not in the report, but also fixed in v2: the fusb302 port node is not
allowed by its binding (the role-switch endpoint belongs in the
connector's ports), and the wifi-poweren-gpio pinctrl node name collides
with gpio-consumer.

Also the PHY reset. I had it as snps,reset-gpios, which is both misspelled
(the schema property is singular) and deprecated. v2 describes it on the
MDIO bus instead:

	&mdio0 {
		reset-gpios =3D <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
		reset-delay-us =3D <20000>;
		reset-post-delay-us =3D <100000>;
		rgmii_phy0: phy@1 { ... };
	};

That is the only spelling that works here. __mdiobus_register() releases a
bus level reset before mdiobus_scan_bus_c22(), whereas a per-PHY
reset-gpios is applied by phylib only after the PHY has been found, which
never happens for a PHY that boots held in reset. Checked all three on
hardware: per-PHY reset leaves the PHY dark, the bus level reset brings it
up and the link comes up at 1000 Mbit/s.

dtbs_check is clean on v2, with no deprecated properties left.

Jiaxing



