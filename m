Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C9CE6917F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgmMtx8fj816a/GURnFat6+G6RLlkVLmq0pwMu2JauI=; b=RzczyGFr2A9io8
	ABVdQQijqd+JG0AfIBg1QKS/rq38Ec2jEyfkeB1VccyJGPhUjkCB0ZHRPzPbzJEbKzaH9lHN/ngBx
	KUwW6gIA7dZVBGr/Xb1qI6tHHDpDCHmL1l1Qz5k7fqn9iv4PdNu4im7sCGF6+lOc5SMHBiKwwqnl4
	eGCmZewHpMO6q6IxdPbzJ3eOH268JXFvfEZVWu1KuMdkJ91YhJ6mo1DYpFUrizzqyZUdyjGiASIOR
	SP8I2zG3VdHYOfGW4QfqJ6v1SZrzwUTESTwW1E2oWoGUnqB+2w9raUyeYQvzGTnljfHkQevulvxxN
	SRft0lbfLd4t5nAiCaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWV6-00000002qno-4Azm;
	Fri, 22 Nov 2024 16:27:20 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEWU9-00000002qeQ-2gXi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 16:26:22 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 070C7A048D;
	Fri, 22 Nov 2024 17:26:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=DgmMtx8fj816a/GURnFa
	t6+G6RLlkVLmq0pwMu2JauI=; b=uYNlL+4zIM+zX/JiygGWkVt1kpItmI5Jz3AR
	JvNEaPKACe/nP5lc9XyrHp1Cyz+QI1LHt8SLtKNTLHxc+lM1L+cw6TFmNjdKW+h3
	Qdvv0YzH9suP6fLlgLdFu+Gy+RQKynj4kxujfaTgeWYaVgC0tqxbcY30hkQan4Iv
	Cc4mfvwQatftfG4t3kMnnf0OMNF9Fca76R5Oax0AH9RMxunmFYo6Zt+A9NNuGXif
	cZFqxqQR3UmXLA9QT3Nnis9Q2CX3j74c1UvaKwyFnZi1UHGx4Zsi72GOFt4XgLAE
	siqeeNjBCf+vwy6pNtKuyssXyzmayo9Its+CLF5mKByod+sad+QyRbkm2OlISBV6
	NK25wQQrjt14EcasyNAnt6tKx0GKAEJ/GQzqpj+WDf1RVpwnPUPr6k0Pz4IMBhyf
	RAFKHxaTMckqz7v7OpmEITxwtWg2UNe0cnp+iYd9kke2TvxHyaslsoAWsbzOOvXH
	ZKvl1RrIhpFyHkVCiVv8lp2wx093tQ7AocH3ipJhfIYUqrHW/PGnjAgvh/GpRE0T
	K1jegw2QA3EL9rwcCo1cQkXrwLGHG0A3CApa/SE9B2gFbb4MKaX9s1/nrv/Wo5oN
	YBFDZwLrv40Dlc6ujWUeCwjNHA+g25bBHykYAL7sSVZpasTXGihBajlHQrte2jXv
	saqQcx8=
Message-ID: <5bd6dc85-29db-4f57-8d8b-156ebc116d03@prolan.hu>
Date: Fri, 22 Nov 2024 17:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: atmel-quadspi: Fix register name in verbose logging
 function
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20241122141302.2599636-1-csokas.bence@prolan.hu>
 <a326f5ab-f36a-4210-83ff-0f2ae9fa830d@tuxon.dev>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <a326f5ab-f36a-4210-83ff-0f2ae9fa830d@tuxon.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.7]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855607263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_082621_838611_C4C0E937 
X-CRM114-Status: UNSURE (   6.14  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2024. 11. 22. 15:52, Claudiu Beznea wrote:
> 
> 
> On 22.11.2024 16:13, Csókás, Bence wrote:
>> `atmel_qspi_reg_name()` is used for pretty-printing register offsets
>> for verbose logging of register accesses. However, due to a typo
>> (likely a copy-paste error), QSPI_RD's offset prnts as "MR", the
> 
> s/prnts/prints ?

A typo in a commit msg fixing a typo, how ironic... I guess I should a) 
re-read my mail more carefully, and b) get my keyboard checked... It 
starts missing letters when I quick-type :/

Anyways, if you pick this up, feel free to amend. If there's a v2 (I 
doubt it'll be needed though), then I'll amend this as well obviously.
Bence

P.S. it missed an 'n' again, while composing this one. Ugh.


