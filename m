Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54624E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvJGVxdgnbYvfph3H3kgMPc6iYxBtpYDW2uAliBQ3DU=; b=XpHjPkR5onwZGdzzTOjO+4V+My
	COBS/859mxl1JFy8C7/UoMl4NlygNB+O6zPJ9jtpQSYgS3wqdD6N4FlHfZ3DyBxmNwhHbxqGCkP6G
	TILHr0JD7PN68EqHawWx8sjj2u/zTmQDEo8kaomVSe6ve2+4PlO/R91M6nJF5QAyCL+U6TLP8jSFt
	TB3I8LJHJhUx7/z0dCVSx9QY/4TvnMU6eYEFkTgqsYoYG0dR7r0xnQtowTadRTBSJP/CN9FzuFQjM
	VgWnQWMHPAv6K1WCZK+Nkvw7Sguv81fwpaWrBkpr1hHIauGE1ofH9cLrxCaIQLwMpeDiL1+zP9l03
	JKaiBHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9eo-000000050Q0-2dCZ;
	Tue, 07 Jan 2025 13:30:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9W9-00000004z9H-1T5c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 13:21:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDC6FA412F0;
	Tue,  7 Jan 2025 13:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F324BC4CED6;
	Tue,  7 Jan 2025 13:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736256068;
	bh=9NTgYqTrn5wL8NaJXAT7TIA0G7ygQMIXiRiad9OKEJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DYbWYYvzpEroP27+bQ/D3FsjsX5+Y/QakfQ9cvd26kQFmdHmXDqFP0G3pTs4zKhA0
	 JyPYh4El071HKAsZgYIGzwI+NWWfbcEzQhjrcRv3kB8VrF0mhJK8pRT+5tMwVbZxQ0
	 dJ095+r4ffi5Kr3d2rXJbJF42Ftrg7bixFgQbUUieML+HzkvIDZqhDRXzgq0UBGOMo
	 0zJi/azt9cmUIGxT9gBkElUnJ6G9NyG2MgOqNcMQz7Dpb0D/giJtEvht/ubCbWltYD
	 vri6npuG2Hd5HK6kK8/FiG2Nsl1GHdJYye3uWzFY6e6jj5y+6eBdXKEqCiEspl1Rkz
	 bT8WDuwR0cxrg==
Message-ID: <d425172a-4f98-44fd-875f-dbbe6497d1ce@kernel.org>
Date: Tue, 7 Jan 2025 15:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] net: ti: icssg-prueth: Add VLAN support
 in EMAC mode
To: MD Danish Anwar <danishanwar@ti.com>, Jeongjun Park
 <aha310510@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 Lukasz Majewski <lukma@denx.de>, Meghana Malladi <m-malladi@ti.com>,
 Diogo Ivo <diogo.ivo@siemens.com>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>
References: <20250103092033.1533374-1-danishanwar@ti.com>
 <20250103092033.1533374-2-danishanwar@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250103092033.1533374-2-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_052109_455839_A5D44197 
X-CRM114-Status: UNSURE (   5.31  )
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



On 03/01/2025 11:20, MD Danish Anwar wrote:
> Add support for vlan filtering in dual EMAC mode.

vlan/VLAN

> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


