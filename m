Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9258606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 06:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p4BAV5P5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GPktyQ5b;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ccqHUmul
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQEbex78dJiZ6flYdEKHWa7WKCcFJQn3S3ebxGv69bQ=; b=p4BAV5P5gV/VEtlUrdQpHcpe4T
	lzWsWd2vLP4z699JZkYgc38Uw3Yk6nGkvueUi1p5K3vwAIo1rRnwEbblxFjvNxIIMggyt4SbTZiPB
	dHxeQQekz1bHk9MMJmLWYI+NsFPlY/nmr9MVpkZU90SZeqLYwIh57adn4o2yoMuKPUzFDHn68Zpsm
	so9Q5Cu4DO+JR+K2W83DqhAa0f8+A0CEh6ohfrZl5+BRUGOdw6OI/AJvJp4F0JzBTtBSO0VAjGpIt
	Yg2me1X8UUg/ljz+dtPTI/7FwGbK2z56eA4Wwko70JhPUWiOCiFNAuyxeAzaW6XxyNj8JEiukGpW5
	jYGzVSVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJm0c-0000000DSBj-1XEn;
	Thu, 22 Oct 2026 06:10:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJm0X-0000000DSBA-21Zq;
	Thu, 22 Oct 2026 06:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:Message-ID:Date
	:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XQEbex78dJiZ6flYdEKHWa7WKCcFJQn3S3ebxGv69bQ=; b=GPktyQ5bGyT7KuTvJ2df19dFbs
	9pVrg4FuMNCwdaVThXQtcRotCFXFadx0L6kgd5F3ycbjZapQdKVqoa3MlboFLzWUftp6tuHji3fGg
	mYwMkpGSKld/GOxCjDmaVCaQUw68CfyIe74HkelKMtsxojJ0zNbmvZ1ODoSZ+rtyftJZJibDIg4nN
	l0JDgKHO/m8pj1ADbJ450pkwl5nzflrxZcLuoHDX8juk8jfWeQIjNcYjNjer6SOtfPsoUPJzq8tu9
	RBAzIrISx9MxcuMuQytsHVcTZBu6oEnDItOEygt+wiY6s547O3WE2woEsYD7A8K4X3vd4/PHPDk9s
	+pMe+I3g==;
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJm0N-00000006VFA-1cyx;
	Thu, 22 Oct 2026 06:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792649415; bh=XQEbex78dJiZ6flYdEKHWa7WKCcFJQn3S3ebxGv69bQ=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=ccqHUmul2+x/FAippxR5Lm4pqpIn00HML3oZaJRMz/3XmrQZgxLZmD20wH0oCuxff
	 VvRyHF3El0G6GssBeuPpwC1JSZtvMaZB23aoV8GC5isRhLBsgNFhbAKFTR1fvGOxG0
	 wccK9gRw36J/u74xpxXnYWCtLnB55wGuUHvLX7kM=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: NsCqLbOOOuIqLRqC+FSlwScu91X/dvsM21w86Qepldmed9erOtty5JZbfypXor
	 Z+W8O+qRKguP1gOe5jgtjB1OBSp3Z0CUpphBH8b1J3YTd1v2QGH/3+iQiID2HdSTyWc6Hqht2BGKE
	 uotxFC3g6/P3V8I4Xjj708z2fqSIOzUFwSwzhTEHLSoCOhlApTu+7M943+yxFb7CTRz1FxldR6Wi9
	 yiw/mmS6mw/xzXtrfQc24ZhI/enBE36ygOVydHWsjH9LyfbhDh9ByrFNJ/fsR04ZFRTRNM8w5I3g2
	 WqJszElvpwOYJFzxLGvJ2ReXzajNsYHRNhSfUbXRX8bfAglK8yJmYWjcuhBBEavz7lPOKqqVBENXZ
	 FW52p9cZ3pQVGaFF3UcMdDGFOBviVeBZCkLRINLo5IlUAZW1Wg1eW/urrzEjYt8xmjHk7rvHZGasP
	 p9v0cgyp3Ir4WP+FEfQy+lUEGHXJigjMkD992wxlnskkUIFvMld7nHb0iCRaj9OBOfXD7pJ/gIpLQ
	 scxS3EUml5N4kEXvuu3LXxufgq8JVlEJiUMu5ijnuLWHHi/cBD35fASiOHNDlHih9+HG3Imm6GBrU
	 FbkwGjeB5qmvC6HEfc5EgNbByn7s3Xik+hVBijPxygwxu98unyy4JD5XXdYm9tRN+rHZndULE/nlt
	 t5IuP3Sf8B/zENLz9PzmLTyXZhvEO/bACsik15vyKkGRl8YljJ3rR8vR0+4bGiZfOtrQ5jW4Vh8t7
	 jlJl5bjOkANIQd/mnjopt4onu8RKx+dlAlTldKvvxEmSwW0ifKb8+3kp7xdCGhBi0GM7Umo52jzrq
	 XKs7NtCCiBxXNFr1v6ZRJTu+tmnCVuwotxcoWE00rimlqOT/LEcaHHhxnGMkwPyBDt2eqMrmPKExV
	 O6p4EPDtLdnh721MWleAnB2y117F+YwzjHHI95nkvcLVMxx38ce7WP2M+EyP76+iIoMOhWik1Yb62
	 Cq1woms1pd0MEObSkwVrtYCqjjDBMF3RTB/+F0et9qm78nflM+aey5IpuGWz7KRw56l1j/EaukSqq
	 sJ4u37ZbLyRuwChBhAw7pVxjoh5NQ8JmorbawI6TgldryQ4M=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?SGVpa28gU3TDvGJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>
