Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D24FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViqeHQLIZm0HWnSQexz4QSSM3m74KlPcBjrXGGI/Zew=; b=zDAJUi2GYQx6CJ3QEfVpzl8Ruk
	/kYCMyq+BsjpJF5gITqhdac2YequIPvRDCXqzWMWHqfF02RtAnPkpTeEnaJn+P27mPbOYseMUFjI4
	cMJrjbd17/Fh8X0s/syjz2EPM42fkZy0nSZs9XLBgvfZpYhNc+jPKpWyG4QdVhGJ0q/IhN6WJOdbj
	Od93sqLGrTRME+1YZNAqdMv5cdbaq9ccNWKcR1ZFPLVHMjIe9kqHP8jFg5UxdeIXKGjHPX/qFsby1
	1Pb2vg6T8avVyVZ5oJgeKh5wn0F2+LftCLGKdyWCwlO8kd31Cdzo4lRxxVIYD0vNYH6tRSFtaVx2X
	xzqjdQBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWfB-000000066Hx-099V;
	Fri, 03 Jul 2026 05:42:10 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWf8-000000066Gk-3SJw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1783057321; bh=ViqeHQLIZm0HWnSQexz4QSSM3m74KlPcBjrXGGI/Zew=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=CQWXqKrY4WQhgdQBLj533cjlb+QPOFKlA+nk7B29YRJpZHOzSGQ5UwbsSvwogneYp
	 QCxKZhizxjkhHXVSQQn7BGj3npq5XMTr0FiJeiTUN3gvWB/7SWdGdefwMlEM3HiwBX
	 Wx6E7mvv1ZbTej5eiu2+j4EF/yjJtMc168HVlB8I=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-XMAILINFO: NBGkhoQ8491PceFq1cOFzrfl6cKUIB8C33gPhPjpIur5KR6W4qQ36+vEohq5KR
	 bGdPokva9jQxNFgyFb/Zf7kJsbkoCTODLj1Ke5p61gsjsGiPaOtkQRAoy8rTCxyxhTQBeyF4FyekY
	 73uyxaZdMdqFI7Jl2f5fEXgEpQ7iHLRhj8RYcUPHTcgRxcUeW9fRW1PTfkFEyRana+WCTkY59rzDR
	 g6UrARgeeGGpdn0MnE2YlkwPNTAlY00I+LWHGJ8px+WsUjOPZ6HWKHOgVfP+IMuX6uf3BE2sFRvGS
	 neN000bWmA4Wij4iPe40l6Ws6vXyQdJb7uXiXK0oHo95zQX8OdXrnfPkwiKtZPPJqZHlMckh01EYC
	 ucInO8HwwMzap+1YxiYdIn/7045WcXw10f4K5giaLoQYOuV3+jRo4yvqGQn1gFQR99zcY66QLSFE7
	 20jumZIl0hj9PZAaROjipkFpJkO7egEuVUYVCqwn/tT6XaohVH7uEHQz9CiGMSBpNfNnIBB2ui0qs
	 cmPeL91PvOzPlTzOvm1c3pTE1WPFRkQxoYaOM8KAuaLlasY5ka+a1wUZYLZ4HTr3PDAF5DLZ1MBtm
	 kinXWMzb/vk70AAncpcacO2fP3L+Dik6eoFOqOiCbrvATDNGMnyx2IjidKt9zDNNte8Iz3+QXQY9n
	 sbBZKvq4koPVTzwCrQRVxMa3SYIbrnm239E5uLbcUoHZ0p58gIzrNbHhTSI8yEsbzKzmEHcPETB6r
	 4IxMDbcPNnMViUec9Imsp3INKPJB0XILlV1tJNTuPSK/FPLdRr61NRuQ8JxE8lO1mFqy7AZ8ZaLi2
	 0Ot49k1RHzqYSc3R/6sINM4QRtUCHGVuwiKecEBQnJr9LbmuHAsSy0MR1UEO/IYSg0lCjGNaoHQIf
	 VWzhEtLME08xFBylTHtFCPSVjlwDAgUZFE3oON548mTfQM+pznObBLQqvf8hz1zOYNsnwG879O6Mc
	 zByhMCrKwY0j6yEU/5C3APaP83efQcIBh2A3clfa5z//GdGkpYRLoWoQ5gdDWMCXVXxZERPF9nvnL
	 1eNJgVWsctkAx9cQxC9j3D9aeYihMb7ZVDXIg
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>, "=?utf-8?B?aGVpa28=?=" <heiko@sntech.de>
Cc: "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?bWFpbGhvbA==?=" <mailhol@kernel.org>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?cm9iaA==?=" <robh@kernel.org>, "=?utf-8?B?a3J6aytkdA==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Y29ub3IrZHQ=?=" <conor+dt@kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] can: rockchip: add RK3588 CAN-FD support
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Fri, 3 Jul 2026 13:41:59 +0800
X-Priority: 3
Message-ID: <tencent_358CC86827C08D8405142316F9053629D00A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_C422347432620914231601BC882C7E604D08@qq.com>
	<20260702-accelerated-shoebill-of-elevation-76f536-mkl@pengutronix.de>
