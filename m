Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3454ACA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 01:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wgnOb3qWz6wBb9vyKuCsG5rQeCBlBsWJND+E1w6iSmU=; b=y+R0pAiAHwx5J+T//eBOtun6qf
	VWJN5rT5T9wuk+uXmP1wKIkn+gprHfMtuziJ3OaDbkyae1IUd0nDLOtWljO+4XyaxT2CnRIkXHLqc
	4kbDHpstQQ+Ge5wx9/dN0tJx1jG4re3qPuzxw13faKJxZTIPO3w60/a0sJigxb8z/QWYx9YY/wQVE
	TYpEEdNh2QvoWV7jYmQPP7XtrEY1HdB2tvthUEsSTyaKe/Rpb7OAy5HaAupJ/Ata6x5mmf96rXt2s
	28JWDCMlBAffoVjBpRHp8Q418VBEHG62oN+coTBz02yd7Uf5L4hpU8zgD9TaHUasFwIp9yDRtwTM/
	chAqmKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqMNI-00000006i4H-1sCl;
	Mon, 25 Aug 2025 01:51:56 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqMKf-00000006hzb-0zq9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 01:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756086551;
	bh=wgnOb3qWz6wBb9vyKuCsG5rQeCBlBsWJND+E1w6iSmU=;
	h=Subject:From:To:Cc:Date;
	b=BwNiLTp9/zW5Dlir+EesRuR54/NgyA3gVrB1YA7dvgsvYUnl8rRHS7ScuKlRNlItE
	 MhTgoFefOXbypEA4vR1CT/V0IqLTcLi+ljrRV8fvGKxCgYLETfHSRQSXSOGqq+d+Aq
	 184CDgl4BwsximKIqixoYTEH+t5iyYDuwIQiKllcS+xr6gulQgmBo+6BQfP9nRbv5/
	 qMbjPlLY1xuL9iSO5Bs/2/g2N7rTLvtLp4Gh7EfgOcl5y8XQlnQrKRB1YKXKCoT6kk
	 fa5rkcyjhy0KuuXdPiLHXtryJbqan0qASeR/bPgjgjPi3qUOQ6SfsljO62UMKI7LTc
	 9f5R5fbWaFdlw==
Received: from [192.168.68.112] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BF056443C;
	Mon, 25 Aug 2025 09:49:11 +0800 (AWST)
Message-ID: <5e7e5d2cedb3bb232420ad720c857b95d8c02f21.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: early devicetree changes for 6.18
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Aug 2025 11:19:10 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_184913_464326_37A2F2F2 
X-CRM114-Status: UNSURE (   7.96  )
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

Hello SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585=
:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm-6.18-devicetree-0

for you to fetch changes up to 7686b441c0ad921211b0a69977bad746d18e4b33:

  ARM: dts: nuvoton: Use generic "ethernet" as node name (2025-08-11 09:38:=
03 +0930)

----------------------------------------------------------------
Early Nuvoton ARM devicetree updates for 6.18

So far we have just the one fix from Krzysztof that switches some nodes to =
use
generic names, as recommended by the spec.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: nuvoton: Use generic "ethernet" as node name

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


