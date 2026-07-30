Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B6DC5516E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 20:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoageaeHuW+vLD+n3J3BgniEcl+294LoQ8nwrWdQTmM=; b=c1hS7EXpJqi2og5Em4qQedJ66d
	YJqICM6CxYpXxx5J57rwna0t/49VFZfoHXQ2z5XrHOyTJ73YL7Qnp5KYhlIujJlMFWde2blTnulEi
	6SUSFdKMFojIYGdu12i0hUE0JtquAqCjJriMlYLO1vP+Fs6UH8ST7QgtEynnwZn8ooNGhD6/hEafe
	b2brzepLPMjC3ouzCQ9Sppm6c5f60wcvWsgpnOT29wq7IHQHeQ4ysV6KECbRef+BeewoSBnb1/4yi
	Srfbi7CbHYgV79kXQG0uhAHPc7TxvPLMH9YsZZC6nea9rqOa3FQdZtKU3amZQrBmph59oqwBnDqjI
	TRJ4CQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpX4N-0000000BIjk-1SKi;
	Thu, 30 Jul 2026 20:09:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpX4K-0000000BIjU-0KJr;
	Thu, 30 Jul 2026 20:09:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33CEF43C0B;
	Thu, 30 Jul 2026 20:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3511F00A3A;
	Thu, 30 Jul 2026 20:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785442166;
	bh=YoageaeHuW+vLD+n3J3BgniEcl+294LoQ8nwrWdQTmM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=m9tJgX3s2+fJtTOhhzSUFdSf87f6HjmB6S0nyzk6AawrnI2k3ZI7Ayp4PPvoIHtcB
	 x/nuxXEsuEtzHawo9hnIacD46ErBp0Ce8aOJMYeeZa07Sc6imTMJrJT4AZaarPmd3U
	 3iEVDGLGDiUtOZnb1OB6kHky6CS03EbgSp2Wv6uh0VpiXc94wEQpq3xXoEY3KAdhL/
	 +xaTi+pCBaTEB8me4zzBzMj7/WvYt/OoK1/dL2hL0JPZ8CNQCn5FFCD2Sgp83hJoRA
	 9mg7rEbTuCxYM0onWdSQSwyWXIC9Sdc+XCXq08APafCGENqjiwOMCN189/C96EUqmQ
	 FKQZbf/MUCEPg==
Date: Thu, 30 Jul 2026 13:09:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vladimir
 Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle
 <daniel@makrotopia.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell
 King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v19 00/10] net: dsa: Add Airoha AN8855 support
Message-ID: <20260730130924.1f99801a@kernel.org>
In-Reply-To: <20260728154846.1828945-1-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 28 Jul 2026 17:48:27 +0200 Christian Marangi wrote:
> This series add the initial support for the Airoha AN8855 Switch.

This series did not apply at the time of posting.

Looks like Sashiko/Gemini applied and reviewed it against net/main
so you should check if it has anything worth addressing to say:

https://sashiko.dev/#/patchset/20260728154846.1828945-8-ansuelsmth@gmail.com

