Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC40C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/C/yfoc8MNJECP8bjDv7AtAK6K/8GDl3xqk/IfXYdk=; b=xZAJQ5PHWkDGxs0qh7GUH5cQFA
	6XCjRgYMDL7rL653vCN/FEA4+ljYvtdDhuLRRUI8vEaQCy5x224BowNJL3K9USM4af9ESOxEHfGUm
	2N+6t7Vb3oOvAqObJf5uSiGaCVJcRMurvJJR9AhS6XV9n1bNKX22fne8W3mhg5Wm8NfDokg6W97LZ
	Z8fWTDRrg8fOC3s8WNqzXX+khXeUTNixtsL/LRprORuXx0L2KCOuytNknVAbd2B+SBaePFN4ENdtJ
	JmyzDsVfFPfsh9lJ0yb+bAbIFtCN9F1z1Qp9mbEau/b7hf4g6Bm/Nei+a8HiqUYNnjGu/sp4JuOKs
	T5NHqVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvp-00000005DuJ-32bJ;
	Tue, 22 Sep 2026 11:45:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvl-00000005Dq2-3x0G;
	Tue, 22 Sep 2026 11:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077500;
	bh=jKFRXUzZ/gZUTvNeWyPS2Cro/WCl4lSg1W4J+SAdU+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VsjR1yAmeWj6hHQcapdsAtBNEZdkX47MMhiLc69fpXQ8lM7Gqu6uJx1GOaUSBjc6l
	 SoxYgm7UYA4OF5+/O3/Iwsk0RbZZZkOjOfb1zltAX1ZMyvAXlsW4gT25y0LJBqPYqz
	 mjZ+gKNnCZVIlEg4pKAtLEPCt5BgCrr3CF7Thrbtf1O8blWg3twzyXZfAmDnWpJiG7
	 Dr4rHCgso0zdP1ew/cm1OZIdKs2cleRJWJcfXPlyl4UETEd70JJPL8wICW5JviODv3
	 UN5t2LvKf61kUXDfcf8fkXl8lhp0b8Wk5svSGfdgB9Oc7ETcJHC9TDQ5kxuD1lja2B
	 KcnsLoAx0JzbQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84BFB17E03B6;
	Tue, 22 Sep 2026 13:44:59 +0200 (CEST)
Message-ID: <68960e8d-36fb-4a35-a469-c18e3ade8fe3@collabora.com>
Date: Tue, 22 Sep 2026 13:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: Add MT6397 sound DAI cells
To: "Rob Herring (Arm)" <robh@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260921232649.3132592-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232649.3132592-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044502_153585_B097D2C6 
X-CRM114-Status: UNSURE (   5.65  )
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

On 9/22/26 01:26, Rob Herring (Arm) wrote:
> Document the one sound DAI cell provided by MT6397 PMIC nodes.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


