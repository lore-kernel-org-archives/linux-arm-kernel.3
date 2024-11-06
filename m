Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29A8D40D08
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 00:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEcFU5Iqsgm3U1kleL1AuXyG0d6sZHwbrluDEXSnsOE=; b=XRgWh7OBbxY7us9w1B6M7DnHux
	+0Ino/rzwhhCmoHYPLk1hXULKsyDdP7Fc7cMD6w3J8dhbt8K4R6VEz1G4/+hDdRYD47o8fZLFp+EW
	K1mGzQYqSWpfXypwPb290RPO4f2gX86odkM51O2xN+/XpBNohbuxOrEeBaM7PXdjGjDsM4feu//5w
	PtyREx+1SgZKIm6Ri+ihLa1Ifzujgk2cUfu75c3l5N5cQbR8AxbQj1SrTwsc/Q877tWohdExsdrnf
	jVUVTrPlz6qT08mzYRoPV4b1vJsCmB6VBaG2/r2jInb8MDkyyQqKLXOzyNG7PNyMWZ3sDIL8YYlGM
	TjEdkD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8U56-00000001DVb-2GgY;
	Wed, 06 Nov 2024 00:39:32 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8U3M-00000001DIg-3uQP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 00:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730853459;
	bh=MEcFU5Iqsgm3U1kleL1AuXyG0d6sZHwbrluDEXSnsOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=d2fqNuW7b4RXmB3s7G5PSJmu0Z6xCG88TD6MYvWYhkjYPejnPRZYYXKLr9d4Gw9rD
	 P2yyInckCQLVw8ri12qNsZKAKnwTz07MOkRhuVsrmEJztJTZ81n+cAkDXagwI7Qnc+
	 TV8HacgBK9b1iyD656HuSIs00K6kuz3Xfjd6TZeDSGcvcR7w3EGozUkAS7cb9cSvr8
	 YmeyNv0cGwo/NOmbeS2UZalwT9pJNcD8v0KmjIako8kMbDlIV8ahDRxPuPBgijJbDl
	 Xp1w0W9Mj9uKu4fwWQ6ibR/pj9iaO/xUBNmyo/cYrkIM8NfrmicA+49mQJxn8FVHk9
	 koqwVmoXXpIzA==
Received: from [127.0.1.1] (ppp118-210-162-114.adl-adc-lon-bras34.tpg.internode.on.net [118.210.162.114])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CF8176B28B;
	Wed,  6 Nov 2024 08:37:35 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jdelvare@suse.com, 
 linux@roeck-us.net, sylv@sylv.io, linux-hwmon@vger.kernel.org, 
 Joel Stanley <joel@jms.id.au>, 
 Naresh Solanki <naresh.solanki@9elements.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
In-Reply-To: <20241104092220.2268805-1-naresh.solanki@9elements.com>
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add IBM SBP1 board
Message-Id: <173085345571.351006.17162436911260710903.b4-ty@codeconstruct.com.au>
Date: Wed, 06 Nov 2024 11:07:35 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_163745_215127_713C878B 
X-CRM114-Status: UNSURE (   6.17  )
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

On Mon, 04 Nov 2024 14:52:14 +0530, Naresh Solanki wrote:
> Document the new compatibles used on IBM SBP1.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


