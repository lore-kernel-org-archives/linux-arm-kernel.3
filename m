Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9A5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 09:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7Bmpx1B1OFaUSgPQarXLFPl0uH+PohveX2hywvmfnE=; b=FVNbq8rIC/IXGCQtSu5CW9zHy1
	ycg8civRQJDYMapvsZlz/iLbuKJ1z0ZrbkG1HYz3fW0MKVQrlY+TKgG+AHLj0bA2WG4XlVIW8wMEN
	eH0XEvdVVa3CnNgt4E60XFVaVpuRqVtCd93nJOG5vsnRKAJIZgLbva9G80dxr3ulk/LQJBb/6o6LE
	Nlp+z77415ZhW2Qhhl48Hh1iRzIkGjOyhSDz15T9JJB9a1trUYALVaa86CgjFi0/PL4oeajDjZcVx
	SflEuMM5TSNsKsPShM6Tdf8eXYj82jnk9l/4+iKCTZUk6I5mavjAkgo91RmCnzBcfbYmJW8F9ubKM
	FENeOcYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTqM-0000000Dg2E-3afl;
	Fri, 07 Mar 2025 09:18:10 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTok-0000000DfmU-1S58
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 09:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741338989;
 bh=l7Bmpx1B1OFaUSgPQarXLFPl0uH+PohveX2hywvmfnE=;
 b=fKCB3ZkXgkgd94FL2tgf5rfWgT6Ulw8NqjUBCtU4u9nUuc1r1vyTM1m+Qwjz7AfVlh/D5DXuC
 C57oN/xSWwbIHTkDfpibuJRgIpKZNx2W2lqtKaKc5/v9Ri0r/mQxAKRQofpLW5QIvAixx3S9eNo
 9AU3ZV/UWyFVAOGazb/NRCz/0+8mNTLSB7TOozNy6zQJRscQ8ARGEtGpcAvT6ygglWwzQ+5blpT
 cOLCjkGxhPazs12xknx8b1gftFe5TCbc02nlq2pktPgMuQNKB4/ZY91cXBEWaLRM38OOPI/GrzS
 /VpMqQlubWXMk0YcjykalEpbK9NowFWaj4YIvT4TvdFQ==
X-Forward-Email-ID: 67cab95fd992817a57e35d57
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <cbd6d3ee-8ad1-443f-9506-e28240ffb09e@kwiboo.se>
Date: Fri, 7 Mar 2025 10:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Enable Ethernet controller on
 Radxa E20C
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250306221402.1704196-1-jonas@kwiboo.se>
 <20250306221402.1704196-5-jonas@kwiboo.se>
 <e0e8fa5e-07a2-4f4f-80b9-ddb2332c27ea@lunn.ch>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <e0e8fa5e-07a2-4f4f-80b9-ddb2332c27ea@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_011630_722163_5CC4705F 
X-CRM114-Status: UNSURE (   7.71  )
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

Hi Andrew,

On 2025-03-06 23:49, Andrew Lunn wrote:
>> +&mdio1 {
>> +	rgmii_phy: ethernet-phy@1 {
>> +		compatible = "ethernet-phy-ieee802.3-c22";
> 
> The compatible is not needed. That is the default.

Interesting, however I rather be explicit to not cause any issue for
U-Boot or any other user of the device trees beside Linux kernel.

Regards,
Jonas

> 
> 	Andrew


