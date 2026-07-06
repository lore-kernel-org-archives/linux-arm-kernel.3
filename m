Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4858FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THuhvPYxoUVY1fyXHYjm6ybRklyzNtpCS1SAJayw/aE=; b=xzNyihEopZ5xRWItfX6r1vFQFM
	6zFK62EO6DnEhLJ/EjNbhrVaY/6Z854ruKHccM0tr40gKywLsEjoyOz3h+KOooKnI8MBQyGsSwZx8
	Rt0f0x3+DFToyf8GODwVJ/gi+l3IpvpYza5BFVKLMxU+JbL/87z7AncrAHIo0V5kSI2caMQXdBqzr
	BFkWq2p4r7A2FIZ5w5zTG+7VjgBTEtfpdUBxfojSHQLeY8Ja6uCJu2Zav0PsTdywmL0Jg0mypTpYk
	5idbZtLg0w3nT0YNcc9shtoZhxfzF8TrH5bz4wYJCvNBvnpJeTshzLxjmR4EWn8UjTOCdBVYKUmgS
	/MP6dlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqnA-0000000Dcki-0Joo;
	Mon, 06 Jul 2026 21:23:52 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqn6-0000000Dcia-0J72;
	Mon, 06 Jul 2026 21:23:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783373020; bh=THuhvPYxoUVY1fyXHYjm6ybRklyzNtpCS1SAJayw/aE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b08t4qOa7amCbULr5F/3FGFixSA4T61dvvpWpmi1mVEROAvwOlsSZa2a3j/0TyWeH
	 trsNnOoo1xCn++fv2a+CO9fM17ngxKJsBw/syfR98Uv2Syx8TARAaWKZZpE/py3xsV
	 gM5a8EdUIjjsC5uzG8dWPMF0UKmXt02i2jW2U5uI=
Received: from AERO17.taila7786d.ts.net ([220.171.158.107])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 5E484855; Tue, 07 Jul 2026 05:23:36 +0800
X-QQ-mid: xmsmtpt1783373016tfy6yz64c
Message-ID: <tencent_BF5741F8151925AFF7A3026460204C2B3108@qq.com>
X-QQ-XMAILINFO: No7DFzN00JnRdexOUT7KJ1j5GhTH/EFzHkmfx68KkdRR8eNizRxrO88bjOgmX/
	 iXmRjNojHUFtGyoDpyQWfTWCfqFHSaPh7H/LczkVVW+/CfPiVFnj/hya0BdudIZEJHyVe/JKLR5G
	 jr6F4lYn+XcAT/Bom4HFp7seyMXfXXEPHDl3E3sL+JgDVxEtsJX0P+8lZR1Glsh6dvcvkK1QuRcV
	 ymOf/kcoFINQEMlMMmSSvM/AmAgqq4um+grCW+UnzIDneXsD0Ai4Zpcfnq47wnFIN34iyURhu3A6
	 tjdq9oN1YpdVjZMikHMANXHqk+fIxNC345Wkm8IDxAigxef72y2RnhQZMl1FlKMQZpHMJ0SkLcD5
	 HlkpGd6kRpXI1O07dPZfLVekrDBqsTjZGnKuiNwm8G2tyTwfykKAFXRgfJrW3qZNQLEwv9+qfOI0
	 5ngDCAMxb3yZTw8xFs7gjWIaybSVjix0+Ee+frgensIW51SGZ/vMcsYYbSBDVo8fcy/LbYvbe9NP
	 WWb2wV6CHn3YNwSxiOGxRjGIrov6FISex49mIBQYIbnikRb92hOVnDP5vQJKMR97G9Ad+cSZRy9P
	 lHKJyhnIOtuP0tW1OIgjFL/zNKmQ4XOlzbdXumquzGXZUXZyoohSEYgyat1DufZPQlawKerZbFFK
	 jsEOiCE6t4RlWXqG5unHon0Uju/Yrr8Hz6drqBCev9EwGg8Ba6+EyENwSt/8h1JW88QtsTbOMX5J
	 2tMLz4YEv8xoBZqfFZd8rFKDO5mYrw4TiXM6uo+rPDr9TiI2UygtOntp2MOclSUC5kM28xynsBKq
	 ewzwo/ulaZ+dNHz7inyAv3pS/1+crWOb9+ziqK1aiC8ymEFlNtOFReV+5Ha5pL5mJHRK6z8s6CVa
	 w2zGCmVPWsaUGL4NHl+J5kmURjadZvSPOkQrwXDBMoSz4DDjoLB7BJn6600YBaEi7nMx3+Ju5iBu
	 cOS8W9LHOtXPEsa7VPjOTZMo05C8VN7Y1w9IbnQgEI0Pwkq89ur2O2jrmEKRcqTS/m0v/nKl4Q1V
	 WSyrQSrU+pZxTWNFx9MbPS1NjK0JBcLg7udIIU/A==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Pufan Jin <2254650260@qq.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add EmbedFire LubanCat 4 board
Date: Tue,  7 Jul 2026 05:20:35 +0800
X-OQ-MSGID: <20260706212220.688032-1-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1ac2d0f4-e027-4633-9d34-2709cb3e43ec@lunn.ch>
References: <20260705135014.1004166-1-2254650260@qq.com> <tencent_6D311DC5F405B157049538DD5B080082A10A@qq.com> <1ac2d0f4-e027-4633-9d34-2709cb3e43ec@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_142348_590974_771E4B6E 
X-CRM114-Status: GOOD (  15.79  )
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

On Sun, Jul 05, 2026 at 05:11:58PM +0200, Andrew Lunn wrote:
> > +	/* The board has 1.5ns delays on RX lines; TX delay is provided by the MAC. */
>
> That is pretty unusual. How is this RX delay done?

You're right to question this, and I apologise -- the comment was
inaccurate. I re-checked the board schematic and both TXC and RXC
have ~2ns of trace delay added on the PCB (annotated as
"TXC / RXC : delays 2ns" next to the RGMII bus). So neither the MAC
nor the PHY should add any internal delay.

> Ideally, you want to the PHY adding the delay, not the MAC. 99% of
> rockchip boards get this wrong, they have phy-mode 'rgmii', and
> {tx|rx}_delay properties. And i tell developers to swap to 'rgmii-id'
> and remove the delay properties.
>
> With the PCB adding some delays, you board is slightly
> different. Please drop the tx_delay and adjust the phy-mode so the PHY
> adds the delay.

Since the PCB already provides the required clock skew on both
directions, for v2 I will switch to:

    phy-mode = "rgmii";

and drop both the tx_delay property and the misleading comment.

I also need to correct the cover letter: the PHY on the shipping
board revision (20241026) is a Realtek RTL8211F, not a JLSemi JL21xx.
An earlier revision (20240221) used JL21xx, but the current hardware
uses RTL8211F. The cover letter and binding commit message will be
updated accordingly in v2.

I will collect the remaining reviewer feedback before sending v2 and
will re-test the link on hardware with the corrected phy-mode before
posting.

Thanks for the pointer to ethernet-controller.yaml.

Pufan Jin


