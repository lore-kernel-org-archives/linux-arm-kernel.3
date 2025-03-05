Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A0AC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 03:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB1Fg5+dAjxOGDDpHSRhLIwRL7ORPyK20ZoH95iVSr8=; b=hE21byIZIH2bJj4lQw9cA7HFO9
	C+yNZY88u4h6w1Qg3KMXr+RTm64nOvs+7qV1HQY52jPsvPinJkgnCigjaa/QnPowOLVbfRSpIq7ts
	dW+Sbvf79KlDSoElulJjMXloXs0QkdDXMyaQzzSYtgLKgKAjA13m+oMP0ZRq60NF9GTqbsAp7DPEC
	qjMeKVzGPuWXuPlpdn5q6MhH3gbVyCl4TFAj7C3vj27YsC/srRmQH6L/rV8nJI6nAe+ylkBDqQpM4
	d7UqQwGfwQybeD3vaHX3rVxQvvxoapDyIGVpsCRjKmKYkjpVpam4W3+FhrJT4xgpcZ6/hw0dUDRrM
	NINC9Igg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfvD-00000006vHX-1X7y;
	Wed, 05 Mar 2025 03:59:51 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpeuq-00000006qCm-2LP0;
	Wed, 05 Mar 2025 02:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=1mEvevodehkZr1dVVYVlAIIA3BdOF7abSyN55uGLtjQ=; b=J
	XixPnoSCQtJeUQKXjg/C2pD/lBfXpPyyxF42XyE3bar3H0hHv//PtjCVfTuO2xR3
	5Ka40W9E2gI2LkswQugdFOmbdetS0+fq/sMtyVEM5i8gAk6i0bfa0phouRqfQvDu
	LISesrATrsLHweVqVUku+hrFAFBxT6JQFqtAgpMQLY=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-118 (Coremail) ; Wed, 5 Mar 2025 10:55:17 +0800 (CST)
X-Originating-IP: [58.22.7.114]
Date: Wed, 5 Mar 2025 10:55:17 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "Sebastian Reichel" <sebastian.reichel@collabora.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	detlev.casanova@collabora.com, linux-rockchip@lists.infradead.org,
	"Andy Yan" <andy.yan@rock-chips.com>, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH v3 0/3] Add display subsystem dt node on rk3576
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <2627393.Mh6RI2rZIc@diego>
References: <20241231095728.253943-1-andyshrk@163.com>
 <173564980410.21979.2947276365464229762.robh@kernel.org>
 <lfmhqurnpjmfy6pfjxd5aczxujislv2p5bsurcbl7capyt7zv3@hy2twvjj53uz>
 <2627393.Mh6RI2rZIc@diego>
X-NTES-SC: AL_Qu2fA/2fvEsq4SGaZekfmkcVgOw9UcO5v/Qk3oZXOJF8jDDp2ycwUUJSDXLaweO0FQ+OmgmGXTtC9/R7f4VTVaQNmOegLoECOzW/XnS1PDhO3g==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <c9c0a4a.3247.195643a9a86.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: digvCgAXVpgVvcdnp0R2AA--.5758W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBMHXmfHucNUCgABsf
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_185524_935153_D82E0677 
X-CRM114-Status: GOOD (  14.66  )
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

