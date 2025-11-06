Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65976CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 10:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiGYWWa5Rp57nAs3YvpKkmsJ3R0ZczKe27XnYzkP11E=; b=iAWrW/pD8aHH+SudiZgErWFd+L
	gw7faA+k2kib40PZUH7Sm3xWINO042KWmmua0c2/iHNC1Jit7Rphbp+Nd28H5eqX7nV7GTVFvpEVx
	hSlIIs36MxorBO+aP511bLqS8eAHKLl768xE97XybTYe9FPPKyLMS+WXhCy3HdmGTHt5gv0fQVPAn
	FaEJKwxqYWppvgUoan9t9JwkPoVKctkDCZo1j38guYKbYTYA0v+U7NVy0jv/5LONbhIkDucJOBFdo
	8hwg2SBWzDUTDUQuDmcot+mbB9bE8QCpqHQSTkrjNJvrz0jX9cO9IraPmaXkbXQyW3+WaFsDKkF3+
	oykLE76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxL9-0000000FKol-1I9I;
	Thu, 06 Nov 2025 10:35:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxL7-0000000FKoI-07To
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 10:35:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0E3E81A18F3;
	Thu,  6 Nov 2025 10:35:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CDD4F6068C;
	Thu,  6 Nov 2025 10:35:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 988AA11850A7B;
	Thu,  6 Nov 2025 11:35:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762425334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QiGYWWa5Rp57nAs3YvpKkmsJ3R0ZczKe27XnYzkP11E=;
	b=La2lMt1p6x8Hb9C4Zb4UsCRLtRjgSDQHG9SACtaJZuGR23DTZhxooUqS9qjaVzHyC7jOaX
	suv+nt5QbHKOuV/VUnyBeSYA5k0qUp4NPOc2C1KCKAsUGA6qs6HUCQUaCIb4UqABCOKywe
	0kQeR+bC75XuNIhEjn5YEIL9eJx2+6Ee+sik2osTtpfd/ieJfXpySlTRNNd3bvT+hQQ+cn
	QV1WqssONxwiGELNS4B73AVTErYGREFXWE3JHli3VQSE3N/tChz06EzHuvYD7up65CExoM
	V6icAliw9KsXZIi65dH80n45Ol2jByhS8t9HOJRIsIbmJS0s7UdEhtG0KuK4Ig==
Message-ID: <88e8b9c9-16b5-4f8e-a2ea-3ce14555c731@bootlin.com>
Date: Thu, 6 Nov 2025 11:35:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/11] net: stmmac: ingenic: convert to
 set_phy_intf_sel()
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <6ad7667a-f2be-4674-99a2-2895a82b762a@bootlin.com>
 <aQx3Brj6t48O6wPg@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aQx3Brj6t48O6wPg@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_023537_204164_E2033AA9 
X-CRM114-Status: GOOD (  13.43  )
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

>>> Convert ingenic to use the new ->set_phy_intf_sel() method that was
>>> recently introduced in net-next.
>>>
>>> This is the largest of the conversions, as there is scope for cleanups
>>> along with the conversion.
>>>
>>> v2: fix build warnings in patch 9 by rearranging the code
>>>
>>>  .../net/ethernet/stmicro/stmmac/dwmac-ingenic.c    | 165 ++++++---------------
>>>  1 file changed, 45 insertions(+), 120 deletions(-)
>>>
>>
>> Damned, missed that V2 and started reviewing V1... I'll resend the tags
>> for V2.
> 
> Yes, Jakub reported build warnings on patch 9 last night, followed by
> the kernel build bot reporting the same thing. The dangers of not
> building with W=1, but then W=1 is noisy which makes spotting new
> warnings difficult.
> 

I had the same issue, I have recently started using the nipa infra locally for
that, which comes with a way to compare the number of warnings before/after for
each patch to help sift through these :

https://github.com/linux-netdev/nipa

The setup was actually way easier than I would've thought, and testing
a series boils down to running :

cd $nipa
./ingest_mdir.py --mdir /tmp/my-series/ --tree $linux

it still takes a while to run on my workstation though, but at least it
doubles as a nice way to heat-up my living room with all the compiling
going on :)

Maxime

