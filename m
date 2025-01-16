Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D711C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 08:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJU6NHSPpPz6Gg8DqBJTcsC/F3EA4FbG2Cn09XAcRJg=; b=4XrGA7lqNpL0u2S8t3P9bL109Y
	ruJQqJwUXNdxLbdEavg2sp8leJsP3yc6UygX8QGigzy1I6fi08YciLM2ADvDHMaO6FPdmpdI/nWG/
	uu8z+fWClhwL+M8Uzy1x66wdsJS7ly6EY2JmGkdk0scVIbAMHNg1QPCedg4MdZM/j2Y52Q6klKI4W
	uuOMHT0eZsG6SJ6JEXw4gSqM7w0nfD/XDV+hh8b6l3sgcnsB2eyC4vd1+TnR+lxg0FT6BPxWzqRoz
	jQH03hGB1N/QtfqsdCJQDQp+N4FIZkSwH8OExyVi+MHAjqoBljYe+fYsc8TiDwzffudm8vRSipn9i
	6CJLQYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLH9-0000000EDXG-1qww;
	Thu, 16 Jan 2025 08:30:51 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLFs-0000000EDGd-0V9A;
	Thu, 16 Jan 2025 08:29:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=Jp2pRXZexydmXCI8/gUBpp2H+ifwmmcIHVvnsMZb7WQ=; b=E
	LQKfR9zxZAtMMzT1A2dBhZXdQx/30olE98zDgaBrKpADjtLqAQVPQ8ZgpqEcWDCg
	sfrZJAgBSczhHm7BztA++MFtdmc30BTWE7MH/403H2owp6PCk7uj7KwOrasjG6zj
	iVbx27CiKttvDu+MoK+/28jEyjSIHUhQ5nHlCcgGHY=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-117 (Coremail) ; Thu, 16 Jan 2025 16:27:42 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Thu, 16 Jan 2025 16:27:42 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
	detlev.casanova@collabora.com, daniel@fooishbar.org, robh@kernel.org,
	sebastian.reichel@collabora.com,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re:Re: [PATCH v11 10/11] dt-bindings: display: vop2: Add rk3576
 support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20240801(9da12a7b)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <3a93b0e3.1b0c.1945a1f4dbd.Coremail.andyshrk@163.com>
References: <20250111112614.432247-1-andyshrk@163.com>
 <20250111112614.432247-11-andyshrk@163.com>
 <i5mp7wrogfc7w3fbmvqgqxsbgcx4xnfnjik4rpd35amdwgppan@fistrhikrrmd>
 <3a93b0e3.1b0c.1945a1f4dbd.Coremail.andyshrk@163.com>
X-NTES-SC: AL_Qu2YBfyauUgt5CecZulS/DNQ2YpmHKvs4olgqcQkZd0qqTHPyz4QZ0BuLUbI3d7Zvc2YEN/kNIz7hm45G8K9
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <652ec3b0.6e7b.1946e39b31e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dSgvCgD3v47+wohnYKRYAA--.37488W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqRXWXmeIvFiXEgADs5
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_002932_528392_837C67A3 
X-CRM114-Status: UNSURE (   8.29  )
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