CkhlbGxvLAoK5ZyoIDIwMjUtMDMtMDUgMDU6MTY6NDnvvIwiSGVpa28gU3TDvGJuZXIiIDxoZWlr
b0BzbnRlY2guZGU+IOWGmemBk++8mgo+QW0gRGllbnN0YWcsIDQuIE3DpHJ6IDIwMjUsIDE1OjQ3
OjI4IE1FWiBzY2hyaWViIFNlYmFzdGlhbiBSZWljaGVsOgo+PiBIZWxsbywKPj4gCj4+IE9uIFR1
ZSwgRGVjIDMxLCAyMDI0IGF0IDA2OjU3OjIxQU0gLTA2MDAsIFJvYiBIZXJyaW5nIChBcm0pIHdy
b3RlOgo+PiA+IE9uIFR1ZSwgMzEgRGVjIDIwMjQgMTc6NTc6MTcgKzA4MDAsIEFuZHkgWWFuIHdy
b3RlOgo+PiA+ID4gQXMgdGhlIFZPUFswXSBhbmQgSERNSVsxXSBkcml2ZXIgaGF2ZSBhbHJlYWR5
IGJlZW4gc3VibWl0dGVkIGZvciByZXZpZXcuCj4+ID4gPiBUaGlzIHNlcmllcyBlbmFibGUgaGRt
aSBkaXNwbGF5IG9uIHNpZ2U1IGJvYXJkLgo+PiA+ID4gCj4+ID4gPiBbMF0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtcm9ja2NoaXAvMjAyNDEyMzEwOTA4MDIuMjUxNzg3LTEtYW5keXNo
cmtAMTYzLmNvbS9ULyN0Cj4+ID4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cm9ja2NoaXAvMjAyNDEyMzEwOTQ0MjUuMjUzMzk4LTEtYW5keXNocmtAMTYzLmNvbS9ULyN0Cj4+
ID4gPiAKPj4gPiA+IENoYW5nZXMgaW4gdjM6Cj4+ID4gPiAtIFNwbGl0IGZyb20gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcm9ja2NoaXAvMzMzMDU4Ni5hZU5KRllFTDU4QGRpZWdvL1Qv
I3QKPj4gPiA+IAo+PiA+ID4gQW5keSBZYW4gKDMpOgo+PiA+ID4gICBhcm02NDogZHRzOiByb2Nr
Y2hpcDogQWRkIHZvcCBmb3IgcmszNTc2Cj4+ID4gPiAgIGFybTY0OiBkdHM6IHJvY2tjaGlwOiBB
ZGQgaGRtaSBmb3IgcmszNTc2Cj4+ID4gPiAgIGFybTY0OiBkdHM6IHJvY2tjaGlwOiBFbmFibGUg
aGRtaSBkaXNwbGF5IG9uIHNpZ2U1Cj4+ID4gPiAKPj4gPiA+ICAuLi4vYm9vdC9kdHMvcm9ja2No
aXAvcmszNTc2LWFybXNvbS1zaWdlNS5kdHMgfCAgNDcgKysrKysrKwo+PiA+ID4gIGFyY2gvYXJt
NjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTc2LmR0c2kgICAgICB8IDEyNiArKysrKysrKysrKysr
KysrKysKPj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE3MyBpbnNlcnRpb25zKCspCj4+ID4KPj4g
PiBbLi4uXSAoYSBidW5jaCBvZiB3YXJuaW5ncyBkdWUgdG8gZGVwZW5kZW5jeSBwYXRjaCBzZXJp
ZXMgbm90IHlldAo+PiA+IGJlaW5nIGluIGxpbnV4LW5leHQpCj4+IAo+PiBJIHRoaW5rIGFsbCBk
ZXBlbmRlbmNpZXMgaGF2ZSBsYW5kZWQgbm93LiBCdXQgaXQgbWlnaHQgYmUgc2Vuc2libGUKPj4g
dG8gZG8gYSBxdWljayByZXNlbmQgY29uc2lkZXJpbmcgaG93IG9sZCB0aGlzIGlzLgo+PiAKPj4g
V291bGQgYmUgbmljZSB0byBoYXZlIGluaXRpYWwgUkszNTc2IEhETUkgc3VwcG9ydCBpbiA2LjE1
IDopCj4KPm5vdyB3ZSBjYW4gOi0pCj4KPlRoZSB1cGRhdGUgd2FzIG5vdCB0aGF0IGRpZmZpY3Vs
dCwgc28gZGlkIGl0IG15c2VsZiB3aGVuIGFwcGx5aW5nLgoKVGhhbmtzIGZvciB5b3UgYWxsLCBt
YW55IHRoYW5rcy4KSSBhbHNvIHNlbnQgb3V0IGEgcGF0Y2ggZm9yIGVhbmJsZSBoZG1pIG9uIHJr
MzU3NiBldmIxLgoKCj4KPgo+SGVpa28KPgo+Cg==

