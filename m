Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74FBC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4xP+AqQZrlindgeM0wVDqFGCYlq2C/ApmJvBWbW8qA=; b=WF/8zkJvocN/WLa+dUXnYZ4b5Y
	jpvhYb7Jllq4+axN3VTN6NbKMRN4VtmCIaDbwEgOL/uKjdwQMdQflG3d82oApUwWvF1RQeYvatQWX
	tvyJpwCXcdUxTDXkh/ZadvZsgpF87+tjRcXX3n/WBmlqAw5QbM6m9g0hf7QYVzvQve5MbO1lk9HQM
	JpMLJWFJfkcqmgV12ghvbCuO0CLZ+i6ycKvtvT9VUxqe+C+r1j7t9WK5NfT/uwDX5gjHV5rWDiNsG
	buU5yYsN8c5qPeOmPMfxK8P9kGsvFDsrdnEVyt6w3EIYAICQmjqVSBj1OBMob0xzgv2tVSmPoSqSp
	8EGPZlEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRM4-0000000Ah0b-1dD8;
	Thu, 30 Jul 2026 14:03:24 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRM1-0000000AgyN-3e9O;
	Thu, 30 Jul 2026 14:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1785420198; bh=M4xP+AqQZrlindgeM0wVDqFGCYlq2C/ApmJvBWbW8qA=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=h8hON9f0mEyfO/W6dGSjyZPjvCojsNfMCBSCAjW54IRphXgPucwXnOpm3ByahZZL3
	 H9EawCccURlBQSefuJDpjRgw66SczSWdsHqjZxb7Dz8kulZ/fu+4Zuh0SKbiAyl332
	 tbtWbCacaYPN183IxwOsuJ38yMwLZI0xJAbeoC3g=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-XMAILINFO: OO0v+scX7Xpdsxfeeljl1Hw7oWOUfC5P1bSWOQQI7+g3GpjPGuZQrQynQk01cZ
	 cCRYtF4gnczVgqxM+WVt5t+zAkHNj1lA4BAy5fZxwQWOMkbHwL2ngEB+gmPjeeT20x4jerz6hbYw8
	 xy0AViojZw9CCSazyav/oT2u+EEU3uHCpWEMZvdo5XmKGBAhnOqxGVjfecre0OK+SLuTCDXck6SqR
	 6I1lno/VGMLAcEaxIVsoBpzoKyHUFV8FqedE7J5f6dhycDf0hoj8U1XI1FG30zmNUQJYErCkRzSEZ
	 PDFdLWYhW76svrFHYk6CwBDX1nW5fkKi9I6xXVjUftDmKeB9l5zYPprJPEJzEUOhuq7dCqMOwYuOZ
	 JsgyCZWmrqaSb+puuv/RBpfgOHv4A9Ft4i0YrQaSYC1USaFoPhz4m0A1BpAaG1StTUVAEZq6Tw8qt
	 KrpMzVwEGzWrsk4EbvYkrrvxAG9W6USVEe552HxHbMo7RjzEs5B9h0mjmzni1x4By70EGNJHkV61S
	 Ysfef+STN92sDVtR+B0qviWiKY/VOUUI1d+UakqsrpJOaK/2omxacFEPSvCt3pIkde6zJVMgZDS73
	 aZdpH4eyPyFwHmmDI+O0FVt6JBnLnClyMDLALfRX+jQD699zPTYd3ZXkL291Dp+rXTPiNFqPj7j8p
	 rzNES+voO8qdHZo9+RqUrwdAwXnxmpeUdI4yi09iKSPZpysI8g1rSrGtBz28+VwWNxypMLp87Z6UV
	 zLYQMUG2ongjRE2nyqlKBttDDII1By8GQqK7vfFfoMeItLxdw/bOSWc5yQoGzYUqcxor8Qk2v4rob
	 1LUGnRDIUhNOSDBhQpvppxHHjmpAy6OyH/RikTCfNlaa10LkrZB3sTqDuF46AzrkYGADQNm+vsu6K
	 3pv7Gl5sjhahs7AWiFKeywVbRQTejahJAmVQUdzOhdvp1XBRodaWoS44fHVSyB4sHKfGtVSwL2ON1
	 uzs7T3q5NRbNp71k9z1xWhImdGRpyrreLyD0bUq+NKaGMdyp/1L9GqmvjNXeM1/DAT9wVU0Dcn+33
	 ZNkL/VDV3USMdtBLodPAeObaC8VPVSOwV1L3sgluTerK3kw4lLUmLCPLhEyOYubxhZXRyHrWZJJye
	 43k=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?UXVlbnRpbiBTY2h1bHo=?=" <quentin.schulz@cherry.de>, "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?Um9iIEhlcnJpbmc=?=" <robh@kernel.org>, "=?utf-8?B?S3J6eXN6dG9mIEtvemxvd3NraQ==?=" <krzk+dt@kernel.org>, "=?utf-8?B?Q29ub3IgRG9vbGV5?=" <conor+dt@kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>
Cc: "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?ZGV2aWNldHJlZQ==?=" <devicetree@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko.stuebner@cherry.de>
Subject: Re: [PATCH v5 3/4] arm64: dts: rockchip: add CAN-FD nodes for RK3588
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 30 Jul 2026 22:03:15 +0800
X-Priority: 3
Message-ID: <tencent_415F4BD31A0D950C4202CC08424010A28106@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20260725-master-v5-0-75da459d2b93@qq.com>
 <tencent_BE229ADF4693078DBBCC6C02CC0855C01E06@qq.com>
	<2b7519cc-9e22-45de-940e-2996c2423de5@cherry.de>
In-Reply-To: <2b7519cc-9e22-45de-940e-2996c2423de5@cherry.de>
X-QQ-mid: xmsezb41-0t1785420195tbj99inby
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_070322_259409_0C54DEC4 
X-CRM114-Status: UNSURE (   8.54  )
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

SGkgUXVlbnRpbiwKCj4gVGVzdGVkLWJ5OiBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1
bHpAY2hlcnJ5LmRlPiAjIFJLMzU4OCBKYWd1YXIKPgo+IHdoZXJlIHdlIGhhdmUgYWxsIHRo
cmVlIENBTiBjb250cm9sbGVycyBhY2Nlc3NpYmxlICh0d28gdmlhIGFuIGFkYXB0ZXIKPiBi
b2FyZCkuIFNlZQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJvY2tjaGlwLzIw
MjYwNzMwLWphZ3Vhci1jYW4tdjEtMC05YjU2NmJkNzg1ZGFAY2hlcnJ5LmRlLwo+IGZvciBt
b3JlIGluZm8gYW5kIHRoZSB0ZXN0IHNldHVwLgoKVGhhbmsgeW91IGZvciB0ZXN0aW5nIGFs
bCB0aHJlZSBDQU4gY29udHJvbGxlcnMgb24gdGhlIFJLMzU4OCBKYWd1YXIuCgpJIHdpbGwg
YWRkIHlvdXIgVGVzdGVkLWJ5IHRhZyB0byBwYXRjaCAzLiBJIGFtIHByZXBhcmluZyB2NiBu
b3cgYW5kIHdpbGwKcG9zdCBpdCBzaG9ydGx5IHdpdGggdGhpcyB1cGRhdGUgaW5jbHVkZWQu
CgpUaGFua3MsCkN1bmhhbw==


