Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4437BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpUIjGfrWbQRj+aLKeioF0Qk5IQ0w8HMDilcdM+qTvc=; b=odGBGUbQMyA7jcW8xNHCqL6cSX
	zYdaw9Qi/OTOvQd41E+DLS0OzAioA80QxHanCvEzifjcM1lre8ecFvftAOw9cx2pwBYs8dl3U57Co
	9Nnmo3F3/UanGJSgfX2V3ywU72RIma3elLEXc8V4cNk+fnKzvHCQgC/h14aJ2Ip3gvJEkeDl9KSEs
	s/4hpJh1B4/3JO0PX74+ldp8awN2ldys6VSHKu2zVs28rRJEU9Ned1+VY+g29haBYDTbnG2pgniGp
	1KsuCF98UZjYSdck8BA6QTweK7LZ9VB0RsXrZNLZRza/FWM0Yu5E5+PxrJKQRW2vv6MrTZcFGRUo+
	TEs5i3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWvWH-00000002XUu-3SnA;
	Sun, 12 Jan 2025 10:48:37 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWvV1-00000002XNS-1A0I;
	Sun, 12 Jan 2025 10:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=uLijmqhAw5jNLjBRhm2d/cc/4ja5JlnokOX1s31dGKk=; b=l
	yLdeC6XNbfUhJ/yxiV/UBm/xycSNPKckTvmMN0H5ckDwbYKROYBqtMCcfy5khtDS
	ZiZq6ITHnoq0z6brdXXmrsKzXeHBr6zKFQUzdzpSLn/g/cB/MANU9Xh2xBZajfEm
	r2gXef9RYgok7NxNzrSBrKIRVxyat8w3wdn0banOd0=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-110 (Coremail) ; Sun, 12 Jan 2025 18:46:28 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Sun, 12 Jan 2025 18:46:28 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com, 
	detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org, 
	sebastian.reichel@collabora.com, 
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v11 10/11] dt-bindings: display: vop2: Add rk3576
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <i5mp7wrogfc7w3fbmvqgqxsbgcx4xnfnjik4rpd35amdwgppan@fistrhikrrmd>
References: <20250111112614.432247-1-andyshrk@163.com>
 <20250111112614.432247-11-andyshrk@163.com>
 <i5mp7wrogfc7w3fbmvqgqxsbgcx4xnfnjik4rpd35amdwgppan@fistrhikrrmd>
X-NTES-SC: AL_Qu2YBPqct08j7iWbYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCfp9hkHQ3BTPUD22/mDESm+nQiHVyBC7M55cZJ4f4YkiMOvA/MjaB30brfRc7Guag==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <3a93b0e3.1b0c.1945a1f4dbd.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bigvCgCHj1OEnYNnfmqzAA--.12837W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hTSXmeDmdcttwADs5
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_024719_660082_8BD7B75B 
X-CRM114-Status: UNSURE (   9.87  )
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

