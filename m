Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518EFCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 13:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Message-ID:Date:Content-Transfer-Encoding:Content-Type:Mime-Version:Subject:
	Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YA58kepF5/oFO2hgjwCX+vvSGiubieaYMrE8JCbPGRE=; b=J5IQNVzOki5BObLx2KVJpK67Yg
	ftHwUp93QuBgC1T7p2uzWvSK8iQ6EHm6WX2b7Y5uAMxjySnb0xQtJ4bH2DA5lvn1xtUL4xmYojolA
	rYlPcbFrj3bN4z88NXUzaxl2PO60rPLdTYjSljPLO9MaJi+/HT+P0kjGOdJhNiT7EjidHxUqgRpMy
	rUFrFLhoUxQspU5N6U097RQQ5E050v2hJiLi1YtwierpFekZXbqpWb9ED2fwocrbb6ccAkscbEbBS
	ER4PCifRQ2NsyiWZcwao5OLZPy+VdDOgFX7MQF362PqT92a4X13koxPQ0fUKNArti6jC3jbiOKN7a
	1gOOR6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcDE-0000000Cue3-3OE5;
	Tue, 13 Oct 2026 13:06:36 +0000
Received: from out162-62-57-137.mail.qq.com ([162.62.57.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGcD8-0000000CucB-1qI2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 13:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791896783; bh=YA58kepF5/oFO2hgjwCX+vvSGiubieaYMrE8JCbPGRE=;
	h=From:To:Cc:Subject:Date:References:In-Reply-To;
	b=j7IsN8VBWg65+eB3yIn/pY/Cp7UuHAS1ElrRYG3zZ7ZDXhi4M7thr2ZTlxwosL0Rx
	 fPD04FsKz1HocQJoipo0t6fXxf7LfpjkHyJSjBmW5xK3+MJ2cvCHSei91HaqsooCo9
	 Dl7wl9Kkd0V4VH9581K0y75223OkCnoIsP+AzcaQ=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-XMAILINFO: OTkXlZHit/HDB8lz4bZyda8RXw5N5T4WHY6SL+WkAwI1CMWbvphDjR94zYpnKl
	 w9w2c0/v1h6QRIPtC/NIc30bOguGfgMYpH+00L7Qsis+xUpA8Nv+/wuo62ZbSP3XKzEG8uYQVh5DV
	 yok+v9e6ywQ9rWYWeEKwQnhLd2FBs/4ZCSw5Jjf7OCHKIj8cfHpYPJFjwldV6hlDsa84AHGsZpm/a
	 WrQ7bMmfodY02zY0+KHnCfF7q2t+jk3kL0ltDxzU6lqeGHMu1RXJW5QqRACnN3w2UltfYuFlgV4OX
	 N8h/k/ddOQsVYO+J02HXIY95WzCaQub8DB/9KemcUbV7hEjCmlqQ7EVNMdajoct92kC+sJM7kNamx
	 1aE7mDpyf177tcaFixVmtjLQ29Lii7uS3GCMZkNYqSW1L6LBmWXdb6IHRR5MyxStYo38Hm49qFqcm
	 AWAODyxYB/E8n0hAkvlmjShx23PmPggxbzVDcP524fSzoD0CPyLU9+RGVCXoh2k+ANhWnoiluu8/S
	 vgLMF+Kq1kYqdXLdh49+8TnNStwsGtuhEd/iPWQw9Ny7SXxql05T0uPQzac983mEHKD/d3GQeiomp
	 JMl0Cxxk5NTdiOziSbcq6K0OCEjMjOypdYY3K1AWjJcXQAIzHL2Nl5Wsk0YYJv7eeCmPB3oZo+DVl
	 0Vn1E6BVcR/Jd/j5Cc/l7kUEiupH4YunRfFHliQq5jXRuNoZPmvuwqfW16wqTIlrxRsccA75k49SI
	 V2N+NyLy1wpCp3zBNXlsEaa+dDrsKnkZuxPQut0knJM31hCQvTZVX5583eXF2RLgPNrAqB0Qv9H9u
	 i5gcgt2CETH8w7OErtDpFPFTeJOhIN5CWcryAde4jIEKFCwo7eXX5avKAmuFdtSyZXjwd23l0rgBq
	 KwitEBIvRHOhzLvIubCJbpLJ1Oh1hDSmmBSOg6DMCW3xuyAuu1PfIZXKX+p8TBOlIVLnI6z/uWiZA
	 BLGQa5RMF/4qBGUIZJHF3vKGbSnP1CHfUqO6p6hbMxeFyp3djE6SyG23n6H7IIkcbXqpgp/n2zGyX
	 CSm8Y2+bLzij19n+LvRGR5GrnLK3U7I6blTB81jpzuBJxkyg=
From: "=?utf-8?B?Q3VuaGFvIEx1?=" <1579567540@qq.com>
To: "=?utf-8?B?TWFyYyBLbGVpbmUtQnVkZGU=?=" <mkl@pengutronix.de>
Cc: "=?utf-8?B?VmluY2VudCBNYWlsaG9s?=" <mailhol@kernel.org>, "=?utf-8?B?U2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lvcg==?=" <bigeasy@linutronix.de>, "=?utf-8?B?Q2xhcmsgV2lsbGlhbXM=?=" <clrkwllms@kernel.org>, "=?utf-8?B?U3RldmVuIFJvc3RlZHQ=?=" <rostedt@goodmis.org>, "=?utf-8?B?bGludXgtY2Fu?=" <linux-can@vger.kernel.org>, "=?utf-8?B?bmV0ZGV2?=" <netdev@vger.kernel.org>, "=?utf-8?B?a2VybmVs?=" <kernel@pengutronix.de>, "=?utf-8?B?SGVpa28gU3R1ZWJuZXI=?=" <heiko@sntech.de>, "=?utf-8?B?bGludXgtcm9ja2NoaXA=?=" <linux-rockchip@lists.infradead.org>, "=?utf-8?B?bGludXgtYXJtLWtlcm5lbA==?=" <linux-arm-kernel@lists.infradead.org>, "=?utf-8?B?bGludXgta2VybmVs?=" <linux-kernel@vger.kernel.org>, "=?utf-8?B?c3RhYmxl?=" <stable@vger.kernel.org>
Subject: Re: [PATCH net] can: rockchip_canfd: stop bus-off restart before closing the device
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Tue, 13 Oct 2026 21:06:21 +0800
X-Priority: 3
Message-ID: <tencent_F9D491A400474428BFE7262F1A1799A88407@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
References: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
	<20261013-hissing-saiga-of-endeavor-ef5e03-mkl@pengutronix.de>
In-Reply-To: <20261013-hissing-saiga-of-endeavor-ef5e03-mkl@pengutronix.de>
X-QQ-mid: xmsezb41-0t1791896781t2k02as9b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_060634_514468_5753C63A 
X-CRM114-Status: GOOD (  20.54  )
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

SGkgTWFyYywKCj4gQUZBSUNTIHRoaXMgaXMgYSBzeXN0ZW1hdGljIHByb2JsZW0gYW5kIHNo
b3VsZCBJTUhPIG5vdCB3b3JrZWQgYXJvdW5kIGluCj4gb25lIGRyaXZlciBvbmx5LgoKQWdy
ZWVkLiBJIGluaXRpYWxseSBvbmx5IG5vdGljZWQgdGhlIHByb2JsZW0gaW4gdGhlIFJvY2tj
aGlwIENBTi1GRApkcml2ZXIgYW5kIGRpZCBub3QgY29uc2lkZXIgdGhlIGNvbW1vbiBDQU4g
Y29kZS4KCj4gbmV0aWZfcnVubmluZygpIHRlc3RzIF9fTElOS19TVEFURV9TVEFSVCwgd2hp
Y2ggaXMgcmVtb3ZlZCBpbgo+IF9fZGV2X2Nsb3NlX21hbnkoKSBwcmlvciB0byBjYWxsaW5n
IHRoZSBkcml2ZXIncyBuZG9fc3RvcCgpLgo+Cj4gQ2FuIHdlIG1ha2UgdXNlIG9mIG5ldGlm
X3J1bm5pbmcoKSBwcmlvciB0byBjYWxsaW5nIGRvX3NldF9tb2RlKGRldiwKPiBDQU5fTU9E
RV9TVEFSVCk/IGZyb20gY2FuX3Jlc3RhcnQoKT8KCklmIHlvdSBoYXZlIG5vIG9iamVjdGlv
bnMsIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHB1dCB0aGUKbmV0aWZfcnVubmlu
ZygpIGNoZWNrIGFmdGVyIHRoZSBleGlzdGluZyAhcHJpdi0+ZG9fc2V0X21vZGUgY2hlY2sg
YW5kCmJlZm9yZSBuZXRpZl9jYXJyaWVyX29rKCk6CgogICAgICAgIGlmICghcHJpdi0+ZG9f
c2V0X21vZGUpCiAgICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7CgogICAgICAg
IGlmICghbmV0aWZfcnVubmluZyhkZXYpKQogICAgICAgICAgICAgICAgcmV0dXJuIC1FTkVU
RE9XTjsKClRoaXMgd291bGQgcHJlc2VydmUgdGhlIGV4aXN0aW5nIGVycm9yIHByZWNlZGVu
Y2UgZm9yIGRldmljZXMgdGhhdCBkbwpub3Qgc3VwcG9ydCByZXN0YXJ0LgoKPiBjYW5fYnVz
X29mZigpIHNob3VsZCBub3Qgc2NoZWR1bGVfZGVsYXllZF93b3JrKCkgaWYgIW5ldGlmX3J1
bm5pbmcoKS4KCkFncmVlZC4gQWx0aG91Z2ggdGhpcyB3b3VsZCBjaGFuZ2UgdGhlIGJlaGF2
aW9yIG9mIHNvbWUgZHJpdmVycywgSSB0aGluawppdCBzaG91bGQgaGVscCBpbXByb3ZlIHN0
YWJpbGl0eS4KCj4gV2Ugc3RpbGwgaGF2ZSB0byBjYWxsIGNhbmNlbF9kZWxheWVkX3dvcmtf
c3luYygmcHJpdi0+Y2FuLnJlc3RhcnRfd29yaykKPiBmcm9tIGVhY2ggZHJpdmVyLCB0aG91
Z2guCgpJIGNhbiBtYWtlIGNoYW5nZXMgdG8gdGhlIG90aGVyIGRyaXZlcnMuIEhvd2V2ZXIs
IEkgZG8gbm90IGhhdmUgdGhlCmNvcnJlc3BvbmRpbmcgaGFyZHdhcmUgYW5kIHdvdWxkIG5v
dCBiZSBhYmxlIHRvIHRlc3QgdGhlIGNoYW5nZXMgb24KcmVhbCBkZXZpY2VzLCBzbyBJIGFt
IGNvbmNlcm5lZCBhYm91dCB0aGUgcmlzay4gSSB3b3VsZCBsaWtlIHRvIGNvbmZpcm06CmRv
IEkgbmVlZCB0byBhdWRpdCBhbmQgZml4IHRoZSByZXN0YXJ0IGJlaGF2aW9yIG9mIGV2ZXJ5
IENBTiBkZXZpY2UKZHJpdmVyPwoKPiBXaGF0IGRvIHlvdSB0aGluaz8KCkkgd2lsbCBhZGRy
ZXNzIHRoZXNlIGNvbW1lbnRzIGluIHYyLiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKUmVn
YXJkcywKQ3VuaGFvIEx1Cg==


