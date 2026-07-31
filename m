Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151E2C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3h0aRc36rgqP3y5iZTknfzFkOzFhyAFk3nFphfGXh5M=; b=GeLij3auHfmyyoT8Xxw0NByElb
	izZmlsdAoSQF5VtolHsT4me//Zw5I2CRkqEspeHnrqmSrVVf+O+zB2uEAaymS/wemNqCWEdCkxWle
	T40rugp9tH02Sr+AE8/v7inDgRDTuKf9U+zgfH7o9emQBNjV0ztSEWrLRKjpZpcXOSK521j/iZHRk
	ftmzMcqwuqjlIg7fViepwPcEVZEpVPDN5tk1cnH+Odyp0HOYDoaLh8j1e+Wygu6nF7zIH74AiSpu7
	gvre2DRCp2FbuyjoEaF1+r1Y0YEKVCIyNmF1l7PoKQNYUrio6L7o4S/bhIJeoz5ebB/maL3KwCZTL
	Yuh9979Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpisu-0000000C68p-1Xea;
	Fri, 31 Jul 2026 08:46:28 +0000
Received: from out162-62-57-87.mail.qq.com ([162.62.57.87])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpisp-0000000C67e-3upS;
	Fri, 31 Jul 2026 08:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785487568; bh=3h0aRc36rgqP3y5iZTknfzFkOzFhyAFk3nFphfGXh5M=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=WhiKFrlOeyMdO0HCNTDdGyNMlU8AWBA0U4VCA2GDXAQv3r8voYWXMwvk7qv8Msx7h
	 ve4zlnuk+fsTM8InwqkqEg9JZq2WFqhvRgfB9dWpmbs1v7L5I7gbOdR9O9vniq77zJ
	 +mBSE7/29tWS5NfbNzNPLIk5D2oOSIFr5J37ZHoY=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: MVtLpNyZV6SI+dxp45/lZojaVWA8ckcR2pgCvR1vpVGpk4g4C00in87UmIAIh/
	 r6I9e863sIupjN7K0QfKEEFmm4lL9hOE8ml5tM3ah0VdSkF4tDqsRuKtFEe/Y+2reWuaRXRBQ+GOa
	 RcJwI760bbBpozHzHK72sLrvmdi+YCTABcab3gBZYKOKmaQiDM7etdBmUU1n4UvlSGJJt+yp7V4SP
	 5gVZzP/8iFQ4pyxNFQny2hzBOL/lKWmg9YNzqcUC53yADXhJC0IIdbYJ4alK2v6XmPceuwV16jL6D
	 oQrHGuVPF3VtyIwUU/31diIiFSif1ZFSTqZ2tNSC4Avj4BUjPhVKmEDbG6XjpKQEjIWReERTuPsJM
	 aHx19s2lacjH9kY7wQMFHwpZMjnwee5uJsvoSzZOnc7WgR4SkPUdTImMovhicvl3MsSpA17NOTchD
	 FMMgXtUIuySAEFwim1cUIGEd+U2eha5ygmlGaTtJCGl7/Ejuq6Jw8Z4/iT1n54yP5Nctz3BKh2bhm
	 R9Dxj/3qqNX08AylsJG9qietCyakLpqAguAp+3scmt3Uo30j2ZnGNIUqLFBSIYja5He5MsEh9NkWF
	 mQi7GyUS0sEbZLfgPmmvzYGKuGsDRTfJfoDJz8TksWnue9+REM+rUTbP6P/24kAtNQL63NA9r+UmL
	 Dm6rFMzem2BfMxvEtmt3I1B5L4MVrd/yB//8SPo4BYaVx7VY/rNre/1t16QNT6HhLiBH26W7/19+T
	 GXXV2Ha+0J9reF4AFGaMEaXqpKIPg9zGi1OY7OwEAlmZ2B6L2AsFyCWTDqFmzpx7RUI4QV7Xq4U9s
	 ppdWzGaMNLDNk83808OlXumdOmznd471APmQTBbXafo1cPbhjaODL+cHbCpQFsQlqw+Z6anjYQhAf
	 ViI15KE4qUmCP3l9v/lGz0ju0OLPZ32Dkjq8hbu5SLAPFsO1jxhx/gRNzKqdsvhmWN+lnS50inOEi
	 VCdSao367NzdZqzk62RkrFhWkm1zza2xjKSNe/luoj3/lRqnI5qb4881Ebx/ZhETmPsr13EITB9b2
	 wdH69YIZiN6mTKtax7WPPmuWsb0Ht/6iIbuMAv+JDk3pIMyCXBCbGmdQay0KuBIfbWGXyoGpNwY0c
	 ubPnkRoz2/0TrcKP/C4RsV9Mhx/7cFXYtox6C7xb9oCCWwCkBijbwV7j
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>
Cc: "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] can: rockchip_canfd: prevent TX stall on echo skb failure
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 31 Jul 2026 16:46:05 +0800
X-Priority: 3
Message-ID: <tencent_5385C642A636017C2422600C71DA6FBA2905@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_929320CDB8CC5402DD486A402122B7DF5606@qq.com>
 <tencent_BFFE7E8E4D7E349F32F509B7233D01FB8808@qq.com>
	<20260731-important-dingo-of-abracadabra-054a28-mkl@pengutronix.de>
