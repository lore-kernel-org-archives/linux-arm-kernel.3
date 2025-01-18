Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED99C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 03:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DyfZWIIA96g0Ckt/iF1SREvxeObReWViBxkd40Wrkw=; b=u+U4cacKgIx4c47XK0MUd/NOPD
	aYV1WZB7fT+M6R4QriX/I2DlLgm5M1Y9xbDzijOoVNY3D2IaQGp8r2b5TO5WXBFD6i+SP4tjay+Cd
	mL+7ezsmw4DOhCho1pmkfBJwBBEfnF+fUDJtsEfWXtpo/0ULwv/rDLYKzpH79wHYYHPvwb+EyQIU4
	gPOhgZkXCshG5dONCuPRIBgUpCi5YNWZl846QFAJgECZD+eRT7+/q14b5OKkmcvxeH0j3ELv8kvwC
	rosaYImA69MosP2Ehv8u9rCsGFdrCP3+Qyz3osbUgHrbQBIf9UgQtyHOiX+DdKMYSrlqDJ39CRjyS
	0LauJUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYzt1-00000001oKn-1jTt;
	Sat, 18 Jan 2025 03:52:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYzrj-00000001oAL-48vY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 03:51:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B43DBA43169;
	Sat, 18 Jan 2025 03:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A859CC4CED1;
	Sat, 18 Jan 2025 03:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737172278;
	bh=/DyfZWIIA96g0Ckt/iF1SREvxeObReWViBxkd40Wrkw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wg4O7nHqeAoZVFYyETYyeYu6pLx6d3Q1QDps4UyzGqUKor6alhi/0n71XGBldQ4HW
	 TZHLh9qrSEZu5RiK1HiCETkuZ1otS4LxtUJY6RwUDnfymgyNy3ZbrOKVDeEBj9q7CU
	 UXN0fhkBZw7KqeXXZPBMGEXi55Z/M9coD9wv2rMoS8l9qMX42xjPco8QGcWlCVpt7r
	 gBzDWBu+xgQnyce5DuwaRJ4ubCN1fvudUEEqWXVRWjVTxqmFncxVG0lakKlY4uLFez
	 v2s8ETIJ+tuqmEYDoo6wEkJkG31MGrlc4fLDXUJLpJQYAa6foQhUuxHZJMAuI2mox+
	 CQFRLjx1V97pg==
Date: Fri, 17 Jan 2025 19:51:16 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: andrew+netdev@lunn.ch
Cc: Ninad Palsule <ninad@linux.ibm.com>, minyard@acm.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com,
 openipmi-developer@lists.sourceforge.net, netdev@vger.kernel.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
 eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 01/10] dt-bindings: net: faraday,ftgmac100: Add phys
 mode
Message-ID: <20250117195116.4211ef42@kernel.org>
In-Reply-To: <20250116203527.2102742-2-ninad@linux.ibm.com>
References: <20250116203527.2102742-1-ninad@linux.ibm.com>
	<20250116203527.2102742-2-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_195120_091594_4DFE2205 
X-CRM114-Status: UNSURE (   5.03  )
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

On Thu, 16 Jan 2025 14:35:16 -0600 Ninad Palsule wrote:
> Aspeed device supports rgmii, rgmii-id, rgmii-rxid, rgmii-txid so
> document them.

Andrew, just to be sure - you're okay with extending the bindings?

