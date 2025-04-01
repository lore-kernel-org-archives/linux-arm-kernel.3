Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101D9C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:In-Reply-To:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aB648o5YY1TqC9NWUirl7q6IvvMzNQQ6izOuYdpRBGc=; b=Ie1tW24YFXBv9sFsp2R2o1jM4T
	+lcvTzrkiTXBftaLICf/IfC49ivcOETOf5FzPMCeDHiLPBvF1+7lvssfe3ciHoNbzNgkuaqxT7wMt
	DFK1zRBBVVsYClgZ+j18SWJDwUEnwjV7tko9z4AeGv7QOYlhel9CF0p4p2sZZMJAj71xO915qfR/a
	eLDwdfROjzLsG8HoNRJ1Oqxyu9CqtlZd+l+Z4AFasXT9FnRaYkLXSJX7NuEHWbBNXObg/BQvfAuT+
	TYPMcdNZZCPcvD7tj/BmnPK1kzoUf3wcQFksQOQThB2DF91zUX02WbOTelVPAN0tsiWYpqsbxqmCp
	X6U7+0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzaC0-00000002qxw-2f4r;
	Tue, 01 Apr 2025 11:54:08 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tza3g-00000002pYw-3OZg;
	Tue, 01 Apr 2025 11:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1743507920; x=1744112720; i=frank-w@public-files.de;
	bh=aB648o5YY1TqC9NWUirl7q6IvvMzNQQ6izOuYdpRBGc=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ApD74cxwr60+65cSJzVQOLtyufSKqdjWNZwpD/NTqtjv8ePB0mjaosgMo6CtUauK
	 qrl9Wx26wZdXYmH88IW5HO/n6HgdxU97eJXsP+vhq+DfhdyOT6/ZQF0RsAnzolXbb
	 1ZeahTX8FEMcvSiiNLKvuBsTQXPDbBlfxXYgY0RcyQS9Aq98XmEs6UBrRRPNreyjT
	 7mX3wZg0d+gEEIfaA5gzgHuVBrZLp5lAVr2lnuauQ1ANGv7ALqohrq3I8cjyRIWk4
	 YlN+rZnGPq1UaaY6ngbn+Cs+bNszHXX5UxORM0ZAGF0Xsoc91R7CQBOT699CyoZQq
	 R6xZDrKjmb7kEvlEAw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.145.244] ([217.61.145.244]) by
 trinity-msg-rest-gmx-gmx-live-5779db864f-xlr59 (via HTTP); Tue, 1 Apr 2025
 11:45:20 +0000
MIME-Version: 1.0
Message-ID: <trinity-2fa9ed21-07af-4fbf-a20e-32684dabdd82-1743507920209@trinity-msg-rest-gmx-gmx-live-5779db864f-xlr59>
From: Frank Wunderlich <frank-w@public-files.de>
To: angelogioacchino.delregno@collabora.com, mikhail.kshevetskiy@iopsys.eu,
 matthias.bgg@gmail.com, daniel@makrotopia.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Aw: Re: [RESEND][PATCH] arm64: dts: mediatek: mt7986: fix pwn fan
 settings for sinovoip bpi-r3 board
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <618b3cdb-0fef-4194-aeb0-4111c011904d@collabora.com>
Importance: normal
References: <20250226050132.547353-1-mikhail.kshevetskiy@iopsys.eu>
 <618b3cdb-0fef-4194-aeb0-4111c011904d@collabora.com>
Date: Tue, 1 Apr 2025 11:45:20 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:yO9aGdXbvADh/oQI0VHxmCucpkTB+ojEJkMcxZCfRjv2ZJ90aw3qVZTkH5cLASUJx9Nur
 Og6p2s8UaNE0KwUXlloc/hHbG+wzNhFp78q5Vb54eEYjbbxuOEEMsZbN8jEuT+i88ImC/O40hrPc
 sa/urpEYkekuNC7/Nn617V93ul1xotaU/38Qeu7qVhQhF4LulL6URd/E+03t4AGJifoWdA3GDs2F
 Gapu3bI/UMBg5UxJ30b/ZmATIPFiG3aPwmnXU8bPKyUceaiVlyGVgo0k+57a49RdUiTexGve4McC
 +sLUlTB+bslcL0DhNrAOfN565uwEItKzvxrLR47LOH6zknPCe7RbVFgRzsSKWa5q9I=
