Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF70CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 02:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQ4G1nhO4fJCrWWO4BgcxbqmE8wNI73Tj0t3GM2e72g=; b=RVwMpLHELJgS3YiMXPQ/7wX63d
	41osT4EYU/P0vkRA1DNot5pp6iMIM8gNkobPKXTiZe7oxhfqgzmXwpLr/V/fh7bbkiAq1LCehKKFz
	rAKKRG9aM7W+i7v6SfIdiLMQEc8v21xXnc8tI/9e1rgJhINb3oW+f5qP3U43X6OZgPqbJZS4opDOx
	4WgbLbNSx1CxewmxZB14NuhS4ugpKVh6SO5R2/6ljL5a7YFQ67lPywiW07NdCZzXgVj53G47mTSgC
	JJC9Lh67LQCFIei4BBwNLDtJv8gvfC0PkHlT8mfZjUz6RIWZNjcPLMYWO/AGOK86X2aM3kpY5cq8G
	bCRsAi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3mnv-00000006apJ-1I1N;
	Wed, 01 Oct 2025 02:42:55 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3mns-00000006aou-3bNr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 02:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1759286566;
	bh=ZQ4G1nhO4fJCrWWO4BgcxbqmE8wNI73Tj0t3GM2e72g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZFBoXrmi4x46zx5rkn/TXKgnk88GhqVOBNlE0vpAngnzuswBVqBCuD8fygmxvJUbq
	 Zd+NhpkbpYbsw6adph0vkSqbB4wP3LkN/1rL6phz7FwuzrYY0ylj1VjpPOk8VR1StZ
	 xP3O0WVuX7WF40WFj1P/gV+lXT0ANNRRJFZlvzwevEQbWEHtzzy2K1LFqIMEoKTqEU
	 ObcdH8i+LgN5pzIn2T2SC5XVx2CJZFCvHsS/59pa043yFHkVBM6smC61lymxgFeC2p
	 yTpjv7sG/u0LM4pfwqd3hOQ0S5iyc4bMd9KA8RudInwK6pqZDYEhWbh8WsbaUJ5AHE
	 uIZFyalX0Km6g==
Received: from [127.0.1.1] (unknown [120.20.48.42])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A743264785;
	Wed,  1 Oct 2025 10:42:44 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Leo Wang <leo.jt.wang@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 george.kw.lee@fii-foxconn.com, bruce.jy.hung@fii-foxconn.com, 
 leo.jt.wang@fii-foxconn.com
In-Reply-To: <20250930-leo-dts-add-shunt-resistor-v2-1-8712984f04c4@gmail.com>
References: <20250930-leo-dts-add-shunt-resistor-v2-1-8712984f04c4@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: clemente: Add HDD LED GPIO
Message-Id: <175928656396.3584264.16163298971652448955.b4-ty@codeconstruct.com.au>
Date: Wed, 01 Oct 2025 12:12:43 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_194253_093756_6DB90132 
X-CRM114-Status: UNSURE (   7.51  )
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

On Tue, 30 Sep 2025 10:49:23 +0800, Leo Wang wrote:
> Define a GPIO expander pin for the HDD LED and expose it via the
> LED subsystem. This allows the BMC to control the front panel
> HDD activity LED.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