Cc: "=?utf-8?B?bGludXgtY2xr?=" <linux-clk@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bWZk?=" <mfd@lists.linux.dev>, "=?utf-8?B?bGludXgtZ3Bpbw==?=" <linux-gpio@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?bGludXgtcG0=?=" <linux-pm@vger.kernel.org>, "=?utf-8?B?bGludXgtaTJj?=" <linux-i2c@vger.kernel.org>, "=?utf-8?B?bGludXgtc2VyaWFs?=" <linux-serial@vger.kernel.org>, "=?utf-8?B?bGludXgtbW1j?=" <linux-mmc@vger.kernel.org>, "=?utf-8?B?bGludXgtc3RtMzI=?=" <linux-stm32@st-md-mailman.stormreply.com>, 
	"=?utf-8?B?bGludXgtcGh5?=" <linux-phy@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 07/27] clk: rockchip: Add RK3572 clock and reset support
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 22 Oct 2026 14:09:02 +0800
X-Priority: 3
Message-ID: <tencent_791C8CE4050020CEF9E536C9D3B4CA9C250A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261022-add-board-ok3572-c-v1-0-0b0fd85a31ee@qq.com>
 <20261022-add-board-ok3572-c-v1-7-0b0fd85a31ee@qq.com>
	<2339330.72vocr9iq0@diego>
In-Reply-To: <2339330.72vocr9iq0@diego>
X-QQ-mid: xmsezb41-0t1792649342t4uw2xziw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_071024_201973_2AF3F4E0 
X-CRM114-Status: GOOD (  15.38  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSGVpa28sCgo+IEFzIHlvdSBkaWRuJ3Qgd3JpdGUgdGhpcyBkcml2ZXIgb24geW91ciBv
d24gYW5kIGV2ZW4ga2VwdCB0aGUgb3JpZ2luYWwKPiBhdXRob3IsIHBsZWFzZSBhbHNvIGNy
ZWRpdCB0aGUgb3JpZ2luYWwgYXV0aG9yIGluIHRoZSBjb21taXQgaXRzZWxmLgo+Cj4gVGhp
cyBjYW4gYmUgZG9uZSBmb3IgZXhhbXBsZSB3aXRoIHNvbWV0aGluZyBsaWtlCj4gZ2l0IGNv
bW1pdCAtLWFtZW5kIC0tYXV0aG9yPSJFbGFpbmUgWmhhbmcgPHpoYW5ncWluZ0Byb2NrLWNo
aXBzLmNvbT4iCj4gYW5kIGluIHRoZSBjb21taXQgYWxzbyBoYXZlIGJvdGggc2lnbmVkLW9m
ZnMtYnksIGFrYSBFbGFpbmUgZmlyc3QKPiB0aGVuIHlvdXJzIGJlbG93IGFzIHRoZSBzdWJt
aXR0ZXIsIGkuZS4gbGlrZQo+Cj4gKysrKysrKysrKysKPiBTaWduZWQtb2ZmLWJ5OiBFbGFp
bmUgWmhhbmcgPHpoYW5ncWluZ0Byb2NrLWNoaXBzLmNvbT4KPiBbZG9jdW1lbnQgd2hhdCBj
aGFuZ2VzIHlvdSBkaWQgaW5zaWRlIHRoZSBicmFja2V0c10KPiBTaWduZWQtb2ZmLWJ5OiBD
dW5oYW8gTHUgPDE1Nzk1Njc1NDBAcXEuY29tPgo+ICsrKysrKysrKysrCj4KPiBUaGUgc2Ft
ZSBhcHBsaWVzIHRvIGFsbCBjb21taXRzIGNvbWluZyBmcm9tIHRoZSBSb2NrY2hpcCB2ZW5k
b3Iga2VybmVsLgoKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCwgYW5kIHNvcnJ5IGZv
ciBtaXNzaW5nIHRoZSBjb21taXQgYXV0aG9yc2hpcC4KCkknbGwgcmV2aWV3IGFsbCBwYXRj
aGVzIGFuZCBhZGQgdGhlIG9yaWdpbmFsIGF1dGhvcnMnIG5hbWVzIHdoZXJlIG5lY2Vzc2Fy
eS4KSG93ZXZlciwgYmVjYXVzZSB0aGUgQlNQIEkgcmVjZWl2ZWQgZG9lcyBub3QgaW5jbHVk
ZSBHaXQgY29tbWl0IGhpc3RvcnksIEkgY2FuCm9ubHkgaWRlbnRpZnkgdGhlbSBmcm9tIHRo
ZSBuYW1lcyBub3RlZCBpbiB0aGUgZmlsZSBoZWFkZXJzLgoKQmVzdCByZWdhcmRzLApDdW5o
YW8=


