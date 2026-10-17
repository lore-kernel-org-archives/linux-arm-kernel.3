Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A4CCC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 03:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPvpngYgb3gDSbNgR2i6nItLp+8/l01MxAbIoxQYnPk=; b=RzLnQp0EByWw5IFGAnyt6AmhjE
	CLgo/45UdnJhuU7MKS3r4B9feiH3wtdmO40cMJimMGT2Ih+0iKuPF/bFQwl7LHYZ5JSOGZoGeGkZT
	gjusTynXSsNOE+rfYNFUMlyRGwOnsVDY/OH3cL8n3HGe3dW431gEDleHJ7hMMcRC+O/lDVeoKatJM
	enZ9y6YzFPPByQJCpxa7NUKho1/ZrF3DMU3U9DZ5E7CZq8ot3GihgU9gZbasi8d7taYpc8ZCB+wc2
	WzMO2PhjQz374DkDrogfWLCAdprfmxBF1BPUKVOX5b90Fe3LepCqvVNeFPWyDokZ50agYDobXx/mz
	fjpCTAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHv4n-00000004NTO-1Ck4;
	Sat, 17 Oct 2026 03:27:17 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHv4k-00000004NSl-0qYG;
	Sat, 17 Oct 2026 03:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792207625; bh=oPvpngYgb3gDSbNgR2i6nItLp+8/l01MxAbIoxQYnPk=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=jyRkvwq8F5spYxmKdsFv9Bdn64KIAYRJpssWfbGiZ2U6ccSdczsuW3DSC5eFVIfDt
	 ubPCKdDGmpRjNHbU/xm6CQBBYmUQlaPD8F8F0stvFUKOl2ZOowwDmALD4SM+7el3nJ
	 ZEiAlNxivZAx3nER/4w4eXFlQsx5T5m08Gx9fCVg=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-XMAILINFO: N/Vcqssfup8JQjUcZJqhvtZnz0BM1ovXR1FQrDMUcw43sIlBo0ec2E7J6fTSPm
	 99rBKKqRA0X8/g8znrLel5OZReJE8SnpzJPCH1Xy9Ad44Qlyb/Yd2/COi2/nzV0+ifFhk5faskbik
	 iogObJWwosHWc1UFZ13gA8sHm+fjFUsbV92xoMRHmrbVuaPKSrFXNqpvAdl1nPNRCXRBAgS23JO3+
	 S26px2QISMzyzzcN3Bgm9lYOAAAl9Y8ulT89XuKNnljaCur9hzX5FtDmufmMHlsCCmq7fjEroR3t+
	 7bSz8LBtaeu/qH/JRTP8QNIhV4J9miIj4UueaKGH0dbq+p7oIj7dCeBqo/s/s+8X4Au48HnQ+PM6U
	 cn8RNAI7bVHyTrYRbl8nseyJe1ucs+Qg9hmKf2MZ1qfHveSGxUi/VoMlN6FbqQKXON9zlovAhNPS4
	 kmv2Rkyw/I+E5EE5TwN7rSGv2Spy+ExFiP249ipYHA5UPNAjZZ3T4582mtXi1ejhB7KXNC6D52QGH
	 kGSfk8uxlM1JfPBabHnE6G9UOZzWnT8l4h/umZNzIyzRl5/dl0kDpr0N+Wk36ht8thXnkOQiq74FH
	 oBZ67SRvIMprALVb76h1LMhw2NITwrB8v5DMqR9k+clTFtV3tKc1UHkheRMpZLyAE4Gps5ZBmO4ut
	 gSGk0MKGga/jit1hucE27G3gsjv0lWJB/gd+M3xWNAI17ogA8hfBtYA0BNpr4YGPpdEc11YI+T/gK
	 ywwNI/qh+of/jjaZtELyuMKyHcBXkCKCFC6l7B7m3v+wx/DfdwONP+Z/OavEkAIFe6A3iPs9evwUK
	 9RXsTm5QcZC+UnqPsodOg9F0mt1MxnFX1CS8c2QKlnc9OZkU4N72xr80noEGvXCl+dSSaegTeSLwq
	 sy2Ykn1LgywfILS/7F5DrFtVfwvfEgdSfnepRmwtew7JBq/lcviMli6wjIBwdyWdtzLioDYQjL99q
	 gyoONzmfyxh5IcwzybNVrZktD4itjnmQQvNWYsaiOz0C9k2Au+cSLHUPr7wht8ErCXNO2iNzUslzm
	 WOfAYJxqfSxmHQ6b0ry+8ootz2fol8RJ7g5UWFqoHLUZhkDg2W4LapuCtKj53VJDRk1t5VOJDcx4W
	 9hjbVzUXf8ACoTrD+iSkZ4nu69mFNm5P7drA75ySsjCQJDIE9kYNX7tBrncevk3uhsINDbknSktmc
	 w==
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?bmV0ZGV2LWJvdCtzYXNoaWtv?=" <netdev-bot+sashiko@kernel.org>
Cc: "=?utf-8?B?bWts?=" <mkl@pengutronix.de>, "=?utf-8?B?bWFpbGhvbA==?=" <mailhol@kernel.org>, "=?utf-8?B?aGVpa28=?=" <heiko@sntech.de>, "=?utf-8?B?ZGF2ZW0=?=" <davem@davemloft.net>, "=?utf-8?B?d2c=?=" <wg@grandegger.com>, "=?utf-8?B?c29ja2V0Y2Fu?=" <socketcan@hartkopp.net>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>, "=?utf-8?B?a3ViYQ==?=" <kuba@kernel.org>
Subject: Re: [PATCH net v5 1/6] can: dev: prevent bus-off recovery when the interface is not running
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Sat, 17 Oct 2026 11:27:03 +0800
X-Priority: 3
Message-ID: <tencent_AB234A019188927E4F4DAB34DF32E2091E08@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <20261015-rockchip-canfd-restart-close-v5-1-ae77327037c9@qq.com>
	<179219884173.1406898.3472467604167875171@kernel.org>
