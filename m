Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA73606D80B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sv9Mt9T0;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=NlzusISO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rr2v31AaKAWwYmMIc7r6Adi1RCicIPCQioImctiyPsI=; b=Sv9Mt9T0nGEymk
	mpMtFiLtZfkifIyL8AlxxZ1GjJjW8g6aDqGM9niKPA6MdpeUF/0eVmg1Lbu8fqG69B64rfu9DWNSA
	Vj/abR8vT6pywn7GR3t2LeC93jf/DfXzgTS12MFnC2LjeSbbqGi1kpxtnGlrm5I928iW8BrsGEBQw
	ohynSBDGU7v+em7Gs09o8lA6Y9ncq49Ojx0s18fh69pL0YnekCcG1A92k5NH/3lweA5UbIxbVyOoc
	P4tqdzoQG30HUHFzAnRdMOzyAZ9kuLg1TI0IdC6qZnl3OY4lkhNKsVqKwn23iO1lqY/zBwmA3yMND
	a4nveFzoEc+dpdc1/Mmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVnc-00000004c42-0bqu;
	Wed, 04 Nov 2026 07:52:48 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVnW-00000004c3M-2wWw;
	Wed, 04 Nov 2026 07:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793778733; bh=rr2v31AaKAWwYmMIc7r6Adi1RCicIPCQioImctiyPsI=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=NlzusISOe4VyviO+Fh5QTwmSxrxrLtqdqrhxKfDnon8OW6c/9QNr1CsmyY0Wm+UTd
	 gGAWtRvvKlAotx/iLQNa2SKd37eyEVloK7J9f915e4ZGsBxXcOCCAVydkEwHfdfwpx
	 zqL+JPmAY4AiiYPQpJ5HgNkRKNkEkXhAKtYs6rYk=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-XMAILINFO: Ml3saj0rxilewwLbXqRKjCErbc4xuxuyWPmsVBMNNss3RQEAP6yAd1CEVl1F7O
	 bR6f/5s7YcgQ5cqBNSYf1rOOnHvXyA0G9/TQ/BMPQfStW+NFrSbzmfwfvKuW//fod4aP2qWJSQSqQ
	 ISA1O0h0AFCQPKed1baTxGlZn/ehdIr+NHT7tUX1ixp+aQh3sLxMql3MBxcSrVMo07XzOis8RlJiX
	 4ZKXHpFH6/tq9EdGDwAr9oig+AIVYrYtpWzwGOMuWH9tejSa0YS6rK9r/b5Wpl1j4q2aO2U4geLNO
	 9ASkPSkqQdE/IWsxC6BYW3rV9lIfoX3ZuFTXtU3Tfzs3CZnOJEHoJOjvepkFISq4xK2B2Cyvyu26q
	 N0aimYeyPjqHgQkZbWEqchA2ZmDYOF4zqxEGiq0eFXa1nFq8mq6RgcKgqb4W++Z+bvPme28MbMGrS
	 JE6TcVj9aFGxn0CQoYRR4pWvPcQ+GQDefvKgVeXpzMYqEWQmfx9lMgHakL2qzHq/Znxm7MQ8cJx/6
	 FvPiGPGKxNAbGECmXIe7QCvslhM3GRcpggmpRz0WAyM22nun9RjyeyhaOzm22xIFpKGYsuQ9VdZah
	 ykKVU5j/IDEa+OtNPQYyUxIJcsup1215kBJdSie8N6YOCUwrTSKfqd2Ybb2KSG48yp8103BHSiJpV
	 0IAsRLmsfsUD89xvymLhkytcYuESXI6AfIun8lesINyedj6JmQTZh+r5rYz1+D0zr2XcfMs6ME2GO
	 no8+dqg5LWThs5n7H7f+F7U7A9cBqMSPNVP7nC90/n5PIVyI6DTICU4VwNm2yn/ey08WGL1AYtGKQ
	 KsDZClpFqTfBKA8BDQ59dTiemuRiV+RhZL+yLvD7slOKZswJPE+aZl/ogYbNfYMJvhrWZlG0PG+Yy
	 NZmp/TJI5ZilR2HctJ1yJwb7/si/gvl8Q+mWBiyfCaNCs3hPSXouQ4feA+rV9XCJgnJD1+5VJIGUo
	 5Re2nEnuwlBFN9MWmJcbxUN8rhPoSibRgqHSnjuNphZWU3vIUnegbkPwXWqlkabnP+D+Pmu3Gdn0a
	 437bc
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?bmV0ZGV2LWJvdCtzYXNoaWtv?=" <netdev-bot+sashiko@kernel.org>
Cc: "=?utf-8?B?bWts?=" <mkl@pengutronix.de>, "=?utf-8?B?bWFpbGhvbA==?=" <mailhol@kernel.org>, "=?utf-8?B?aGVpa28=?=" <heiko@sntech.de>, "=?utf-8?B?ZGF2ZW0=?=" <davem@davemloft.net>, "=?utf-8?B?d2c=?=" <wg@grandegger.com>, "=?utf-8?B?c29ja2V0Y2Fu?=" <socketcan@hartkopp.net>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?ZWR1bWF6ZXQ=?=" <edumazet@kernel.org>, "=?utf-8?B?a3ViYQ==?=" <kuba@kernel.org>, "=?utf-8?B?cGFiZW5p?=" <pabeni@redhat.com>, "=?utf-8?B?aG9ybXM=?=" <horms@kernel.org>, "=?utf-8?B?Y29yYmV0?=" <corbet@lwn.net>, "=?utf-8?B?c2toYW4=?=" <skhan@linuxfoundation.org>, "=?utf-8?B?cmR1bmxhcA==?=" <rdunlap@infradead.org>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, 
	"=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?bGludXgtZG9j?=" <linux-doc@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: Re: [PATCH net v6 1/6] can: dev: prevent bus-off recovery when the interface is not running
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Wed, 4 Nov 2026 15:52:11 +0800
X-Priority: 3
Message-ID: <tencent_CD800791DD8FA7E989A65526222168C42605@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261017-rockchip-canfd-restart-close-v6-1-ed605feb4b6e@qq.com>
	<179237863891.3135.16148468658160918424@kernel.org>
