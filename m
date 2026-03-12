Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E921FED2E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27S0/XYcWlbamnwlv5FH1/SA99z3PDGi+IGq+QjDm38=; b=r/nw7IQXMx9KIMo6VoyraFofDv
	SId0YffeGF87c/UIdf2yRxQPPqgbLGPpy/sRWG85rxiEEbYmV50YKtDMHCQ8LFXpK+DbfrfKSCHvS
	k+jR77gv2W9Dg9WjnBz+uEp7Xf4cDiAdhGcybSkyMaSs7+qcV2xCor6H0WgPY0UB5V3Xz8y60uiar
	cxTJYJa/KH2DeTEU3akk1kUc5Y/sf3lFZxrkrBqYUCGME4Wv1BGfH7beIkwH34eZ4cdrAYTgEWMvq
	bM7sXAk8AI3QpDr1hY6tJoebjMUMRCbiEnC9bu3ouajdHJnI7hf88yfijctboqVtETIrqqrVIIBfi
	ew/Ztj/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b9u-0000000Dcu4-48Cg;
	Thu, 12 Mar 2026 08:12:43 +0000
Received: from out162-62-57-64.mail.qq.com ([162.62.57.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0b9r-0000000Dctg-2T3o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773303153; bh=27S0/XYcWlbamnwlv5FH1/SA99z3PDGi+IGq+QjDm38=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=plCqZQOgNPPoLCxK4VJCgcdTeF11rqT75EAOhbgnFT2xVZKbAUUBHDp1PgK07UcW0
	 /q7XESXf5pkH+cJejWOjnW2LIdYwXcAtZ9MLPYTt+QGO0HgvtNJMX/J0yEEimSCbbk
	 U78oPAaiY4n3msIoXDI6i6vrDdKs6kxehJNexWUA=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-XMAILINFO: NB8AK7fcAs0KtUhMkzHJv1T7vB9mvagc25sJzreQ635HSif3pUTWNsB1ooz8Ck
	 Sap6hQSKtsBjhqL4YjXEmBjGk+6FYs475qu9cDV7vz2BK9g7wUr08gwA4NPbOd7ti3W6frY/RPGp7
	 mPMEcENcbugu/c1epR+lqYxYyNAv1OjsMQR11BFgpc3qt4HF45P/9eecXMlLH+FD8rqfe+DBFrS+O
	 mVP7qocJFLTFvLT1R1I0S1f+PAnhA8JednDibCrXfCDvESz1eixFpMAaNfred3rWE6yJiqNDtZ1Qo
	 zTwO+1BVy6GyEaZE6DbUgtNvcmf/oWPdn2AyoZQYhkoESe0d9Kq4CG0hd5yUWkscn6Jyzetli2VgE
	 wXsXMQkbsX/t+v7jadMLUsRbUkZC9dZ09xc00RF/HPrSakM4jFiViVah/obrC5H5EqCwzDvzpnJiL
	 Qqjtp12BByCs+oNGgmje/SWXAiJOr8GN3NdwRmhZP3jXq70qwCUEKU0WCgCAk8cQ+NnqO+hsld9uH
	 BibOOrfWt34pEmb/12vXzr3Ion81/JT2GxDed30wobqmaJTtWPgM+2pVAxtlyDmedljpXe0366c66
	 xxAe+mkE46si0MZAaCuw1A6EHzeKWs1XicgHv1UMmyfG+n0vH5Vs+WpvKOr4Z1vkDGjhfcAr75mKj
	 XG5TN4SUCLAYBkCvYHC1FiRF33AevSadagy4TAM/MhvZ1nG6/G2k58m2IHC9ppywnrsigiLAaKaEz
	 tX4d2XDvVjNyUPlQM3KYbTgBt9RjGsNNvsnTswFfjR9LeHqyWFFt5zxVtNWhMvpadJ3/wNHH1sZzR
	 s+SFtnbumIHZnpCyT/duf3+1OQZTf7WRLtooGipL3lR7PnJnPX4N9d42PfQO2CF32DmrOxic6H/5h
	 dXN9WMH1Dwp2215rNTMQ8dqGfWXQNnRD+znRRMA2QBPvvgyVNyWAi1zME2r6v5B18H5utbRrRiaYP
	 sicf11H4l3/YaQ/8HK4ZTJCX48qsg=
From: "=?utf-8?B?5L+e5pyd6Ziz?=" <2426767509@qq.com>
To: "=?utf-8?B?R3JlZyBLSA==?=" <gregkh@linuxfoundation.org>
Cc: "=?utf-8?B?c2VyZ2VpLnNodHlseW92?=" <sergei.shtylyov@gmail.com>, "=?utf-8?B?ZGFuaWVs?=" <daniel@zonque.org>, "=?utf-8?B?aGFvamlhbi56aHVhbmc=?=" <haojian.zhuang@gmail.com>, "=?utf-8?B?cm9iZXJ0LmphcnptaWs=?=" <robert.jarzmik@free.fr>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtdXNi?=" <linux-usb@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] USB: pxa27x_udc: check return value of clk_enable
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 12 Mar 2026 16:12:32 +0800
X-Priority: 3
Message-ID: <tencent_28D4DB4E0AD6774FAB12761B8AD05A5D3F06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_648835A07EDBB7CA94B66FAF5662EC2F1407@qq.com>
	<2026031145-stencil-italics-89b3@gregkh>
In-Reply-To: <2026031145-stencil-italics-89b3@gregkh>
X-QQ-mid: xmsezc15-0t1773303152t7ieou44e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_011240_169049_36F515CC 
X-CRM114-Status: GOOD (  16.26  )
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

SGkgR3JlZywNCg0KT24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgMDE6NTY6MTRQTSArMDAwMCwg
R3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPiA+ICAJZHBsdXNfcHVsbHVwKHVkYywgaXNf
YWN0aXZlKTsNCj4gPiAgDQo+ID4gLQlpZiAoc2hvdWxkX2VuYWJsZV91ZGModWRjKSkNCj4g
PiAtCQl1ZGNfZW5hYmxlKHVkYyk7DQo+ID4gKwlpZiAoc2hvdWxkX2VuYWJsZV91ZGModWRj
KSkgew0KPiA+ICsJCXJldCA9IHVkY19lbmFibGUodWRjKTsNCj4gPiArCQlpZiAocmV0KQ0K
PiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiANCj4gRE9uJ3QgeW91IG5lZWQgdG8g
Y2hhbmdlIHRoZSBwdWxsdXA/DQoNClllcywgeW91IGFyZSBhYnNvbHV0ZWx5IHJpZ2h0LiBJ
ZiB1ZGNfZW5hYmxlKCkgZmFpbHMsIHRoZSBoYXJkd2FyZSBwdWxsdXAgc3RhdGUgc2hvdWxk
IGJlIHJldmVydGVkIHRvICFpc19hY3RpdmUuIEkgbWlzc2VkIHRoaXMgaW4gdjMuDQoNCj4g
PiAgCXVkYy0+dmJ1c19zZW5zZWQgPSBpc19hY3RpdmU7DQo+ID4gLQlpZiAoc2hvdWxkX2Vu
YWJsZV91ZGModWRjKSkNCj4gPiAtCQl1ZGNfZW5hYmxlKHVkYyk7DQo+ID4gKwlpZiAoc2hv
dWxkX2VuYWJsZV91ZGModWRjKSkgew0KPiA+ICsJCXJldCA9IHVkY19lbmFibGUodWRjKTsN
Cj4gPiArCQlpZiAocmV0KQ0KPiA+ICsJCQlyZXR1cm4gcmV0Ow0KPiA+ICsJfQ0KPiANCj4g
U2hvdWxkbid0IHlvdSBjaGFuZ2UgdmJ1c19zZW5zZWQ/DQoNCkluZGVlZCwgSSBzaG91bGQg
YWxzbyByb2xsIGJhY2sgdWRjLT52YnVzX3NlbnNlZCA9ICFpc19hY3RpdmUgaWYgdGhlIGVu
YWJsZSBmYWlscy4NCg0KPiA+ICtmYWlsX2VuYWJsZToNCj4gPiArCWlmICghSVNfRVJSX09S
X05VTEwodWRjLT50cmFuc2NlaXZlcikpDQo+ID4gKwkJb3RnX3NldF9wZXJpcGhlcmFsKHVk
Yy0+dHJhbnNjZWl2ZXItPm90ZywgTlVMTCk7DQo+ID4gIGZhaWw6DQo+ID4gIAl1ZGMtPmRy
aXZlciA9IE5VTEw7DQo+ID4gIAlyZXR1cm4gcmV0dmFsOw0KPiANCj4gTm8gb3RoZXIgdW53
aW5kaW5nIGlzIG5lZWRlZD8NCg0KSSBkb3VibGUtY2hlY2tlZCBgcHhhMjd4X3VkY19zdGFy
dGAuIFRoZSBvbmx5IHNldHVwIHN0ZXBzIGJlZm9yZSBgdWRjX2VuYWJsZSgpYCBhcmUgYXNz
aWduaW5nIGB1ZGMtPmRyaXZlcmAgYW5kIGNhbGxpbmcgYG90Z19zZXRfcGVyaXBoZXJhbCgp
YC4gVGhlIGVycm9yIHBhdGggdW5kb2VzIGJvdGgsIHNvIHRoZXJlIHNob3VsZG4ndCBiZSBh
bnkgb3RoZXIgdW53aW5kaW5nIG5lZWRlZCBoZXJlLg0KDQpIb3dldmVyLCB5b3VyIHF1ZXN0
aW9uIHByb21wdGVkIG1lIHRvIGNoZWNrIHRoZSBvdGhlciBmdW5jdGlvbnMsIGFuZCBJIHJl
YWxpemVkIHRoYXQgSSBhbHNvIG1pc3NlZCByb2xsaW5nIGJhY2sgYGRwbHVzX3B1bGx1cGAg
aW4gYHB4YV91ZGNfcmVzdW1lKClgIG9uIGZhaWx1cmUuIEkgd2lsbCBmaXggYWxsIG9mIHRo
ZXNlIG1pc3Npbmcgcm9sbGJhY2tzLg0KDQpUaGFuayB5b3UgZm9yIHRoZSByaWdvcm91cyBy
ZXZpZXchIEkgd2lsbCBzZW5kIG91dCB0aGUgdjQgcGF0Y2ggc2hvcnRseS4NCg0KQmVzdCBy
ZWdhcmRzLA0KWmhhb3lhbmcgWXU=


