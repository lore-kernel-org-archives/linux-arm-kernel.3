Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E81E606ADE0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dxIJVJxG;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=GgDcUbfW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vli6xhlC+1tOZxNe6ZiuhYi3OuRNx6a1ew5ibReVdb0=; b=dxIJVJxGod5/YH
	yZMpvBo/x7OZL81n1WGZecblkPjbp841nceHsnLS/WEY6KuOofDPntyBiEK8shistoBVS4rGPloOf
	A478hoYhxftD9MuVDYJrxIAkJ5twCE+G+8G/WlKO0vLEUQ30n2ZieMxx6bOwaDWyBDcxsyg/aNxF1
	IZU48Agzu4giPI/3Fw1p2LnNKsdDSZNEyEEhvCqydBLG3bpSmEveQ7wncc+sb8m1SPDGdYfSCnsD1
	TsaEvX9bXk6yM5ZFM56whcSRuEuT2RMl5/bVAndxMA5Kdj9FVablTNjHkVPUZHb0gXGcH398zB9JN
	XROQm9jxrFnpA8STrj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLemx-00000004MMg-2FCh;
	Tue, 27 Oct 2026 10:52:19 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLemv-00000004MMC-0D1z;
	Tue, 27 Oct 2026 10:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793098334; bh=Vli6xhlC+1tOZxNe6ZiuhYi3OuRNx6a1ew5ibReVdb0=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=GgDcUbfW7S4LRK0kCnWHh2awVnBHjKVsut/NhT79g0erdnfJH4thJuJ8fBD+JmcVJ
	 M7dEcyuy0/6n51qKyKjD6Pu39FwOBoknRL0CRax5bnN0s0SD/SQ+OM3/KwS8CPMTQt
	 uujva4spKDmJq4dvmnJMdjd0Y9xAM9/EYtqMlzFQ=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-XMAILINFO: OeJOoYd4plGbllljkz+rlLNlYfGojr+DRpXa6DK1UZUUeq0G1YqjFr1mfYZ6tA
	 noFoR74yrCt9wMum5OZv3pqTnamcaj61G0mws81BlcNgHwy5gAjmA10sh12h8oGwEPHFYCaw6/NoB
	 ScAjs94IUOYQmEDQkVlQgpNFcPPLKGxhHJSIujBa48NLo5FBhZM5w2Loq6/ViubVkQZ9mSn1EjvdN
	 EDco+I2rB/MFfOQWAJSZM8N7zeXBenXSR74eskCcq6fhJ+HNWkvct0Qfq3lQy15FRYhRFdQFLZ77s
	 KSFXfi9dTSoWcXpk+GPUZShWPEaJ+9Wg+Ym1PR1D+//x0lue0DGdhlguqkXC5NDYqoGN9oJCd/kq9
	 wd1H4GZLI9mMwIfPZN/0oTdB1H3L9jxnHUGrzMUQuoRYM8HPzO8d4rcp+O9KFILn0ZuyYAkiVovFp
	 81VnbQXu8J7qZj0c13Fw+UnkMdjYZfajU4iljjeY+PlCGGamWqOf6sPVqpX8HFwmefud3DRjrwYmC
	 FdWfO7uw1XFGzW4t6mT4pCHR3nEkjkyq6MmPiaKKf+A0Zoi+X6ucWoQT5PpSkd4rbenb+a7CbCAhu
	 NN/hhOgSazCSAhFaWMmn0iyU++kbe4ua7YhUhwpmnn2GRtN8i3MbkoH0Enaos+J7G4U/l6J5VWzpM
	 c56cl42aRQIhbOz7EcQEeQkqbLlx6o7SVDC5tgox9+GEHup55Ntv/7mJ3aQhPi1p61pmR7EM/Lidi
	 sjAjAcmm36RbC6nWBfe56gqF++IOcFwC+PNcngzGRiwgCsufUarVfd3JcpEiPoE4dHUMS+ZIoarCh
	 2r4PRZk9vqng30BHvZ5no+fvzDw53GQdEWbAJ6KCu00JbR8N3WJ/Gd652wHsJQlCZDKyJ7Z8ux67M
	 TlKHdHoFNWshL50mirk1dBJPKzTsgvJLx9jSGc8GRxwuFsQoM5p/JM8ZS/D+sYvN+YhcMcO3kGCir
	 2l37IOxLr8pg7EzA90qIVTpImO6SXul3RZAucSXHdUTuvoVyDVYssGGV4RbqxKqiRmjRSmMAZyO97
	 txGXWIuLUPWDddHYuKZo0M5d0tUWvXJOGjGMQmV0UPqZOfbXlUWOR7uXIlw==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk@kernel.org>
