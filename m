Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7606EFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyD9N6Ij95cqvpxxFh8VLzH49Q7Wi4pb3Y7hHvQF+04=; b=TMHtn/HkkDD41HymFB8DShuNFx
	wXFxAB6Vs2TOJkrBE07jwuPwfEaAh5+oaprddR4AI3O3CHj53dC8hPkR1YvpgsAGUKPtMu4ARyMpu
	DGtTZqzHTTsNyYikY+XA4ChZNtNwxK0Lt83QDEhJw4+26ZBr3aAKuPUN/GuWn5Z4rSmQ0QcRTKag0
	Q59Tio3nPZdODYXPBPJTft7lKjwVg6NznGX8lVbACxbwh4Ty3j7mI7D8PFpRCAxZbBa0rqMtauX7x
	P59Wg0eMhmcgT8/u4uwbLcBZLc4JcVwzTYPTKaMyBaYt4Myr408WmZcLYvVKW4JxHNUxvmpCWYPRT
	Iw9AJ+Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5V2-00000003j9m-2XxA;
	Wed, 29 Apr 2026 14:02:48 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5Uw-00000003j9J-03sL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 14:02:47 +0000
DKIM-Signature: a=rsa-sha256; bh=JyD9N6Ij95cqvpxxFh8VLzH49Q7Wi4pb3Y7hHvQF+04=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1777470441; v=1; x=1777902441;
 b=otnTPg6uWq6gqFJy+vqFLMal46yT3ld3zQMamAvKUdZNveA8sXWIOYrKljpaBQIm2pKBRxOp
 Z7aqLUy5+aRbozH9NDZTGgUEHkv2rF1yN+kBW1kZ5LpL9CXEWiFfkBh5K+M4J3vnGxtUTG6cOt0
 UlmpHs8LBi4DI4NK7eB5m24ct93WS17ksuNiCPGDck9MASiQ7EWZp5bwi77T11vZafLInah4v7s
 DMM4ezsEfhvVJTbUOQGnaRd6SRJyORfmfpcQkIhjTP86FdYYzIHC27ANPEUHp485MEMfSO8wqss
 OxlVl2pApd+gEAzqaUe6EYmUgTZhcXlnywFzGlezkTt4A==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 b6cf7064; Wed, 29 Apr 2026 15:47:21 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 15:47:21 +0200
Message-Id: <DI5OONVN1JRZ.1UD6VZEVZNUXV@matfyz.cz>
Cc: "Brian Norris" <briannorris@chromium.org>, "Johannes Berg"
 <johannes@sipsolutions.net>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, "Andrew Lunn"
 <andrew@lunn.ch>, "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Frank Li" <Frank.Li@nxp.com>,
 <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mmc@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, "Jeff Chen" <jeff.chen_1@nxp.com>, "Peng
 Fan" <peng.fan@nxp.com>, <david@ixit.cz>
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
To: "Francesco Dolcini" <francesco@dolcini.it>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz>
 <20260429112232.GD17033@francesco-nb>
 <DI5O432AFZVX.3VGKJP31AZX97@matfyz.cz>
 <20260429134011.GA73482@francesco-nb>
In-Reply-To: <20260429134011.GA73482@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_070242_196171_44254C99 
X-CRM114-Status: UNSURE (   6.23  )
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

Francesco Dolcini, 2026-04-29T15:40:11+02:00:
> I do not see any way forward without NXP.

Probably not for the firmware, no. That's why I'm asking Brian if it
would be possible to get the kernel support in without it as in the
Apple case, or whether there are any other options.

Karel