In-Reply-To: <20260731-important-dingo-of-abracadabra-054a28-mkl@pengutronix.de>
X-QQ-mid: xmsezb41-0t1785487565t14l464yo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_014625_454288_6FA7EC53 
X-CRM114-Status: GOOD (  12.55  )
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

SGkgTWFyYywKClNvcnJ5IGZvciBvdmVybG9va2luZyB0aGlzIGZlZWRiYWNrLgoKVGhlIHBy
ZXZpb3VzIHR3byBlbWFpbHMgY29udGFpbmVkIHRoZSBzYW1lIGZlZWRiYWNrIGFzIHRoZSBy
ZXZpZXcgcmVwbHkgdG8gdjEsIGFuZCBJIGhhZCBhbHJlYWR5IHJlcGxpZWQgdG8gdGhhdCBw
b2ludC4gQXMgYSByZXN1bHQsIEkgbWlzdGFrZW5seSBtaXNzZWQgdGhpcyBtZXNzYWdlLgoK
PiBJIHRoaW5rIGl0J3MgYmV0dGVyIHRvIGNhbGwgdGhlIGNhbl9wdXRfZWNob19za2IoKSBh
ZnRlciB0aGUKPiAiaWYgKCFuZXRpZl9zdWJxdWV1ZV9tYXliZV9zdG9wKCkpIgoKSSBhZ3Jl
ZS4gSSB3aWxsIG1vdmUgY2FuX3B1dF9lY2hvX3NrYigpIHRvIGFmdGVyIHRoZSBUWCBxdWV1
ZSBhdmFpbGFiaWxpdHkgY2hlY2sgYW5kIGJlZm9yZSBhbnkgaGFyZHdhcmUgVFggRklGTyBy
ZWdpc3RlciB3cml0ZXMuIElmIGl0IGZhaWxzLCB0aGUgZHJpdmVyIHdpbGwgYWNjb3VudCB0
aGUgZHJvcHBlZCBmcmFtZSBhbmQgcmV0dXJuIHdpdGhvdXQgbW9kaWZ5aW5nIHRoZSBoYXJk
d2FyZSBGSUZPIG9yIHNvZnR3YXJlIFRYIHN0YXRlLgoKSSB3aWxsIHVwZGF0ZSB0aGUgc2Vy
aWVzIGFjY29yZGluZ2x5IGluIHY1LgoKU29ycnkgYWdhaW4gZm9yIG1pc3NpbmcgeW91ciBm
ZWVkYmFjaywgYW5kIHRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCkJlc3QgcmVnYXJkcywK
Q3VuaGFv