Cc: "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?RWxhaW5lIFpoYW5n?=" <zhangqing@rock-chips.com>, "=?utf-8?B?VWxmIEhhbnNzb24=?=" <ulfh@kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtcG0=?=" <linux-pm@vger.kernel.org>, "=?utf-8?B?RmlubGV5IFhpYW8=?=" <finley.xiao@rock-chips.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: power: rockchip: Add RK3572 power domains
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Tue, 27 Oct 2026 18:51:01 +0800
X-Priority: 3
Message-ID: <tencent_0F101DFCE09BB069F66456125E460602F809@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261026-add-board-ok3572-c-pmdomain-v3-0-70d614d3d921@qq.com>
 <20261026-add-board-ok3572-c-pmdomain-v3-1-70d614d3d921@qq.com>
	<20261027-uptight-stalwart-roadrunner-339a8f@quoll>
In-Reply-To: <20261027-uptight-stalwart-roadrunner-339a8f@quoll>
X-QQ-mid: xmsezb41-0t1793098261tcq9nsxxk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_035217_392738_F880FDBE 
X-CRM114-Status: GOOD (  12.06  )
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

SGkgS3J6eXN6dG9mLAoKPiBTb21lIG1lc3MgaGVyZS4gSSBkb24ndCBnZXQgd2hhdCdzIGFi
b3ZlLCBidXQgZG9lcyBub3QgZml0IGNvbW1pdCBtc2cuCj4gQWxzbyB0aGVyZSBhcmUgbm8g
Y29tbWl0IG1zZyBiZXR3ZWVuIHRoZSB0YWdzLgoKSSdtIHZlcnkgc29ycnkgZm9yIHRoZSBt
aXN0YWtlLiBJIHNob3VsZCBoYXZlIGtlcHQgb25seSB0aGUgc2lnbmlmaWNhbnQKY2hhbmdl
cyBpbiB0aG9zZSBub3RlcyBhbmQgZW5jbG9zZWQgdGhlbSBpbiBzcXVhcmUgYnJhY2tldHMg
W10uCgo+IFdoYXQgaXMgZmlyZXdhbGw/IElzIGl0IGZvciBhY2Nlc3MgY29udHJvbD8gSWYg
c28sIHdlIGhhdmUKPiBhY2Nlc3MtY29udHJvbGxlcnMgcHJvcGVydGllcy4KClNvcnJ5IGFi
b3V0IHRoaXMsIHRob3VnaCBJIGNvdWxkbid0IGhlbHAgbGF1Z2hpbmcgYXQgdGhlIG1pc3Rh
a2UgOkQKV2hpbGUgZm9sbG93aW5nIG15IGluc3RydWN0aW9ucyB0byBjbGVhbiB1cCBuYW1p
bmcgYW5kIGNvbW1lbnRzLCBteSBBSQphZ2VudCBpbmNvcnJlY3RseSBleHBhbmRlZCAiZnci
IHRvICJmaXJld2FsbCIuIEkgY2F1Z2h0IGFuZCBjb3JyZWN0ZWQgc29tZQpvZiB0aGVzZSBk
dXJpbmcgcmV2aWV3LCBidXQgYXBwYXJlbnRseSBtaXNzZWQgbWFueSBvdGhlcnMuCgpUaGF0
J3MgbXkgcmV2aWV3IG92ZXJzaWdodCwgYW5kIEknbGwgY2hlY2sgdGhlIHJlbWFpbmluZyBv
Y2N1cnJlbmNlcyBhbmQKZml4IHRoZSBkZXNjcmlwdGlvbi4KCkJlc3QgcmVnYXJkcywKQ3Vu
aGFvIEx1Cgpwdy1ib3Q6IGNy


