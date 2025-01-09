Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58BDE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3fP1jF839rSIDeFTpMsj3jSpAIOhnkLrbuY4znnibM=; b=LHTL0kqwKK/Cvx3AA+K8r0Wv0n
	GXVSp8LO5yCDTBDy7sBBqbgCQzkFsbZxuayplUaf0dLY8XRQAsPmyCNsXQAA2TGa9AgKQAvAQbsOy
	xQEzx/I8b0pX4/Coy0R4ARAjUQ9J0d+zYJ8dYKZUInIzp/CBAsp1sQDZES2JAz7j14MKZr4uJOvlV
	XMFNu7F3mJG7wpYyWfgAfT7VmkchncsrhOmX6wBsDiDYz75FUGSTw8gW5WTfA5LgZvNoq3QAovC9r
	zSRG6g4wg03UkglQpA8yj3pnMMSec/r1MMZZ3+wcn4AJIQYfp6EZAX9iQ+jWZkWa43fELiigS6vAQ
	c3MrVMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqhO-0000000BiZA-0ykS;
	Thu, 09 Jan 2025 11:27:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqfY-0000000Bi6H-2eTy;
	Thu, 09 Jan 2025 11:25:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421943;
	bh=iqXpgp2fGvu3tg/mddpVycP/Hki4wjs3IgZaA1W/y1g=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OQ9QTgk8pzTbDRLiIw7wpB3DR4020axAGcDQUbSskCYfPjhlF/hFGEDxQQft65HJT
	 BgzdMnLVdF6+w6SVhedOWjAmIpwDpAC7nbz8QjSVcilHGTk7AZO3pbkSk8L+TcSYLo
	 jRWBadIsJ5VLiU9+fmPi1CNAgfTXyLzs/Flhwg43HgwchyMRuo88wE1cPwn4APjxnv
	 cOl0y6pSeO4dHLvGpm4wdHwype48vvW4sBc1RGU27tOIa+TAq5GXNnDoAlV642dYYY
	 9B4cm0ftStMXKmcZ9SBlECotbqYaCpyI5JRSZhwJF9jQmo/nX71uVokF+sOXL2QTnJ
	 5QJP7lnAFgztw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F88417E1555;
	Thu,  9 Jan 2025 12:25:42 +0100 (CET)
Message-ID: <a93249b1-b550-46ef-9ad0-0465916cd7af@collabora.com>
Date: Thu, 9 Jan 2025 12:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: airoha: en7581: Add default partition
 table for EVB board
To: Christian Marangi <ansuelsmth@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Daniel Danzberger <dd@embedd.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
References: <20250105150328.15172-1-ansuelsmth@gmail.com>
 <20250105150328.15172-3-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250105150328.15172-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_032544_817731_561CA095 
X-CRM114-Status: UNSURE (   5.09  )
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

Il 05/01/25 16:03, Christian Marangi ha scritto:
> Add default partition table for EN7581 SoC EVB board.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



