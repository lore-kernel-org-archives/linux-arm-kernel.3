Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAB8C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaPDbwxCsdcx+B/dCejKtJh2wWTua00Ci6Hpi0ul8C8=; b=1VBky/K8/+aRfqxlQ7LJWMlMit
	gd7kP3YK/OczXoH7mOhAGIQlY82d4DhLWZzeI+47PjoafQONVLwBdpkJM70WLYVS+DVeGFJKw7kTs
	sOYCnJgjeh1Sm02+o6ux9wH1Mq6xsb+caxaxeE2fc2Vo9NdyEvFFrvVo5skqH7NgOnxehoboLhU0x
	/qT60zmF92MxtyaacJXVmJ+gGeK3QLdsqs7wYMXVAJlschWb/DAhlfgx/BM9yyipvbhRxCPj4R6iI
	h1CX/aQU5sqbYSl8JR5jRMzwicRhRzZxvN6g5bEW502SLm++IqbeyYuicc4fQheIvtrjHjyejoup8
	OJPfILpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWgR-0000000BrD0-1Vtn;
	Wed, 22 Jul 2026 13:08:23 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWgM-0000000BrAq-3yTa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:08:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=WaPDbwxCsdcx+B/dCejKtJh2wWTua00Ci6Hpi0ul8C8=;
	b=H7xCUMUYc/LooIzd+CSV4M98TEu1QIbG+rVULphn8ypPW3Ek4oRmPTSrR0BTeb
	oJ+jvvyj4Tvlx9myhIVE9GLwTQWXpVxr5nJrn1A21G2Dn6DGGBvLvBJ2ndJevJxe
	bOKiqmNQ83H0B5Z0k83upy/IwqMDvMgOipJcBqsqzaTH0=
Received: from [192.168.1.104] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgCndQKNwGBqqIFOHw--.52029S2;
	Wed, 22 Jul 2026 21:07:26 +0800 (CST)
Message-ID: <c85229c4-2c9c-4231-b294-e8012c3fead6@163.com>
Date: Wed, 22 Jul 2026 21:07:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ARM: dts: aspeed: g6: Use KCS AST2600 compatible
 string
To: Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260627052708.172918-1-haiyuewa@163.com>
 <5333a3912656d4c85fd063dc5726106e38150ad6.camel@codeconstruct.com.au>
Content-Language: en-US
From: Haiyue Wang <haiyuewa@163.com>
In-Reply-To: <5333a3912656d4c85fd063dc5726106e38150ad6.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PSgvCgCndQKNwGBqqIFOHw--.52029S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjVbkUUUUU
X-Originating-IP: [101.228.92.86]
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzQ4GcWpgwI7TFAAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_060819_530812_19ABCCF2 
X-CRM114-Status: UNSURE (   8.60  )
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



On 7/22/2026 8:55 PM, Andrew Jeffery wrote:
> On Sat, 2026-06-27 at 13:27 +0800, Haiyue Wang wrote:
>> As the commit 2596f6b93a60 ("ipmi: kcs: aspeed: Add AST2600 compatible
>> string") does, change the AST2600 DTS file to use kcs ast2600 compatible
>> string.
> 
> Is there some other motivation? It's been a while, why now?
> 

Just happened to see 'ast2500' when adding other nodes in DTS. Nothing 
special.

BR,
Haiyue

> Andrew