CkhpIEtyenlzenRvZiwKCkF0IDIwMjUtMDEtMTIgMTg6NDY6MjgsICJBbmR5IFlhbiIgPGFuZHlz
aHJrQDE2My5jb20+IHdyb3RlOgo+Cj5IaSBLcnp5c3p0b2YsCj4KPkF0IDIwMjUtMDEtMTIgMTc6
Mjc6MTgsICJLcnp5c3p0b2YgS296bG93c2tpIiA8a3J6a0BrZXJuZWwub3JnPiB3cm90ZToKPj5P
biBTYXQsIEphbiAxMSwgMjAyNSBhdCAwNzoyNjowOFBNICswODAwLCBBbmR5IFlhbiB3cm90ZToK
Pj4+ICAgICMgU2VlIGNvbXBhdGlibGUtc3BlY2lmaWMgY29uc3RyYWludHMgYmVsb3cuCj4+PiAg
ICBjbG9ja3M6Cj4+PiBAQCAtMTIwLDQzICsxMzMsOTggQEAgYWxsT2Y6Cj4+PiAgICAgICAgcHJv
cGVydGllczoKPj4+ICAgICAgICAgIGNvbXBhdGlibGU6Cj4+PiAgICAgICAgICAgIGNvbnRhaW5z
Ogo+Pj4gLSAgICAgICAgICAgIGNvbnN0OiByb2NrY2hpcCxyazM1ODgtdm9wCj4+PiArICAgICAg
ICAgICAgZW51bToKPj4+ICsgICAgICAgICAgICAgIC0gcm9ja2NoaXAscmszNTY2LXZvcAo+Pj4g
KyAgICAgICAgICAgICAgLSByb2NrY2hpcCxyazM1Njgtdm9wCj4+PiAgICAgIHRoZW46Cj4+PiAg
ICAgICAgcHJvcGVydGllczoKPj4+ICAgICAgICAgIGNsb2NrczoKPj4+IC0gICAgICAgICAgbWlu
SXRlbXM6IDcKPj4+ICsgICAgICAgICAgbWluSXRlbXM6IDUKPj4KPj5UaGF0J3Mgd3JvbmcsIHdo
eSBtYXhJdGVtcyBiZWNhbWUgbWluSXRlbXM/IEhvdyBpcyB0aGlzIHJlbGF0ZWQgdG8gcmszNTc2
Pwo+Pgo+Pj4gKwo+Pj4gICAgICAgICAgY2xvY2stbmFtZXM6Cj4+PiAtICAgICAgICAgIG1pbkl0
ZW1zOiA3Cj4+PiArICAgICAgICAgIG1pbkl0ZW1zOiA1Cj4+Cj4+WW91IGFyZSBkb2luZyBoZXJl
IHdheSB0b28gbXVjaC4gWW91IG5lZWQgdG8gc3BsaXQgcmVvcmdhbml6aW5nLCBzbyB3ZQo+Pndp
bGwgc2VlIHdoYXQgY29tZXMgbmV3Lgo+Pgo+PkFuZCBvZiBjb3Vyc2UgeW91IG5lZWQgdG8gZXhw
bGFpbiB3aHkgeW91IGFyZSBjaGFuZ2luZyBFWElTVElORyBiaW5kaW5nCj4+KEkgYW0gbm90IHRh
bGtpbmcgYWJvdXQgc2h1ZmZsaW5nIGFyb3VuZCAtIHlvdSBjaGFuZ2UgdGhlIGJpbmRpbmcpLgo+
Cj5Ib3cgYWJvdXQgc3BsaXQgdGhpcyBwYXRjaCB0byB0d286IE9uZSByZXdvcmsgdGhlIGV4aXN0
aW5nIGJpbmRpbmcsICBtYWtlIGl0Cj5tb3JlIHN1aXRhYmxlIGZvciBleHBhbmRpbmcgdG8gaW5j
bHVkZSBuZXcgU29Dcy4KPlRoZW4gYWRkIHJrMzU3NiBpbiB0aGUgc2Vjb25kIHBhdGNoID8KCkNh
biB5b3UgY29uZmlybSB3aGV0aGVyIHRoaXMgYXBwcm9hY2ggaXMgYWNjZXB0YWJsZT8gIEkgd2Fu
dCB0byAgY2xhcmlmeSAgd2l0aCB5b3UKYmVmb3JlIHNlbmRpbmcgdGhlIG5leHQgdmVyc2lvbi4K
Cgo+Cj4KPj4KPj4KPj4+ICsKPj4+ICsgICAgICAgIGludGVycnVwdHM6Cj4+PiArICAgICAgICAg
IG1heEl0ZW1zOiAxCj4+PiArCj4+PiArICAgICAgICBpbnRlcnJ1cHQtbmFtZXM6IGZhbHNlCj4+
PiAgCj4+PiAgICAgICAgICBwb3J0czoKPj4+ICAgICAgICAgICAgcmVxdWlyZWQ6Cj4+PiAgICAg
ICAgICAgICAgLSBwb3J0QDAKPj4+ICAgICAgICAgICAgICAtIHBvcnRAMQo+Pj4gICAgICAgICAg
ICAgIC0gcG9ydEAyCj4+PiAtICAgICAgICAgICAgLSBwb3J0QDMKPj4+ICsKPj4+ICsgICAgICAg
IHJvY2tjaGlwLHZvMS1ncmY6IGZhbHNlCj4+PiArICAgICAgICByb2NrY2hpcCx2b3AtZ3JmOiBm
YWxzZQo+Pj4gKyAgICAgICAgcm9ja2NoaXAscG11OiBmYWxzZQo+Pj4gIAo+Pj4gICAgICAgIHJl
cXVpcmVkOgo+Pj4gICAgICAgICAgLSByb2NrY2hpcCxncmYKPj4+IC0gICAgICAgIC0gcm9ja2No
aXAsdm8xLWdyZgo+Pj4gLSAgICAgICAgLSByb2NrY2hpcCx2b3AtZ3JmCj4+PiAtICAgICAgICAt
IHJvY2tjaGlwLHBtdQo+Pj4gIAo+Pj4gLSAgICBlbHNlOgo+Pj4gKyAgLSBpZjoKPj4+ICsgICAg
ICBwcm9wZXJ0aWVzOgo+Pj4gKyAgICAgICAgY29tcGF0aWJsZToKPj4+ICsgICAgICAgICAgY29u
dGFpbnM6Cj4+PiArICAgICAgICAgICAgZW51bToKPj4+ICsgICAgICAgICAgICAgIC0gcm9ja2No
aXAscmszNTc2LXZvcAo+Pj4gKyAgICB0aGVuOgo+Pj4gICAgICAgIHByb3BlcnRpZXM6Cj4+PiAr
ICAgICAgICBjbG9ja3M6Cj4+PiArICAgICAgICAgIG1pbkl0ZW1zOiA1Cj4+Cj4+Cj4+V2h5IG1p
bkl0ZW1zPyBOb3RoaW5nIGluIHRoaXMgcGF0Y2ggbWFrZXMgc2Vuc2UgZm9yIG1lLiBOZWl0aGVy
IGNoYW5naW5nCj4+ZXhpc3RpbmcgYmluZGluZyBub3IgbmV3IGJpbmRpbmcgZm9yIHJrMzU3Ni4K
Pj4KPj4+ICsKPj4+ICsgICAgICAgIGNsb2NrLW5hbWVzOgo+Pj4gKyAgICAgICAgICBtaW5JdGVt
czogNQo+Pj4gKwo+Pj4gKyAgICAgICAgaW50ZXJydXB0czoKPj4+ICsgICAgICAgICAgbWluSXRl
bXM6IDQKPj4+ICsKPj4+ICsgICAgICAgIGludGVycnVwdC1uYW1lczoKPj4+ICsgICAgICAgICAg
bWluSXRlbXM6IDQKPj4+ICsKPj4+ICsgICAgICAgIHBvcnRzOgo+Pj4gKyAgICAgICAgICByZXF1
aXJlZDoKPj4+ICsgICAgICAgICAgICAtIHBvcnRAMAo+Pj4gKyAgICAgICAgICAgIC0gcG9ydEAx
Cj4+PiArICAgICAgICAgICAgLSBwb3J0QDIKPj4+ICsKPj4+ICAgICAgICAgIHJvY2tjaGlwLHZv
MS1ncmY6IGZhbHNlCj4+PiAgICAgICAgICByb2NrY2hpcCx2b3AtZ3JmOiBmYWxzZQo+Pj4gLSAg
ICAgICAgcm9ja2NoaXAscG11OiBmYWxzZQo+Pj4gIAo+Pj4gKyAgICAgIHJlcXVpcmVkOgo+Pj4g
KyAgICAgICAgLSByb2NrY2hpcCxncmYKPj4+ICsgICAgICAgIC0gcm9ja2NoaXAscG11Cj4+PiAr
Cj4+PiArICAtIGlmOgo+Pj4gKyAgICAgIHByb3BlcnRpZXM6Cj4+PiArICAgICAgICBjb21wYXRp
YmxlOgo+Pj4gKyAgICAgICAgICBjb250YWluczoKPj4+ICsgICAgICAgICAgICBjb25zdDogcm9j
a2NoaXAscmszNTg4LXZvcAo+Pj4gKyAgICB0aGVuOgo+Pj4gKyAgICAgIHByb3BlcnRpZXM6Cj4+
PiAgICAgICAgICBjbG9ja3M6Cj4+PiAtICAgICAgICAgIG1heEl0ZW1zOiA1Cj4+PiArICAgICAg
ICAgIG1pbkl0ZW1zOiA3Cj4+Cj4+QW5kIGFnYWluIHdlaXJkIGNoYW5nZSB0byB0aGUgYmluZGlu
Zy4KPj4KPj5CZXN0IHJlZ2FyZHMsCj4+S3J6eXN6dG9mCj4+Cj4+Cj4+X19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj5MaW51eC1yb2NrY2hpcCBtYWlsaW5n
IGxpc3QKPj5MaW51eC1yb2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+aHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yb2NrY2hpcAo=

