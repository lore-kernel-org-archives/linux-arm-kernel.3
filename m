Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB1ECAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yse2UjJ0Dh7zrI132zVl5aYFvop4Jh6+vpIEEPGtQj4=; b=tDN0yrhg57/9NkWWbPQleXVooW
	slG5b9w3JFIqb049Np5Tygopcqh2QEL76mCWbc/5H7s3AKmo0jqrPw8gnnH9HGt7LGz2GdD4HK4JZ
	R11boqXCqi/StW5bVAEScNi2InXFKuh/dy2zKxUsPtoAkQYmQ4avO/R9Tf6j9AiaYNZQQtSrOv+yY
	9S6k6a3T/+CfSD3pMgJUX08A8kB2HkU1GM+Zj69WrS3pSMZKPeOzYcavFM6B+gh7BcO3+xFAJmSum
	+GQizDA5svnzcUYQV4d3Hsvz8aBnIXguMtHntOkfzNUWxorIAVIDZf690Z7SLITNKb7EkTKxd6Zz4
	zO39/8Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yD5-0000000Cn4t-1y2l;
	Tue, 23 Sep 2025 08:17:15 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0yD1-0000000Cn43-2z7h;
	Tue, 23 Sep 2025 08:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758615418; x=1759220218; i=markus.elfring@web.de;
	bh=Yse2UjJ0Dh7zrI132zVl5aYFvop4Jh6+vpIEEPGtQj4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=anoYx4thzK5Oe0EYIIcdhv+GBKzTJON+MmsdB/dTo3E4Kc+geZV4hO5cmp32hmi0
	 nE0izIhAEAst14IrRmS3vNghGAXWwW0UGrtJ+Cc56LNCc8mHyXjuCM4rJPQ3MA5jy
	 JTeBWgaa8xTa1Q2WToxiRYtQFaouaffkP90DI/kXHKF1Otx539yYyizi/LTsDEi4C
	 K/RRkeV4XcBwrHsHeAL7seMlPod3TTSbxDDPT/nRw6prgDJfpS4CONPYC3ppSbS74
	 lGrolfcpsJvK6/3d4u/Fm/+lHokP6Vs4bH+TSur8bMmo4Q4a0zqSnElRWSccNC4De
	 Ugiw1/EBNtxachLfkg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.248]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MtPvg-1uCziO1K2A-016dZc; Tue, 23
 Sep 2025 10:16:58 +0200
Message-ID: <36758eff-5d49-4ded-bcb0-19d38b8eae2a@web.de>
Date: Tue, 23 Sep 2025 10:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v?] ASoC: mediatek: mt8365: Add check for devm_kcalloc() in
 mt8365_afe_suspend()
To: Mark Brown <broonie@kernel.org>, Guangshuo Li
 <lgs201920130244@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
References: <20250922140555.1776903-1-lgs201920130244@gmail.com>
 <638119fb-4587-48a4-9534-2f19a194ca4e@web.de>
 <aNJUQE6VncYiRx_w@finisterre.sirena.org.uk>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aNJUQE6VncYiRx_w@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cWBgkpYik2H8mxtZ3KY43SyfDlbDJM4covtIK1EZWliqdusnR4U
 60QiYFS6WZkjdj6cHddbnnrFuN84ruYgIln/E/7/drt1as3t5c3TCcCoXOiXNIoRpD4U9Gp
 bNFjCpRomDNxAGC4/K43pq4tmUAxnPrrxbi3G2lHQ/e60ExXIQz2PHemtH4H24GSIse2IKV
 GN+56lDmDNjFvJr4UR7dw==
UI-OutboundReport: notjunk:1;M01:P0:ZqrXlG4ixUQ=;3mA1GBTRnGEn4I1VSDjp+EJpkrS 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 yA77uqw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_011712_204633_58149110 
X-CRM114-Status: UNSURE (   6.37  )
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

>> =E2=80=A6
>>> Add a NULL check and bail out with -ENOMEM, making sure to disable the
>>> main clock via the existing error path to keep clock state balanced.
>>
>> How do you think about to increase the application of scope-based resou=
rce management?
>=20
> Feel free to ignore Markus, he has a long history of sending
> unhelpful review comments and continues to ignore repeated requests
> to stop.

Can you take care for the mentioned development topic in more constructive=
 ways?

Regards,
Markus

