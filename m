Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0874E9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 04:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbQGCcXacygdL0pttgXnvjZ05dWekjLf5mE44UOfY4I=; b=uVtJp487TC9/F+Vts795FKEzbX
	3vQAdRx3fVRcWXmG54ziHrKOuhBF5W+9kdCF20V+MeB/rxMWPcbUUPLhC4RN1CnXQ8/dVL/bKKAdO
	e5FQde2Csrctz40LJMcQpHefd9o1FxYtV1jmtiiAVIydLC4hQZL2xqJDj6xaR+C4vysKUTog5JfIh
	LTw0W4fXDN0NuPpQXry3zIKUswUvXeNTx3GQQXFmYqq4FImV3aereQ9omOdvrxONdpSYvbvnpRBPZ
	dO5GjKCRQKxkcMckcfy1HQ9Ln/Z9Oi/iHNJw3nHQV24qEEzN5pBLqEP1206MlEhjQijlADrEB39MY
	AIjChx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsvlA-0000000ArWY-0VrO;
	Thu, 19 Feb 2026 04:35:28 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsvl7-0000000ArWD-1eFG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 04:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1771475723;
	bh=dbQGCcXacygdL0pttgXnvjZ05dWekjLf5mE44UOfY4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=F9yTs8dmkr63M3IBkhGpgOB0FzU3XHFQDGa2PkvS9vvSCL05b3ywnu7EIT8zJYWQ4
	 nHKDCoL0uOVUMJKR5G7fwOJUVQArkS60TDvPRMgb0e2CaaScLe2pOfjDcXlNOuf+4C
	 OyntBq1bjEgs7fj2tOiJJahZ5T/e1xj7Hs1KkavNMJi/DY7VlwtyuF9s2p6Yn6QbCx
	 RLVRAlKyiOnyqOyz3o26eUL5MPviPYgbC2Z9R1owURtXww4ZUldV0xkqRIraPMi6ZW
	 qii2gNIdyrrfbWR6jnkIjX+cFy8Nh4aAXbTqmL5MYuZnUXPcDQmNPjCw2DAePOqkwP
	 af+458OiU7D9Q==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E1CF160033;
	Thu, 19 Feb 2026 12:35:22 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Carl Lee <carl.lee@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 peter.shen@amd.com, colin.huang2@amd.com
In-Reply-To: <20260209-add-nfc-device-v1-1-748d1a98b2b5@amd.com>
References: <20260209-add-nfc-device-v1-1-748d1a98b2b5@amd.com>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: add NFC device
Message-Id: <177147572280.1160818.12060888145911808065.b4-ty@codeconstruct.com.au>
Date: Thu, 19 Feb 2026 15:05:22 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_203525_629107_2D59B421 
X-CRM114-Status: UNSURE (   6.29  )
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

On Mon, 09 Feb 2026 10:25:59 +0800, Carl Lee wrote:
> add NFC NXP NCI device support to NFC tag reading
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


