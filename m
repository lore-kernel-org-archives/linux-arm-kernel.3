Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF98FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 01:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q16sqgrcDh4TW6b6QGnthsd0Rh9/8L6NGJ8pTp9TjsQ=; b=R/zyBw357MSqvGWWvWMD3w3U/z
	tck2JIj7EYwubNeetqWWI2Jpi/Puw630WTfMtGSCOy7+fznJDGP2aJWinGHp1Kg3qkEVy0VUdvYi+
	iwhWUMq/QAU3WYd+kHMy6x8NLzqf9FBEu3mRzSF+dLqUOGWT8lHFltpwkU8sOmqAmjmvgpO0GZikh
	YJ9FpXvQIqNfWimMHGSp/UVLynT0a+Ugrn/i5kJXxK/5X/m6yz2OWToRQnFlSL8PKUMffGaFE/66C
	PKjPrMAf5N9/Qvu7BMjL1q4j7fANkbAcOs8F4qPOLxhj7VgiGEFvWuafargacA/g5Hg777znU2Yho
	61npzzjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSnB-0000000E6yj-116j;
	Wed, 06 Aug 2025 01:18:09 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujSka-0000000E6o3-1rON
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 01:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1754442926;
	bh=q16sqgrcDh4TW6b6QGnthsd0Rh9/8L6NGJ8pTp9TjsQ=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Phvbf0Z9KeOg7rHlR0UiPwm32b3qtbFS8lDlSG/PwVIw4TIwlThELZnZVwv+O6ILz
	 DrGVUl+Oo9PkULcyyHBgHV/Wxa6mm2kAnT4DFA4XmRKSLhNZjY9jueaPe0k+BRYCFZ
	 xzO6UTEgpsVjY7r0A47KjJ/sF8+1S0OU1pIT9xO4qg43tHsc0yjekRvw0KgrCOu8gP
	 tm3yN/TCZVdQisfqQjPwKvySpr15wYSZjXPpnzlpd6xRUzwE5abW2vJH/h8eNR3Y4c
	 NK5rjs88ErIgU/GaeIrxy4ybhMXj4ZeJLqYsAFcKFNriwC1LrBuANg3qP+ldg4M9xm
	 Zqo4VangpeT/w==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 544F06BFF3;
	Wed,  6 Aug 2025 09:15:26 +0800 (AWST)
Message-ID: <182db4f2848dc7b8c110d45bb606e6219983c237.camel@codeconstruct.com.au>
Subject: Re: [PATCH] drivers/soc/aspeed: Add AST27XX SoC ID support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 06 Aug 2025 10:45:25 +0930
In-Reply-To: <20250805063957.1452653-1-ryan_chen@aspeedtech.com>
References: <20250805063957.1452653-1-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_181528_683574_26A90DC0 
X-CRM114-Status: GOOD (  11.36  )
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

Hi Ryan,

Regarding the patch subject, can you please follow the patterns
established by other commits under drivers/soc ?

Separately, can we concentrate efforts on trying to get the platform
definition bits upstream for the AST2700? Arnd's recent newsoc PR adds
several new SoCs (as the tag name suggests), which is a helpful
reference:

https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=3Dsoc-ne=
wsoc-6.17

Cheers,

Andrew

On Tue, 2025-08-05 at 14:39 +0800, Ryan Chen wrote:
> Extend the ASPEED SoC info driver to support AST27XX silicon IDs.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
> =C2=A0drivers/soc/aspeed/aspeed-socinfo.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/soc/aspeed/aspeed-socinfo.c b/drivers/soc/aspeed/asp=
eed-socinfo.c
> index 3f759121dc00..67e9ac3d08ec 100644
> --- a/drivers/soc/aspeed/aspeed-socinfo.c
> +++ b/drivers/soc/aspeed/aspeed-socinfo.c
> @@ -27,6 +27,10 @@ static struct {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "AST2620", 0x05010203 }=
,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "AST2605", 0x05030103 }=
,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "AST2625", 0x05030403 }=
,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* AST2700 */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "AST2750", 0x06000003 },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "AST2700", 0x06000103 },
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{ "AST2720", 0x06000203 },
> =C2=A0};
> =C2=A0
> =C2=A0static const char *siliconid_to_name(u32 siliconid)


