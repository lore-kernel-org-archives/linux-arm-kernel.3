Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E66C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qv1kwRVPne2QFB3ONtm+QRoyPApM0HbetYISv2n4VLw=; b=fihPFlr8DecrPTUDQ6aG7cZbdj
	lXKFUqX5NELQTGj4HEdEG0qNJvKNjdOeFY01sxx8oKIbm06o/YVJBZOJrsDHsjlDShJ1gIsRawrR0
	B3SMDNWiUxFXJXggm+1LRk5F0OLPjpLfx6NdBYV5P+EhhEmKv6IvdAMkBstX2wOSaeEcjuNhzZUy+
	iyA9kiSLD7HfOW3EQQhVrNqB+2WEmnPvDRaocLl8770ofico77IwLfKNAhUvnFNjsXEf5/zSq0+nF
	8dkeLro6uXkMo12YSySGwSgcnLDkY+EwKNwpNH6kdAiZjhX56YGkhVq3+Pu93d5EuCSaj7lnQOheg
	QfAebtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXia-00000006CUu-11Q3;
	Fri, 03 Jul 2026 06:49:44 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXiX-00000006CUT-1ZK6;
	Fri, 03 Jul 2026 06:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783061377; bh=Qv1kwRVPne2QFB3ONtm+QRoyPApM0HbetYISv2n4VLw=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=kvUuuDkKdzTrkPPO1YPK9DXkjA4NuEuyzkwQuj8K0IZwuyjVQzvb+83Ej0G4F5txT
	 rWSla6W2W/0Yg7tgi0MSZbucQFxi2jUqQwWr0HHzaICkr42ZxgAQ7NrMlkfP93MOGy
	 ytFokcv7bozfGmDfm4a0BgqW7ddebbQTw52Ah9Gk=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-XMAILINFO: NkQGnmzToUyFLGGtLNE6QEPHM00sgpR9dNAuu4hfh6sERgH6gk4Tonpk04ALFS
	 HtjVpORe/iBRufuyFzPu5nHHeRVELJVboNLswoK5HE5TdRkrdniQExTX9ckxEDRSCUjcV/Rnof9Pa
	 xgyIoM8IEBYYOPOwKEgH1S9ILeAOKdvETpxmfZvEZfFcPDmgDHva1WvDBkrzZe8sRDF0ZNaqjYHN6
	 c6McCT1CU75io6M/hUMavvtv3pXYZgNp/J3/CO5LXQYvXs7c+CIr/V1Q8UnM7ApcnZ359JIjlqqMW
	 xo/mh7IW+f4rmxM3mf5QKLheAQEbv73PDcdp//DhNpLyp6v45O8FZ7aOZa4rnJQF4/zgxZEVmtWqv
	 vTRZJ/sL1V+H/XwIP7ix7kY76UcuR99lnYDDktPDFvW+lazcgjoD3FRavOnRGfdZWB2FMz/HWupFb
	 tQZ274RK+uwmLn1+cr2fVNEsFtOPcGhL60N6GfmbogQbaJBDV80aKcLoqPspE/b7xBgHJPLRknyj+
	 YhwDJokHTjCs1JbrULSJCYQVlhnvKjqdmKGDCu32mwTrXbKMu/RlFL4fEn0xFYSvNmFINWjjd9WGI
	 pWRDjImr08Pu+0i5K26SbTRJLKstMNY3OLuGyngE1H50yWje9f5AoSZ8ZbHw8Y6s/NTIuYs2E01cb
	 e06aeBk56bPzL9W+4XBLWMPys+GLc7JTXBpav1F24LlgAwz9OoknJtxj0EBolisb9nLCppWvKYo6w
	 CP6woF8jVw/ak4JdOQwLCRmQNAXpxNm0/HhPciclGgk01qMEWBn0gyfGrlMVa49yG7k4vZWJ+UsGM
	 WnchtsJQSaJyeydhNP+7w5CQOJl3GvKf7dhoSiivo7n03Gb+f5+smJti73b6XCRoOlHEE2OYrMsdD
	 V9yNelAEWtAM+qnfTTUpX9xWeakHte6zbUatoViEIC+tVUXUjlS36batqB68RnuKygFqOWxCQ1oID
	 otWG/pH9lB4KmMsi5Dut/0CRo85CcnxFVtZOOOu7IK3ESqc+nVs9R5dP8mk0o5qf1TxrZkfPGwe5S
	 GPX3nXV01/hx2uBToFEj0mnu5aWon/ZONAGbZBfLcCIRPclg=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk@kernel.org>
Cc: "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: can: rockchip: add rk3588 CAN-FD compatible
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 3 Jul 2026 14:49:35 +0800
X-Priority: 3
Message-ID: <tencent_EE004447BFA326179A1419A784CC91B48007@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20260703-master-v3-0-6d56de6fd2f3@qq.com>
 <tencent_3E31CBEFAE0986665A26322171642BC00B05@qq.com>
	<20260703-truthful-aardwolf-of-spirit-b6bafc@quoll>
In-Reply-To: <20260703-truthful-aardwolf-of-spirit-b6bafc@quoll>
X-QQ-mid: xmsezb41-0t1783061375tpzojrz7q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_234941_721973_A877E890 
X-CRM114-Status: GOOD (  12.04  )
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

SGkgS3J6eXN6dG9mLAoKPsKgPsKgQWRkwqBhwqBkZWRpY2F0ZWTCoHJvY2tjaGlwLHJrMzU4
OC1jYW5mZMKgY29tcGF0aWJsZcKgdG/CoGRlc2NyaWJlwqB0aGlzCj7CoD7CoHZhcmlhbnQu
wqBEb8Kgbm90wqB1c2XCoHJvY2tjaGlwLHJrMzU2OHYyLWNhbmZkwqBhc8KgYcKgZmFsbGJh
Y2sswqBiZWNhdXNlwqB0aGF0Cj7CoD7CoHdvdWxkwqBkZXNjcmliZcKgYcKgcmVnaXN0ZXLC
oGxheW91dMKgdGhhdMKgZG9lc8Kgbm90wqBtYXRjaMKgdGhlwqBoYXJkd2FyZS4KPsKgPgo+
wqA+wqBTaWduZWQtb2ZmLWJ5OsKgQ3VuaGFvwqBMdcKgPDE1Nzk1Njc1NDBAcXEuY29tPgo+
wqA+wqBSZXZpZXdlZC1ieTrCoEhlaWtvwqBTdHVlYm5lcsKgPGhlaWtvQHNudGVjaC5kZT4K
PsKgPsKgLS0tCj4KPsKgQWNrZWQtYnk6wqBLcnp5c3p0b2bCoEtvemxvd3NracKgPGtyenlz
enRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4KClRoYW5rcyBmb3IgdGhlIGFjay4g
SSB3aWxsIGFkZCB5b3VyIEFja2VkLWJ5IHRhZyB0byB0aGUgYmluZGluZyBwYXRjaAppbiB2
NC4KCkJlc3QgcmVnYXJkcywKQ3VuaGFv


