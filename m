Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0DAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 00:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngFxpbsAhBt46D4upIiQUrqXmQXQRu9BcTtfx/SuZrQ=; b=zMIBkUh2J5RHI7Y2JRyrHfIfei
	vWM6vYdzC8PLl/sSWJ/73kw9yWGe50vp3+U0+7n3Yojo65JJZ0YenX7vdgbgBxNwpO/4EGlMla5qh
	etgO7agAhraq/b4JlEzEZz60LHvBjn7jjMWs3tfOJN3Y9pCxkNWB7W0SNHBkc6x8cafbTNS2XOUO3
	L/t0zvScNNK0OVaxSPsh9u5FD2PXyjsqkbrEaib19EvBrFyyIa8/ltC7rlGPkMnf3Q5kQTg1SCqCv
	NGn6EjdEj6FQ7R91OugaOyDzHB979KXBtqdyQHBuMqJHWOMKu1rkzxOi3yIiW4YL3UaHuo+aSj43F
	PJTyjDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJyT-00000006dAg-0Uad;
	Wed, 08 Jan 2025 00:31:05 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJxF-00000006d13-3FEq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 00:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736296182;
	bh=ngFxpbsAhBt46D4upIiQUrqXmQXQRu9BcTtfx/SuZrQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cS5aGQNnH8pG8T95/gV34zVLaRqjpN019oKppskkOEPws+2cBRPC2LsXVWHWQbQK9
	 2gswAEXTbEB2AweMzsHU2tfCGYYW7CZldvBxXOrunMD01odqogdtEmCo38bl9wDFju
	 zYmvmmtlXjeY7dL7M/D0aO4deRxw8cxHj8JpZYWpzOc/xJ8KY1tAHRJgb02yrTtDna
	 5p/J8Pp68UkUdV/Yv7tCBYc6le/IVT23pFr6Xt5PQy1rvbInQX3Gj5eEAhX62riQfV
	 dUGGBqeX3a/7M2SOJs5mBn9+EsYVuOrE9vpdkcDOfOKGUZI3iPWsQKzRjq6k89dO3H
	 sBHimNEPs1ChQ==
Received: from [127.0.1.1] (ppp118-210-64-24.adl-adc-lon-bras32.tpg.internode.on.net [118.210.64.24])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E49F670B92;
	Wed,  8 Jan 2025 08:29:40 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250107162726.232402-1-patrick@stwcx.xyz>
References: <20250107162726.232402-1-patrick@stwcx.xyz>
Subject: Re: [PATCH v1 REBASE] ARM: dts: aspeed: yosemite4: adjust
 secondary flash name
Message-Id: <173629618084.481094.9284702547524010515.b4-ty@codeconstruct.com.au>
Date: Wed, 08 Jan 2025 10:59:40 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_162950_024186_96E1496D 
X-CRM114-Status: UNSURE (   8.78  )
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

On Tue, 07 Jan 2025 11:27:25 -0500, Patrick Williams wrote:
> Meta (Facebook) has a preference for all of our secondary flash
> chips to be labelled "alt-bmc" for consistency of userspace tools
> deal with updates.  Bletchley, Harma, Minerva, and Catalina all
> follow this convention but for some reason Yosemite4 is different.
> 
> Adjust the label in the dts to match the other platforms.
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

--
Andrew Jeffery <andrew@codeconstruct.com.au>


