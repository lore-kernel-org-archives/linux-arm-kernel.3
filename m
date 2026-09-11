Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5801AC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWjPhlAZgiTgvDtIbhGLmFKSScrttT/O4nlebYZTq4I=; b=oavuca6ubEHolh1E4aUw7O8ByO
	eUottfuuwR4tKhRcB32VE//X0kh9NWh3DWzGvlHNGUqZCouXWwI6b/eGA+glyoS7QowFxdOF/9OSj
	0AKxhUklYrsc1TSJjm3lpR7pZpSVWSOHq3A8tuEv3GXut5rbhOQLMRQ7KFjsp26ABKt/6+fCJuW9z
	0xbCYppp6aZ5LK+BhohLWGpHLZ7UZAg9QwxnFln8EfovnssJw6kx8L7TmLtHuXl91b80pfZtsX9IP
	mrj4h9X1LXPI7BpK6MN2ne1+EaX1QUUpVxBf60dpDiXd3Rw/XuqYhUAme+Dndr+vq6vNd2siy/7bn
	Dcedme1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zzI-0000000GZVs-370f;
	Fri, 11 Sep 2026 12:04:12 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zzF-0000000GZVE-335T;
	Fri, 11 Sep 2026 12:04:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F273422D66;
	Fri, 11 Sep 2026 14:03:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1789128245; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=JWjPhlAZgiTgvDtIbhGLmFKSScrttT/O4nlebYZTq4I=;
	b=jIJSbCGNgOtF1okwZwZz7W3TNqovpvufn1bP4tfZBqWGrKvQs27AdLg+/WNuSxLkBNCRT8
	7g6PBwjjFphxmz0cE9mnewxnDuvcKJhpeUFefLwNquCds9br+PcMrSNPgHUXJnlUvQAuzo
	7mFwvWjbk/MLyk1IxAC4MdtDXppikqQCqKAwLxShMisVQfPaFjgBfDRXFCPA2rlduBnuwe
	7mDJ2ZPsmGoVXel0KdptjNY53m1XjIPSUDBDpUN4yKqvfiPaotoovgPq/Wq2L+gA4RirEn
	za8YhEJsAJoSfTHi8CsMBYjOci0SVc0uW84h/Dm5PrMUkNTzPzAWQ6CEUuqgDQ==
Message-ID: <c16418fe-a9e9-4a10-b435-98c07c8a87da@cjdns.fr>
Date: Fri, 11 Sep 2026 14:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>
References: <20260909213250.3184238-1-cjd@cjdns.fr>
 <20260911103910.4123567-1-cjd@cjdns.fr>
 <8396aeb6-c43e-453e-a7d3-52349b93c528@lunn.ch>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <8396aeb6-c43e-453e-a7d3-52349b93c528@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_050409_974557_D070CBAA 
X-CRM114-Status: UNSURE (   3.62  )
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


On 11/09/2026 13:58, Andrew Lunn wrote:
>> +	/* Clause 22 local data. */
>> +	ret = phy_write(phydev, MII_CTRL1000, 0x1e00);
> Didn't i ask for 0x1e00 to be replaced with standard macros?


Oh no I somehow re-sent the old patch. So sorry, I'll re-send in a minute.


Caleb


