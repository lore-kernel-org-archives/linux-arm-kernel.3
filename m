Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0615D5B845
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 23:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjqlL3P9HBN4voyP2L5yXiRhMBCYac+G+6cqIX9zAoQ=; b=A1wtTtuEVfKEnXZkL9bvoz8bk9
	z1H4r1Onu7KI8QwBz1K1LMIRNs81Xx7R+ClOPTKFITVazoH5CXaftzV5diyf9dYRCNuAUDR5KBfeO
	3q++KFJ2ZxO88NliCkWuggvEeTrwshHro48488JI0xooMBYUdBvVjERBlPJsteDAr3xnzGlnuCx8H
	DRZ/J+05KUzgmCnyP9oa5WRC2bCjRyh6pu5bKZ26G+6CZAXY1IeJw8+9ZWMXyTIGqA+P8tZCDyz4R
	3Fl8LMWWwtVAoWCzvs4D5vzFtfXzLregvg9t2zDWe/YCGbXe9mTjLbiwU72v6VQhv6yzkDhMI/QCC
	SxsUaNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Zbw-0000000Cgps-03ld;
	Mon, 28 Oct 2024 23:57:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ZaH-0000000CgY5-2NKw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 23:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1730159732;
	bh=bjqlL3P9HBN4voyP2L5yXiRhMBCYac+G+6cqIX9zAoQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CNA8hmvef1s42GR010rD7RxBEzuLHnOSLEfuTT4ohExeXOUCtAQ3i+ii9BKdYKgKV
	 oo+ShgOBibYW+XnZbEV/vB+1TfNLRQXjyFJrz0LhuGlcgReHpnuvlFkW7MOxNEvdvd
	 ww1dmGu+0KI665WZPEqhRujOC1/thS7nO3Rjd+GF5ltVm7gahHiv7Iu4N/GsSAxdx2
	 l7lujEO43zAdpezhv6vA4WZmuVsYw2em11xjIbHBYTxBvLb6JIajA3ovfIYuJwq89Q
	 8yOFQNx3fu39RpTxjMjnWcvV1eDs6PkTYpfahkMeC4b4BbiELz9EC3tL/4My1i9pUT
	 ow3BSW4nRJKLw==
Received: from [192.168.68.112] (ppp118-210-190-243.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.243])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 91D4F67728;
	Tue, 29 Oct 2024 07:55:26 +0800 (AWST)
Message-ID: <0b51600b1308d64e362b771f1bf8adde2fa0fc19.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/3] ARM: dts: aspeed: Add WDT controller into alias
 field
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	wim@linux-watchdog.org, linux@roeck-us.net, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com, Bonnie_Lo@wiwynn.com,
  DELPHINE_CHIU@wiwynn.com, bmc-sw@aspeedtech.com,
 chnguyen@amperecomputing.com
Date: Tue, 29 Oct 2024 10:25:20 +1030
In-Reply-To: <20241028024813.2416962-2-chin-ting_kuo@aspeedtech.com>
References: <20241028024813.2416962-1-chin-ting_kuo@aspeedtech.com>
	 <20241028024813.2416962-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_165542_129939_AD88E26D 
X-CRM114-Status: UNSURE (   6.68  )
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

On Mon, 2024-10-28 at 10:48 +0800, Chin-Ting Kuo wrote:
> Add WDT controller into alias field. After that, WDT index,
> used to distinguish different WDT controllers in the driver,
> can be gotten by using of_alias_get_id dts API.

I feel it would be less brittle if we encode the mapping in the driver?
Based on reg the driver can derive the watchdog index. That way there's
no constraint on how the platform architect arranges the aliases for
the watchdogs (if they define them at all).

Andrew

