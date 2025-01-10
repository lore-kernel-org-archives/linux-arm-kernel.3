Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD845E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WE1mjwbjPoFLC+ZzgjigY9CirLmrXWGlf1v1smKl6Wg=; b=f91zH6LiGduKxf9ICOGP1tqCZD
	pLyy+FlF3kbjDuSeAIAAVKGeKTst6xIYABaaehBlI64wa9nb38lfmqqBX2CikN5j80sJVd351D8eR
	j5xyVUu42gL18I4dRCg/rkXDKesbw4tVQeKPdVN17dBJaDurED+HEvgvy++KqZYrm9zTwymoYhsfj
	PMT4xxCQ2KAMmzckzZk77TezMqV8vQG8ihZ3HMYrPltpiie2WWBJfiT/HyvR48AVg+P0XeVmNZ76i
	X9lIKhyadaXa5a1sokRIOOPLNrvVU+uVbv/jZ4/Yw0YwSDZwKn6H9Jh/8XXeCufkJooqsywymNQG0
	Q5aHSfWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHlF-0000000GDId-0Wnb;
	Fri, 10 Jan 2025 16:21:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHTO-0000000G8j7-302S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:02:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B5805C0674;
	Fri, 10 Jan 2025 16:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CD1C4CEE1;
	Fri, 10 Jan 2025 16:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736524978;
	bh=5diCFIWZuIJV4OjMCTWDxa0Zly+MOIMNEFHwJP7l1Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ni5EALDsWJZer0hLZHbaLS+k6dsytqsVi5PzwKotztyPzlieVlJX0W4MSNwPuJjaY
	 gqE0uYsSBccFOY1YUJXoe6I/pAGCFtHWbUwP/sOvjjkE/TEee86FlejI32+Ql0hVvy
	 6ecrvKY/zIO99leBuMepgyseEnJEAzOi3wiGG2MZPihYHNNfnZbOkPZXqPyEJwMZBf
	 Z0h2518+suWkTNpqYocRGSwgPGjp3w06qGmJPi6m3OXqvd/hrebnb+8C2ZajQgeIQ0
	 toIYd7K8WJoozZcs+9CzqOG1FnT3ydtowvi9edIUvgI/E6I4OOhM3MaQEAE8R+hXUu
	 aubW6LpC00vZg==
Date: Fri, 10 Jan 2025 10:02:56 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
	joel@jms.id.au, conor+dt@kernel.org, devicetree@vger.kernel.org,
	andrew@codeconstruct.com.au, kuba@kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	andrew+netdev@lunn.ch, eajames@linux.ibm.com, minyard@acm.org,
	krzk+dt@kernel.org, davem@davemloft.net, pabeni@redhat.com,
	linux-kernel@vger.kernel.org, edumazet@google.com,
	ratbert@faraday-tech.com
Subject: Re: [PATCH v3 01/10] dt-bindings: net: faraday,ftgmac100: Add phys
 mode
Message-ID: <173652497637.2952052.6627595246829829775.robh@kernel.org>
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <20250108163640.1374680-2-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108163640.1374680-2-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_080258_793831_073955A3 
X-CRM114-Status: UNSURE (   8.22  )
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


On Wed, 08 Jan 2025 10:36:29 -0600, Ninad Palsule wrote:
> Aspeed device supports rgmii, rgmii-id, rgmii-rxid, rgmii-txid so
> document them.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  Documentation/devicetree/bindings/net/faraday,ftgmac100.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