CkhpIEtyenlzenRvZiwKCkF0IDIwMjUtMDEtMTIgMTc6Mjc6MTgsICJLcnp5c3p0b2YgS296bG93
c2tpIiA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPk9uIFNhdCwgSmFuIDExLCAyMDI1IGF0IDA3
OjI2OjA4UE0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+PiAgICAjIFNlZSBjb21wYXRpYmxlLXNw
ZWNpZmljIGNvbnN0cmFpbnRzIGJlbG93Lgo+PiAgICBjbG9ja3M6Cj4+IEBAIC0xMjAsNDMgKzEz
Myw5OCBAQCBhbGxPZjoKPj4gICAgICAgIHByb3BlcnRpZXM6Cj4+ICAgICAgICAgIGNvbXBhdGli
bGU6Cj4+ICAgICAgICAgICAgY29udGFpbnM6Cj4+IC0gICAgICAgICAgICBjb25zdDogcm9ja2No
aXAscmszNTg4LXZvcAo+PiArICAgICAgICAgICAgZW51bToKPj4gKyAgICAgICAgICAgICAgLSBy
b2NrY2hpcCxyazM1NjYtdm9wCj4+ICsgICAgICAgICAgICAgIC0gcm9ja2NoaXAscmszNTY4LXZv
cAo+PiAgICAgIHRoZW46Cj4+ICAgICAgICBwcm9wZXJ0aWVzOgo+PiAgICAgICAgICBjbG9ja3M6
Cj4+IC0gICAgICAgICAgbWluSXRlbXM6IDcKPj4gKyAgICAgICAgICBtaW5JdGVtczogNQo+Cj5U
aGF0J3Mgd3JvbmcsIHdoeSBtYXhJdGVtcyBiZWNhbWUgbWluSXRlbXM/IEhvdyBpcyB0aGlzIHJl
bGF0ZWQgdG8gcmszNTc2Pwo+Cj4+ICsKPj4gICAgICAgICAgY2xvY2stbmFtZXM6Cj4+IC0gICAg
ICAgICAgbWluSXRlbXM6IDcKPj4gKyAgICAgICAgICBtaW5JdGVtczogNQo+Cj5Zb3UgYXJlIGRv
aW5nIGhlcmUgd2F5IHRvbyBtdWNoLiBZb3UgbmVlZCB0byBzcGxpdCByZW9yZ2FuaXppbmcsIHNv
IHdlCj53aWxsIHNlZSB3aGF0IGNvbWVzIG5ldy4KPgo+QW5kIG9mIGNvdXJzZSB5b3UgbmVlZCB0
byBleHBsYWluIHdoeSB5b3UgYXJlIGNoYW5naW5nIEVYSVNUSU5HIGJpbmRpbmcKPihJIGFtIG5v
dCB0YWxraW5nIGFib3V0IHNodWZmbGluZyBhcm91bmQgLSB5b3UgY2hhbmdlIHRoZSBiaW5kaW5n
KS4KCkhvdyBhYm91dCBzcGxpdCB0aGlzIHBhdGNoIHRvIHR3bzogT25lIHJld29yayB0aGUgZXhp
c3RpbmcgYmluZGluZywgIG1ha2UgaXQKbW9yZSBzdWl0YWJsZSBmb3IgZXhwYW5kaW5nIHRvIGlu
Y2x1ZGUgbmV3IFNvQ3MuClRoZW4gYWRkIHJrMzU3NiBpbiB0aGUgc2Vjb25kIHBhdGNoID8KCgo+
Cj4KPj4gKwo+PiArICAgICAgICBpbnRlcnJ1cHRzOgo+PiArICAgICAgICAgIG1heEl0ZW1zOiAx
Cj4+ICsKPj4gKyAgICAgICAgaW50ZXJydXB0LW5hbWVzOiBmYWxzZQo+PiAgCj4+ICAgICAgICAg
IHBvcnRzOgo+PiAgICAgICAgICAgIHJlcXVpcmVkOgo+PiAgICAgICAgICAgICAgLSBwb3J0QDAK
Pj4gICAgICAgICAgICAgIC0gcG9ydEAxCj4+ICAgICAgICAgICAgICAtIHBvcnRAMgo+PiAtICAg
ICAgICAgICAgLSBwb3J0QDMKPj4gKwo+PiArICAgICAgICByb2NrY2hpcCx2bzEtZ3JmOiBmYWxz
ZQo+PiArICAgICAgICByb2NrY2hpcCx2b3AtZ3JmOiBmYWxzZQo+PiArICAgICAgICByb2NrY2hp
cCxwbXU6IGZhbHNlCj4+ICAKPj4gICAgICAgIHJlcXVpcmVkOgo+PiAgICAgICAgICAtIHJvY2tj
aGlwLGdyZgo+PiAtICAgICAgICAtIHJvY2tjaGlwLHZvMS1ncmYKPj4gLSAgICAgICAgLSByb2Nr
Y2hpcCx2b3AtZ3JmCj4+IC0gICAgICAgIC0gcm9ja2NoaXAscG11Cj4+ICAKPj4gLSAgICBlbHNl
Ogo+PiArICAtIGlmOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICAgY29tcGF0aWJs
ZToKPj4gKyAgICAgICAgICBjb250YWluczoKPj4gKyAgICAgICAgICAgIGVudW06Cj4+ICsgICAg
ICAgICAgICAgIC0gcm9ja2NoaXAscmszNTc2LXZvcAo+PiArICAgIHRoZW46Cj4+ICAgICAgICBw
cm9wZXJ0aWVzOgo+PiArICAgICAgICBjbG9ja3M6Cj4+ICsgICAgICAgICAgbWluSXRlbXM6IDUK
Pgo+Cj5XaHkgbWluSXRlbXM/IE5vdGhpbmcgaW4gdGhpcyBwYXRjaCBtYWtlcyBzZW5zZSBmb3Ig
bWUuIE5laXRoZXIgY2hhbmdpbmcKPmV4aXN0aW5nIGJpbmRpbmcgbm9yIG5ldyBiaW5kaW5nIGZv
ciByazM1NzYuCj4KPj4gKwo+PiArICAgICAgICBjbG9jay1uYW1lczoKPj4gKyAgICAgICAgICBt
aW5JdGVtczogNQo+PiArCj4+ICsgICAgICAgIGludGVycnVwdHM6Cj4+ICsgICAgICAgICAgbWlu
SXRlbXM6IDQKPj4gKwo+PiArICAgICAgICBpbnRlcnJ1cHQtbmFtZXM6Cj4+ICsgICAgICAgICAg
bWluSXRlbXM6IDQKPj4gKwo+PiArICAgICAgICBwb3J0czoKPj4gKyAgICAgICAgICByZXF1aXJl
ZDoKPj4gKyAgICAgICAgICAgIC0gcG9ydEAwCj4+ICsgICAgICAgICAgICAtIHBvcnRAMQo+PiAr
ICAgICAgICAgICAgLSBwb3J0QDIKPj4gKwo+PiAgICAgICAgICByb2NrY2hpcCx2bzEtZ3JmOiBm
YWxzZQo+PiAgICAgICAgICByb2NrY2hpcCx2b3AtZ3JmOiBmYWxzZQo+PiAtICAgICAgICByb2Nr
Y2hpcCxwbXU6IGZhbHNlCj4+ICAKPj4gKyAgICAgIHJlcXVpcmVkOgo+PiArICAgICAgICAtIHJv
Y2tjaGlwLGdyZgo+PiArICAgICAgICAtIHJvY2tjaGlwLHBtdQo+PiArCj4+ICsgIC0gaWY6Cj4+
ICsgICAgICBwcm9wZXJ0aWVzOgo+PiArICAgICAgICBjb21wYXRpYmxlOgo+PiArICAgICAgICAg
IGNvbnRhaW5zOgo+PiArICAgICAgICAgICAgY29uc3Q6IHJvY2tjaGlwLHJrMzU4OC12b3AKPj4g
KyAgICB0aGVuOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gICAgICAgICAgY2xvY2tzOgo+PiAt
ICAgICAgICAgIG1heEl0ZW1zOiA1Cj4+ICsgICAgICAgICAgbWluSXRlbXM6IDcKPgo+QW5kIGFn
YWluIHdlaXJkIGNoYW5nZSB0byB0aGUgYmluZGluZy4KPgo+QmVzdCByZWdhcmRzLAo+S3J6eXN6
dG9mCj4KPgo+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PkxpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdAo+TGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yb2NrY2hpcAo=