UI-OutboundReport: notjunk:1;M01:P0:Ou5OEG+zFwg=;aKeVcj8YEdkxAf8v4DSOSDw4ziz
 NcJfgTMEfH2INfC98FxnMo9HOmJbOoYVBVOPX+sBjoCQn2CqqAyqrNAyxmtz5CgalDpPQn1ba
 xfZGBrshdMQUBqu31xsG+oZSc3SE8PU+pniCSbUpXDXEqJa5HTQcuqoaYLn4HFHvqgwEJKvbI
 7fHQeE2sePpXv5JGaSps91PxWdqpIkcEkFyA0P/AvcHaPl5HC2i4gTkRh/Lrvfefo35mrV7fk
 BxYodTWmHRHib2pFY6ikV+6SJGArijoxL1RA/j16iEjZIcMFelElBLeZ3hshh+3yhlXQwaeii
 sNrZOiVYRUUOVU+BrfZsUC+5Jjze4tn+ZLS58nb6r0u+OGmpQpErB79sXVrwQPTfNgX+5SsaE
 o2kkWV8p9GVWxfNYP5pyhn9HPOJZf1IEfvj+ppWJtx4aUxzns63QPKM4WRfbpTPgHC48pi2pW
 ZnamhlbJQgL7smDq1lB/aJMaIktH2cZ1nXsOKA3v+zt+t2I68Ob6Q0LSDHZaEnHY+npTDEF4S
 61qUgYsBHuYfAlRC+exDCYGhb2i11ebgk+UhaXh+c2OsjkCAicy34JAaKeZ1ZCiJenqVqsTIZ
 IFI2eeKZgNlCHMN641uF4N8ImMLYUlZ4853piXi6iLEIHw0+bykkR2jUjzDW4kSO9j5jio8NA
 QSUNEwq9eym9OAuK9Id8FFmHikmNZSVxbWh9yX9CGbSPcbiUFv+sAKb0I6Lkqs7aeE53e1O3R
 JQeQAYnGuDSV6Cf+HN9+DXas6HMbqfFiMuhQCLDnU0BMjjJrhzUuEAqXZX941nIfea7FIh622
 C6/hRVOugy3qK71SE0fNtb5jtpT7nHSqqWy2vVu/qSyytQR5cbEWQNKaEn1UwwRnsZGjFwmhy
 gKLMHY9gSThbzDXkWXA8K681pg2kVQYOKsVwmDVD3+x2RfI0K65gVuCabQO1y44SqMixp7kvr
 KdFseEnxVF5riYLsiRXcJiEbKjuKkR7LmUywICt6aDVzkbsR4vy88T1AcT6eeL29O2sNjOhWf
 SP6TgCo4K3yPyf/6HHQNlvOiwOR6HVNMlvhLMzAFyA/VD2ph5CYRxaeVoF3/lfiiuo+ij8Hf7
 GWWE46ExXT6RG2cShw7Rx8+PT7lQF3utvtzPwPG0bRGzdQ2lF5Xsc15Z/eoqemxiDJEikjtrM
 cNdyQh7blA9z74XpNhpOOjzDwKxFxF182JUqFhLIIz/lFMCjZdbynMs6zs7CfINikh/qwb/Um
 dn7KZs0NFa2y2htkkhM9IMcwopsK/QSbzekajGsaPtB10eRvk2cPlkU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_044533_228908_C609EC70 
X-CRM114-Status: UNSURE (   6.55  )
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

Hi

ping (and noticed a typo in subject)...it does not look like you picked the patch up.

> i have the fan from sinovoip and that was working for me, but if your fan only works with new values, i have no point against this change.

> btw. angelo, how is state for my r4-dtsi change?
currently i only can add a blank dts for the phy variant, or do you have other recommends?

regards Frank