In-Reply-To: <179237863891.3135.16148468658160918424@kernel.org>
X-QQ-mid: xmsezb41-0t1793778731ti26akn17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_235244_583775_D47F007D 
X-CRM114-Status: GOOD (  11.31  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGksCgo+IERvZXMgdGhpcyBjaGVjayBhY3R1YWxseSBjbG9zZSB0aGUgd2luZG93IHRoZSBz
dWJqZWN0IGxpbmUgZGVzY3JpYmVzPwoKTm8uIFRoZSBjaGVja3MgcmVqZWN0IHJlY292ZXJ5
IHRoYXQgb2JzZXJ2ZXMgdGhlIGludGVyZmFjZSBkb3duLCBidXQgZG8Kbm90IHNlcmlhbGl6
ZSByZWNvdmVyeSB3aXRoIGNsb3NlLiBUaGUgRmxleENBTiB0ZWFyZG93biByYWNlIGFuZCB0
aGUKSEkzMTEwIHN0YWxlLXdvcmsgY2FzZSBhcmUgcmVhbCwgcHJlLWV4aXN0aW5nIGlzc3Vl
cy4gVGhpcyBwYXRjaCBuYXJyb3dzCnRoZWlyIGVudHJ5IHdpbmRvd3Mgd2l0aG91dCBjbG9z
aW5nIHRoZW0uIFJvY2tjaGlwJ3MgZWFybHkgY2FuY2VsbGF0aW9uCmFuZCBmaW5hbCBjYW5j
ZWxsYXRpb24gYWZ0ZXIgSVJRIHRlYXJkb3duIGRvIG5vdCBmaXggb3RoZXIgZHJpdmVycy4K
Cj4gQ2FuIHJlc3RhcnRfd29yayBzdGlsbCBiZSBxdWV1ZWQgYWZ0ZXIgY2xvc2VfY2FuZGV2
KCkgYW5kIHRoZW4KPiBvdXRsaXZlIHRoZSBuZXRfZGV2aWNlPwoKWWVzLiBISTMxMTAncyBJ
UlEgdGhyZWFkIGNhbiByZXRhaW4gYSB0cnVlIHJ1bm5pbmcgc25hcHNob3QgYWNyb3NzIHRo
ZQpjYW5jZWwsIHRoZW4gcXVldWUgdGhlIGNvcmUgd29yayBiZWZvcmUgZnJlZV9pcnEoKSBm
aW5pc2hlcy4gUmVtb3ZhbCBoYXMKbm8gbGF0ZXIgY2FuY2VsbGF0aW9uIG9mIHRoYXQgd29y
ay4gRGVzdHJveWluZyB0aGUgZHJpdmVyJ3MgcHJpdmF0ZQp3b3JrcXVldWUgZG9lcyBub3Qg
ZHJhaW4gdGhlIGNvcmUgcmVzdGFydCB3b3JrIG9uIHRoZSBzeXN0ZW0gd29ya3F1ZXVlLgpD
aGVja2luZyBuZXRpZl9ydW5uaW5nKCkgZnJvbSB0aGUgY2FsbGJhY2sgY2Fubm90IHByb3Rl
Y3QgZnJlZWQgbWVtb3J5LgoKQmVzdCByZWdhcmRzLApDdW5oYW8gTHU=


