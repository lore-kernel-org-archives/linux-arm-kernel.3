Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B28C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 11:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63qFvfIzijRRXeWjG7Gdgug6Q2YIRJCYz23Ir1lfV7k=; b=wz0TrSX3AkiMURD5P2WMGyRhMs
	zIoZAbetUZQ3VE9lFOxpbAmhjubt2SdxXpuY1jxr8L88cL3+IBaOTakX/emKazN5eG3drYoRy8QEP
	HbWlnaX6KGlWvDSPXZsUEEbMldXWiI68S8xkfTfCFjLIuVV7gb/fvz4RRs0MKx/nnlzfY3GonBN8H
	pMwUdVBYvJtCy62wCjtBIQzh/NAidd+ou4mkxZqvaq5El2hHRQhoUibDrUUkq20Q+d+Yrg3NzcYzw
	8NCCS7cnz5B0FOMzVmmfCdpKA3ySIxalZgUCJ5Xqh8spee6mXYRbctyaBO0qLWTGcPltchDx0NMOn
	hqcyC2Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzD6z-00000000BtG-41vQ;
	Mon, 31 Mar 2025 11:15:25 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzD5G-00000000BZR-2RTG;
	Mon, 31 Mar 2025 11:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743419609; x=1744024409; i=markus.elfring@web.de;
	bh=63qFvfIzijRRXeWjG7Gdgug6Q2YIRJCYz23Ir1lfV7k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DuCYBdDhF8Fy4JQuEISj/xxgWJGxhskPvt7avwMknr9RnkdPIVq1ioV167HlIkwP
	 9jk277vaZTgu97yDUC6b2cQPnNu7vv1oCd2LzGq08lS8tusYDGCSZcG36L8k2GGN+
	 uSUUUqiojCVcpL99WiWvwrYWr5ltqW1wfyARA5wOUiGCx8Xv9oRHJcm1wUp++M2y0
	 7VdvBHsujjBwumoQTEfrvRYqU01apYwTZ9NDK98YuO6c7vDeyCaoSKRi+VcvXsHoW
	 9Mh+fBM/E7kMkALgFuN2rfzeKCIcFTKtgOnR6UyPYx/rg5D8tQdEpBTjAccq6LA7W
	 ipVscRTofRR5LHuWvw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MXoYQ-1tbzEb0Sjc-00JC9a; Mon, 31
 Mar 2025 13:13:29 +0200
Message-ID: <a2ba5805-3e2a-4967-9c78-2702bf55304c@web.de>
Date: Mon, 31 Mar 2025 13:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Felix Fietkau <nbd@nbd.name>, Howard Hsu <howard-yh.hsu@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>
References: <20250331103543.9154-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: Add NULL check in mt7996_thermal_init
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331103543.9154-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E43tro449Ol30lrF617necoQPncpjixgFyA64Up7dJH5TVfM12a
 hD/dqOom0bt25Jfaze2XNBarwKvOa1LS/m55Bc5iA/sBhQuCwrh7au622dfxiJia06I2OGZ
 cG/sSUU3rJ1Ez5QzZ36FLlM27NtFxYzhukaLhdZOtgMvC37BSK9drd6Yb0NeywLyBhmSfIQ
 791+ixOhWFt8ZhSqv6t5A==
UI-OutboundReport: notjunk:1;M01:P0:XgyDYicIh3M=;bQjk5pLYYjSB6PgM7fpD2zt5rkv
 j/Fd0srC+6SyjkmrZoyiw8Y+OzYhoxJHWVddoodtmtMmK2R5wkM6MzbLbPjHP07XTb7OVpiGd
 eFhSBuvgcfo6wzo4sYYjYq9BeLGcFHgMu65B309H54/zMdMSRoXIj3/DQQ9qQ5K3V8o4RXb3h
 2wNwWtFgcsxC5wqnW2Gqbck+7gHOtpp6gh/LNfBtnzoyCshTS+RbVB3S3NCw6A4bXGkXQBFWV
 4w5o2BAQqW7PE+K7WkkCBpk8ylEf3nFxAL7TBf6nXFWUkjpX9K6JDgXjAdmWf2wOps86cbVp3
 s8yDi3p87ZSgXD9bX25akKMkhk0tzFuZnhYS3hz9i73W99hw+AJuxIje5VnjVTwzOw2tfJSKP
 qTgesIXsoxHHlAOT7CIUR8yFYSQgjUjtdrrrrtlih739Cc0SYI0YI5/l0afpsGQzOR2fjlVrs
 0v3SJeHMtqvXnxC34SCdDUHfR9WHnVlfrIBSnvl5xIXoop0x5iwLwwalFijB+YNNTI49EXmrL
 /0oiAIjNUDFXY0yvdFrDTVD4x5DEx8HDJ5p7vkP0wE8x2LnChFfMSVnI80aWh0AOeHDnMRwMj
 y+g6KtyVVi9Sa4cZihCC+r7QP+nX912uKPcG8uJyg171lOWEyvaikcOoixUahqaKFbxsQ6XhJ
 zEhOqgiX57GvIHskk8gkCmFC0Y5AXnHHA/82PzF1o93Cc9UR7nMfViWfcIAFZFaa2e/HtucYk
 uaUUPpIZ6eu+WFGUy1BJdvCBggbfxReYuwGs0kGV01aS918t+fUbuIGCy1ocuZ/fOqDrZ+6Xs
 CKvx0qJocSxTnq6WDBogfwtg76u0kQqa7f9FepQBR0sMYhOdAwW40N0HojT7JAK7N5L9ptdFh
 BZj/V3Mzvb5Kr++h8OD479/RJi/p8cdr/ZhhrIHITs2r8XCxcMc96oNjXoF81eYlOk6Vqft3o
 v3To9SmOnP0z2S6k+DOdEUlCOSpZ60Aj7Dk0RhAI4wKoNzurNygP7RPcEuCmiYE9o/I9iH++C
 qTJJ1vCLk4TupbwswCqUhbq5X6MKtD+7sMZRykWqTJ3hNYcRrReR1PJDZac47lcSYnbkhHDgA
 XH+OYIziDKs092Wvp2CdoqZr461kz/Jo1yGtSVIWfe68MNjrBjM3OlHYhf5J6RGxfidhMj86G
 /4Inwo8Q1smp/X7Mnz8Slbipxjn6asyIooHZq+6ezca4R4D1MhqGt7OvJoJYoqBYt399dWF4N
 AH5eYqkJ5fPXay6DBIx2UPVNuHJD9+Qerb2rhvzQzLMJ4qdRctMKSDEimt+lTUcnJAv249Cx4
 WpaKgQN0ouxDKp4vxBGBaOwpX8Pio2O6eb2ux7zwwciPmo8Q0uaVrt+1+lXI3og77Aw6FF7zK
 c+gLrM3HzHHDIr7Mfp6F6UM2EqDBQa9QQr1U4y82rDto/zlXaECUt3npPP7tvuRJw43DPsWtF
 B35sLEqCMaxXjiiLt8p5+VOl7VvxbatTDjfuklmGX/yv2xSou
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_041338_918962_C89C91F9 
X-CRM114-Status: UNSURE (   6.41  )
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

> When devm_kasprintf() fails, it returns a NULL pointer. However, this re=
turn value is not properly checked in the function mt7996_thermal_init.
>
> A NULL check should be added after the devm_kasprintf() to prevent poten=
tial NULL pointer dereference error.

* Please adhere to word wrapping preferences around 75 characters per text=
 line.

* How do you think about to choose the imperative mood for an improved cha=
nge description?
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n94

Regards,
Markus

