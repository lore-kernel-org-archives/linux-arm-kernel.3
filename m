Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D609CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 06:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oe3cxkXt/q2JPyVdIDXoHlk1IlmJAzFO2nNbBbqCMZI=; b=XJ7MgwLqPXpSNbM/S16x1OrPpo
	QZMkoxCxWsOkwlOUs3Q04JvHzhgJdssGXWJ/KKuwfeL8WKwjANhXJ4Sg9Jh34pU+fNrD2JFpKyR6l
	leXa8yAjvgM53LCwjNw7IzFccijbp3JKqWgeVn2pMJCaSR88cPjvciXizv73uXkojCw7iuyxEcGGl
	9CRJgSJCWUlyfA20h/AI955CYqoV7sHf+UBsNhjAPMmmYoa0mvhtxKfqWitJa/rt0dawCZyuGHZCN
	sSbDw1dsth4gSgVxVf03NlfFFTNEUQjYn+ZSYygd/Szo8f8gKbSiAMtjhFc4ILGoZDqmcj/10IFuC
	8Gf/JO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEjS-0000000CMBA-4AuM;
	Wed, 10 Sep 2025 06:55:06 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEjR-0000000CMAV-0FLG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 06:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757487302;
	bh=oe3cxkXt/q2JPyVdIDXoHlk1IlmJAzFO2nNbBbqCMZI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Wm52vjo0yGm9yLddJf8W6MO2tmsTQreghqcEGUTooX0HuiOyhYgcc1JAOegg9qIA4
	 ZKi4Hz2FywXjQfEbMuB68TvFcgR1u6hXWpa8DZMXLC+N6RJlW43Hu5hraj1Knqqn9l
	 y3fLQ4CESLbcdxW/4S6OhaLINhbpIa2NEncQQ4AfpfmKvYpMLRk+4re6sLuwTmBAiG
	 Ih2qA3w80tGIvp5WCexHdpkL0QzQg5BHcWifLTXW39ycRy/p8BNO7hMVzVL4T58MNH
	 vMR8nzf11pQXEqTlh3OlxaCHqufvWGzWu0zxqJ5YtbXabDpyo6+HyVWcW1JClAhFm/
	 t/ADaFTCPoBug==
Received: from [127.0.1.1] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7B3286443C;
	Wed, 10 Sep 2025 14:55:02 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250829211330.1336274-1-robh@kernel.org>
References: <20250829211330.1336274-1-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: aspeed: Drop syscon "reg-io-width"
 properties
Message-Id: <175748730236.660876.7704019071552566777.b4-ty@codeconstruct.com.au>
Date: Wed, 10 Sep 2025 16:25:02 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_235505_294883_4AE63CEC 
X-CRM114-Status: UNSURE (   7.89  )
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

On Fri, 29 Aug 2025 16:13:29 -0500, Rob Herring (Arm) wrote:
> The default width is 4 bytes for "syscon" devices, so "reg-io-width" is
> redundant and can be dropped.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