In-Reply-To: <179219884173.1406898.3472467604167875171@kernel.org>
X-QQ-mid: xmsezb41-0t1792207623tzsdiwpov
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_202714_967677_29630E13 
X-CRM114-Status: GOOD (  16.28  )
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

SGksCgo+IFtTZXZlcml0eTogTWVkaXVtXQo+IElzIHRoaXMgY2hlY2sgZW5vdWdoIHRvIGRl
bGl2ZXIgd2hhdCB0aGUgc3ViamVjdCBsaW5lIHByb21pc2VzPyBJdCByZWFkcwo+IHRoZSBy
dW5uaW5nIGJpdCBvbmNlIHdpdGhvdXQgYW55IGxvY2suIGNhbl9yZXN0YXJ0X3dvcmsoKSBy
dW5zIG9uIHRoZQo+IHN5c3RlbSB3b3JrcXVldWUgd2l0aG91dCBSVE5MIG9yIGFueSBDQU4t
cHJpdmF0ZSBsb2NrLCBzbyBub3RoaW5nIG9yZGVycwo+IGl0IGFnYWluc3QgX19kZXZfY2xv
c2VfbWFueSgpIGFuZCBuZG9fc3RvcCgpLgoKVGhlIGNoZWNrIGFsb25lIGRvZXMgbm90IHNl
cmlhbGl6ZSByZXN0YXJ0IHdpdGggbmRvX3N0b3AoKSwgYXMgbm90ZWQgaW4KdGhlIGNvbW1p
dCBtZXNzYWdlLiBGb3IgUm9ja2NoaXAsIHRoaXMgc2VyaWVzIGFsc28gY2FsbHMKY2xvc2Vf
Y2FuZGV2X2NhbmNlbF9yZXN0YXJ0X3N5bmMoKSBhdCB0aGUgYmVnaW5uaW5nIG9mIHJrY2Fu
ZmRfc3RvcCgpLAp3aGlsZSB0aGUgcmVzb3VyY2VzIGFyZSBzdGlsbCBhdmFpbGFibGUsIHRv
IHdhaXQgZm9yIGFueSByZXN0YXJ0IHRoYXQKaGFzIGFscmVhZHkgcGFzc2VkIHRoZSBjaGVj
ayBiZWZvcmUgdGVhcmluZyBkb3duIHRoZSBoYXJkd2FyZSBhbmQgSVJRLgpUaGUgcHJlLWV4
aXN0aW5nIHRlYXJkb3duIHJhY2VzIGluIG90aGVyIGRyaXZlcnMgYXJlIG91dHNpZGUgdGhl
IHNjb3BlCm9mIHRoaXMgc2VyaWVzIGFuZCBzaG91bGQgYmUgYWRkcmVzc2VkIGluIHNlcGFy
YXRlIHBhdGNoZXMuCgo+IFtTZXZlcml0eTogSGlnaF0KPiBUaGlzIGlzIGEgcHJlLWV4aXN0
aW5nIGlzc3VlIGFuZCB3YXMgbm90IGludHJvZHVjZWQgYnkgdGhpcyBwYXRjaC4gVGhlCj4g
cGF0Y2ggbWFrZXMgdGhlIHdpbmRvdyBzbWFsbGVyLCBidXQgY2FuIHJlc3RhcnRfd29yayBz
dGlsbCBiZSBxdWV1ZWQKPiBhZnRlciBjbG9zZV9jYW5kZXYoKSBoYXMgY2FuY2VsbGVkIGl0
PwoKWWVzLCBpZiBhIGJ1cy1vZmYgcHJvZHVjZXIgaXMgc3RpbGwgcnVubmluZywgdGhlIGNo
ZWNrIGRvZXMgbm90IHByZXZlbnQKaXQgZnJvbSBxdWV1aW5nIHdvcmsgYWZ0ZXIgY2FuY2Vs
bGF0aW9uLiBGb3IgUm9ja2NoaXAsIHRoZSBzZXJpZXMga2VlcHMKdGhlIGZpbmFsIGNsb3Nl
X2NhbmRldigpIGFmdGVyIGZyZWVfaXJxKCkgaGFzIGRyYWluZWQgdGhlIGJ1cy1vZmYKcHJv
ZHVjZXIuIFRoaXMgZmluYWwgY2FuY2VsbGF0aW9uIGNhdGNoZXMgd29yayBxdWV1ZWQgYWZ0
ZXIgdGhlIGVhcmx5CmNhbmNlbGxhdGlvbiwgYW5kIHRoZSBydW5uaW5nIGNoZWNrIHByZXZl
bnRzIHN1Y2ggd29yayBmcm9tIHJlc3RhcnRpbmcKdGhlIGhhcmR3YXJlIHdoaWxlIHRoZSBp
bnRlcmZhY2UgaXMgZG93bi4KClRoZSBsYXRlLWVucXVldWUgYW5kIGxpZmV0aW1lIGlzc3Vl
cyBpbiBvdGhlciBkcml2ZXJzIHNob3VsZCBhbHNvIGJlCmhhbmRsZWQgaW4gc2VwYXJhdGUg
cGF0Y2hlcy4gVGhpcyBzZXJpZXMgaXMgbGltaXRlZCB0byB0aGUgUm9ja2NoaXAKQ0FOLUZE
IHJlc3RhcnQvY2xvc2UgcmFjZXMgYW5kIGRvZXMgbm90IGFkZCBhIGdlbmVyaWMgZnJlZS91
bnJlZ2lzdGVyCnNhZmVndWFyZC4KClJlZ2FyZHMsCkN1bmhhbyBMdQo=