In-Reply-To: <20260702-accelerated-shoebill-of-elevation-76f536-mkl@pengutronix.de>
X-QQ-mid: xmsezb41-0t1783057319tq7q6pl5z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_224207_179922_64471069 
X-CRM114-Status: GOOD (  14.29  )
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

SGkgTWFyYywKCj4gVGhlbiBDQU4tRkQgaXMgYnJva2VuLiA6Lwo+Cj4gTWF5YmUgaW4gYSBs
YXRlciBwYXRjaCB3ZSBjYW4gaGFjayBzb21ldGhpbmcsIHRvIGFsbG93IHdvcmtpbmcKPiBj
b25maWd1cmF0aW9ucy4KCkkgZGlkIHNvbWUgbW9yZSB0ZXN0cyBhbmQgZm91bmQgdGhhdCB0
aGUgaW1tZWRpYXRlIGJ1cy1vZmYgd2l0aCBCUlMgaXMKcmVsYXRlZCB0byB0aGUgdHJhbnNt
aXQgZGVsYXkgY29tcGVuc2F0aW9uIHNldHRpbmcuCgpBZnRlciBzZXR0aW5nIFJLQ0FORkRf
UkVHX1RSQU5TTUlUX0RFTEFZX0NPTVBFTlNBVElPTiB0byAwLCBpLmUuCmRpc2FibGluZyBU
REMsIENBTi1GRCB3aXRoIEJSUyB3b3JrcyBvbiBSSzM1ODggaW4gbXkgc2V0dXAuIEkgdGVz
dGVkIHRoZQpzYW1lIGNvbW1hbmQgd2l0aCA1MDAga2JpdC9zIGFyYml0cmF0aW9uIGJpdHJh
dGUgYW5kIDEsIDMgYW5kIDUgTWJpdC9zCmRhdGEgYml0cmF0ZS4KClRoZSA1IE1iaXQvcyBk
YXRhIHBoYXNlIHRlc3Qgc2V0dXAgd2FzOgoKICBDQU4gY2xvY2s6IDMwMCBNSHoKICBjYW4w
IDwtPiBjYW4xIGRpcmVjdGx5IGNvbm5lY3RlZAogIG5vIG90aGVyIGRldmljZXMgb24gdGhl
IGJ1cwogIGJ1cyB0ZXJtaW5hdGlvbjogNjAgT2htCgogIGlwIGxpbmsgc2V0IGNhbjAgdHlw
ZSBjYW4gYml0cmF0ZSA1MDAwMDAgc2FtcGxlLXBvaW50IDAuOCBkYml0cmF0ZSA1MDAwMDAw
IGRzYW1wbGUtcG9pbnQgMC44IGZkIG9uIGJlcnItcmVwb3J0aW5nIG9uCiAgaXAgbGluayBz
ZXQgY2FuMSB0eXBlIGNhbiBiaXRyYXRlIDUwMDAwMCBzYW1wbGUtcG9pbnQgMC44IGRiaXRy
YXRlIDUwMDAwMDAgZHNhbXBsZS1wb2ludCAwLjggZmQgb24gYmVyci1yZXBvcnRpbmcgb24K
CiAgY2FuZ2VuIGNhbjAgLUkgMiAtTGkgLURpIC1wIDEwIC1mIC1nIDEgLWMzMiAtYgogIGNh
bnNlcXVlbmNlIC1ydiBjYW4xIC1mCgpUaGUgdGVzdCByYW4gZm9yIDE1IG1pbnV0ZXMuIFRo
ZSByZWNlaXZlciByZXBvcnRlZCBjb250aW51b3VzIHNlcXVlbmNlCndyYXAtYXJvdW5kIG1l
c3NhZ2VzLCBlLmcuOgoKICBzZXF1ZW5jZSB3cmFwIGFyb3VuZCAoMCkKICBzZXF1ZW5jZSB3
cmFwIGFyb3VuZCAoMSkKICAuLi4KICBzZXF1ZW5jZSB3cmFwIGFyb3VuZCAoMzcyMTgpCiAg
c2VxdWVuY2Ugd3JhcCBhcm91bmQgKDM3MjE5KQoKVGhlIGludGVyZmFjZSBzdGF0aXN0aWNz
IGFmdGVyIHRoZSB0ZXN0IHdlcmU6CgogIGNhbjA6CiAgICAgICAgICAgIHJlLXN0YXJ0ZWQg
YnVzLWVycm9ycyBhcmJpdC1sb3N0IGVycm9yLXdhcm4gZXJyb3ItcGFzcyBidXMtb2ZmCiAg
ICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAg
MCAgICAgICAgICAwCiAgICAgIFJYOiAgYnl0ZXMgcGFja2V0cyBlcnJvcnMgZHJvcHBlZCAg
bWlzc2VkICAgbWNhc3QKICAgICAgIDE1MDY2NzM1NiA5NTI4Mzc3ICAgICAgMCAgICAgICAw
ICAgICAgIDAgICAgICAgMAogICAgICBUWDogIGJ5dGVzIHBhY2tldHMgZXJyb3JzIGRyb3Bw
ZWQgY2FycmllciBjb2xsc25zCiAgICAgICAxNTA2NjczNTYgOTUyODM3NyAgICAgIDAgICAg
ICAgMCAgICAgICAwICAgICAgIDAKCiAgY2FuMToKICAgICAgICAgICAgcmUtc3RhcnRlZCBi
dXMtZXJyb3JzIGFyYml0LWxvc3QgZXJyb3Itd2FybiBlcnJvci1wYXNzIGJ1cy1vZmYKICAg
ICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAw
ICAgICAgICAgIDAKICAgICAgUlg6ICBieXRlcyBwYWNrZXRzIGVycm9ycyBkcm9wcGVkICBt
aXNzZWQgICBtY2FzdAogICAgICAgMTUwNjY3MzU2IDk1MjgzNzcgICAgICAwICAgICAgIDAg
ICAgICAgMCAgICAgICAwCiAgICAgIFRYOiAgYnl0ZXMgcGFja2V0cyBlcnJvcnMgZHJvcHBl
ZCBjYXJyaWVyIGNvbGxzbnMKICAgICAgICAgICAgICAgMCAgICAgICAwICAgICAgMCAgICAg
ICAwICAgICAgIDAgICAgICAgMAoKVGhlcmUgd2VyZSBubyBidXMgZXJyb3JzIGFuZCBubyBi
dXMtb2ZmIGV2ZW50cyBpbiB0aGlzIHRlc3QuCgo+IENhbiB5b3UgdXBkYXRlIHRoZSBkZXNj
cmlwdGlvbiBvZiB0aGUgcXVpcmsgZm9yIHRoZSByazM1ODggYW5kIGFkZCBob3cKPiB0byBy
ZXByb2R1Y2UgaXQ/CgpXaXRoIFREQyBkaXNhYmxlZCBJIGNhbm5vdCByZXByb2R1Y2UgdGhl
IEJSUyBidXMtb2ZmIHByb2JsZW0gYW55bW9yZS4KVGhpcyBhbHNvIGxvb2tzIGRpZmZlcmVu
dCBmcm9tIFJLQ0FORkRfUVVJUktfQ0FORkRfQlJPS0VOLCBzbyBJIGRvIG5vdAp0aGluayBS
SzM1ODggc2hvdWxkIHVzZSB0aGF0IHF1aXJrLgoKPiBQbGVhc2Uga2VlcCBpdCBkaXNhYmxl
ZCBmb3Igbm93LgoKR2l2ZW4gdGhlIG5ldyB0ZXN0IHJlc3VsdCwgSSBwbGFuIHRvIHNlbmQg
djQgd2l0aCB0aGUgUkszNTg4IFREQyByZWdpc3RlcgpzZXQgdG8gMCBhbmQgQ0FOLUZEIGVu
YWJsZWQgZm9yIFJLMzU4OC4KClJlZ2FyZHMsCkN1bmhhbw==


