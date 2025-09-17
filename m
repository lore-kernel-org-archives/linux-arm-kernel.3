Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE74ACAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 00:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aQQfGbAOvDVkwEgS59kc/rR3ZeQC8NQMOe0HdHu520=; b=ZcD7s/kubgMUYS1iVlxB2t+frL
	mkn/Cm8IOoXAJCqcQrl2fqTz5zJ6q0RkVqNsmhmysGQjyxJIFrSPtiUy1sUnNnJOSslZoU7ujjKE0
	6lgsaXckIB1pEMUWcHZ3z0bTiv2xp2P6xIhE2PVWhmWmX/YZdp7Cjq1r39ZySB/cYtL4Ta04M/oa1
	h7JQf/kz/jEsipXKAQy+23dgpM/rlXcbJWMf9ebEvHGWMpJcHtnIiFKFoe5Ki2FeE6BRR9AC80UZI
	k75fpog6hOClrTm3Ff8zfceVNf3KS6m7Bq03a4L+J+X+xG46ZI0z5utnP/0Qfdp+e4c1Q83uj6PF3
	U7p8q6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygAS-00000009k3v-0i1O;
	Wed, 17 Sep 2025 00:37:04 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uygAP-00000009k2R-2tt0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 00:37:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758069414;
	bh=2aQQfGbAOvDVkwEgS59kc/rR3ZeQC8NQMOe0HdHu520=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XFiZ6dWqlEq5JjXJDc3jTkzqlLjsXOYeOEaYvqx3w+QWmoF02AibYhO/0qogfCNoA
	 6Cw8Hgj15YSEAeqDI+FNe1jTCivXry3hZqLkFLRKe67f794gwcj+kqahWzefuFRmXZ
	 VbzTWtHHL1k9NEf4dA0n4guxa6IZ6qQlojXlRKLUioC+GWSKANFEZ0gkGKnjxiRmql
	 7II0uBU+85pghCodofZ0T0srNeTCav74b6daG1tWJNFl8I30RCnLa2mc5CXgsOl29a
	 qH3Jwa3gqfmPQDK2kR5PQ/eS1AQdbeWTM4i2PEVwNtTImtr1qoEhQilX7o4+BAeCjX
	 23gXItncK/V9Q==
Received: from [127.0.1.1] (unknown [120.20.76.56])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 09EDF6F070;
	Wed, 17 Sep 2025 08:36:50 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Leo Wang <leo.jt.wang@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
 leo.jt.wang@fii-foxconn.com
In-Reply-To: <20250915-leo-dts-add-shunt-resistor-v1-1-d65389148a3d@gmail.com>
References: <20250915-leo-dts-add-shunt-resistor-v1-1-d65389148a3d@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: clemente: add
 shunt-resistor-micro-ohms for LM5066i
Message-Id: <175806941070.498785.13666236370278646492.b4-ty@codeconstruct.com.au>
Date: Wed, 17 Sep 2025 10:06:50 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_173701_943623_3EA572A6 
X-CRM114-Status: UNSURE (   7.42  )
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

On Mon, 15 Sep 2025 17:47:23 +0800, Leo Wang wrote:
> Add the 'shunt-resistor-micro-ohms' property to the LM5066i power
> monitors on I2C1 for the Meta Clemente BMC board. This accurately
> describes the hardware and is required for proper power monitoring.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


