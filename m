Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F77D12D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 06:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r00k13bJOtFaWOaYvtCwbROOQSCXB6VqNkV5/x6pz8I=; b=qwosoadKjbwIq5
	D+tQ6SInT+bwzBFZi+oeVFwD6pStJX0iqmILaOztJ0Tg3407l8MC9GPES6/Lf6bwjl+RPKB6pC5Zq
	VX08aRGcgw7qlEpdkUhUyS2lgktTAWEQ+ctGWSj5coi0/yC9cfpoYyolJJ88HKX9rSDd5L9cJRsE1
	kPWSVR6VC3/ZkTpwLeUhhYiRMpq1UWnU9AnLeYB7rONaTXdFAeEqFz1JMOBaTEV28HwIqsqGzKXZc
	LNWGil9qbux/O/FPQaf+mlUnWIvLhtuq7dflqHnCmPHdmCdZ4tc8+a2Y58QvJE9eAqgOgKPRfUweC
	yeH4QPJMQ5zkA4zkaupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tANij-0000000GTAI-43Xp;
	Mon, 11 Nov 2024 06:16:18 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tANgx-0000000GSvJ-3THh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 06:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1731305657; x=1731910457; i=frank-w@public-files.de;
	bh=r00k13bJOtFaWOaYvtCwbROOQSCXB6VqNkV5/x6pz8I=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hfg7tzu7K0UMRwCqkjh6HUY82atbVacbqfe0PkrxTuj2yRI3J8ED8IRAuvN9tzbv
	 /9LZ+DyTF0g9lq/UBsYnq8SkTU61zvrWqCp2BMKdukqHvJCdCGyhc/+dFGTYJHdK2
	 GFvzKRe1j7xbkfbIlI8cx+bLSaq2TiHpMhSmoSZhmvTYUqrZUS6SIwTpZL1Arlper
	 jOdF//6tb8oJ0r4/2BfaT4CBhi70hSVliTnKHadIKs6OjlJXbR6I7knZr/F100aPH
	 jjuP79bxXldXvISmek9hZrbuatoo0nIVjTVITqNh9AHALFFQEkK5Wz0z56tkU7Ev+
	 Bj/eD+kudPLEIVkN1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.144.196]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKGP-1sz6Cf3dJR-002K9U; Mon, 11
 Nov 2024 07:14:17 +0100
Date: Mon, 11 Nov 2024 07:14:16 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Damien Le Moal <dlemoal@kernel.org>, Frank Wunderlich <linux@fw-web.de>,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>
CC: Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_2/3=5D_arm64=3A_dts=3A_marvel?=
 =?US-ASCII?Q?l=3A_drop_additional_phy-names_for_sata?=
User-Agent: K-9 Mail for Android
In-Reply-To: <c6dade2e-fd8a-4a7b-89a1-b1276d8e9106@kernel.org>
References: <20241109094623.37518-1-linux@fw-web.de> <20241109094623.37518-3-linux@fw-web.de> <c6dade2e-fd8a-4a7b-89a1-b1276d8e9106@kernel.org>
Message-ID: <C415B917-DE36-42DE-96A8-E1A90A049375@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BKOFQ1Mi9FnHIK8Ipfu90R0zSkYFQC5djJf+f2dKjZ+vdGbr2/0
 O9nRetLYm6jx/ouWj9NqiQoZo1SYKtJukrGPlVSoeqhDpASqWXBB+3V/QZuGzcaWNZV1svd
 Sb69X2rjnCjoheHZJ9hj8cKBMPs5IXq9f319YzgnWRjycWmVcUwbiXCTZeHvvFh55DcRogM
 BMPs9oUhvNKkBI+39kmzA==
UI-OutboundReport: notjunk:1;M01:P0:tD1zr+Lt7VM=;Rb6j5Bsy/H8+ktsYyjKppjnEP6S
 iwfCAZskY7YuYdTIhzwCOL/+d9ea7hSGaRF9OutD3sRG7G2iIZK5NALMRuPRuaZjdt1PgGBOv
 4AIWIUN32VJYSz4ODf++vGe5dqRdTTeG/kFKwkRtrXHpyqrqTXmgo0Wx0CVC49hvND5gg3v2Z
 aPIiDbXw4K/4zYQZi/iPJvktkwfcst8TEbW/42pLP2cqDSL96VHhww29vc+BnXvYa2740zC36
 q62b7KU+iIcTAIflflVfJSMx2xNiS9JVvw2ZFSSoVi5YvqRbjpx/cTyGp2OTgnIDwwPabfMtG
 Un8+hD2dAOyDusPIEZOg+COJ3JHZS16Cagj/2SyVm5qz3fIfjuUp58H6lRQL/IeFMK799pm3R
 Jnfnj9K1/CZ7Qqz1ucpSOcKbHIS9vs3IVorS2YDBS3D0nED474+H1ZTTs92sOAev12h8FDafM
 2aYlk5hJD0icP9+mTCgozNXrbqnKDODTE39aPME9LCdqkWChhPzONOw3cqsKynMqML+ZsIXuo
 Plw0b6c5kUQGoUBex6NdS8DfB1BqerYTh2DmKHFoojoltHNCZLitZq0/446WAUTDtzpmTkw07
 do33YEn9FnzNBG1Q8Ap1riBKhjjFXQ84vw+NBm2YPseZWLEWMsY2UaBxjhHgkXX2NPgRZq+h1
 AV/9NAU0U+r3g8DMRCS24UTS1yChT/RXBpCQgkJJ6IgAet5+YT736WiNdYlPPKBvfNb5nknaL
 ixX/jQ+MRw+oEkBCJOR/IxqKsjZOlNKQGH83ZiYn6sEzST3+0yVz5p781jytl8XrKdckLqp2G
 KXWuFRqBJpa89tvWWRI7Bk2Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_221428_183887_1976F6BA 
X-CRM114-Status: UNSURE (   5.57  )
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
Reply-To: frank-w@public-files.de
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi

Am 11=2E November 2024 01:05:48 MEZ schrieb Damien Le Moal <dlemoal@kernel=
=2Eorg>:
>On 11/9/24 18:46, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Commit facbe7092f8a ("arm64: dts: marvell: Drop undocumented SATA phy n=
ames")
>
>Isn't a Fixes tag for the above commit desired here ?

I have not added one and deopped from first part because of this:

<https://lore=2Ekernel=2Eorg/linux-arm-kernel/20220315024952=2E3we7hiwrksk=
b4tsy@vireshk-i7/>

>> drops some phy-names from devicetrees but misses some=2E Drop them too=
=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>


regards Frank

