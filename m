Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A934ACCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 22:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9LGDsHV0V8er8+9rWb89z8ch8m1YHIGXEqcvL59oSw=; b=biFRzxZkGeYJUN4mqdh8UDM3Vw
	5QQAxdcI33JcHyfzdnl6V19uZIvd5/VlFUTTVYUMGF0o9Bwt7qT1gQSaSXDZC/hOaLCZCH4dYfl3c
	XYVi/RCreZqyelgzKKgEXNWWik7BUk4CcrhrKRPmBP07eMuvENpzfXSIyvUjcCMt/4PkxNIZcqmfe
	M9zQatosWjYVxXu71qtZLLP8pA8tKSPGVfeUA6em8NejAnTnVDUe5HAp+9+kS0MExCWUQmlr9cfIm
	LrHU9F9rpJi7shvUMoia7f82R0wDldmUB8b7vfEcIv72GtQqzewT3oGcldpuK9mXK1wkTm+PHrrb7
	2QTqplJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExzz-00000006sq5-1kLh;
	Fri, 31 Oct 2025 22:53:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExzw-00000006soS-0a07;
	Fri, 31 Oct 2025 22:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=G9LGDsHV0V8er8+9rWb89z8ch8m1YHIGXEqcvL59oSw=; b=D2XOHXU1ctlN9GuNS4+JTrmhXE
	gQYlE+EJgQ+hxbvY23kAmJJc/otiv/+R6PXm0f5k3oFMUebBrYat2wQUfaYZFpJhySqgBtuw4fnbU
	UYpTm/We3nMkfb0Mp/g9goXZv7pBOfUvl1w+ZYmGn75qjUkcvmH9NN9dkuqurSJj9n+WZKmd/TrBL
	62v/jUC75sAh4dvR8lwCDDOmRm/4vHc4vd9Zd4Xygz65TO1+5n//aU3ee2YDhmHg+JUtLnR7ucf9B
	kCi6MxEcs9N1YBRL2WKaWP1mNO3m7b4rBhqrUCXMj6twzHvFZ0u6IpG0pYg1VjDBtbPL0iJYjk8S2
	TY08Ix1w==;
Received: from i53875bca.versanet.de ([83.135.91.202] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vExzr-0004vM-IJ; Fri, 31 Oct 2025 23:53:27 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Johan Jonker <jbx6244@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm: dts: rockchip: fix tps65910 nodes
Date: Fri, 31 Oct 2025 23:53:21 +0100
Message-ID: <176195118793.233084.1466070272333250662.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <b3d05df4-a916-48e1-8d9e-590782806bd5@gmail.com>
References: <b3d05df4-a916-48e1-8d9e-590782806bd5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_155332_203402_B50D2505 
X-CRM114-Status: GOOD (  10.58  )
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


On Fri, 31 Oct 2025 00:38:55 +0100, Johan Jonker wrote:
> The binding for tps65910 is converted to yaml and they have
> changed the regulator nodename layout and added some required
> properties. Fix the tps65910 nodes on Rockchip boards.
> 
> 

Applied, thanks!

[1/1] arm: dts: rockchip: fix tps65910 nodes
      commit: 130daaaf1088d1686dbc4c9a2763132c43a4d980

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

